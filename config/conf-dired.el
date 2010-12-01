;;; conf-dired.el --- dired configuration

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
;;   (require 'conf-dired)

;;; Code:

(eval-when-compile
  (require 'cl))

;;; dired
;; extensions :
(require 'dired-x)
(require 'dired+)
;; toujours réutiliser le buffer courant :
(toggle-dired-find-file-reuse-dir 1)
;; permet de copier un fichier d'un buffer dired vers
;; un autre buffer dired
(setq dired-dwim-target t)
;; (dé)compression automatique des fichiers lus et écrits
(auto-compression-mode t)
;;; dired
;; pourvoir supprimer des dossiers récursivement
(setq dired-recursive-deletes t)

(when (eq system-type 'cygwin)
  (require 'w32-find-dired))

(require 'dired+)

(require 'run-assoc)
(when (eq system-type 'cygwin)
  (setq associated-program-alist
      '(("/cygdrive/c/Program Files/SumatraPDF/SumatraPDF.exe" "\\.pdf$")
        ((lambda (file)
           (browse-url
	    (concat "file:///" (expand-file-name file)))) "\\.html?$")
	)))

(provide 'conf-dired)
;;; conf-dired.el ends here
