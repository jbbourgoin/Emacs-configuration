;;; conf-bbdb.el --- bbdb database configuration

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
;;   (require 'conf-bbdb)

;;; Code:

(eval-when-compile
  (require 'cl))

;;; bbdb
(require 'bbdb)
;;(require 'bbdb-gui)
(load "~/.emacs.d/lisp/bbdb-vcard-import.el")
;;(bbdb-initialize 'gnus 'message)
;;(bbdb-insinuate-message)
(setq bbdb-file-coding-system 'utf-8)
(setq bbdb-default-country "France")
(setq bbdb-expand-mail-aliases t)
(setq bbdb-file "~/.emacs.d/bbdb")
;; par defaut bbdb est configure pour accepter les numeros de
;; telephone au format americain ici on desactive cette option
(setq bbdb-north-american-phone-numbers-p nil)
;; permet d'eviter d'avoir une fenetre bbdb qui montre en permanence
;; les mises a jour dans bbdb lorsque l'on utilise GNUS
(setq bbdb-use-pop-up nil)
;; pas de code de localisation par defaut pour les numeros de
;; telephone
(setq bbdb-default-area-code nil)
;; permet d'empecher a bbdb de creer une nouvelle entree a chaque fois
;; qu'un mail d'une nouvelle personne est lu avec GNUS, RMAIL, VM ou
;; MH.
(setq bbdb/mail-auto-create-p nil)
;; nombre de lignes desire dans la fenetre popup de bbdb lorsque l'on
;; utilise VM/MH/RMAIL ou GNUS.
(setq bbdb-pop-up-target-lines 7)
;;ne check pas le code postal
(setq bbdb-check-zip-codes-p nil)



(provide 'conf-bbdb)
;;; conf-bbdb.el ends here
