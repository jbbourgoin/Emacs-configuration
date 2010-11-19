;;; conf-viewers.el --- conf-viewers.el

;; Copyright (C) 2010 Free Software Foundation, Inc.
;;
;; Author:  <jbbourgoin@PABUSIENNE>
;; Maintainer:  <jbbourgoin@PABUSIENNE>
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
;;   (require 'conf-viewers)

;;; Code:

(eval-when-compile
  (require 'cl))

;;; configuration de docview afin de visualiser pdf, ps etc.
(when (eq system-type 'cygwin)
  (setq doc-view-ghostscript-program "c:/Program Files/gs/gs8.71/bin/gswin32.exe"))
(when (eq system-type 'gnu/linux)
  (setq doc-view-ghostscript-program "/usr/bin/gs"))
;;(setq doc-view-dvipdf-program "")
;;(setq doc-view-pdftotext-program "")


(provide 'conf-viewers)
;;; conf-viewers.el ends here
