import requests
import json
from pathlib import Path
import glob
import os

def mds2waves(parent_dir):
    parent_dir = Path(parent_dir)
    mds_dir = parent_dir/"lesson_mds"
    mds_paths = list(mds_dir.glob("*.md"))
    output_dir = parent_dir / "lesson_audio_waves"
    os.makedirs(output_dir, exist_ok=True)
    for index, path in enumerate(mds_paths):
        output_path = output_dir / path.with_suffix('.wav').name
        with open(path, 'r', encoding='utf-8') as file:
            text = file.read()
        # エンジン起動時に表示されているIP、portを指定
        host = "127.0.0.1"
        port = 50021

        # 音声化する文言と話者を指定(3で標準ずんだもんになる)
        params = {
            'text': text,
            'speaker': 3,
        }

        # 音声合成用のクエリ作成
        query_response = requests.post(
            f'http://{host}:{port}/audio_query',
            params=params
        )

        if query_response.status_code != 200:
            print(f"クエリの作成に失敗しました: {query_response.status_code}")
            continue

        # 音声合成を実施
        synthesis_response = requests.post(
            f'http://{host}:{port}/synthesis',
            headers={"Content-Type": "application/json"},
            params=params,
            data=json.dumps(query_response.json())
        )

        if synthesis_response.status_code == 200:
            with open(output_path, 'wb') as f:
                f.write(synthesis_response.content)
            print(f"音声が {output_path} に保存されました。")
        else:
            print(f"音声合成に失敗しました: {synthesis_response.status_code}")

if __name__ == "__main__":
    mds2waves("図形と方程式_audio")
