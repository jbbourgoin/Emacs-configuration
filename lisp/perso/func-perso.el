;;; func-perso.el --- diverses fonctions perso ou test

;; Copyright (C) 2012 Free Software Foundation, Inc.
;;
;; Author: Jean-Baptiste Bourgoin <jbbourgoin@myhost>
;; Maintainer: Jean-Baptiste Bourgoin <jbbourgoin@myhost>
;; Created: 11 Feb 2012
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
;;   (require 'func-perso)

;;; Code:

(eval-when-compile
  (require 'cl))

(setq visible-bell t)


(defun rpl-accents ()
  "Remplace les erreurs d'accentuation"
  (interactive)
  (let ((case-fold-search t)) ; or nil
    (goto-char (point-min))
    (while (search-forward "`a" nil t)
      (replace-match "à" t t))
    (goto-char (point-min))
    (while (search-forward "ˆa" nil t)
      (replace-match "â" t t))
    (goto-char (point-min))
    (while (search-forward "`e" nil t)
      (replace-match "è" t t))
    (goto-char (point-min))
    (while (search-forward "´e" nil t)
      (replace-match "é" t t))
    (goto-char (point-min))
    (while (search-forward "ˆe" nil t)
      (replace-match "ê" t t))
    (goto-char (point-min))
    (while (search-forward "ˆo" nil t)
      (replace-match "ô" t t))
    (goto-char (point-min))
    (while (search-forward "ˆi" nil t)
      (replace-match "î" t t))
    (goto-char (point-min))
    (while (search-forward "u¨" nil t)
      (replace-match "ü" t t))
    (goto-char (point-min))
    (while (search-forward "`u" nil t)
      (replace-match "ù" t t))
    (goto-char (point-min))
    (while (search-forward "¸c" nil t)
      (replace-match "ç" t t))
    ))




(provide 'func-perso)
;;; func-perso.el ends here
