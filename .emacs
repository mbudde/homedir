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

(global-set-key (kbd "M-/") 'hippie-expand)

(setq inhibit-startup-message t)

(server-start)

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "white" :foreground "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 98 :width normal :foundry "unknown" :family "DejaVu Sans Mono")))))

(add-to-list 'load-path "~/.emacs.d")
(load "init.el")
