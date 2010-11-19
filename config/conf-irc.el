;;; conf-irc.el --- conf-irc

;; Copyright (C) 2010 Free Software Foundation, Inc.
;;
;; Author: Jean-Baptiste Bourgoin <monsieur.camille@gmail.com>
;; Maintainer: Jean-Baptiste Bourgoin <monsieur.camille@gmail.com>
;; Created: 25 Sep 2010
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
;;   (require 'conf-irc)

;;; Code:

(eval-when-compile
  (require 'cl))

;;; ERC
;;; fonction pour se connecter à un serveur IRC :
(defmacro asf-erc-bouncer-connect (command server port nick ssl pass)
  "Create interactive command `command', for connecting to an IRC server. The
   command uses interactive mode if passed an argument."
  (fset command
        `(lambda (arg)
           (interactive "p")
	   (if (not (= 1 arg))
	       (call-interactively 'erc)
	     (let ((erc-connect-function ',(if ssl
					       'erc-open-ssl-stream
					     'open-network-stream)))
 	       (erc :server ,server :port ,port :nick ,nick :password ,pass))))))


;;; différents comptes
(load "~/.emacs.d/prive/config/comptes-erc.el")

;;; lancer tous les comptes avec une seule commande
 ;; fires up a new frame and opens your servers in there. You will need
 ;; to modify it to suit your needs.
(defun my-irc ()
  "Start to waste time on IRC with ERC."
  (interactive)
  (select-frame (make-frame '((name . "Emacs IRC")
 			      (minibuffer . t))))
  (call-interactively 'erc-frn) ;; freenode
  ;;(sit-for 1)
  ;;(call-interactively 'erc-opn)
  ;;(sit-for 1)
  ;;(call-interactively 'erc-ifs)
  )

 (setq erc-autojoin-channels-alist
       '(("freenode.net" "#spip")))

(provide 'conf-irc)
;;; conf-irc.el ends here
