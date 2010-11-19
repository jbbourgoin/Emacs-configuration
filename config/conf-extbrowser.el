;;; conf-extbrowser.el --- external browser configuration

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
;;   (require 'conf-extbrowser)

;;; Code:

(eval-when-compile
  (require 'cl))


(when (eq system-type 'cygwin)
  (progn
    ;; WINDOWS :
    ;;(setq browse-url-browser-function 'browse-url-generic
    ;;      browse-url-generic-program
    ;;"c:/Users/jbbourgoin/AppData/Local/Google/Chrome/Application/chrome.exe")
    (setq browse-url-browser-function 'browse-url-generic
          browse-url-generic-program
          "c:/Program Files/Mozilla Firefox/firefox.exe")
    ))

(provide 'conf-extbrowser)
;;; conf-extbrowser.el ends here
