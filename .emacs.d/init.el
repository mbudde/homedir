;(setq viper-mode t)
;(require 'viper)

(setenv "ERGOEMACS_KEYBOARD_LAYOUT" "da")
(load "ergoemacs-keybindings/ergoemacs-mode")
(ergoemacs-mode 1)

(load "emacsd-tile.el")

(require 'color-theme)
(require 'blueish-theme)
(setq color-theme-is-global t)
;;(color-theme-initialize)
;;(color-theme-marquardt)
(blueish-theme)

