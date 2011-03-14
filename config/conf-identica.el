;;; conf-identica.el --- identi.ca configuration

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
;;   (require 'conf-identica)

;;; Code:

(eval-when-compile
  (require 'cl))

;;; Identi.ca mode
;;;;; KEYS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; C-c C-r : view replies timeline
;; C-c C-g : view the public timeline
;; C-c C-f : view your friends timeline
;; g : refresh buffer
;; C-c C-s : update status
;; C-c C-d : direct message
;; i : show avatars
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'identica-mode)
(load "~/.emacs.d/prive/config/password-identica.el")
;; update status
;;(global-set-key "\C-cip" 'identica-update-status-interactive)
;; Direct messages
;;(global-set-key "\C-cid" 'identica-direct-message-interactive)


(provide 'conf-identica)
;;; conf-identica.el ends here
