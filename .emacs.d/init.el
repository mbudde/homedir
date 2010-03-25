;(setq viper-mode t)
;(require 'viper)

(setenv "ERGOEMACS_KEYBOARD_LAYOUT" "da")
(load "ergoemacs-keybindings/ergoemacs-mode")
(ergoemacs-mode 1)

(load "emacsd-tile.el")


(add-to-list 'load-path "org-mode/lisp")
;;(add-to-list 'load-path "org-mode/contrib/lisp")
(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(setq org-log-done 'time)
(setq org-todo-keywords
      '((sequence "TODO" "STARTED" "WAITING" "|" "DONE")))
(setq org-todo-keyword-faces
      '(("STARTED"   . (:foreground "orange" :weight bold))
        ("WAITING"   . (:foreground "blue" :weight bold))))

(defun gtd ()
  (interactive)
  (find-file "/home/michael/gtd/gtd.org"))

(require 'color-theme)
(require 'blueish-theme)
(setq color-theme-is-global t)
;;(color-theme-marquardt)
(blueish-theme)