;;(server-start)

(setenv "ERGOEMACS_KEYBOARD_LAYOUT" "da")

;; ----------
;; load-paths
;; ----------
(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/ergoemacs")
(add-to-list 'load-path "~/.emacs.d/org-mode/lisp")
(add-to-list 'load-path "~/.emacs.d/yasnippet")
(add-to-list 'load-path "~/.emacs.d/icicles")

;; ---------
;; Autoloads
;; ---------
(require 'blueish)
(require 'gentooish)
(require 'color-theme-subdued)
(require 'emacsd-tile)
(require 'ergoemacs-mode)
;; (require 'icicles)
(require 'org-install)
(require 'redo)
(require 'yasnippet)
(require 'smooth-scrolling)

;; -----
;; Faces
;; -----
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#000000" :foreground "#eeeeec" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 98 :width normal :foundry "unknown" :family "DejaVu Sans Mono")))))

(setq color-theme-is-global t)
(color-theme-subdued)
;; (color-theme-blueish)
;; (color-theme-gentooish)

;; ---------
;; Auto-mode
;; ---------
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

;; ----------------
;; General settings
;; ----------------
(setq inhibit-startup-message t
      column-number-mode t

      ;; scroll one line at a time (less "jumpy" than defaults)
      mouse-wheel-scroll-amount '(2 ((shift) . 10)) ;; one line at a time
      mouse-wheel-progressive-speed nil ;; don't accelerate scrolling
      mouse-wheel-follow-mouse 't ;; scroll window under mouse
      scroll-step 1 ;; keyboard scroll one line at a time

      c-default-style '((c-mode . "k&r")))

;; http://trey-jackson.blogspot.com/2007/12/emacs-tip-5-hippie-expand.html
(setq hippie-expand-try-functions-list
      '(yas/hippie-try-expand
        try-expand-dabbrev
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill
        try-complete-file-name-partially
        try-complete-file-name
        try-expand-all-abbrevs
        try-expand-list
        try-expand-line
        try-complete-lisp-symbol-partially
        try-complete-lisp-symbol))

(setq-default make-backup-files nil
              auto-save-default nil

              indent-tabs-mode nil
              tab-width 4
              c-basic-offset 4)

;; -----
;; Modes
;; -----
(show-paren-mode 1)
(bar-cursor-mode 1)
(tooltip-mode -1)
(menu-bar-right-scroll-bar)
(global-linum-mode 1)
(ergoemacs-mode 1)
;; (icy-mode t)
(ido-mode 1)
(winner-mode 1)

(yas/initialize)
(setq yas/root-directory "~/.emacs.d/yasnippet/snippets")
(yas/load-directory yas/root-directory)

;; ----------
;; Mode Hooks
;; ----------
(add-hook 'css-mode
  (lambda ()
    (setq tab-width 2)))

;; --------
;; Org mode
;; --------
(setq org-log-done 'time)
(setq org-todo-keywords
      '((sequence "TODO" "STARTED" "WAITING" "|" "DONE")))
(setq org-todo-keyword-faces
      '(("STARTED"   . (:foreground "orange" :weight bold))
        ("WAITING"   . (:foreground "blue" :weight bold))))

;; -----------------
;; Utility functions
;; -----------------
(defun comment-or-uncomment-current-line-or-region ()
  "Comments or uncomments current current line or whole lines in region."
  (interactive)
  (save-excursion
    (let (min max)
      (if (and transient-mark-mode mark-active)
          (setq min (region-beginning) max (region-end))
        (setq min (point) max (point)))
      (comment-or-uncomment-region
       (progn (goto-char min) (line-beginning-position))
       (progn (goto-char max) (line-end-position))))))

(defun copy-line-contents ()
  "Copy contents of current line (not indentation) to kill-ring"
  (interactive)
  (let (bol eol)
    (save-excursion
      (beginning-of-line-text)
      (setq bol (point))
      (end-of-line)
      (setq eol (point))
      (kill-ring-save bol eol))))

(defun new-indented-line ()
  "Start a new line and indent it no matter where the point is in the current line."
  (interactive)
  (end-of-line)
  (newline-and-indent))

(defun my-backward-kill-word ()
  "Kill word backward"
  (interactive)
  (if (bolp)
      (backward-delete-char 1)
    (if (string-match "\\w" (buffer-substring (point-at-bol) (point)))
        (backward-kill-word 1)
      (kill-region (point-at-bol) (point)))))

(defun my-forward-kill-word ()
  "Kill word forwards"
  (interactive)
  (if (eolp)
      (backward-delete-char -1)
    (if (string-match "\\w" (buffer-substring (point) (point-at-eol)))
        (backward-kill-word -1)
      (kill-region (point) (point-at-eol)))))

(defun gtd ()
  (interactive)
  (find-file "/home/michael/gtd/gtd.org"))

;; ------------------
;; Custom keybindings
;; ------------------
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
;; ------------------------------------
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
