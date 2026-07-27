/* main.js — nav / reveal / scramble-text / watermark count */

document.addEventListener('DOMContentLoaded', () => {
  initMobileMenu();
  initReveal();
  initScrambleText();
  initWatermarkCount();
  initFooterYear();
});

/* ---- モバイルメニュー ---- */
function initMobileMenu() {
  const btn = document.getElementById('menu-btn');
  const panel = document.getElementById('mobile-menu');
  if (!btn || !panel) return;

  const nav = document.querySelector('.main-nav');
  if (nav) panel.innerHTML = nav.innerHTML;

  btn.addEventListener('click', () => {
    const open = panel.classList.toggle('is-open');
    btn.textContent = open ? 'CLOSE' : 'MENU';
  });
}

/* ---- スクロールフェードイン ---- */
function initReveal() {
  const targets = document.querySelectorAll('.reveal');
  if (!targets.length) return;

  if (window.matchMedia('(prefers-reduced-motion: reduce)').matches) {
    targets.forEach((el) => el.classList.add('is-visible'));
    return;
  }

  const observer = new IntersectionObserver(
    (entries, obs) => {
      entries.forEach((entry) => {
        if (entry.isIntersecting) {
          entry.target.classList.add('is-visible');
          obs.unobserve(entry.target);
        }
      });
    },
    { threshold: 0.12, rootMargin: '0px 0px -40px 0px' }
  );

  targets.forEach((el) => observer.observe(el));
}

/* ---- スクランブルテキスト（見出し用モーション） ---- */
function initScrambleText() {
  const targets = document.querySelectorAll('[data-scramble]');
  if (!targets.length) return;

  const reduced = window.matchMedia('(prefers-reduced-motion: reduce)').matches;
  const noise = 'アイウエオカキクケコサシスセソタチツテトナニヌネノ0123456789';

  if (reduced) return;

  const runScramble = (el) => {
    const original = el.textContent;
    const len = original.length;
    let frame = 0;
    const totalFrames = 18;

    const interval = setInterval(() => {
      frame++;
      let out = '';
      for (let i = 0; i < len; i++) {
        const revealPoint = (i / len) * totalFrames;
        if (frame >= revealPoint + totalFrames * 0.3) {
          out += original[i];
        } else if (original[i] === ' ' || original[i] === '\n') {
          out += original[i];
        } else {
          out += noise[Math.floor(Math.random() * noise.length)];
        }
      }
      el.textContent = out;
      if (frame >= totalFrames) {
        clearInterval(interval);
        el.textContent = original;
      }
    }, 35);
  };

  const observer = new IntersectionObserver(
    (entries, obs) => {
      entries.forEach((entry) => {
        if (entry.isIntersecting) {
          runScramble(entry.target);
          obs.unobserve(entry.target);
        }
      });
    },
    { threshold: 0.4 }
  );

  targets.forEach((el) => observer.observe(el));
}

/* ---- 見出し脇のウォーターマーク数字カウントアップ ---- */
function initWatermarkCount() {
  const targets = document.querySelectorAll('.heading__watermark');
  if (!targets.length) return;

  if (window.matchMedia('(prefers-reduced-motion: reduce)').matches) return;

  const observer = new IntersectionObserver(
    (entries, obs) => {
      entries.forEach((entry) => {
        if (!entry.isIntersecting) return;
        const el = entry.target;
        const finalText = el.textContent.trim();
        const finalNum = parseInt(finalText, 10);
        if (isNaN(finalNum)) return;

        let frame = 0;
        const totalFrames = 14;
        const interval = setInterval(() => {
          frame++;
          if (frame >= totalFrames) {
            el.textContent = finalText;
            clearInterval(interval);
          } else {
            const rnd = Math.floor(Math.random() * 90) + 10;
            el.textContent = String(rnd).padStart(finalText.length, '0');
          }
        }, 45);

        obs.unobserve(el);
      });
    },
    { threshold: 0.4 }
  );

  targets.forEach((el) => observer.observe(el));
}

/* ---- フッター年 ---- */
function initFooterYear() {
  const el = document.getElementById('year');
  if (el) el.textContent = new Date().getFullYear();
}
