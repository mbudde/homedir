(show-paren-mode)

(setq c-default-style
      '((c-mode . "k&r")))

(setq-default make-backup-files nil)
(setq-default auto-save-default nil)
(setq-default show-trailing-whitespace t)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default c-basic-offset 4)

(add-hook 'css-mode
  (lambda ()
    (setq tab-width 2)))

(global-set-key (kbd "<f7>") 'toggle-truncate-lines)

;; http://trey-jackson.blogspot.com/2007/12/emacs-tip-5-hippie-expand.html
(global-set-key (kbd "M-/") 'hippie-expand)
(setq hippie-expand-try-functions-list '(try-expand-dabbrev try-expand-dabbrev-all-buffers try-expand-dabbrev-from-kill try-complete-file-name-partially try-complete-file-name try-expand-all-abbrevs try-expand-list try-expand-line try-complete-lisp-symbol-partially try-complete-lisp-symbol))

(setq inhibit-startup-message t)

;; scroll one line at a time (less "jumpy" than defaults)
(setq mouse-wheel-scroll-amount '(2 ((shift) . 10))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mosue 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time

(server-start)

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "white" :foreground "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 98 :width normal :foundry "unknown" :family "DejaVu Sans Mono")))))

(require 'color-theme)
(setq color-theme-is-global t)
(color-theme-marquardt)

(bar-cursor-mode)

(add-to-list 'load-path "~/.emacs.d")
(load "init.el")
