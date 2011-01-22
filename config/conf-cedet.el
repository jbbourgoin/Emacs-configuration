;;; conf-cedet.el --- CEDET dev tools configuration

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
;;   (require 'conf-cedet)

;;; Code:

(eval-when-compile
  (require 'cl))

(require 'ede)
(require 'semantic)
(require 'eieio)
(require 'sr-speedbar)
(global-ede-mode t)                      ; Enable the Project management system
;;(semantic-load-enable-code-helpers)      ; Enable prototype help and smart completion 
(setq semanticdb-default-save-directory "~/.emacs.d/semantic-cache/")
;;(global-srecode-minor-mode 1)            ; Enable template insertion menu
;; speedbar
;; sr-speedbar : la barre dans un buffer plutôt que dans une fenêtre
(global-set-key (kbd "C-x p") 'sr-speedbar-toggle)
(setq sr-speedbar-width-x '80)
(setq sr-speedbar-auto-refresh nil)
(setq sr-speedbar-right-side nil)

(provide 'conf-cedet)
;;; conf-cedet.el ends here
