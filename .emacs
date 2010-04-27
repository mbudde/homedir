;;(server-start)

(setenv "ERGOEMACS_KEYBOARD_LAYOUT" "da")

;; ----------
;; load-paths
;; ----------
(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/ergoemacs")
(add-to-list 'load-path "~/.emacs.d/org-mode/lisp")

;; ---------
;; Autoloads
;; ---------
(require 'ergoemacs-mode)
(require 'emacsd-tile)
(require 'color-theme)
(require 'blueish-theme)
(require 'org-install)
(require 'else-mode)

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
(blueish-theme)

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

(setq-default make-backup-files nil
              auto-save-default nil

              indent-tabs-mode nil
              tab-width 4
              c-basic-offset 4)

;; -----
;; Modes
;; -----
(show-paren-mode t)
(bar-cursor-mode t)
(tooltip-mode -1)
(menu-bar-right-scroll-bar)
(global-linum-mode t)
(ergoemacs-mode 1)

;; ----------
;; Mode Hooks
;; ----------
(add-hook 'css-mode
  (lambda ()
    (setq tab-width 2)))

;; ------------------
;; Custom keybindings
;; ------------------
(global-set-key (kbd "<f7>") 'toggle-truncate-lines)
(global-set-key (kbd "<f8>") 'toggle-show-trailing-whitespace-show-ws)
(global-set-key (kbd "M-/") 'hippie-expand)

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

(global-set-key (kbd "C-,") 'comment-or-uncomment-current-line-or-region)

(defun copy-line ()
  "Copy current line to kill-ring"
  (interactive)
  (let (bol eol)
    (save-excursion
      (beginning-of-line-text)
      (setq bol (point))
      (end-of-line)
      (setq eol (point))
      (kill-ring-save bol eol))
    )
  )


(global-set-key (kbd "C-d") 'copy-line)

(defun gtd ()
  (interactive)
  (find-file "/home/michael/gtd/gtd.org"))
