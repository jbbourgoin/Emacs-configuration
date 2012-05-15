;;; conf-scheme.el --- conf-scheme

;; Copyright (C) 2012 Free Software Foundation, Inc.
;;
;; Author: Jean-Baptiste Bourgoin <jbbourgoin@jbbourgoin-desktop>
;; Maintainer: Jean-Baptiste Bourgoin <jbbourgoin@jbbourgoin-desktop>
;; Created: 12 Apr 2012
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

(require 'quack)

(setq scheme-program-name "/usr/bin/racket")

(provide 'conf-scheme)
;;; conf-scheme.el ends here
