;;; conf-scheme.el --- scheme configuration

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
;;   (require 'conf-scheme)

;;; Code:

(eval-when-compile
  (require 'cl))

;;;::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: scheme-mode ;;;
(when (eq system-type 'cygwin)
  (setq scheme-program-name "/cygdrive/c/Devel/Racket/Racket.exe"))
(when (eq system-type 'gnu/linux)
  (setq scheme-program-name "/usr/bin/racket"))
(add-hook 'scheme-mode-hook       (lambda () (paredit-mode +1)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Geiser (quand racket ou guile 2) :
;; (load-file "~/.emacs.d/public/lisp/geiser/elisp/geiser.el")
;; (add-hook 'geiser-mode-hook       (lambda () (paredit-mode +1)))

(provide 'conf-scheme)
;;; conf-scheme.el ends here
