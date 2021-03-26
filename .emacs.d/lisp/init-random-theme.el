;; init-random-theme.el -*- lexical-binding: t; -*-


;;(add-to-list 'custom-theme-load-path "~/.emacs.d.imymirror/package-manual/emacs-color-theme-solarized")
;; (load-theme 'dichromacy t)

(add-to-list 'load-path (concat imy/package-manual-dir "rand-theme"))
(require 'rand-theme)

;; (setq rand-theme-unwanted '(leuven tango adwaita light-blue tsdh-light dichromacy whiteboard))


;; Themes I never want to be selected
(setq rand-theme-wanted '(doom-Iosvkem  doom-acario-dark  doom-acario-light  doom-ayu-light  doom-ayu-mirage  doom-challenger-deep  doom-city-lights  doom-dark+  doom-dracula  doom-ephemeral  doom-fairy-floss  doom-flatwhite  doom-gruvbox-light  doom-gruvbox  doom-henna  doom-homage-black  doom-homage-white  doom-horizon  doom-laserwave  doom-manegarm  doom-material  doom-miramare  doom-molokai  doom-monokai-classic  doom-monokai-pro  doom-monokai-spectrum  doom-moonlight  doom-nord-light  doom-nord  doom-nova  doom-oceanic-next  doom-old-hope  doom-one-light  doom-one  doom-opera-light  doom-opera  doom-outrun-electric  doom-palenight  doom-peacock  doom-plain-dark  doom-plain  doom-rouge  doom-snazzy  doom-solarized-dark  doom-solarized-light  doom-sourcerer  doom-spacegrey  doom-tomorrow-day  doom-tomorrow-night  doom-vibrant  doom-wilmersdorf  doom-zenburn  material-light  material  adwaita  deeper-blue  dichromacy  leuven  light-blue  manoj-dark  misterioso  tango-dark  tango  tsdh-dark  tsdh-light  wheatgrass  whiteboard  wombat  afternoon spacemacs-dark spacemacs-light ample ample-flat ample-light leuven leuven-dark plan9 twilight-bright flatui-theme flucui-dark flucui-light
					))

(rand-theme)


(provide 'init-random-theme)
