;;; conf-adressbook.el --- conf-adressbook

;; Copyright (C) 2010 Free Software Foundation, Inc.
;;
;; Author: Jean-Baptiste Bourgoin <monsieur.camille@gmail.com>
;; Maintainer: Jean-Baptiste Bourgoin <monsieur.camille@gmail.com>
;; Created: 22 Sep 2010
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
;;   (require 'conf-adressbook)

;;; Code:

(eval-when-compile
  (require 'cl))

;;; vcard
(require 'vcard)

;;; address book
(require 'external-abook)
;; goobook
(custom-set-variables '(external-abook-command "goobook query '%s'"))
;; key in gnus : gnus-message-mode external-abook-try-expand
(defun add-keys-to-message-mode ()
  (local-set-key (kbd "C-i") 'external-abook-try-expand))
(add-hook 'message-mode 'add-keys-to-message-mode)

(provide 'conf-adressbook)
;;; conf-adressbook.el ends here
