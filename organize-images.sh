#!/bin/bash
# ==========================================================================
# organize-images.sh
#
# Desktop/images 配下の素材から、サイト用に厳選した写真を images/ に、
# Instagram専用の候補（Reels動画・未確認HEIC）を instagram/ にコピー＆
# リネームします。ファイル名は「写真ファイル名の命名表.md」の番号（1=サムネ〜）
# に揃えてあります。ここで選んでいる写真と違うものを使いたい場合は、
# 命名表を見ながらご自身で images/ に直接リネーム＆コピーしていただいても
# 構いません（このスクリプトは必須ではありません）。
#
# HEIC（Resonanceの3枚）は sips で JPG に変換します（macOS標準コマンド）。
#
# 使い方:
#   1. このファイルをリポジトリのルート（index.html等がある場所）に置く
#   2. ターミナルで `bash organize-images.sh` を実行
#   3. images/ と instagram/ が作成され、選定した写真がコピーされます
# ==========================================================================

set -e

SRC="$HOME/Desktop/images"
DEST_SITE="./images"
DEST_IG="./instagram"
DEST_PDF="./pdfs"

mkdir -p "$DEST_SITE" "$DEST_IG" "$DEST_PDF"

echo "== 論考PDFをコピーしています =="
cp "$SRC/耳を澄ますための装置/視線の非対称性のコピー2.pdf" "$DEST_PDF/mimi-shisen.pdf"
cp "$SRC/耳を澄ますための装置/耳のコピー.pdf" "$DEST_PDF/mimi-rule.pdf"

echo "== サイト掲載用の画像をコピーしています =="

# --- Resonance（計10枚） ---
cp "$SRC/Resonance/resonance-01.jpg" "$DEST_SITE/resonance-01.jpg"
cp "$SRC/Resonance/resonance-sub1.jpg" "$DEST_SITE/resonance-02.jpg"
cp "$SRC/Resonance/resonance-sub2.jpg" "$DEST_SITE/resonance-03.jpg"
cp "$SRC/Resonance/IMG_1516.jpg" "$DEST_SITE/resonance-04.jpg"
cp "$SRC/Resonance/IMG_1517.jpg" "$DEST_SITE/resonance-05.jpg"
cp "$SRC/Resonance/IMG_1521.jpg" "$DEST_SITE/resonance-06.jpg"
cp "$SRC/Resonance/IMG_1522.jpg" "$DEST_SITE/resonance-07.jpg"
cp "$SRC/Resonance/IMG_4598.jpg" "$DEST_SITE/resonance-08.jpg"
cp "$SRC/Resonance/スクリーンショット 2026-07-21 14.12.44.png" "$DEST_SITE/resonance-app1.jpg"
cp "$SRC/Resonance/スクリーンショット 2026-07-21 14.13.17.png" "$DEST_SITE/resonance-app2.jpg"

# --- 耳を澄ますための装置（計5枚） ---
cp "$SRC/耳を澄ますための装置/IMG_9749.jpg" "$DEST_SITE/mimi-01.jpg"
cp "$SRC/耳を澄ますための装置/IMG_9748.jpg" "$DEST_SITE/mimi-02.jpg"
cp "$SRC/耳を澄ますための装置/mimi-main.jpg" "$DEST_SITE/mimi-03.jpg"
cp "$SRC/耳を澄ますための装置/mimi-sub1.jpg" "$DEST_SITE/mimi-04.jpg"
cp "$SRC/耳を澄ますための装置/edgesのコピー2.jpg" "$DEST_SITE/mimi-05.jpg"

# --- 大学生の放課後ミュージアム（フライヤーの1枚のみローカルにコピー） ---
# 会場写真3枚（旧museum-01〜03）は、とびらプロジェクト公式サイトの本人執筆記事から
# 直接読み込むようHTML側を変更したため、ローカルへのコピーは不要になりました。
cp "$SRC/大学生の放課後ミュージアム/afterschool-museum.jpg" "$DEST_SITE/museum-04.jpg"

# --- 絵画を聴く（インスタレーション・計10枚） ---
cp "$SRC/絵画を聴く/01_Sound_Installation.jpg" "$DEST_SITE/kiku-01.jpg"
cp "$SRC/絵画を聴く/LG5_8_03.JPG" "$DEST_SITE/kiku-02.jpg"
cp "$SRC/絵画を聴く/LG5_8_02.JPG" "$DEST_SITE/kiku-03.jpg"
cp "$SRC/絵画を聴く/スクエア画像.jpg" "$DEST_SITE/kiku-04.jpg"
cp "$SRC/絵画を聴く/作業風景.png" "$DEST_SITE/kiku-05.jpg"
cp "$SRC/絵画を聴く/Unity編集画面.png" "$DEST_SITE/kiku-06.jpg"
cp "$SRC/絵画を聴く/LG5_8_04.JPG" "$DEST_SITE/kiku-07.jpg"
cp "$SRC/絵画を聴く/LG5_1460.JPG" "$DEST_SITE/kiku-08.jpg"
cp "$SRC/絵画を聴く/LG5_1440.JPG" "$DEST_SITE/kiku-09.jpg"
cp "$SRC/絵画を聴く/スクリーンショット 2026-06-06 1.22.51.png" "$DEST_SITE/kiku-10.jpg"

# --- 聴く絵画をつくる（ワークショップ・計9枚） ---
cp "$SRC/聴く絵画をつくる/04_Web_App_Spatial_Audio.jpg" "$DEST_SITE/kikue-01.jpg"
cp "$SRC/聴く絵画をつくる/スクリーンショット 2026-07-21 13.47.17.png" "$DEST_SITE/kikue-02.jpg"
cp "$SRC/聴く絵画をつくる/スクリーンショット 2026-07-21 13.47.40.png" "$DEST_SITE/kikue-03.jpg"
cp "$SRC/聴く絵画をつくる/スクリーンショット 2026-07-21 13.48.08.png" "$DEST_SITE/kikue-04.jpg"
cp "$SRC/聴く絵画をつくる/スクリーンショット 2026-07-21 13.48.42.png" "$DEST_SITE/kikue-05.jpg"
cp "$SRC/聴く絵画をつくる/03_Web_App_Composition.jpg" "$DEST_SITE/kikue-06.jpg"
cp "$SRC/聴く絵画をつくる/スクリーンショット 2026-07-21 13.40.32.png" "$DEST_SITE/kikue-07.jpg"
cp "$SRC/聴く絵画をつくる/スクリーンショット 2026-07-21 13.40.50.png" "$DEST_SITE/kikue-08.jpg"
cp "$SRC/聴く絵画をつくる/スクリーンショット 2026-07-21 13.43.00.png" "$DEST_SITE/kikue-09.jpg"

echo "== Instagram専用（Reels動画・未確認HEICなど）をコピーしています =="

mkdir -p "$DEST_IG/mimi" "$DEST_IG/resonance/unreviewed-heic"

cp "$SRC/耳を澄ますための装置/インスタ.m4v" "$DEST_IG/mimi/reel-1.m4v"
cp "$SRC/耳を澄ますための装置/インスタ２.m4v" "$DEST_IG/mimi/reel-2.m4v"

echo "== HEIC(Resonance)をJPGに変換しています（内容未確認、使うかはご判断ください） =="
if command -v sips >/dev/null 2>&1; then
  sips -s format jpeg "$SRC/Resonance/IMG_4341.HEIC" --out "$DEST_IG/resonance/unreviewed-heic/IMG_4341.jpg" >/dev/null
  sips -s format jpeg "$SRC/Resonance/IMG_4598.HEIC" --out "$DEST_IG/resonance/unreviewed-heic/IMG_4598.jpg" >/dev/null
  sips -s format jpeg "$SRC/Resonance/IMG_5142.HEIC" --out "$DEST_IG/resonance/unreviewed-heic/IMG_5142.jpg" >/dev/null
else
  echo "sipsが見つかりませんでした。HEICの変換はスキップします（macOS以外の環境と思われます）。"
fi

echo "完了しました。images/ と instagram/ を確認してください。"
echo "写真を差し替えたい場合は「写真ファイル名の命名表.md」を見ながら、番号に合わせて images/ 内のファイルを入れ替えてください。"
