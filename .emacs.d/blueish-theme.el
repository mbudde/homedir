(defun blueish-theme ()
  (interactive)
  (color-theme-install
   '(blueish-theme
      ((background-color . "#000000") ;; #101e2e
      (background-mode . dark)
      (border-color . "#1a1a1a")
      (cursor-color . "#ffffff")
      (foreground-color . "#eeeeec")
      (mouse-color . "black"))
     (fringe ((t (:background "#1a1a1a"))))
     (mode-line ((t (:foreground "#eeeeec" :background "#555753"))))
     (region ((t (:background "#0d2b45"))))
     (font-lock-builtin-face ((t (:foreground "#729fcf"))))
     (font-lock-comment-face ((t (:foreground "#888a85"))))
     (font-lock-function-name-face ((t (:foreground "#edd400"))))
     (font-lock-keyword-face ((t (:foreground "#729fcf"))))
     (font-lock-string-face ((t (:foreground "#ad7fa8"))))
     (font-lock-type-face ((t (:foreground"#8ae234"))))
     (font-lock-variable-name-face ((t (:foreground "#eeeeec"))))
     (minibuffer-prompt ((t (:foreground "#729fcf" :bold t))))
     (font-lock-warning-face ((t (:foreground "Red" :bold t))))
     )))
(provide 'blueish-theme)
