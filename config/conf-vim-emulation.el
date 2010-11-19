;;; conf-vim-emulation.el --- vim emulation configuration

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
;;   (require 'conf-vim-emulation)

;;; Code:

(eval-when-compile
  (require 'cl))

;;; VIPER MODE
;; voir ~/.viper. Activer viper :
(setq viper-mode t)                ; enable Viper at load time
(setq viper-ex-style-editing nil)  ; can backspace past start of insert / line
(require 'viper)                   ; load Viper
(require 'vimpulse)                ; load Vimpulse
(setq woman-use-own-frame nil)     ; don't create new frame for manpages
(setq woman-use-topic-at-point t)  ; don't prompt upon K key (manpage display)

(provide 'conf-vim-emulation)
;;; conf-vim-emulation.el ends here
