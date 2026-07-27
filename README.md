# jumpeikaneko.github.io — サイト刷新版（v3）

無駄な装飾を排し、余白とタイポグラフィで見せる白黒グレーのみのポートフォリオサイトです。
ビルドツールは使わず、静的HTML + 1本のCSS + 1本のJSのみで構成しているので、
GitHub Pagesにそのまま置けばすぐに公開できます。

現状、サイトに掲載しているのは以下の5作品です（ご指定の通り）。

- 絵画を聴く（インスタレーション）
- 聴く絵画をつくる（ワークショップ）
- Resonance
- 耳を澄ますための装置
- 大学生の放課後ミュージアム

「気配に触れる」「ミキキの交差点」「VR学会論文」は、絵画を聴くの詳細ページ内や
展示・受賞歴のリストに関連情報としてのみ掲載し、独立ページは作っていません。

## ファイル構成

```
portfolio/
├── index.html                     About（プロフィール／ASIBA Pickup／活動略歴／受賞歴）
├── work.html                      作品一覧グリッド（5作品）
├── work-detail-kiku.html          絵画を聴く（インスタレーション）
├── work-detail-kikue.html         聴く絵画をつくる（ワークショップ）
├── work-detail-resonance.html     Resonance
├── work-detail-mimi.html          耳を澄ますための装置
├── work-detail-museum.html        大学生の放課後ミュージアム
├── news.html                      各項目をクリックすると関連ページへ移動
├── contact.html
├── css/style.css                   サイト全体のデザインを一元管理
├── js/main.js                      ナビ／スクロールフェードイン／進捗バー／スクランブルテキスト
├── 写真ファイル名の命名表.md        写真を1（サムネ）〜10まで番号でリネームするための表
├── organize-images.sh              写真の選定結果をimages/とinstagram/に自動振り分けするスクリプト
├── PHOTO_CURATION.md               写真選定の記録（何を選び、何を外したか）
├── CNAME                           GitHub Pagesの独自ドメイン設定（jumpeikaneko.com）
└── images/                         画像（命名表を参照）
```

## 使い方（3ステップ）

1. **写真の準備**：「写真ファイル名の命名表.md」を開き、各作品の番号（1=サムネイル〜）に
   合わせて、ご自身で選んだ写真を `resonance-01.jpg` のようにリネームし、`images/` に
   入れてください。`organize-images.sh` を実行すると、こちらで選定済みの候補写真を
   自動でコピー＆リネームすることもできます（必須ではありません）。
2. **このフォルダの中身を、現在のリポジトリのルートに上書きコピー**してください。
3. `git add . && git commit -m "Refresh site design" && git push` でGitHub Pagesに
   反映されます。

## 関連リンク（各ページに反映済み）

- 絵画を聴く：[ASIBA Creative Leagueプロジェクトページ](https://league.asiba.or.jp/projects/kaiga-wo-kiku)／[動画](https://youtu.be/eBatsv8Ndhs)／関連展示として[100BANCH](https://100banch.com/projects/listen-to-the-painting)へのリンクを掲載
- 聴く絵画をつくる：[美学校 展示ページ](https://bigakko.jp/exhibition/2026/kaigawokiku)
- 耳を澄ますための装置：[NEW SCHOOL成果展 公式ページ](https://artcenter-new.jp/fieldnoteofhope_exbihition/)／[動画](https://youtu.be/koExwe1mF_U)
- 大学生の放課後ミュージアム：[フォーラム映像ページ](https://tobira-project.info/blog/event/20260125_forum_movie.html)／[動画](https://youtu.be/qrjDPr2DpTM)
- Resonance：[作品本編音源](https://x.gd/IlZ4M)／[Sasebo Sound Chronicle Award 公式ページ](https://shimabi.com/sasebo-sound-chronicle-award/)／[動画](https://youtu.be/Ptc896ATLQY)／[SoundCloud](https://soundcloud.com/lt1jsa0m3wbn)
- News：各項目をクリックすると、関連する作品ページ（またはAbout）に移動します。
- 全ページ共通フッター：[Instagram](https://www.instagram.com/jumpei.kaneko)／[SoundCloud](https://soundcloud.com/lt1jsa0m3wbn)

## GitHub Pages 独自ドメイン設定

リポジトリ直下に `CNAME`（中身は `jumpeikaneko.com` の1行）を含めてあります。
push後、GitHubリポジトリの `Settings → Pages` で Custom domain に
`jumpeikaneko.com` が表示され、DNS側の設定が反映されていれば「Enforce HTTPS」に
チェックが入れられます。

お名前.com側では「ネームサーバー/DNS」→ 対象ドメインの「DNSレコード設定」で、
ホスト名を空欄にした状態で以下4つのAレコードを追加してください。

```
185.199.108.153
185.199.109.153
185.199.110.153
185.199.111.153
```

`www.jumpeikaneko.com` でもアクセスできるようにする場合は、ホスト名 `www` の
CNAMEレコードを追加し、値を `jumpeikaneko.github.io` にしてください。

## デザインの仕組み

- **配色**：白・黒・グレーのみ。差し色は使っていません。写真は白黒加工せず、
  実際の色をそのまま見せます。
- **タイポグラフィ**：Zen Old Mincho（和文）／EB Garamond（欧文）。見出しは大きく
  見せつつも、m-shitamichi.com のような「読ませる」組版を意識してサイズを抑え、
  リード文は少しイタリックにして編集的な質感を出しています。
- **グリッド／写真の見せ方**：作品一覧は細線区切りの2カラムグリッド（`.work-grid`）。
  各作品の詳細ページは https://league.asiba.or.jp/projects/kaiga-wo-kiku を参考に、
  短い導入文＋写真を飾らず縦にたくさん並べる`.photo-stream`構成にしています。
- **Pickup**：ASIBA Creative League 4期は、大きな見出しセクションにはせず、
  Aboutのプロフィール欄の下に小さな囲み（`.pickup`）として掲載しています。
- **活動略歴／展示・受賞歴**：枠を大きく取らず、1行あたりの余白を絞った
  コンパクトなリスト（`.timeline__row`）にしています。文章ではなく、年＋短い
  ラベルという形式に統一しました。
- **ちょっと変な、遊びの装飾**：
  - `.heading__watermark`：見出しの後ろに、輪郭線だけの巨大な連番を薄く配置。
    画面に入るとランダムな数字から本来の番号へカウントアップします。
  - `.marquee`：各ページ上部を横切る、プロジェクトのキーワードが流れ続ける一行。
- **モーション**：
  - `.reveal` / `.reveal-stagger`：スクロールで静かに浮かび上がるフェードイン。
  - `.img-wipe`：写真にカーテンが上がるようなワイプ演出。
  - スクランブルテキスト（`data-scramble`）：見出しが画面に入ると、ランダムな
    文字が少しずつ本来のテキストへ収束していきます。「信号がチューニングされて
    聴こえてくる」ような、サウンド・アートらしいモーションとして採用しました。
    カーソル追従の演出は使っていません。
  - ページ上部の細いスクロール進捗バー、全面にごく薄いグレインノイズを
    重ねてざらついた質感を出しています。
  - `prefers-reduced-motion` 設定時は自動的に無効化されます。
- **レスポンシブ**：720px以下でハンバーガーメニューに切り替わり、グリッドは
  1カラムになります。

## 今後の更新のしやすさ

- 新しい作品を追加する場合は、`work-detail-*.html` を1つコピーして中身を差し替え、
  `work.html` にカードを1つ追加するだけで済みます（デザインはCSS側で自動的に揃います）。
- 見出しにスクランブル演出を付けたい場合は、対象の要素に `data-scramble` 属性を
  付けるだけで動作します（プレーンテキストの見出し限定）。
- ヘッダー・フッターは各ページに同じマークアップを複製していますが、ビルド不要で
  GitHub Pages上でそのまま動くようにあえてシンプルな構成にしています。将来的に
  ページ数が増えてナビの一括管理をしたくなった場合は、Eleventyなどの軽量な
  静的サイトジェネレータの導入をご検討ください。
