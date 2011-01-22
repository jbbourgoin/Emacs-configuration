;;; conf-php.el --- php configuration

;; Copyright (C) 2010 Free Software Foundation, Inc.
;;
;; Author: Jean-Baptiste Bourgoin <jbbourgoin@linuxette.stpabu.org>
;; Maintainer: Jean-Baptiste Bourgoin <jbbourgoin@linuxette.stpabu.org>
;; Created: 14 May 2010
;; Version: 0.01
;; Keywords

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program; if not, write to the Free Software
;; Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

;;; Commentary:

;; 

;; Put this file into your load-path and the following into your ~/.emacs:
;;   (require 'conf-php)

;;; Code:

(eval-when-compile
  (require 'cl))

(autoload 'php-mode "php-mode" "PHP editing mode" t)
(add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode))
(add-to-list 'auto-mode-alist '("\\.php3\\'" . php-mode))
(add-to-list 'auto-mode-alist '("\\.php4\\'" . php-mode))

;; Toggle between PHP & HTML Helper mode.  Useful when working on
;; php files, that can been intertwined with HTML code
;; (defun toggle-php-html-mode ()
;;   (interactive)
;;   "Toggle mode between PHP & HTML modes"
;;   (cond ((string= mode-name "PHP")
;;          (php-mode))
;;         ((string= mode-name "XHTML")
;;          (html-mode))))
;;(global-set-key [f5] 'toggle-php-html-mode)

;;; eldoc php
;; (setq my-php-function-doc-hash (make-hash-table :test 'equal))
;; (defun my-php-fetch-function-doc (function)
;;   (let ((doc (gethash function my-php-function-doc-hash 'nope)))
;;     (when (eq doc 'nope)
;;       (setq doc nil)
;;       (let ((buf (url-retrieve-synchronously (concat "http://php.net/manual-lookup.php?pattern=" function))))
;;         (with-current-buffer buf
;;           (goto-char (point-min))
;;           (let (desc)
;;             (when (re-search-forward "<div class=\"methodsynopsis dc-description\">\\(\\(.\\|\n\\)*?\\)</div>" nil t)
;;               (setq desc
;;                     (replace-regexp-in-string
;;                      " +" " "
;;                      (replace-regexp-in-string
;;                       "\n" ""
;;                       (replace-regexp-in-string "<.*?>" "" (match-string-no-properties 1)))))
              
;;               (when (re-search-forward "<p class=\"para rdfs-comment\">\\(\\(.\\|\n\\)*?\\)</p>" nil t)
;;                 (setq desc
;;                       (concat desc "\n\n"
;;                               (replace-regexp-in-string
;;                                " +" " "
;;                                (replace-regexp-in-string
;;                                 "\n" ""
;;                                 (replace-regexp-in-string "<.*?>" "" (match-string-no-properties 1))))))))

;;             (if desc
;;                 (setq doc (xml-substitute-special desc)))))
;;         (kill-buffer buf))
;;       (puthash function doc my-php-function-doc-hash))
;;     doc))
;; (defun my-php-eldoc-function ()
;;   (let ((symbol (thing-at-point 'symbol)))
;;     (if (and symbol
;;              (not (eq (elt symbol 0) ?$)))
;;         (my-php-fetch-function-doc symbol))))


(provide 'conf-php)
;;; conf-php.el ends here
