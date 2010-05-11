;; Package Dependencies:
;; emacs-goodies-el (color-theme)
;; haskell-mode

(setenv "ERGOEMACS_KEYBOARD_LAYOUT" "da")

;; ---------------------------------------------------------
;; load-paths

(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/ergoemacs")
(add-to-list 'load-path "~/.emacs.d/org-mode/lisp")
(add-to-list 'load-path "~/.emacs.d/yasnippet")
;;(add-to-list 'load-path "~/.emacs.d/icicles")

;; ---------------------------------------------------------
;; Required packages

(require 'ergoemacs-mode)
(require 'smooth-scrolling)
(require 'emacsd-tile)
(require 'redo)
(require 'linum)
(require 'tramp)

(require 'mbudde-funcs)

;; ---------------------------------------------------------
;; Faces and color theme
;; Must be executed before some of the other stuff or I get an
;; "arithmetic error".

(custom-set-faces
 '(default ((t (:inherit nil :stipple nil :background "#000000" :foreground "#eeeeec" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 98 :width normal :foundry "unknown" :family "DejaVu Sans Mono")))))

(when (require 'color-theme-subdued nil 'noerror)
  (setq color-theme-is-global t)
  (color-theme-subdued))

;; ---------------------------------------------------------
;; General settings

(setq user-full-name "Michael Budde"
      user-mail-address "mbudde@gmail.com")

(tool-bar-mode -1)
(tooltip-mode -1)
(menu-bar-right-scroll-bar)
(show-paren-mode 1)
(column-number-mode 1)

;; Use a bar cursor instead of a block when available
(when (fboundp 'bar-cursor-mode)
  (bar-cursor-mode 1))

(setq inhibit-startup-message t)
(setq diff-switches "-u")               ;; Default to unified diff
(setq c-default-style '((c-mode . "k&r")))

;; Don't pollute my folders with backup files
(setq make-backup-files nil
      auto-save-default nil)

(setq-default indent-tabs-mode nil
              tab-width 4
              c-basic-offset 4)

;; Don't wrap lines by default
(setq-default truncate-lines 1)

;; Sensible copy-paste behaviour
(setq mouse-drag-copy-region nil
      x-select-enable-primary nil
      x-select-enable-clipboard t)

;; http://trey-jackson.blogspot.com/2007/12/emacs-tip-5-hippie-expand.html
(setq hippie-expand-try-functions-list
      '(try-expand-dabbrev
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill
        try-complete-file-name-partially
        try-complete-file-name
        try-expand-all-abbrevs
        try-expand-list
        try-expand-line
        try-complete-lisp-symbol-partially
        try-complete-lisp-symbol))

(ergoemacs-mode 1)

;; Auto-mode
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(add-to-list 'auto-mode-alist '("\\.hs$" . haskell-mode))

;; Mode Hooks
(add-hook 'css-mode-hook
  (lambda ()
    (setq tab-width 2)))

(add-hook 'doc-view-mode-hook
  (lambda ()
    (auto-revert-mode)))

;; ---------------------------------------------------------
;; Useful packages

;; Winner mode (undo window changes)
(when (fboundp 'winner-mode)
  (winner-mode 1))

;; Line numbering
(global-linum-mode 1)

;; IDO mode
(ido-mode 'both)
(setq ido-work-directory-list '("~/" "/home/devel")
      ido-max-work-file-list 30)

;; Yasnippet
(when (require 'yasnippet nil 'noerror)
  (yas/initialize)
  (setq yas/root-directory "~/.emacs.d/yasnippet/snippets")
  (yas/load-directory yas/root-directory)
  (add-to-list 'hippie-expand-try-functions-list 'yas/hippie-try-expand)) ;; Expand snippets with hippie expand

;; Org mode
(when (require 'org-install nil 'noerror)
  (setq org-log-done 'time)
  (setq org-todo-keywords
        '((sequence "TODO" "STARTED" "WAITING" "|" "DONE")))
  (setq org-todo-keyword-faces
        '(("STARTED"   . (:foreground "orange" :weight bold))
          ("WAITING"   . (:foreground "blue" :weight bold)))))

;; ---------------------------------------------------------
;; Custom keybindings

(global-set-key (kbd "<f6>") 'linum-mode)
(global-set-key (kbd "<f7>") 'toggle-truncate-lines)
(global-set-key (kbd "<f8>") 'toggle-show-trailing-whitespace-show-ws)
(global-set-key (kbd "C-h") 'beginning-of-line-text)
(global-set-key (kbd "C-,") 'comment-or-uncomment-current-line-or-region)
(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "M-m") 'transpose-chars)
(global-set-key (kbd "C-c d") 'copy-line-contents)
(global-set-key (kbd "C-c j") 'new-indented-line)
(global-set-key (kbd "C-c r") 'revert-buffer)
(global-set-key (kbd "C-c C-c") 'eval-buffer)

;; ------------------------------------
;; Minor mode for override key bindings

(defvar my-keys-minor-mode-map (make-keymap) "my-keys-minor-mode keymap.")

(define-key my-keys-minor-mode-map (kbd "M-e") 'my-backward-kill-word)
(define-key my-keys-minor-mode-map (kbd "M-r") 'my-forward-kill-word)

(define-minor-mode my-keys-minor-mode
  "A minor -mode so that my key settings override annoying major modes."
  t nil 'my-keys-minor-mode-map)

(my-keys-minor-mode 1)

;; (add-hook 'minibuffer-setup-hook
;;           (lambda ()
;;             (my-keys-minor-mode 0)))
