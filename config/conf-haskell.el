;;; conf-haskell.el --- conf-haskell

;; Copyright (C) 2010 Free Software Foundation, Inc.
;;
;; Author: Jean-Baptiste Bourgoin <jbbourgoin@debianette.StPabu>
;; Maintainer: Jean-Baptiste Bourgoin <jbbourgoin@debianette.StPabu>
;; Created: 22 Dec 2010
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
;;   (require 'conf-haskell)

;;; Code:

(eval-when-compile
  (require 'cl))

(load "~/.emacs.d/public/lisp/haskell-mode-2.8.0/haskell-site-file.el")

;;; modules :
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
;; 3 modes d'indentation (ne fonctionnent pas ensembles) :
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)

;;; haskell :
;;(setq haskell-program-name "")

(provide 'conf-haskell)
;;; conf-haskell.el ends here
