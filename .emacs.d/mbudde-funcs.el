
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
  "Copy contents of current line (indentation not included) to kill-ring"
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

(defun my-backward-kill-word (arg)
  "Kill word backward. If point is at the beginning of the line,
kill the newline. If there are no words before the point on the
current line, kill until the beginning of line is reached.
With argument ARG, kill ARG words."
  (interactive "p")
  (if (not arg)
      (setq arg 1))
  (if (bolp)
      (backward-delete-char 1)
    (if (string-match "\\w" (buffer-substring (point-at-bol) (point)))
        (backward-kill-word arg)
      (kill-region (point-at-bol) (point)))))

(defun my-forward-kill-word (arg)
  "Kill word forward. If point is at the end of the line, kill
the newline. If there are no words after the point on the current
line, kill until the end of the line is reached.
With argument ARG, kill ARG words."
  (interactive "p")
  (if (not arg)
      (setq arg 1))
  (if (eolp)
      (backward-delete-char -1)
    (if (string-match "\\w" (buffer-substring (point) (point-at-eol)))
        (backward-kill-word (* arg -1))
      (kill-region (point) (point-at-eol)))))

(setq not-to-kill-buffer-list '("*scratch*" "*Messages*"))
(defun kill-buffer-but-not-some (buf)
  "If buffer is not in `not-to-kill-buffer-list` kill it; else bury it."
  (interactive "bKill buffer:")
  (if (not buf)
      (setq buf (buffer-name (current-buffer))))
  (if (member buf not-to-kill-buffer-list)
      (bury-buffer buf)
    (kill-buffer buf)))

(defun kill-other-buffers ()
  "Kill all other buffers except those in `not-to-kill-buffer-list`."
  (interactive)
  (mapc 'kill-buffer-but-not-some (delq (current-buffer) (buffer-list))))

(defun clear-buffers ()
  "Kill all buffers except those in `not-to-kill-buffer-list`."
  (interactive)
  (mapc 'kill-buffer-but-not-some (buffer-list)))

(defun gtd ()
  (interactive)
  (find-file "/home/michael/gtd/gtd.org"))

(provide 'mbudde-funcs)
