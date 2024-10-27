import 'dart:convert';
import 'dart:ui';

import 'package:fair_edu_mobile/domain/model/entity/head_line.dart';
import 'package:fair_edu_mobile/domain/model/entity/segment.dart';
import 'package:fair_edu_mobile/presentation/pages/lecture/components/headLine.dart';
import 'package:fair_edu_mobile/presentation/pages/lecture/components/segment_card.dart';
import 'package:fair_edu_mobile/presentation/pages/lecture/controller.dart';
import 'package:fair_edu_mobile/presentation/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:scribble/scribble.dart';
import 'package:uuid/uuid.dart';
import 'package:webview_flutter/webview_flutter.dart';

const types.User mockUser = types.User(id: 'user-1', firstName: 'user');
final List<types.TextMessage> mockMessages = [
  types.TextMessage(
    author: const types.User(id: 'user-2', firstName: 'Support Agent'),
    createdAt: DateTime.now().millisecondsSinceEpoch - 5000,
    id: const Uuid().v4(),
    text: 'I have a question about my lecture notes.',
  ),
  types.TextMessage(
    author: const types.User(id: 'user-1', firstName: 'John'),
    createdAt: DateTime.now().millisecondsSinceEpoch + 10000,
    id: const Uuid().v4(),
    text: 'Hello! How can I assist you today?',
  ),
];

void handleSendPressed(types.PartialText message) {
  final newMessage = types.TextMessage(
    author: mockUser,
    createdAt: DateTime.now().millisecondsSinceEpoch,
    id: const Uuid().v4(),
    text: message.text,
  );

  print('Message sent: ${newMessage.text}');
}

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
    final selectedSegment = useState<UuidValue?>(UuidValue.fromString("seg1"));
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

    final chatToDisplay = useState<List<types.TextMessage>>(mockMessages);

    final chatListAsync = ref.watch(ListChatControllerProvider(
      userId: UuidValue.fromString("user1"),
      lectureId: UuidValue.fromString("lec11"),
    ));

    print("chatListAsync: ${chatListAsync.valueOrNull}");

    useEffect(() {
      scribbleController.value.setStrokeWidth(1.0);
      return null;
    }, []);

    // 最初のチャットを表示
    useEffect(() {
      final firstChatEntity = chatListAsync.valueOrNull?.first;
      if (firstChatEntity != null) {
        chatToDisplay.value = firstChatEntity.messages.map((messageEntity) {
          final message = types.TextMessage(
            author: mockUser,
            createdAt: DateTime.now().millisecondsSinceEpoch,
            id: const Uuid().v4(),
            text: messageEntity.message, // message.textを使用
          );
          return message;
        }).toList();
      } else {
        chatToDisplay.value = [];
      }
      return null;
    }, [selectedSegment, chatListAsync.valueOrNull]);

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

      final chatId = hasMatch ? selectedSegment.value : null;

      try {
        await postController.post(
            userId: UuidValue.fromString("user1"),
            lectureId: UuidValue.fromString("lec11"),
            chatId: UuidValue.fromString("chat1"),
            message: message.text);

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
                            Listener(
                              onPointerDown: (event) {
                                if (event.kind == PointerDeviceKind.touch) {
                                  scribbleController.value.onPointerDown(event);
                                }
                              },
                              onPointerMove: (event) {
                                if (event.kind == PointerDeviceKind.touch) {
                                  scribbleController.value
                                      .onPointerUpdate(event);
                                }
                              },
                              onPointerUp: (event) {
                                if (event.kind == PointerDeviceKind.touch) {
                                  scribbleController.value.onPointerUp(event);
                                }
                              },
                              child: Stack(
                                children: [
                                  SingleChildScrollView(
                                    controller: scrollController,
                                    child: Stack(
                                      children: [
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

                                            final webViewController =
                                                WebViewController()
                                                  ..setJavaScriptMode(
                                                      JavaScriptMode
                                                          .unrestricted)
                                                  ..loadRequest(
                                                    Uri.dataFromString(
                                                      svgXml.content,
                                                      mimeType: 'text/html',
                                                      encoding:
                                                          Encoding.getByName(
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
                                                      chatEntity.segmentId ==
                                                      svgXml.id),
                                            );
                                          }).toList(),
                                        ),
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
                                ],
                              ),
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
      width: isRightSidebarOpen.value ? 300 : 0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      color: Colors.grey[200],
      child: isRightSidebarOpen.value
          ? Chat(
              messages: messageController.value,
              onSendPressed: onSendPressed,
              onAttachmentPressed: onAttachmentPressed,
              user: user,
              showUserAvatars: true,
              showUserNames: true,
              // scrollController: scrollController, // ScrollControllerを渡す
            )
          : null,
    );
  }
}
