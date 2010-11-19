;;; conf-interface.el --- general interface configuration

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
;;   (require 'conf-interface)

;;; Code:

(eval-when-compile
  (require 'cl))

;;; activer la roulette
;;(mouse-wheel-mode t)

;;; numéro de colonne :
(column-number-mode t)


;; inhiber l'écran de démarrage
(setq inhibit-startup-message t)

;;; Menus etc...
(tool-bar-mode 0)
;;(scroll-bar-mode 1)
;;(set-scroll-bar-mode 'right)
(menu-bar-mode 1)
(blink-cursor-mode 1)


;;; police
;; manuel :
(when (eq system-type 'gnu/linux)
  (set-face-attribute 'default nil :family "DejaVu Sans Mono" :height 120))
(when (eq system-type 'cygwin)
  (set-face-attribute 'default nil :family "Anonymous Pro" :height 120))
;;(set-face-attribute 'default nil :family "Consolas" :height 100)
;;(set-face-attribute 'default nil :family "Courier" :height 100)
;; système (GNOME etc.) :
;;(setq font-use-system-font t)

;;; couleur
;;(require 'color-theme)
;;(color-theme-initialize)
;;(color-theme-goldenroad)

;;; taille
(setq initial-frame-alist 
      '((top . 10) (left . 20)
	(width . 80) (height . 35)))

;;; barre de titre
(setq frame-title-format "GNU/Emacs -- %b")


;;; popup
(require 'popup)

(provide 'conf-interface)
;;; conf-interface.el ends here
