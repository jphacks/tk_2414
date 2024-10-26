import os
import subprocess
from pathlib import Path
from bs4 import BeautifulSoup
import string
from selenium import webdriver
from selenium.webdriver.chrome.options import Options 
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.chrome.service import Service 
import base64
from tqdm import tqdm

class Md2SegmentedHTML:
    def __init__(self, input_file: str):
        self.input_file = Path(input_file)
        if not self.input_file.is_file():
            raise FileNotFoundError(f"入力ファイル '{self.input_file}' が存在しません。")
        self.output_dir = self.input_file.with_suffix('')  # 拡張子を除いたディレクトリ名

    def strip_md(self):
        # Markdownファイルを読み込み
        output_dir = self.output_dir / "lesson_mds"
        try:
            with self.input_file.open("r", encoding="utf-8") as file:
                markdown_text = file.read()
            contents = markdown_text.split("---")
            os.makedirs(output_dir, exist_ok=True)
            for index, content in enumerate(contents):
                content = content.strip()
                if not content:
                    continue
                segment_path = output_dir / f"segment_{index}.md"
                with segment_path.open("w", encoding="utf-8") as md_file:
                    md_file.write(content)
                print(f"{segment_path} を保存しました")
        except Exception as e:
            print(f"エラーが発生しました: {e}")

    def md2html(self):
        segment_paths = list((self.output_dir / "lesson_mds").glob("*.md"))
        if not segment_paths:
            print(f"出力ディレクトリ '{self.output_dir / 'lesson_mds'}' にMarkdownセグメントが見つかりません。")
            return
        output_dir = self.output_dir / "lesson_htmls"
        os.makedirs(output_dir, exist_ok=True)
        for path in segment_paths:
            output_path = output_dir / path.with_suffix('.html').name
            # コマンドと引数をリストで定義
            command = [
                "pandoc",
                "--self-contained",
                "-s",
                "--mathml",
                str(path),
                "-o",
                str(output_path)
            ]
            # コマンドを実行
            result = subprocess.run(command, capture_output=True, text=True)

            # 実行結果を確認
            if result.returncode == 0:
                print(f"{path.name} から {output_path.name} への変換が成功しました。")
            else:
                print(f"コマンド実行中にエラーが発生しました。")
                print(result.stderr)
    def html2png(self):
        html_paths = list((self.output_dir / "lesson_htmls").glob("*.html"))
        output_dir = self.output_dir / "lesson_pngs"
        os.makedirs(output_dir, exist_ok=True)
        service = Service(executable_path=ChromeDriverManager().install())

        # ヘッドレスモードのChromeオプションを設定
        chrome_options = Options()
        chrome_options.add_argument('--headless')
        chrome_options.add_argument('--hide-scrollbars')
        chrome_options.add_argument('--disable-gpu')

        driver = webdriver.Chrome(service=service, options=chrome_options)
        for path in tqdm(html_paths):
            # HTMLファイルの読み込み
            html_file_url = 'file://' + os.path.abspath(str(path))
            driver.get(html_file_url)
            output_path = output_dir / path.with_suffix('.png').name

            # ページの幅と高さを取得
            height = driver.execute_script('return document.body.scrollHeight')
            # ウィンドウサイズをページサイズに設定（高さを10%増やす）
            driver.set_window_size(676, int(height * 1.05))

            # 一時的な待機（必要に応じて）
            # import time
            # time.sleep(2)

            # フルページスクリーンショットを撮影（Chrome DevTools Protocolを使用）
            screenshot = driver.execute_cdp_cmd("Page.captureScreenshot", {"captureBeyondViewport": True, "fromSurface": True})
            with open(output_path, "wb") as f:
                f.write(base64.b64decode(screenshot['data']))
                print(base64.b64decode(screenshot['data']))
        # ブラウザを閉じる
        driver.quit()
if __name__ == "__main__":
    markdown_path = "tk_2414/ai/図形と方程式.md"
    try:
        converter = Md2SegmentedHTML(markdown_path)
        converter.strip_md()
        converter.md2html()
        converter.html2png()
    except FileNotFoundError as fnf_error:
        print(fnf_error)
    except Exception as e:
        print(f"予期せぬエラーが発生しました: {e}")