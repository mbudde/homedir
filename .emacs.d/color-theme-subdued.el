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

(require 'color-theme)

(defun color-theme-subdued ()
  "Subdued color theme for Emacs by Jason Blevins.
Based on the Tango color palette."
  (interactive)
  (color-theme-install
   '(color-theme-subdued
     ((foreground-color . "#d3d7cf")
      (background-color . "#000")
      (background-mode . dark)
      (cursor-color . "#729fcf")
      (mouse-color . "#73d216"))

     ;;; Standard font lock faces
     (default ((t (nil))))
     (font-lock-comment-face ((t (:foreground "#888a85"))))
     (font-lock-comment-delimiter-face ((t (:foreground "#888a85"))))
     (font-lock-doc-face ((t (:foreground "#888a85"))))
     (font-lock-doc-string-face ((t (:foreground "#888a85"))))
     (font-lock-string-face ((t (:foreground "#ad7fa8"))))
     (font-lock-keyword-face ((t (:foreground "#729fcf"))))
     (font-lock-builtin-face ((t (:foreground "#855c1b"))))
     (font-lock-function-name-face ((t (:foreground "#edd400"))))
     (font-lock-variable-name-face ((t (nil))))
     (font-lock-preprocessor-face ((t (:foreground "#888a85"))))
     (font-lock-constant-face ((t (:foreground "#8ae234"))))
     (font-lock-type-face ((t (:foreground "#ad7fa8"))))
     (font-lock-warning-face ((t (:bold t :foreground "#cc0000"))))

     ;; Search
     (isearch ((t (:foreground "#080808" :background "#edd400"))))
     (isearch-lazy-highlight-face ((t (:foreground "#080808" :background "#2e3436"))))

     ;; Emacs Interface
     (fringe ((t (:background "#0f0f0f"))))
     (border ((t (:background "#0f0f0f"))))
     (mode-line ((t (:background "#1f1f1f" :foreground "#eeeeec"))))
     (mode-line-buffer-id ((t (:background "#1f1f1f" :foreground "#eeeeec"))))
     (mode-line-inactive ((t (:background "#1f1f1f" :foreground "#888a85"))))
     (minibuffer-prompt ((t (:foreground "#729fcf"))))
     (region ((t (:background "dark slate blue"))))

     ;; Parenthesis matching
     ;; (show-paren-match-face ((t (:foreground "#2e3436" :background "#73d216"))))
     ;; (show-paren-mismatch-face ((t (:foreground "#2e3436" :background "#ef2929"))))
     (show-paren-match ((((class color) (background dark)) (:foreground "#eeeeec" :background "#204a87"))))
     (show-paren-mismatch ((((class color) (background dark)) (:foreground "#eeeeec" :background "#a40000"))))

     ;; Line highlighting
     (highlight ((t (:background "#1f1f1f" :foreground nil))))
     (highlight-current-line-face ((t (:background "#1f1f1f" :foreground nil))))

     ;; Diff mode
     (diff-added ((t (:foreground "#73d216"))))
     (diff-removed ((t (:foreground "#cc0000"))))
     (diff-context ((t (:foreground "white"))))
     (diff-header ((t (:foreground "#c4a000" :background nil))))
     (diff-file-header ((t (:inherit diff-header))))
     (diff-hunk-header ((t (:foreground "#3465a4" :background nil))))
     (diff-refine-change ((t (:background "#2e3436"))))
     (diff-changed ((t (:foreground "#75507b")))

     ;; Calendar
     (holiday-face ((t (:foreground "#cc0000"))))

     ;; Info
     (info-xref ((t (:foreground "#729fcf"))))
     (info-xref-visited ((t (:foreground "#ad7fa8"))))

     ;;; AUCTeX
     (font-latex-sectioning-5-face ((t (:foreground "#c4a000" :bold t))))
     (font-latex-bold-face ((t (:foreground "#4e9a06" :bold t))))
     (font-latex-italic-face ((t (:foreground "#4e9a06" :italic t))))
     (font-latex-math-face ((t (:foreground "#855c1b"))))
     (font-latex-string-face ((t (:foreground "#77507b"))))
     (font-latex-warning-face ((t (:foreground "#cc0000"))))
     (font-latex-slide-title-face ((t (:foreground "#c4a000"))))

     ;;; post-mode
     (post-emoticon-face ((t (:background "#edd400" :foreground "#000000"))))
     (post-header-value-face ((t (:foreground "#4e9a06"))))
     (post-header-keyword-face ((t (:foreground "#4e9a06" :bold t))))
     (post-signature-text-face ((t (:foreground "#cc0000"))))
     (post-quoted-text-face ((t (:foreground "#855c1b" :slant normal))))
     (post-double-quoted-text-face ((t (:foreground "#77507b" :slant normal))))
     (post-multiply-quoted-text-face ((t (:foreground "#61635e" :slant normal))))
     (post-email-address-text-face ((t (:foreground "#729fcf" :bold t))))
     (post-url-face ((t (:foreground "#729fcf" :bold t))))

     ;; ido-mode
     (ido-first-match-face ((t (:foreground "#eeeeec" :bold t))))
     (ido-only-match-face ((t (:foreground "#73d216"))))
     (ido-subdir-face ((t (:foreground "#729fcf" :bold t))))
     ))))

(provide 'color-theme-subdued)
