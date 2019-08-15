import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["bluejay"],
    typeSpeed: 150,
    loop: true
  });
}

export { loadDynamicBannerText };

const loadDynamicBannerText2 = () => {
  new Typed('#banner-typed-text-2', {
    strings: ["Jazz it up a little"],
    typeSpeed: 200,
    loop: true
  });
}

export { loadDynamicBannerText2 };
