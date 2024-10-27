# 生成AIとttsモデルを用いた教材の自動作成

## このディレクトリ内のファイルについて

- **generate_lesson_script.ipynb**   
OpenAIのモデルとlangchain,Bingsearch APIを用いた教材の自動作成を行う

- **generate_audiofile.ipynb**   
上記のコードで作成した原稿のセグメントに対して設定した読み上げスクリプトから音声出力(whisper-large-v2model)を行う。
 
- **convert_html2png.py**
教材をセグメントごとに区切り、それぞれをhtmlを経由しpngデータへと変換することで、フロントやバックエンドの実装しやすい形にする。

- **generate_audio.py**  
VoiceVoxを用いてテキストの音声出力を行う。
## 教材スクリプトの自動作成について
具体的な教材生成に関する試作や最終案についてはgenerate_lesson_script.ipynb内に書かれているドキュメントを参照してください。

今回の最終案については以下のような処理を行います。  
### 必要なAPIキー　一覧　　
```
BING_SUBSCRIPTION_KEY = xxxx
LANGCHAIN_API_KEY = xxxx
LANGCHAIN_ENDPOINT = xxxx
OPENAI_API_KEY = xxxx
BING_SEARCH_URL = xxxx
LANGCHAIN_TRACING_V2 = true
```
上記APIキーを対象サービスにて取得後、.envファイルを作成し、ai/.envに格納する

### 処理フロー
```
最終的な処理内容として以下のようになった。  
1. GPT-o1-previewによって草稿を作成する
2. 批判的プロンプトと改善プロンプトの二つを用意する
3. Bingsearch APIによって必要情報を取得し生成する。
4. 批判的プロンプトによって草案に対して改善案を出力する
5. 改善プロンプトによって改善案と草案を入力することで改善された原稿を出力
6. これを規定step数に達するまで実行する
7. 完成した原稿に対して見出し2で分割し、それぞれに対してBingsearch APIを用いてweb上から補足情報の取得を行う。
8. 補足情報と分割した講義内容を入力することで補足情報の補完を行った原稿の作成を行う。
9. 原稿に対して例題や図(pythonコードで出力させ後述の処理によって画像変換)を作成
10. 以上を踏まえて作成した草案に対して、web上のChatGPTにて対話的に改善を行い、人間による構成を経てこれを最終原稿とする。
```

また、適切なプロンプトを作成するために要件や入出力を定義することによってプロンプトを作成するAgentの構築も行った。

## 教材スクリプトの分割と形式変換
教材スクリプトはMarkdown形式からhtml形式をへてバイナリーのpng形式へと変換を行った。

Tこの処理のコードはconvert_html2png.pyへと保管されている。

必要ライブラリ
```
selenium
webdriver-manager
beautifulsoup4
pypdf
PyAudio
pillow 
pandoc
tqdm
```
原稿には"---"を区切り文字に設定してあるので、そこを元に原稿をセグメントに分割する。

その後pandocを用いて分割したMarkdownをhtmlデータへと変換する。  
htmlデータはseleniumを用いてスクリーンショットを作成しバイナリーデータの画像データへと変換される。


## 読み上げ音声の自動作成について
具体的な教材生成に関する試作や最終案についてはgenerate_audiofile.ipynbとgenerate_audio.py内に書かれているドキュメントを参照してください。

今回の最終案については以下のような処理を行います。  
1. Gemini-1.5-pro-002に完成した原稿を全て入力し、原稿を作成する。
2. 教材スクリプトの分割と形式変換に含まれるコードを用いてセグメントごとに分割する
3. OpenAIのwhisperとVoiceVoxを用いて２種類の音声を作成する。