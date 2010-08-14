;; color-theme-subdued.el -- a tango-based color theme for Emacs
;; Revision 7
;;
;; Copyright (C) 2009-2010 Jason R. Blevins <jrblevin@sdf.lonestar.org>
;;
;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 3 of
;; the License, or (at your option) any later version.
;;
;; This program is distributed in the hope that it will be
;; useful, but WITHOUT ANY WARRANTY; without even the implied
;; warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
;; PURPOSE.  See the GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public
;; License along with this program; if not, write to the Free
;; Software Foundation, Inc., 59 Temple Place, Suite 330, Boston,
;; MA 02111-1307 USA
;;
;; Modified by Michael Budde <mbudde@gmail.com>

(require 'color-theme)

(defun color-theme-subdued-install (theme)
  (let* ((frame-params (car theme))
         (dark-frame-params (car frame-params))
         (light-frame-params (car (last frame-params)))
         (face-specs (cdr theme))
         dark-theme
         light-theme)
    (setq dark-theme `(color-theme-subdued
                        ,dark-frame-params))
    (setq light-theme `(color-theme-subdued-light
                         ,light-frame-params))
    (dolist (spec face-specs)
      (apply (lambda (face dark-spec &optional light-spec)
               (add-to-list 'dark-theme `(,face ((t ,dark-spec))) t)
               (if light-spec
                   (add-to-list 'light-theme `(,face ((t ,light-spec))) t)
                 (add-to-list 'light-theme `(,face ((t ,dark-spec))) t)))
             spec))
    (eval `(defun color-theme-subdued ()
             (interactive)
             (color-theme-install (quote ,dark-theme))))
    (eval `(defun color-theme-subdued-light ()
             (interactive)
             (color-theme-install (quote ,light-theme))))))

(let ((butter1 "#fce94f")
      (butter2 "#edd400")
      (butter3 "#c4a000")
      (orange1 "#fcaf3e")
      (orange2 "#f57900")
      (orange3 "#ce5c00")
      (chocolate1 "#e9b96e")
      (chocolate2 "#c17d11")
      (chocolate3 "#8f5902")
      (chameleon1 "#8ae234")
      (chameleon2 "#73d216")
      (chameleon3 "#4e9a06")
      (skyblue1 "#729fcf")
      (skyblue2 "#3465a4")
      (skyblue3 "#204a87")
      (plum1 "#ad7fa8")
      (plum2 "#75507b")
      (plum3 "#5c3566")
      (scarletred1 "#ef2929")
      (scarletred2 "#cc0000")
      (scarletred3 "#a40000")
      (aluminium1 "#eeeeec")
      (aluminium2 "#d3d7cf")
      (aluminium3 "#babdb6")
      (aluminium4 "#888a85")
      (aluminium5 "#555753")
      (aluminium6 "#2e3436"))

  (color-theme-subdued-install
   `((((foreground-color . ,aluminium2)
       (background-color . "#000")
       (background-mode . dark)
       (cursor-color . ,skyblue1)
       (mouse-color . ,chameleon2))
      ((foreground-color . "#000")
       (background-color . "#fff")
       (background-mode . light)
       (cursor-color . ,skyblue3)
       (mouse-color . ,chameleon2)))

     ;;; Standard font lock faces
     (default (nil))

     (font-lock-comment-face (:foreground ,aluminium4))
     (font-lock-comment-delimiter-face (:foreground ,aluminium4))
     (font-lock-doc-face (:foreground ,aluminium4))
     (font-lock-doc-string-face (:foreground ,aluminium4))
     (font-lock-string-face (:foreground ,plum1)
                            (:foreground ,plum2))
     (font-lock-keyword-face (:foreground ,skyblue1)
                             (:foreground ,skyblue2))
     (font-lock-builtin-face (:foreground ,orange1)
                             (:foreground ,orange3))
     (font-lock-function-name-face (:foreground ,butter2)
                                   (:foreground ,butter3))
     (font-lock-variable-name-face (nil))
     (font-lock-preprocessor-face (:foreground ,aluminium4))
     (font-lock-constant-face (:foreground ,chameleon1)
                              (:foreground ,chameleon3))
     (font-lock-type-face (:foreground ,plum1))
     (font-lock-warning-face (:bold t :foreground ,scarletred2))

     ;; Search
     (isearch (:foreground "#080808" :background ,butter2))
     (isearch-lazy-highlight-face (:foreground "#080808" :background ,aluminium6)
                                  (:foreground ,aluminium6 :background ,aluminium2))

     ;; Emacs Interface
     (fringe (:background "#0f0f0f")
             (:background "#fff"))
     (border (:background "#0f0f0f")
             (:background "#fff"))
     (mode-line (:background "#1f1f1f" :foreground ,aluminium1))
     (mode-line-buffer-id (:background "#1f1f1f" :foreground ,aluminium1))
     (mode-line-inactive (:background "#1f1f1f" :foreground ,aluminium4))
     (minibuffer-prompt (:foreground ,skyblue1))
     (region (:background "dark slate blue")
             (:background "#ffe0a0"))

     ;; Parenthesis matching
     (show-paren-match (:foreground ,aluminium1 :background ,skyblue3)
                       (:foreground ,aluminium1 :background ,skyblue2))
     (show-paren-mismatch (:foreground ,aluminium1 :background ,scarletred3)
                          (:foreground ,aluminium1 :background ,scarletred2))

     ;; Line highlighting
     (highlight (:background "#1f1f1f" :foreground nil)
                (:background ,skyblue1 :foreground nil))
     (highlight-current-line-face (:background "#1f1f1f" :foreground nil)
                                  (:background ,skyblue1 :foreground nil))

     ;; Diff mode
     (diff-added (:foreground ,chameleon3))
     (diff-removed (:foreground ,scarletred2))
     (diff-context (:foreground "white")
                   (:foreground "#000"))
     (diff-header (:foreground ,butter3 :background nil))
     (diff-file-header (:foreground ,butter3 :background nil))
     (diff-hunk-header (:foreground ,skyblue2 :background nil))
     (diff-refine-change (:background ,aluminium6))
     (diff-changed (:foreground ,plum2))

     ;; Calendar
     (holiday-face (:foreground ,scarletred2))

     ;; Info
     (info-xref (:foreground ,skyblue1))
     (info-xref-visited (:foreground ,plum1))

          ;;; AUCTeX
     (font-latex-sectioning-5-face (:foreground ,butter3 :bold t))
     (font-latex-bold-face (:foreground ,chameleon3 :bold t))
     (font-latex-italic-face (:foreground ,chameleon3 :italic t))
     (font-latex-math-face (:foreground "#855c1b"))
     (font-latex-string-face (:foreground ,plum2))
     (font-latex-warning-face (:foreground ,scarletred2))
     (font-latex-slide-title-face (:foreground ,butter3))

     ;; ido-mode
     (ido-first-match (:foreground ,aluminium1 :bold t)
                      (:foreground "#000" :bold t))
     (ido-only-match (:foreground ,chameleon2)
                     (:foreground ,chameleon3))
     (ido-subdir (:foreground ,skyblue1 :bold t)
                 (:foreground ,skyblue2 :bold t))

     ;; Dired
     (dired-directory (:foreground ,skyblue1 :bold t)
                      (:foreground ,skyblue2 :bold t))
     (dired-symlink (:foreground "#34e2e2" :bold t)
                    (:foreground "#2fcccc" :bold t))

     ;; Magit
     (magit-diff-add (:foreground ,chameleon2)
                     (:foreground ,chameleon3))
     (magit-diff-del (:foreground ,scarletred1)
                     (:foreground ,scarletred2))
     (magit-diff-file-header (:foreground ,butter3 :background nil))
     (magit-diff-hunk-header (:foreground ,skyblue1 :background nil)
                             (:foreground ,skyblue2 :background nil))
     (magit-log-sha1 (:foreground ,butter3))
     (magit-item-highlight (:background ,aluminium6)
                           (:background ,aluminium2))

     ;; sh-mode
     (sh-heredoc (:foreground ,plum1)
                 (:foreground ,plum2))
     (sh-quoted-exec (:foreground ,orange2)))))

(setq subdued-light-theme-on nil)
(defun toggle-subdued-light-theme (arg)
  (interactive "P")
  (if (or arg (not subdued-light-theme-on))
      (progn (setq subdued-light-theme-on t)
             (color-theme-subdued-light))
    (setq subdued-light-theme-on nil)
    (color-theme-subdued)))

(provide 'color-theme-subdued)
