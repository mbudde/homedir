;; emacsd-tile.el -- tiling windows for emacs

(require 'windmove)

(defun swap-with (dir)
  (interactive)
  (let ((other-window (windmove-find-other-window dir)))
    (when other-window
      (let* ((this-window  (selected-window))
             (this-buffer  (window-buffer this-window))
             (other-buffer (window-buffer other-window))
             (this-start   (window-start this-window))
             (other-start  (window-start other-window)))
        (set-window-buffer this-window  other-buffer)
        (set-window-buffer other-window this-buffer)
        (set-window-start  this-window  other-start)
        (set-window-start  other-window this-start)))))

;(global-set-key (kbd "M-s-k") (lambda () (interactive) (swap-with 'down)))
;(global-set-key (kbd "M-s-i") (lambda () (interactive) (swap-with 'up)))
;(global-set-key (kbd "M-s-j") (lambda () (interactive) (swap-with 'left)))
;(global-set-key (kbd "M-s-l") (lambda () (interactive) (swap-with 'right)))

(global-set-key (kbd "M-s-k") (lambda () (interactive) (enlarge-window 1)))
(global-set-key (kbd "M-s-i") (lambda () (interactive) (enlarge-window -1)))
(global-set-key (kbd "M-s-j") (lambda () (interactive) (enlarge-window -1 t)))
(global-set-key (kbd "M-s-l") (lambda () (interactive) (enlarge-window 1 t)))

(global-set-key (kbd "C-s-k") 'windmove-down)
(global-set-key (kbd "C-s-i") 'windmove-up)
(global-set-key (kbd "C-s-j") 'windmove-left)
(global-set-key (kbd "C-s-l") 'windmove-right)

(provide 'emacsd-tile)
