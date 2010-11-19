;;; conf-spell.el --- spell checking configuration

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
;;   (require 'conf-spell)

;;; Code:

(eval-when-compile
  (require 'cl))

;;; ispell
;; dictionnaire en français
(when (eq system-type 'cygwin)
  (setq ispell-program-name "/cygdrive/c/Program Files/Aspell/bin/aspell.exe"))
(setq ispell-extra-args '("--sug-mode=ultra"))
(setq ispell-dictionary "francais")
;; liste de dictionnaire
(require 'ispell)
;; brezhoneg :
(add-to-list 'ispell-dictionary-alist
             '("brezhoneg"
               "[A-Za-zùñéèêàçœæÉÈÀÇŒÆÊ]"
               "[^A-Za-zùñéèêàçœæÉÈÀÇŒÆÊ]"
               "[']" t ("-C" "-d" "brezhoneg") "~latin1" iso-8859-1))
;; ajouter au menu
(require 'easymenu)

(defun my-ispell-brezhoneg-dictionary () ;;;;;; BREZHONEG
  "Switch to the brezhoneg dictionary."
  (interactive)
  (ispell-change-dictionary "brezhoneg"))
(easy-menu-add-item  nil '("tools" "spell")
                     ["Select brezhoneg Dict" my-ispell-brezhoneg-dictionary t])

(defun my-ispell-francais-dictionary () ;;;;;;; FRANCAIS
  "Switch to the francais dictionary."
  (interactive)
  (ispell-change-dictionary "francais"))
(easy-menu-add-item  nil '("tools" "spell")
                     ["Select francais Dict" my-ispell-francais-dictionary t])

(defun my-ispell-english-dictionary () ;;;;;;; ENGLISH
  "Switch to the english dictionary."
  (interactive)
  (ispell-change-dictionary "english"))
(easy-menu-add-item  nil '("tools" "spell")
                     ["Select english Dict" my-ispell-english-dictionary t])

;;; FLYSPELL
;; pour des raisons de performance :
(setq flyspell-issue-message-flag 'nil)
;; activer pour les modes suivants :
(dolist (hook '(text-mode-hook org-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 1))))
;; desactiver pour les modes suivants :
(dolist (hook '(change-log-mode-hook log-edit-mode-hook))
  (add-hook hook (lambda () (flyspell-mode -1))))
;; activer dans les commentaires uniquement :
(add-hook 'c++-mode-hook (lambda () (flyspell-prog-mode)))
(add-hook 'cperl-mode-hook (lambda () (flyspell-prog-mode)))
(add-hook 'lisp-mode-hook (lambda () (flyspell-prog-mode)))

(provide 'conf-spell)
;;; conf-spell.el ends here
