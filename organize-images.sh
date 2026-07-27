#!/bin/bash
# organize-images.sh
# Desktop/images 内の元写真・PDFを、サイト掲載用の名前でリサイズ＆圧縮しながらコピーします。
# 実行方法: このファイルがあるフォルダ（portfolio）で `bash organize-images.sh`

SRC=~/Desktop/images
DEST_SITE=./images
DEST_PDF=./pdfs

mkdir -p "$DEST_SITE"
mkdir -p "$DEST_PDF"
mkdir -p ./instagram/mimi

# 長辺1800px・JPEG品質80%にリサイズ＆圧縮してコピーする関数
# （スマホ写真の数MBが、だいたい数百KB程度になります）
resize_copy() {
  local src="$1"
  local dest="$2"
  if [ -f "$src" ]; then
    sips -s format jpeg -s formatOptions 80 -Z 1800 "$src" --out "$dest" > /dev/null
    echo "  ✓ $(basename "$dest")"
  else
    echo "  ✗ 見つかりません: $src"
  fi
}

echo "== 絵画を聴く =="
resize_copy "$SRC/絵画を聴く/01_Sound_Installation.jpg" "$DEST_SITE/kiku-01.jpg"
resize_copy "$SRC/絵画を聴く/02_Interaction.jpg" "$DEST_SITE/kiku-02.jpg"
resize_copy "$SRC/絵画を聴く/インスタレーションでのインタラクション.png" "$DEST_SITE/kiku-03.jpg"
resize_copy "$SRC/絵画を聴く/LG5_1440.JPG" "$DEST_SITE/kiku-04.jpg"
resize_copy "$SRC/絵画を聴く/LG5_1460.JPG" "$DEST_SITE/kiku-05.jpg"
resize_copy "$SRC/絵画を聴く/LG5_8_02.JPG" "$DEST_SITE/kiku-06.jpg"
resize_copy "$SRC/絵画を聴く/LG5_8_03.JPG" "$DEST_SITE/kiku-07.jpg"
resize_copy "$SRC/絵画を聴く/LG5_8_04.JPG" "$DEST_SITE/kiku-08.jpg"
resize_copy "$SRC/絵画を聴く/スクエア画像.jpg" "$DEST_SITE/kiku-09.jpg"
resize_copy "$SRC/絵画を聴く/作業風景.png" "$DEST_SITE/kiku-10.jpg"

echo "== 聴く絵画をつくる =="
resize_copy "$SRC/聴く絵画をつくる/03_Web_App_Composition.jpg" "$DEST_SITE/kikue-01.jpg"
resize_copy "$SRC/聴く絵画をつくる/04_Web_App_Spatial_Audio.jpg" "$DEST_SITE/kikue-02.jpg"
resize_copy "$SRC/聴く絵画をつくる/スクリーンショット 2026-07-21 13.40.32.png" "$DEST_SITE/kikue-03.jpg"
resize_copy "$SRC/聴く絵画をつくる/スクリーンショット 2026-07-21 13.40.50.png" "$DEST_SITE/kikue-04.jpg"
resize_copy "$SRC/聴く絵画をつくる/スクリーンショット 2026-07-21 13.43.00.png" "$DEST_SITE/kikue-05.jpg"
resize_copy "$SRC/聴く絵画をつくる/スクリーンショット 2026-07-21 13.47.17.png" "$DEST_SITE/kikue-06.jpg"
resize_copy "$SRC/聴く絵画をつくる/スクリーンショット 2026-07-21 13.47.40.png" "$DEST_SITE/kikue-07.jpg"
resize_copy "$SRC/聴く絵画をつくる/スクリーンショット 2026-07-21 13.48.08.png" "$DEST_SITE/kikue-08.jpg"
resize_copy "$SRC/聴く絵画をつくる/スクリーンショット 2026-07-21 13.48.42.png" "$DEST_SITE/kikue-09.jpg"

echo "== Resonance =="
resize_copy "$SRC/Resonance/resonance-01.jpg" "$DEST_SITE/resonance-01.jpg"
resize_copy "$SRC/Resonance/resonance-sub1.jpg" "$DEST_SITE/resonance-02.jpg"
resize_copy "$SRC/Resonance/resonance-sub2.jpg" "$DEST_SITE/resonance-03.jpg"
resize_copy "$SRC/Resonance/IMG_1516.jpg" "$DEST_SITE/resonance-04.jpg"
resize_copy "$SRC/Resonance/IMG_1517.jpg" "$DEST_SITE/resonance-05.jpg"
resize_copy "$SRC/Resonance/IMG_1521.jpg" "$DEST_SITE/resonance-06.jpg"
resize_copy "$SRC/Resonance/IMG_1522.jpg" "$DEST_SITE/resonance-07.jpg"
resize_copy "$SRC/Resonance/IMG_4598.jpg" "$DEST_SITE/resonance-08.jpg"
resize_copy "$SRC/Resonance/スクリーンショット 2026-07-21 14.12.44.png" "$DEST_SITE/resonance-app1.jpg"
resize_copy "$SRC/Resonance/スクリーンショット 2026-07-21 14.13.17.png" "$DEST_SITE/resonance-app2.jpg"

echo "== 大学生の放課後ミュージアム（フライヤーのみ／他はサイト埋め込み） =="
resize_copy "$SRC/大学生の放課後ミュージアム/afterschool-museum.jpg" "$DEST_SITE/museum-04.jpg"

echo "== 耳を澄ますための装置 =="
resize_copy "$SRC/耳を澄ますための装置/mimi-main.jpg" "$DEST_SITE/mimi-01.jpg"
resize_copy "$SRC/耳を澄ますための装置/mimi-sub1.jpg" "$DEST_SITE/mimi-02.jpg"
resize_copy "$SRC/耳を澄ますための装置/mimi-sub2.jpg" "$DEST_SITE/mimi-03.jpg"
resize_copy "$SRC/耳を澄ますための装置/IMG_9748.jpg" "$DEST_SITE/mimi-04.jpg"
resize_copy "$SRC/耳を澄ますための装置/IMG_9749.jpg" "$DEST_SITE/mimi-05.jpg"
resize_copy "$SRC/耳を澄ますための装置/listening-device.jpg" "$DEST_SITE/mimi-06.jpg"

echo "== PDF（論考・技術資料／圧縮せずそのままコピー） =="
if [ -f "$SRC/耳を澄ますための装置/視線の非対称性のコピー2.pdf" ]; then
  cp "$SRC/耳を澄ますための装置/視線の非対称性のコピー2.pdf" "$DEST_PDF/mimi-shisen.pdf"
  echo "  ✓ mimi-shisen.pdf"
fi
if [ -f "$SRC/耳を澄ますための装置/耳のコピー.pdf" ]; then
  cp "$SRC/耳を澄ますための装置/耳のコピー.pdf" "$DEST_PDF/mimi-rule.pdf"
  echo "  ✓ mimi-rule.pdf"
fi

echo "== Instagram動画（そのままコピー） =="
if [ -f "$SRC/耳を澄ますための装置/インスタ.m4v" ]; then
  cp "$SRC/耳を澄ますための装置/インスタ.m4v" ./instagram/mimi/
  echo "  ✓ インスタ.m4v"
fi
if [ -f "$SRC/耳を澄ますための装置/インスタ２.m4v" ]; then
  cp "$SRC/耳を澄ますための装置/インスタ２.m4v" ./instagram/mimi/
  echo "  ✓ インスタ２.m4v"
fi

echo ""
echo "完了：images/ と pdfs/ に圧縮済みファイルができました。"
du -sh ./images 2>/dev/null
