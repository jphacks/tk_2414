import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path_provider/path_provider.dart';

class DisplaySavedImage extends HookConsumerWidget {
  final String fileName;

  const DisplaySavedImage({super.key, required this.fileName});

  static const name = 'DisplaySavedImage';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageFile = useState<File?>(null);

    // 画像ファイルをロードするメソッド
    Future<void> loadImage() async {
      try {
        final directory = await getApplicationDocumentsDirectory();
        final path = directory.path;
        final file = File('$path/$fileName');

        if (await file.exists()) {
          imageFile.value = file;
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('画像ファイルが見つかりません。')),
          );
        }
      } catch (e) {
        // エラーが発生した場合の処理
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('画像の読み込み中にエラーが発生しました: $e')),
        );
      }
    }

    // useEffectを使用して初期ロードを実行
    useEffect(() {
      loadImage();
      return null; // クリーンアップは必要ないためnullを返す
    }, []);

    return Scaffold(
      appBar: AppBar(
        title: const Text('保存された画像を表示'),
      ),
      body: Center(
        child: imageFile.value != null
            ? Image.file(imageFile.value!)
            : const Text('画像が読み込まれていません。'),
      ),
    );
  }
}
