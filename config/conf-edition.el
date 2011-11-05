;;; conf-edition.el --- general edition configuration

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
;;   (require 'conf-edition)

;;; Code:

(eval-when-compile
  (require 'cl))

;;; line-move-visual permet de passer d'une ligne à l'autre même
;;; en mode "logical line"
(setq line-move-visual nil)

;;; visual-line-mode : c'est un mode "visual line" (=/= logical line)
;; (setq global-visual-line-mode t) ;; global
(add-hook 'text-mode-hook 'turn-on-visual-line-mode)
(add-hook 'fundamental-mode-hook 'turn-on-visual-line-mode)
(add-hook 'xbbcode-mode-hook 'turn-on-visual-line-mode)
(add-hook 'bbcode-mode-hook 'turn-on-visual-line-mode)
(add-hook 'markdown-mode-hook 'turn-on-visual-line-mode)

;;; Afficher la 'parenthèse correspondante'
(show-paren-mode 1)
(setq show-paren-delay 0)

;;; surligner la région marquée
(transient-mark-mode 0)

;;; entrer une touche supprime la sélection (active transient-mark-mode)
(delete-selection-mode 1)

;;; input method
(global-set-key (kbd "C-x C-m i") 'set-input-method)

;;; codage des caractères
;; utf-8 par défaut
;; (setq current-language-environment "French")
;; (setq default-input-method "french-keyboard")
;; (setq keyboard-coding-system (quote utf-8))
;; (set-terminal-coding-system 'utf-8)
;; (set-keyboard-coding-system 'utf-8)
;; (set-language-environment 'french)
(prefer-coding-system 'utf-8)

;;;en mode "complete" il fournit un grand nombre de complétions
(setq tab-always-indent 'complete)

;;; delim
;; Kill text between two delimiters, preserving structure.
(require 'delim-kill)

(setq-default show-trailing-whitespace t)
(setq default-indicate-empty-lines t)

;;; unfill paragraph
(defun jbb-unfill-paragraph ()
  "Does the opposite of fill-paragraph"
  (interactive)
  (let
      ((fill-column (point-max)))
    (fill-paragraph nil)))

(global-set-key [f5] 'jbb-unfill-paragraph)


;;; undo tree
(require 'undo-tree)

(provide 'conf-edition)
;;; conf-edition.el ends here
