;;; conf-w3m.el --- conf-w3m

;; Copyright (C) 2010 Free Software Foundation, Inc.
;;
;; Author: Jean-Baptiste Bourgoin <monsieur.camille@gmail.com>
;; Maintainer: Jean-Baptiste Bourgoin <monsieur.camille@gmail.com>
;; Created: 06 Nov 2010
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
;;   (require 'conf-w3m)

;;; Code:

(eval-when-compile
  (require 'cl))

;;; w3m
(require 'w3m-load)
(require 'w3m)
;; choisir entre navigateur interne (w3m) et externe
;; (setq browse-url-browser-function 'browse-url-generic
;;       browse-url-generic-program "/usr/bin/iceweasel")
;; (defun choose-browser (url &rest args)
;;   (interactive "sURL: ")
;;   (if (eq url nil)
;;       (setq url word-at-point))
;;   (if (y-or-n-p "Use external browser? ")
;;       (browse-url-generic url)
;;     (w3m-browse-url url)))
;; (setq browse-url-browser-function 'choose-browser)
;; (global-set-key "\C-xm" 'choose-browser)
;; browse in new tab
;; (setq browse-url-browser-function 'w3m-browse-url
;;       browse-url-new-window-flag t)
(autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)
;; optional keyboard short-cut
;;(global-set-key "\C-xm" 'browse-url-at-point)
;; cookies
(setq w3m-use-cookies t)
;; moteurs de recherche additionnels
(require 'w3m-search)
(add-to-list 'w3m-search-engine-alist
	     '("emacs-wiki" "http://www.emacswiki.org/cgi-bin/wiki.pl?search=%s"
	       "wikipedia-fr" "http://fr.wikipedia.org/wiki/Special:Search?search=%s"
	       "cnrtl" "http://www.cnrtl.fr/definition/%s"))
;; line-drawing caracters
(standard-display-ascii ?\200 [15])
(standard-display-ascii ?\201 [21])
(standard-display-ascii ?\202 [24])
(standard-display-ascii ?\203 [13])
(standard-display-ascii ?\204 [22])
(standard-display-ascii ?\205 [25])
(standard-display-ascii ?\206 [12])
(standard-display-ascii ?\210 [23])
(standard-display-ascii ?\211 [14])
(standard-display-ascii ?\212 [18])
(standard-display-ascii ?\214 [11])
(standard-display-ascii ?\222 [?\'])
(standard-display-ascii ?\223 [?\"])
(standard-display-ascii ?\224 [?\"])
(standard-display-ascii ?\227 " -- ")


(provide 'conf-w3m)
;;; conf-w3m.el ends here
