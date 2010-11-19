;;; conf-csharp.el --- csharp configuration

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
;;   (require 'conf-csharp)

;;; Code:

(eval-when-compile
  (require 'cl))

(require 'csharp-mode)
(setq auto-mode-alist
      (append '(("\\.cs$" . csharp-mode)) auto-mode-alist))
(defun my-csharp-mode-fn ()
  "function that runs when csharp-mode is initialized for a buffer."
  ...insert your code here...
  ...most commonly, your custom key bindings ...
  )
(add-hook  'csharp-mode-hook 'my-csharp-mode-fn t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; C# code completion (requires CEDET semantic)
;;(load "wisent-csharp")
;;(require 'csharp-completion)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; ;; C# code completion (in csharp-mode-hook)
;; (local-set-key "\M-\\"   'cscomp-complete-at-point)
;; (local-set-key "\M-\."   'cscomp-complete-at-point-menu)

;;; POWERSHELL
(require 'powershell-mode)

(provide 'conf-csharp)
;;; conf-csharp.el ends here
