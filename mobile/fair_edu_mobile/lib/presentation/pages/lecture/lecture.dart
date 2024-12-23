import 'dart:convert';

import 'package:fair_edu_mobile/domain/model/entity/chat.dart';
import 'package:fair_edu_mobile/domain/model/entity/head_line.dart';
import 'package:fair_edu_mobile/domain/model/entity/segment.dart';
import 'package:fair_edu_mobile/presentation/pages/lecture/components/audio_play_dialog.dart';
import 'package:fair_edu_mobile/presentation/pages/lecture/components/headLine.dart';
import 'package:fair_edu_mobile/presentation/pages/lecture/components/segment_card.dart';
import 'package:fair_edu_mobile/presentation/pages/lecture/controller.dart';
import 'package:fair_edu_mobile/presentation/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:scribble/scribble.dart';
import 'package:uuid/uuid.dart';
import 'package:webview_flutter/webview_flutter.dart';

const types.User mockUser = types.User(id: 'user', firstName: 'user');
const types.User mockBot = types.User(id: 'bot', firstName: 'bot');

void handleAttachmentPressed() {
  print('Attachment button pressed');
}

class LectureScreen extends HookConsumerWidget {
  const LectureScreen({
    super.key,
    required this.id,
    required this.courseId,
    required this.lectureId,
  });

  final String id;
  final String courseId;
  final String lectureId;

  static const name = 'Lecture';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLeftSidebarOpen = useState(true);
    final isRightSidebarOpen = useState(true);
    // final selectedSegment = useState<UuidValue?>(UuidValue.fromString("seg1"));
    final selectedSegment = useState<UuidValue?>(UuidValue.fromString("null"));
    final selectedChat = useState<UuidValue?>(UuidValue.fromString("null"));

    final scribbleController = useState(ScribbleNotifier());
    final ScrollController scrollController = useScrollController();

    final svgXmlList = useState<List<SegmentEntity>>([]);

    final asyncGetHeadLine = ref.watch(ListHeadLineControllerProvider(
      lectureId: UuidValue.fromString("lec11"),
    ));
    final asyncGetMaterial = ref.watch(GetMaterialListControllerProvider(
      lectureId: UuidValue.fromString("lec11"),
    ));
    final postController = ref.read(postMessageProvider.notifier);

    final chatToDisplay = useState<List<types.TextMessage>>([]);

    final chatListAsync = ref.watch(ListChatControllerProvider(
      userId: UuidValue.fromString("user1"),
      lectureId: UuidValue.fromString("lec11"),
    ));

    print("chatListAsync: ${chatListAsync.valueOrNull}");

    useEffect(() {
      scribbleController.value.setStrokeWidth(1.0);
      return null;
    }, []);

    useEffect(() {
      final selectedChat = chatListAsync.valueOrNull?.firstWhere(
        (chatEntity) => chatEntity.segmentId == selectedSegment.value,
        orElse: () => ChatEntity(
          chatId: UuidValue.fromString(""),
          segmentId: UuidValue.fromString(""),
          messages: [],
        ),
      );

      chatToDisplay.value = selectedChat != null
          ? selectedChat.messages.map((messageEntity) {
              // isUserがtrueならmockUser、falseならmockBotをauthorに設定
              final author = messageEntity.isUser ? mockUser : mockBot;

              final message = types.TextMessage(
                author: author, // authorを動的に設定
                createdAt: DateTime.now().millisecondsSinceEpoch,
                id: const Uuid().v4(),
                text: messageEntity.message, // message.textを使用
              );
              return message;
            }).toList()
          : [];

      return null;
    }, [selectedSegment.value]);

    // useEffect(() {
    //   final selectedChat = chatListAsync.valueOrNull?.firstWhere(
    //       (chatEntity) => chatEntity.segmentId == selectedSegment.value,
    //       orElse: () => ChatEntity(
    //             chatId: UuidValue.fromString(""),
    //             segmentId: UuidValue.fromString(""),
    //             messages: [],
    //           ));

    //   chatToDisplay.value = selectedChat != null
    //       ? selectedChat.messages.map((messageEntity) {
    //           final message = types.TextMessage(
    //             author: mockUser,
    //             createdAt: DateTime.now().millisecondsSinceEpoch,
    //             id: const Uuid().v4(),
    //             text: messageEntity.message, // message.textを使用
    //           );
    //           return message;
    //         }).toList()
    //       : [];

    //   return null;
    // }, [selectedSegment.value]);

    useEffect(() {
      switch (asyncGetMaterial) {
        case AsyncData(:final value):
          if (value.isNotEmpty) {
            svgXmlList.value = value.map((material) {
              return material.copyWith(
                content: '''
                <html>
                  <body style="margin: 0; padding: 0;">
                    ${material.content} <!-- SVGデータを挿入 -->
                  </body>
                </html>
              ''',
              );
            }).toList();
          }
          break;
        case AsyncLoading():
          break;
        case AsyncError(:final error):
          break;
      }
      return null;
    }, [asyncGetMaterial]);

    void handleSendPressed(types.PartialText message, WidgetRef ref,
        ValueNotifier<List<types.TextMessage>> chatToDisplay) async {
      final newMessage = types.TextMessage(
        author: mockUser,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: const Uuid().v4(),
        text: message.text,
      );

      final bool hasMatch = svgXmlList.value.any(
        (segment) => segment.id == selectedSegment.value,
      );

      final selectedChat = chatListAsync.valueOrNull?.firstWhere(
          (chatEntity) => chatEntity.segmentId == selectedSegment.value,
          orElse: () => ChatEntity(
                chatId: UuidValue.fromString(""),
                segmentId: UuidValue.fromString(""),
                messages: [],
              ));

      final chatId = hasMatch ? selectedChat?.chatId : null;

      try {
        final newId = await postController.post(
            userId: UuidValue.fromString("user1"),
            lectureId: UuidValue.fromString("lec11"),
            chatId: chatId,
            message: message.text);

        selectedSegment.value = newId;

        chatToDisplay.value = [...chatToDisplay.value, newMessage];
      } catch (error) {}
    }

    final mediaQueryData =
        MediaQueryData.fromView(WidgetsBinding.instance.window);
    final screenHeight = mediaQueryData.size.height;
    final screenWidth = mediaQueryData.size.width - 700;

    double totalHeight = 0;
    for (var svgXml in svgXmlList.value) {
      final viewBoxMatch =
          RegExp(r'viewBox="([0-9.]+) ([0-9.]+) ([0-9.]+) ([0-9.]+)"')
              .firstMatch(svgXml.content);
      double? svgHeight;

      if (viewBoxMatch != null) {
        final widthInViewBox = double.tryParse(viewBoxMatch.group(3)!);
        final heightInViewBox = double.tryParse(viewBoxMatch.group(4)!);

        if (widthInViewBox != null && heightInViewBox != null) {
          final aspectRatio = heightInViewBox / widthInViewBox;
          final webViewWidth = screenWidth * 0.9;
          svgHeight = webViewWidth * aspectRatio;
        }
      }

      svgHeight ??= 300;
      totalHeight += svgHeight;
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () => const HomeRoute().go(context)),
        title: const Text('Lecture'),
        actions: [
          IconButton(
            icon: Icon(isLeftSidebarOpen.value
                ? Icons.arrow_back_ios
                : Icons.arrow_forward_ios),
            onPressed: () => isLeftSidebarOpen.value = !isLeftSidebarOpen.value,
          ),
          IconButton(
            icon: Icon(isRightSidebarOpen.value
                ? Icons.arrow_forward_ios
                : Icons.arrow_back_ios),
            onPressed: () =>
                isRightSidebarOpen.value = !isRightSidebarOpen.value,
          ),
        ],
      ),
      body: Row(
        children: [
          AnimatedContainer(
            width: isLeftSidebarOpen.value ? 150 : 0,
            height: double.infinity,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            color: Colors.grey[200],
            child: isLeftSidebarOpen.value
                ? switch (asyncGetHeadLine) {
                    AsyncValue(value: final dataList, isLoading: false)
                        when dataList != null =>
                      LeftSidebarContent(
                        headLineList: dataList,
                      ),
                    _ => const Center(child: CircularProgressIndicator())
                  }
                : null,
          ),
          Expanded(
            child: Container(
                decoration: const BoxDecoration(color: Colors.white),
                padding: const EdgeInsets.all(16.0),
                child: switch (asyncGetMaterial) {
                  AsyncValue(:final value) when value != null => switch (
                        chatListAsync) {
                      AsyncValue(value: final dataList, isLoading: false)
                          when dataList != null =>
                        Stack(
                          children: [
                            Stack(
                              children: [
                                SingleChildScrollView(
                                  controller: scrollController,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start, // 上揃えにする
                                    children: [
                                      // 左側のアイコンを縦に並べるColumn
                                      Column(
                                        children:
                                            svgXmlList.value.map((svgXml) {
                                          final viewBoxMatch = RegExp(
                                                  r'viewBox="([0-9.]+) ([0-9.]+) ([0-9.]+) ([0-9.]+)"')
                                              .firstMatch(svgXml.content);
                                          double? svgHeight;

                                          if (viewBoxMatch != null) {
                                            final widthInViewBox =
                                                double.tryParse(
                                                    viewBoxMatch.group(3)!);
                                            final heightInViewBox =
                                                double.tryParse(
                                                    viewBoxMatch.group(4)!);

                                            if (widthInViewBox != null &&
                                                heightInViewBox != null) {
                                              final aspectRatio =
                                                  heightInViewBox /
                                                      widthInViewBox;
                                              final webViewWidth =
                                                  screenWidth * 0.9;

                                              svgHeight =
                                                  webViewWidth * aspectRatio;
                                            }
                                          }

                                          svgHeight ??= 300;

                                          return Padding(
                                            padding: EdgeInsets.only(
                                                bottom: svgHeight - 28),
                                            child: AudioPlayButton(
                                              url: Uri.parse(svgXml.voiceUrl),
                                            ),
                                          );
                                        }).toList(),
                                      ),

                                      // 右側のStack: SegmentCardとScribbleを重ねる
                                      Expanded(
                                        child: Stack(
                                          children: [
                                            // SegmentCardを表示するColumn
                                            Column(
                                              children: svgXmlList.value
                                                  .map((svgXml) {
                                                final viewBoxMatch = RegExp(
                                                        r'viewBox="([0-9.]+) ([0-9.]+) ([0-9.]+) ([0-9.]+)"')
                                                    .firstMatch(svgXml.content);
                                                double? svgHeight;

                                                if (viewBoxMatch != null) {
                                                  final widthInViewBox =
                                                      double.tryParse(
                                                          viewBoxMatch
                                                              .group(3)!);
                                                  final heightInViewBox =
                                                      double.tryParse(
                                                          viewBoxMatch
                                                              .group(4)!);

                                                  if (widthInViewBox != null &&
                                                      heightInViewBox != null) {
                                                    final aspectRatio =
                                                        heightInViewBox /
                                                            widthInViewBox;
                                                    final webViewWidth =
                                                        screenWidth * 0.9;

                                                    svgHeight = webViewWidth *
                                                        aspectRatio;
                                                  }
                                                }

                                                svgHeight ??= 300;

                                                final webViewController =
                                                    WebViewController()
                                                      ..setJavaScriptMode(
                                                          JavaScriptMode
                                                              .unrestricted)
                                                      ..loadRequest(
                                                        Uri.dataFromString(
                                                          svgXml.content,
                                                          mimeType: 'text/html',
                                                          encoding: Encoding
                                                              .getByName(
                                                                  'utf-8'),
                                                        ),
                                                      );

                                                return SegmentCard(
                                                  webViewController:
                                                      webViewController,
                                                  screenWidth: screenWidth,
                                                  svgHeight: svgHeight,
                                                  audioUrl: Uri.parse(
                                                      'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3'),
                                                  onSelect: () {},
                                                  isSelected:
                                                      selectedSegment.value ==
                                                          svgXml.id,
                                                  hasMessage: dataList.any(
                                                      (chatEntity) =>
                                                          chatEntity
                                                              .segmentId ==
                                                          svgXml.id),
                                                );
                                              }).toList(),
                                            ),
                                            // Scribbleを最前面に表示
                                            Positioned.fill(
                                              child: SizedBox(
                                                height: totalHeight,
                                                child: Scribble(
                                                  notifier:
                                                      scribbleController.value,
                                                  drawPen: true,
                                                  simulatePressure: false,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Column(
                                        children:
                                            svgXmlList.value.map((svgXml) {
                                          final viewBoxMatch = RegExp(
                                                  r'viewBox="([0-9.]+) ([0-9.]+) ([0-9.]+) ([0-9.]+)"')
                                              .firstMatch(svgXml.content);
                                          double? svgHeight;

                                          if (viewBoxMatch != null) {
                                            final widthInViewBox =
                                                double.tryParse(
                                                    viewBoxMatch.group(3)!);
                                            final heightInViewBox =
                                                double.tryParse(
                                                    viewBoxMatch.group(4)!);

                                            if (widthInViewBox != null &&
                                                heightInViewBox != null) {
                                              final aspectRatio =
                                                  heightInViewBox /
                                                      widthInViewBox;
                                              final webViewWidth =
                                                  screenWidth * 0.9;

                                              svgHeight =
                                                  webViewWidth * aspectRatio;
                                            }
                                          }

                                          svgHeight ??= 300;
                                          final hasMessage = dataList.any(
                                              (chatEntity) =>
                                                  chatEntity.segmentId ==
                                                  svgXml.id);

                                          return Padding(
                                            padding: EdgeInsets.only(
                                                bottom: svgHeight - 28),
                                            child: hasMessage
                                                ? IconButton(
                                                    onPressed: () {
                                                      print('chat pressed');
                                                      selectedSegment.value =
                                                          svgXml.id;
                                                    },
                                                    icon: const PhosphorIcon(
                                                      PhosphorIconsRegular.chat,
                                                    ),
                                                  )
                                                : const SizedBox(
                                                    width: 48,
                                                    height: 48,
                                                  ),
                                          );
                                        }).toList(),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      _ => const Center(child: CircularProgressIndicator())
                    },
                  _ => const Center(child: CircularProgressIndicator())
                }),
          ),
          AnimatedContainer(
            width: isRightSidebarOpen.value ? 400 : 0,
            height: double.infinity,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            color: Colors.grey[200],
            child: isRightSidebarOpen.value
                ? RightSidebarContent(
                    isSidebarOpen: isRightSidebarOpen.value,
                    messages: chatToDisplay.value,
                    user: mockUser,
                    onSendPressed: (message) =>
                        handleSendPressed(message, ref, chatToDisplay),
                    onAttachmentPressed: handleAttachmentPressed,
                  )
                : null,
          ),
        ],
      ),
    );
  }
}

class LeftSidebarContent extends HookConsumerWidget {
  const LeftSidebarContent({
    super.key,
    required this.headLineList,
  });

  final List<HeadLineEntity> headLineList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate(
            headLineList
                .map((headLine) => HeadLineCard(headLine: headLine))
                .toList(),
          ),
        ),
      ],
    );
  }
}

class RightSidebarContent extends HookConsumerWidget {
  const RightSidebarContent({
    super.key,
    required this.isSidebarOpen,
    required this.messages,
    required this.user,
    required this.onSendPressed,
    required this.onAttachmentPressed,
  });

  final bool isSidebarOpen;
  final List<types.Message> messages;
  final types.User user;
  final void Function(types.PartialText) onSendPressed;
  final void Function() onAttachmentPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isRightSidebarOpen = useState(isSidebarOpen);
    final messageController = useState<List<types.Message>>([]);

    // ScrollControllerを使用
    final scrollController = useScrollController();

    useEffect(() {
      messageController.value = List<types.Message>.from(messages)
        ..sort((a, b) => (b.createdAt ?? 0).compareTo(a.createdAt ?? 0));

      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (scrollController.hasClients) {
          scrollController.jumpTo(scrollController.position.maxScrollExtent);
        }
      });
      return null;
    }, [messages]);

    return AnimatedContainer(
      // 背景色
      // decoration: BoxDecoration(color: Colors.grey[200]),
      width: isRightSidebarOpen.value ? 300 : 0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      color: Colors.grey[500],
      child: isRightSidebarOpen.value
          ? Chat(
              messages: messageController.value,
              onSendPressed: onSendPressed,
              onAttachmentPressed: onAttachmentPressed,
              user: user,
              showUserAvatars: true,
              showUserNames: true,
              theme: const DefaultChatTheme(
                backgroundColor:
                    Color.fromARGB(255, 235, 235, 235), // ここで背景色を設定
              ),
              // scrollController: scrollController, // ScrollControllerを渡す
            )
          : null,
    );
  }
}
