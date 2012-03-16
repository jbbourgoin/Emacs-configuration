;;; conf-path.el --- conf-path file

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
;;   (require 'conf-path)

;;; Code:

(eval-when-compile
  (require 'cl))

;;; variable PATH
;;; Define a function to setup additional path
(defun my-add-path (path-element)
  "Add the specified path element to the Emacs PATH"
  (interactive "DEnter directory to be added to path: ")
  (if (file-directory-p path-element)
      (setenv "PATH"
              (concat (expand-file-name path-element)
                      path-separator (getenv "PATH")))))
;;; Set localized PATH for Emacs.
(if (fboundp 'my-add-path)
    (let ((my-paths (list
                     "/MinGW/bin/"
                     "/MinGW/msys/1.0/local/bin"
                     "/strawberry/perl/bin"
                     "~/Applications/bin"
		     "~/.emacs.d/public/bin/"
                     "~/.emacs.d/applications/bin/"
                     "~/.perl6/bin/"
                     )))
      (dolist (path-to-add my-paths (getenv "PATH"))
        (my-add-path path-to-add))))


;;;;;;   répertoires
;; ajouter .emacs.d/lisp ainsi que tous ses sous-répertoires au load-path :
(if (fboundp 'normal-top-level-add-subdirs-to-load-path)
    (let* ((my-lisp-dir "~/.emacs.d/public/lisp")
           (default-directory my-lisp-dir))
      (setq load-path (cons my-lisp-dir load-path))
      (normal-top-level-add-subdirs-to-load-path)))

;;;;;; INFO
;; pour recomposer *info* évaluer : (setq Info-dir-contents nil)
(require 'info)
(setq Info-directory-list
      (append '("~/.info"
                "/MinGW/share/info/"
                "/MinGW/msys/1.0/local/share/info/"
                "~/.emacs.d/public/lisp/manual/geiser/doc/"
                "~/.emacs.d/public/info/"
                )
              Info-default-directory-list
              Info-directory-list))

;;; backup
(setq backup-directory-alist
      '(("." . "~/.emacs.d/backup-files")))

;;; les configurations apportées par customize sont
;;; enregistrés dans ~.emacs-custom
(setq custom-file "~/.emacs.d/emacs-custom")
(load-file custom-file)

(provide 'conf-path)
;;; conf-path.el ends here
