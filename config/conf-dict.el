;;; conf-dict.el --- dictionnaries-configuration

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
;;   (require 'conf-dict)

;;; Code:

(eval-when-compile
  (require 'cl))

(defun lookup-wikipedia ()
  "Look up the word under cursor in Wikipedia.
This command generates a url for Wikipedia.com and switches you
to browser. If a region is active (a phrase), lookup that phrase."
  (interactive)
  (let (myword myurl)
    (setq myword
          (if (and transient-mark-mode mark-active)
              (buffer-substring-no-properties (region-beginning) (region-end))
            (thing-at-point 'symbol)))
    (setq myword (replace-regexp-in-string " " "_" myword))
    (setq myurl (concat "http://en.wikipedia.org/wiki/" myword))
    (browse-url myurl)
    ))

;;; text-translator
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; keys ;;;
;; C-u F6 : sélection du dictionnaire par défaut                              ;;
;; F6 : traduit le mot avec le dictionnaire par défaut                        ;;
;; F7 : traduit le ou les mots sélectionnés avec le dictionnaire de son choix ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'text-translator)
(global-set-key (kbd "<f6>") 'text-translator)
(global-set-key (kbd "<f7>") 'text-translator-all)

;; The trasnlation results show the popup (text overlay).
;; You have to require the popup.el. (http://github.com/m2ym/auto-complete)
(require 'popup)
(setq text-translator-display-popup t)


(provide 'conf-dict)
;;; conf-dict.el ends here
