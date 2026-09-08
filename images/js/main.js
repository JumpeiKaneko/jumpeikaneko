/* =========================================================
   Jumpei Kaneko — Portfolio
   main.js
   共通の挙動をここに集約する：
   1) モバイルナビの開閉
   2) 現在ページのナビゲーションハイライト
   3) スクロール / 読み込み時のフェードイン・ワイプ（IntersectionObserver）
   4) スクロール進捗バー
   5) スクランブルテキスト（見出しがノイズから収束する）
   6) 見出し連番のカウントアップ
   ========================================================= */

document.addEventListener("DOMContentLoaded", () => {
  injectChrome();
  initNavToggle();
  initActiveNav();
  initRevealOnScroll();
  initScrollProgress();
  initScrambleText();
  initWatermarkCount();
  initLangToggle();
});

/* 0) 全ページ共通のオーバーレイ要素を注入 -------------------------- */
function injectChrome() {
  // ページ全体のグラデーション背景。position:fixedの実要素にすることで、
  // background-attachment:fixed の挙動が不安定な端末でも、スクロール位置に
  // 関わらず常に画面いっぱいにグラデーションが敷かれた状態を保証する。
  const pageBg = document.createElement("div");
  pageBg.className = "page-gradient-bg";
  document.body.prepend(pageBg);

  const grain = document.createElement("div");
  grain.className = "grain";
  document.body.appendChild(grain);

  const progress = document.createElement("div");
  progress.className = "scroll-progress";
  progress.setAttribute("data-scroll-progress", "");
  document.body.appendChild(progress);
}

/* 0b) 英語版の切り替え --------------------------------------------
   data-en属性を持つ要素だけを対象に、初回表示時の日本語(innerHTML)を
   自動でキャッシュしておき、ボタンで日本語⇄英語をトグルする。
   英語訳がまだ用意されていないページ／要素はそのまま日本語で表示される。 */
function initLangToggle() {
  const toggle = document.querySelector("[data-lang-toggle]");
  if (!toggle) return;

  const targets = document.querySelectorAll("[data-en]");
  let isEn = localStorage.getItem("siteLang") === "en";

  function applyLang(en) {
    targets.forEach((el) => {
      if (el.dataset.jaCache === undefined) {
        el.dataset.jaCache = el.innerHTML;
      }
      el.innerHTML = en ? el.dataset.en : el.dataset.jaCache;
    });
    document.documentElement.lang = en ? "en" : "ja";
    toggle.textContent = en ? "JA" : "EN";
    toggle.setAttribute("aria-pressed", String(en));
  }

  applyLang(isEn);

  toggle.addEventListener("click", () => {
    isEn = !isEn;
    localStorage.setItem("siteLang", isEn ? "en" : "ja");
    applyLang(isEn);
  });
}

/* 1) モバイルメニューの開閉 -------------------------------- */
function initNavToggle() {
  const toggle = document.querySelector("[data-menu-toggle]");
  const root = document.documentElement;

  if (!toggle) return;

  toggle.addEventListener("click", () => {
    const isOpen = root.classList.toggle("nav-open");
    toggle.setAttribute("aria-expanded", String(isOpen));
  });

  // ナビ内リンクをタップしたら閉じる（モバイル）
  document.querySelectorAll(".nav__link").forEach((link) => {
    link.addEventListener("click", () => {
      root.classList.remove("nav-open");
      toggle.setAttribute("aria-expanded", "false");
    });
  });
}

/* 2) 現在ページを nav に反映 -------------------------------- */
function initActiveNav() {
  const current = document
    .body
    .dataset
    .page; // 各HTMLの <body data-page="work"> 等から取得

  if (!current) return;

  document.querySelectorAll(".nav__link").forEach((link) => {
    if (link.dataset.navKey === current) {
      link.setAttribute("aria-current", "page");
    }
  });
}

/* 3) スクロールで静かに立ち上がるフェードイン / ワイプ ------------------ */
function initRevealOnScroll() {
  const targets = document.querySelectorAll(".reveal, .reveal-stagger, .img-wipe");

  if (!targets.length) return;

  if (!("IntersectionObserver" in window)) {
    targets.forEach((el) => el.classList.add("is-visible"));
    return;
  }

  const observer = new IntersectionObserver(
    (entries, obs) => {
      entries.forEach((entry) => {
        if (entry.isIntersecting) {
          entry.target.classList.add("is-visible");
          obs.unobserve(entry.target);
        }
      });
    },
    {
      threshold: 0.12,
      rootMargin: "0px 0px -8% 0px",
    }
  );

  targets.forEach((el) => observer.observe(el));
}

/* 4) ページ上部のスクロール進捗バー -------------------------------- */
function initScrollProgress() {
  const bar = document.querySelector("[data-scroll-progress]");
  if (!bar) return;

  const update = () => {
    const scrollTop = window.scrollY || document.documentElement.scrollTop;
    const height = document.documentElement.scrollHeight - window.innerHeight;
    const pct = height > 0 ? (scrollTop / height) * 100 : 0;
    bar.style.width = pct + "%";
  };

  update();
  window.addEventListener("scroll", update, { passive: true });
  window.addEventListener("resize", update);
}

/* 5) スクランブルテキスト — 見出しがノイズから文字として収束する ------
   [data-scramble] を付けた見出しが画面に入ったタイミングで、ランダムな
   文字が少しずつ本来のテキストへ収束していく。カーソル演出の代わりに、
   「信号がチューニングされて聴こえてくる」ような、サウンド・アートらしい
   モーションとして採用。 */
function initScrambleText() {
  const els = document.querySelectorAll("[data-scramble]");
  if (!els.length) return;

  if (window.matchMedia && window.matchMedia("(prefers-reduced-motion: reduce)").matches) {
    return;
  }

  const noise = "アイウエオカキクケコサシスセソタチツテト/ ・0123456789";

  const scramble = (el) => {
    const final = el.textContent;
    const len = final.length;
    const totalFrames = 16;
    let frame = 0;

    const timer = setInterval(() => {
      let out = "";
      for (let i = 0; i < len; i++) {
        const ch = final[i];
        if (ch === " " || ch === "\n") {
          out += ch;
          continue;
        }
        const revealAt = (i / len) * totalFrames * 0.7;
        out += frame >= revealAt ? ch : noise[Math.floor(Math.random() * noise.length)];
      }
      el.textContent = out;
      frame++;
      if (frame > totalFrames) {
        el.textContent = final;
        clearInterval(timer);
      }
    }, 40);
  };

  if (!("IntersectionObserver" in window)) {
    els.forEach((el) => scramble(el));
    return;
  }

  const observer = new IntersectionObserver(
    (entries, obs) => {
      entries.forEach((entry) => {
        if (entry.isIntersecting) {
          scramble(entry.target);
          obs.unobserve(entry.target);
        }
      });
    },
    { threshold: 0.5 }
  );

  els.forEach((el) => observer.observe(el));
}

/* 6) 見出しの背景連番（heading__watermark）をカウントアップさせる ------ */
function initWatermarkCount() {
  const marks = document.querySelectorAll(".heading__watermark");
  if (!marks.length || !("IntersectionObserver" in window)) return;

  if (window.matchMedia && window.matchMedia("(prefers-reduced-motion: reduce)").matches) {
    return;
  }

  const observer = new IntersectionObserver(
    (entries, obs) => {
      entries.forEach((entry) => {
        const el = entry.target;
        if (!entry.isIntersecting) return;

        const target = el.textContent.trim();
        const digits = target.length;
        let i = 0;
        const steps = 10;

        const timer = setInterval(() => {
          i++;
          if (i >= steps) {
            el.textContent = target;
            clearInterval(timer);
            return;
          }
          const rand = Math.floor(Math.random() * Math.pow(10, digits));
          el.textContent = String(rand).padStart(digits, "0");
        }, 45);

        obs.unobserve(el);
      });
    },
    { threshold: 0.4 }
  );

  marks.forEach((el) => observer.observe(el));
}
