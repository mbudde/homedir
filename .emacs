;; Package Dependencies:
;; Required:
;;   linum:     http://stud4.tuwien.ac.at/~e0225855/linum/linum.html
;; Optional:
;;   emacs-goodies-el (color-theme)
;;   slime:     http://common-lisp.net/project/slime/
;;   yasnippet: http://code.google.com/p/yasnippet/
;;   org-mode:  git://repo.or.cz/org-mode.git
;;   jd-el:     git://git.naquadah.org/~jd/jd-el.git
;;   magit:     git://github.com/philjackson/magit.git
;;   edit-server http://github.com/stsquad/emacs_chrome

;; Bugs:
;; * Error when emacs is started in ~/Documents/Org

(setenv "ERGOEMACS_KEYBOARD_LAYOUT" "da")

;; ---------------------------------------------------------
;; load-paths

(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/ergoemacs")
(add-to-list 'load-path "~/.emacs.d/org-mode/lisp")
(add-to-list 'load-path "~/.emacs.d/yasnippet")
(add-to-list 'load-path "~/.emacs.d/slime")
(add-to-list 'load-path "~/.emacs.d/ldg-mode")
(add-to-list 'load-path "~/.emacs.d/jd-el")
(add-to-list 'load-path "~/.emacs.d/magit")

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

(require 'color-theme-subdued nil 'noerror)

(add-hook 'after-make-frame-functions
          (lambda (frame)
            (set-variable 'color-theme-is-global nil)
            (select-frame frame)
            (if (and window-system (fboundp 'color-theme-subdued-light))
                (color-theme-subdued-light)
              (color-theme-standard))))

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

;; Scroll one line at a time with mouse (less "jumpy" than defaults)
(setq mouse-wheel-scroll-amount '(2 ((shift) . 10)) ; one line at a time
      mouse-wheel-progressive-speed nil             ; don't accelerate scrolling
      mouse-wheel-follow-mouse 't)                  ; scroll window under mouse

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

(setq inferior-lisp-program "clisp")

(ergoemacs-mode 1)

;; Auto-mode
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

;; SLIME
(when (require 'slime-autoloads nil 'noerror)
  (slime-setup))

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
  (add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
  (global-set-key (kbd "C-r") 'org-capture)
  (global-set-key (kbd "C-c a") 'org-agenda)
  (setq org-directory "~/Documents/Org"
        org-agenda-files '("~/Documents/Org/todo.org")
        org-default-notes-file "notes.org"
        org-hide-leading-stars t
        org-agenda-ndays 7
        org-deadline-warning-days 14
        org-agenda-show-all-dates t
        org-agenda-skip-deadline-if-done t
        org-agenda-skip-scheduled-if-done t
        org-agenda-start-on-weekday nil
        org-clock-idle-time 15
        org-fast-tag-selection-single-key 'expert
        org-clock-in-switch-to-state "STARTED")
  (setq org-todo-keywords
        '((sequence "TODO(t)" "STARTED(s)"
                    "WAITING(w@)" "APPT(a)" "|"
                    "DONE(d!)" "DEFERRED(f@)" "CANCELLED(x@)")))
  (setq org-todo-keyword-faces
        '(("TODO" . (:foreground "#ad7fa8" :weight bold))
          ("STARTED" . (:foreground "orange" :weight bold))
          ("WAITING" . (:foreground "blue" :weight bold))
          ("CANCELLED" . (:foreground "red" :weight bold))))
  (setq org-capture-templates
        '(("t" "" entry
           (file+headline "todo.org" "Tasks")
           "* TODO %?\n  %u")
          ("n" "" entry
           (file+headline "notes.org" "Notes")
           "* %u %?" :prepend t)))
  (setq org-agenda-custom-commands
        '(("u" alltodo ""
           ((org-agenda-skip-function
             (lambda nil (org-agenda-skip-entry-if 'scheduled 'deadline)))
            (org-agenda-overriding-header "Unscheduled TODO entries: "))))))

(require 'mbledger nil 'noerror)

;; Rainbow mode and Google Maps from jd-el
(require 'rainbow-mode nil 'noerror)
(require 'google-maps nil 'noerror)

;; Magit
(require 'magit nil 'noerror)

;; edit-server
(if (locate-library "edit-server")
    (progn
     (require 'edit-server)
     (setq edit-server-new-frame nil)
     (edit-server-start)))

;; ---------------------------------------------------------
;; Custom keybindings

(global-set-key (kbd "<f5>") (lambda () (interactive) (revert-buffer nil t)))
(global-set-key (kbd "<f6>") 'linum-mode)
(global-set-key (kbd "<f7>") 'toggle-truncate-lines)
(global-set-key (kbd "<f8>") 'toggle-show-trailing-whitespace-show-ws)
(global-set-key (kbd "<f9>") 'toggle-subdued-light-theme)
(global-set-key (kbd "C-h") 'beginning-of-line-text)
(global-set-key (kbd "C-j") 'newline-and-indent)
(global-set-key (kbd "C-,") 'comment-or-uncomment-current-line-or-region)
(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "M-m") 'transpose-chars)
(global-set-key (kbd "C-c d") 'copy-line-contents)
(global-set-key (kbd "C-c j") 'new-indented-line)
(global-set-key (kbd "C-c r") 'revert-buffer)
(global-set-key (kbd "C-c C-c") 'eval-buffer)
(global-set-key (kbd "C-M-æ") 'isearch-forward-regexp)
(global-set-key (kbd "C-M-Æ") 'isearch-backward-regexp)
(global-set-key (kbd "s-!") 'kill-buffer-and-window)

;; ------------------------------------
;; Minor mode for override key bindings

(defvar my-keys-minor-mode-map (make-keymap) "my-keys-minor-mode keymap.")

(define-key my-keys-minor-mode-map (kbd "M-e") 'my-backward-kill-word)
(define-key my-keys-minor-mode-map (kbd "M-r") 'my-forward-kill-word)

(define-minor-mode my-keys-minor-mode
  "A minor -mode so that my key settings override annoying major modes."
  t nil 'my-keys-minor-mode-map)

(my-keys-minor-mode 1)
