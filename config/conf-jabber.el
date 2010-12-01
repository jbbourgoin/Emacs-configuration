;;; conf-jabber.el --- conf-jabber

;; Copyright (C) 2010 Free Software Foundation, Inc.
;;
;; Author: Jean-Baptiste Bourgoin <monsieur.camille@gmail.com>
;; Maintainer: Jean-Baptiste Bourgoin <monsieur.camille@gmail.com>
;; Created: 20 Sep 2010
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
;;   (require 'conf-jabber)

;;; Code:

(eval-when-compile
  (require 'cl))

;;; conf
(require 'jabber-autoloads)

;; comptes
(load "~/.emacs.d/prive/config/comptes-jabber.el")

;; opening chat in is own frame
 (setq 
  special-display-regexps 
  '(("jabber-chat" 
     (width . 80)
     (scroll-bar-width . 16)
     (height . 15)
     (tool-bar-lines . 0)
     (menu-bar-lines 0)
     (font . "-GURSoutline-Courier New-normal-r-normal-normal-11-82-96-96-c-70-iso8859-1")
     (left . 80))))

;; highlight url and type C-c RET to open it
(add-hook 'jabber-chat-mode-hook 'goto-address)

(provide 'conf-jabber)
;;; conf-jabber.el ends here
