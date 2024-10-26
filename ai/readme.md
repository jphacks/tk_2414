# 生成AIとttsモデルを用いた教材の自動作成

## このディレクトリ内のファイルについて

・**generate_lesson_script.ipynb**   
OpenAIのモデルとlangchain,Bingsearch APIを用いた教材の自動作成を行う

・**generate_audiofile.ipynb**   
上記のコードで作成した原稿のセグメントに対して設定した読み上げスクリプトから音声出力(text-to-speach)を行う。

ToDo: 最終的なフロー決定  
ToDo: Markdownの分割、SVG変換のコードを記述する  
ToDo: Markdownの分割、SVG変換のコードを記述する 

## 教材スクリプトの自動作成について
具体的な教材生成に関する試作や最終案についてはgenerate_lesson_script.ipynb内に書かれているドキュメントを参照してください。

今回の最終案については以下のような処理を行います。  
ToDo: 最終的なフローを記入する

## 教材スクリプトの分割と形式変換
教材スクリプトはMarkdown形式からhtml形式をへてバイナリーのpng形式へと変換を行った。

ToDo:この処理のコードは~へと保管されている。

## 読み上げ音声の自動作成について
具体的な教材生成に関する試作や最終案についてはgenerate_audiofile.ipynb内に書かれているドキュメントを参照してください。

今回の最終案については以下のような処理を行います。  
ToDo: 最終的なフローを記入する