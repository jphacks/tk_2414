import 'package:audioplayers/audioplayers.dart';
import 'package:fair_edu_mobile/presentation/components/framework/dialog/dialog.dart';
import 'package:fair_edu_mobile/presentation/components/framework/snack_bar/snack_bar.dart';
import 'package:fair_edu_mobile/presentation/components/framework/snack_bar/snack_bar_content.dart';
import 'package:fair_edu_mobile/presentation/components/theme/constants.dart';
import 'package:fair_edu_mobile/presentation/components/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:uuid/uuid.dart';

extension on int {
  String get twoDigits => toString().padLeft(2, '0');
}

extension on Duration {
  String get formatted =>
      '${inHours.twoDigits}:${inMinutes.remainder(60).twoDigits}:${inSeconds.remainder(60).twoDigits}';
}

class AudioPlayDialog extends HookConsumerWidget {
  const AudioPlayDialog({
    super.key,
    required this.url,
    required this.id,
  });

  final Uri url;
  final Uuid id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = AppTheme.of(context);

    return DialogContentBase(
      child: HookBuilder(
        builder: (context) {
          final audioPlayer = useMemoized(
            () => AudioPlayer(
              playerId: id.toString(),
            ),
            const [],
          );

          final isPlaying = useState(false);
          final duration = useState(Duration.zero);
          final position = useState(Duration.zero);

          final resumePause = useCallback(
            () async {
              if (audioPlayer.state == PlayerState.playing) {
                await audioPlayer.pause();
              } else {
                await audioPlayer.resume();
              }
            },
            [audioPlayer],
          );

          useEffect(() {
            audioPlayer.setReleaseMode(ReleaseMode.stop);

            final stateSubscription = audioPlayer.onPlayerStateChanged.listen(
              (PlayerState state) {
                isPlaying.value = state == PlayerState.playing;
              },
            );

            final durationSubscription = audioPlayer.onDurationChanged.listen(
              (Duration d) {
                duration.value = d;
              },
            );

            final positionSubscription = audioPlayer.onPositionChanged.listen(
              (Duration p) {
                position.value = p;
              },
            );

            final completeSubscription = audioPlayer.onPlayerComplete.listen(
              (_) {
                position.value = Duration.zero;
                isPlaying.value = false;
              },
            );

            Future.delayed(Duration.zero, () async {
              try {
                await audioPlayer.setSourceUrl(url.toString());
              } catch (e) {
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const CustomSnackBar(
                      content: SnackBarContentFailure(
                        title: 'エラーが発生しました',
                        description: '音声ファイルの取得に失敗しました',
                      ),
                    ),
                  );
                }
              }
            });

            return () {
              stateSubscription.cancel();
              durationSubscription.cancel();
              positionSubscription.cancel();
              completeSubscription.cancel();
              audioPlayer.dispose();
            };
          }, [audioPlayer]);

          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${position.value.formatted} / ${duration.value.formatted}',
                    style: appTheme.textTheme.bodySm.copyWith(
                      color: appTheme.colorTheme.textSecondary,
                    ),
                  ),
                ],
              ),
              const Gap(spacingUnit * 1.5),
              Theme(
                data: Theme.of(context).copyWith(
                  sliderTheme: SliderThemeData(
                    activeTrackColor: appTheme.colorTheme.primary,
                    trackHeight: 2.0,
                    thumbColor: appTheme.colorTheme.onPrimary,
                    thumbShape: CustomSliderThumbShape(
                      enabledThumbRadius: 8.0,
                      strokeWidth: 1.0,
                      strokeColor: appTheme.colorTheme.primary,
                    ),
                    overlayShape: const RoundSliderOverlayShape(
                      overlayRadius: 0.0,
                    ),
                  ),
                ),
                child: Slider(
                  min: 0.0,
                  max: duration.value.inMilliseconds.toDouble(),
                  value: position.value.inMilliseconds.toDouble().clamp(
                        0.0,
                        duration.value.inMilliseconds.toDouble(),
                      ),
                  onChanged: (double value) async {
                    final newPosition = Duration(milliseconds: value.toInt());
                    await audioPlayer.seek(newPosition);
                  },
                ),
              ),
              const Gap(spacingUnit * 3),
              TextButton.icon(
                onPressed: resumePause,
                icon: PhosphorIcon(
                  size: spacingUnit * 2,
                  color: appTheme.colorTheme.primary,
                  isPlaying.value
                      ? PhosphorIconsFill.pause
                      : PhosphorIconsFill.play,
                ),
                label: Text(
                  isPlaying.value ? '一時停止' : '再生',
                ),
              ),
              const Gap(spacingUnit),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      '閉じる',
                      style: appTheme.textTheme.labelMd.copyWith(
                        color: appTheme.colorTheme.textSecondary,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

class CustomSliderThumbShape extends SliderComponentShape {
  const CustomSliderThumbShape({
    required this.enabledThumbRadius,
    required this.strokeWidth,
    required this.strokeColor,
  });
  final double enabledThumbRadius;
  final double strokeWidth;
  final Color strokeColor;

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final Canvas canvas = context.canvas;

    final fillPaint = Paint()
      ..color = sliderTheme.thumbColor ?? Colors.blue
      ..style = PaintingStyle.fill;

    final strokePaint = Paint()
      ..color = strokeColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(center, enabledThumbRadius, fillPaint);

    canvas.drawCircle(center, enabledThumbRadius, strokePaint);
  }

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(enabledThumbRadius);
  }
}

class AudioPlayButton extends HookConsumerWidget {
  const AudioPlayButton({
    super.key,
    required this.url,
  });

  final Uri url;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // AudioPlayerのインスタンスを作成

    print("url: $url");
    final audioPlayer = useMemoized(() => AudioPlayer(), const []);

    // 再生状態や時間を管理するフラグや変数
    final isPlaying = useState(false);
    final duration = useState(Duration.zero);
    final position = useState(Duration.zero);

    // 再生・停止を切り替えるコールバック
    final togglePlay = useCallback(
      () async {
        if (isPlaying.value) {
          await audioPlayer.pause();
        } else {
          await audioPlayer.play(UrlSource(url.toString())); // URLから再生
        }
        isPlaying.value = !isPlaying.value; // 再生状態を反転
      },
      [audioPlayer, isPlaying],
    );

    useEffect(() {
      audioPlayer.setReleaseMode(ReleaseMode.stop);

      final durationSubscription = audioPlayer.onDurationChanged.listen((d) {
        duration.value = d;
      });

      final positionSubscription = audioPlayer.onPositionChanged.listen((p) {
        position.value = p;
      });

      final completeSubscription = audioPlayer.onPlayerComplete.listen((_) {
        position.value = Duration.zero;
        isPlaying.value = false;
      });

      return () {
        durationSubscription.cancel();
        positionSubscription.cancel();
        completeSubscription.cancel();
        audioPlayer.dispose();
      };
    }, [audioPlayer]);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Slider(
        //   min: 0.0,
        //   max: duration.value.inMilliseconds.toDouble(),
        //   value: position.value.inMilliseconds.toDouble().clamp(
        //         0.0,
        //         duration.value.inMilliseconds.toDouble(),
        //       ),
        //   onChanged: (value) async {
        //     final newPosition = Duration(milliseconds: value.toInt());
        //     await audioPlayer.seek(newPosition); // シーク操作
        //   },
        // ),
        // Text(
        //   '${position.value.inMinutes}:${(position.value.inSeconds % 60).toString().padLeft(2, '0')} / '
        //   '${duration.value.inMinutes}:${(duration.value.inSeconds % 60).toString().padLeft(2, '0')}',
        // ),

        // 再生・一時停止ボタン
        TextButton.icon(
          onPressed: togglePlay, // ボタンを押したときに再生・停止を切り替える
          icon: PhosphorIcon(
            size: 24,
            color: Colors.blue,
            isPlaying.value
                ? PhosphorIconsFill.pause // 再生中なら一時停止アイコン
                : PhosphorIconsFill.play, // 停止中なら再生アイコン
          ),
          label: const Text(""),
        ),
      ],
    );
  }
}
