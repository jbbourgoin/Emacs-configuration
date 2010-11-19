;;; conf-eshell.el --- eshell terminal emulator configuration

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
;;   (require 'conf-eshell)

;;; Code:

(eval-when-compile
  (require 'cl))

;;; eshell
;;;;;;;;;;;;;;;;;;;;;;;;;;;; DOC
;; Redirection :
;; >    means overwrite
;; >>   means append
;; >>>  means insert at point - this works when redirecting to a
;;        buffer or to an open file
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PROMPT
;; saute une ligne entre le chemin et le prompt :
(setq eshell-prompt-function
      (lambda ()
        (concat (eshell/pwd) "\n" (if (= (user-uid) 0) " # " " $ "))))
;; charger de nouvelles fonctions
;;(require 'eshell_clear)
;;(require 'eshell_bmk)
;; sauver l'historique à la fermeture
(setq eshell-save-history-on-exit t)
;; FONCTION OPEN
;; $ op * :
;; $ op . : ouvre Explorer dans le dossier courant
;; $ op file.doc : ouvre le fichier dans le lecteur doc système etc.
(defun eshell/op (FILE)
  "Invoke (w32-shell-execute \"Open\" FILE) and substitute slashes for backslashes"
  (w32-shell-execute "Open" (substitute ?\\ ?/ (expand-file-name FILE))))
;;; less
(require 'less)


(provide 'conf-eshell)
;;; conf-eshell.el ends here
