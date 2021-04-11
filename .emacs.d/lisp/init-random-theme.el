;; init-random-theme.el -*- lexical-binding: t; -*-


(add-to-list 'custom-theme-load-path "~/.emacs.d.imymirror/package-manual/emacs-color-theme-solarized")
;; (load-theme 'dichromacy t)

;; (add-to-list 'load-path (concat imy/package-manual-dir "theme"))
(add-to-list 'load-path (concat imy/package-manual-dir "rand-theme"))

(require 'rand-theme)

;; Themes I never want to be selected
(setq rand-theme-unwanted '(alect-black-alt naquadah leuven manoj-dark apropospriate-dark ample-light))

;; dark : kaolin-mono-dark kaolin-mono-light  darktooth

(setq unwanted-theme '(
		       ;; dark
		       ;; kaolin-mono-dark   darktooth  doom-snazzy doom-gruvbox  wheatgrass

		       ;; light
		       ;; twilight-bright flatui apropospriate  apropospriate-light
		       
		       ))

 (setq rand-theme-wanted unwanted-theme)

;; (setq rand-theme-wanted '(doom-Iosvkem  doom-acario-dark  doom-acario-light  doom-ayu-light  doom-ayu-mirage  doom-challenger-deep  doom-city-lights  doom-dark+  doom-dracula  doom-ephemeral  doom-fairy-floss  doom-flatwhite  doom-gruvbox-light  doom-gruvbox  doom-henna  doom-homage-black  doom-homage-white  doom-horizon  doom-laserwave  doom-manegarm  doom-material  doom-miramare  doom-molokai  doom-monokai-classic  doom-monokai-pro  doom-monokai-spectrum  doom-moonlight  doom-nord-light  doom-nord  doom-nova  doom-oceanic-next  doom-old-hope  doom-one-light  doom-one  doom-opera-light  doom-opera  doom-outrun-electric  doom-palenight  doom-peacock  doom-plain-dark  doom-plain  doom-rouge  doom-snazzy  doom-solarized-dark  doom-solarized-light  doom-sourcerer  doom-spacegrey  doom-tomorrow-day  doom-tomorrow-night  doom-vibrant  doom-wilmersdorf  doom-zenburn  material-light  material  adwaita  deeper-blue  dichromacy  leuven  light-blue  manoj-dark  misterioso  tango-dark  tango  tsdh-dark  tsdh-light  wheatgrass  whiteboard  wombat  afternoon   ample ample-flat ample-light leuven leuven-dark plan9 twilight-bright flatui flucui-dark flucui-light espresso soft-stone minimal-black minimal-dark minimal moe moe-dark moe-light anti-zenburn alect-black-alt alect-black alect-dark-alt alect-dark alect-light alect-light-alt darktooth apropospriate apropospriate-dark apropospriate-light tao tao-yang tao-yin  organic-green hc-zenburn anti-zenburn jazz naquadah darkburn soothe clues spacegray planet seti badwolf darkmine kaolin-aurora kaolin-blossom kaolin-breeze kaolin-bubblegum kaolin-dark kaolin-eclipse  kaolin-galaxy kaollin-light  kaolin-mono-dark kaolin-mono-light kaolin-ocean kaolin-shiva kaolin-temple kaolin-valley-dark kaolin-valley-light  phoenix-dark-mono  phoenix-dark-pink gruber-darker subatomic nimbus  green-is-the-new-black-theme organic-green  green-phosphor
;; 					))

;; (rand-theme)


(provide 'init-random-theme)
