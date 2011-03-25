;;; conf-dired.el --- dired configuration

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
;;   (require 'conf-dired)

;;; Code:

(eval-when-compile
  (require 'cl))

;;; dired
;; extensions :
(require 'dired-x)
(require 'dired+)
;; toujours réutiliser le buffer courant :
(toggle-dired-find-file-reuse-dir 1)
;; permet de copier un fichier d'un buffer dired vers
;; un autre buffer dired
(setq dired-dwim-target t)
;; (dé)compression automatique des fichiers lus et écrits
(auto-compression-mode t)
;;; dired
;; pourvoir supprimer des dossiers récursivement
(setq dired-recursive-deletes t)

(when (eq system-type 'cygwin)
  (require 'w32-find-dired))

(require 'dired+)

(require 'run-assoc)

(when (eq system-type 'cygwin)
  (setq associated-program-alist
      '(("/cygdrive/c/Program Files/SumatraPDF/SumatraPDF.exe" "\\.pdf$")
        ((lambda (file)
           (browse-url
	    (concat "file:///" (expand-file-name file)))) "\\.html?$"))))

;;; ouvrire dans dired avec xdg-open
(when (eq system-type 'gnu/linux)
  (defun dired-do-shell-launch-file-default ()
    (interactive)
    (save-window-excursion
      (dired-do-async-shell-command
       "$HOME/.emacs.d/public/bin/open.sh" current-prefix-arg ;; linux;; multiple files
       ;; "nohup xdg-open" current-prefix-arg ;; linux can open multiple files, but one at a time
       ;; "see" current-prefix-arg ;; linux;; can open at most 1 file (being opened)
       ;; "open" current-prefix-arg ;; mac os x
       (dired-get-marked-files t current-prefix-arg)))))
(when (eq system-type 'gnu/linux)
  (define-key dired-mode-map (kbd "s-o") 'dired-do-shell-launch-file-default))

;; unmount disk in dired
;;http://loopkid.net/articles/2008/06/27/force-unmount-on-mac-os-x
(when (eq system-type 'gnu/linux)
  (defun dired-do-shell-unmount-device ()
    (interactive)
    (save-window-excursion
      (dired-do-async-shell-command
       "umount" current-prefix-arg ;; linux
       ;; "diskutil unmount" current-prefix-arg ;; mac os x
       (dired-get-marked-files t current-prefix-arg)))))
(when (eq system-type 'gnu/linux)
  (define-key dired-mode-map (kbd "s-u") 'dired-do-shell-unmount-device))

(provide 'conf-dired)
;;; conf-dired.el ends here