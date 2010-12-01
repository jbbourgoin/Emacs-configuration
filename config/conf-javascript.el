;;; conf-javascript.el --- javascript configuration

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
;;   (require 'conf-javascript)

;;; Code:

(eval-when-compile
  (require 'cl))

;; (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;;; Le REPL fonctionne avec le mode js2. Il faut, dans le cadre de
;;; cette configuration, l'activer à la main.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; JS REPL ;;
;; run-js : see the repl                                                      ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'js-comint)
(when (eq system-type 'gnu/linux)
  (setq inferior-js-program-command "/usr/bin/seed")) ;; seed, smjs, rhino etc.
(add-hook 'js2-mode-hook
          '(lambda () 
             ;; (local-set-key "\C-x\C-e" 'js-send-last-sexp)
             (local-set-key "\C-x\C-e" 'js-send-region)
;;             (local-set-key "\C-\M-x" 'js-send-last-sexp-and-go)
;;             (local-set-key "\C-cb" 'js-send-buffer)
;;             (local-set-key "\C-c\C-b" 'js-send-buffer-and-go)
;;             (local-set-key "\C-cl" 'js-load-file-and-go)
             ))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; MOZREPL ;;;
;; C-c C-s: open a MozRepl interaction buffer and switch to it                ;;
;; C-c C-l: save the current buffer and load it in MozRepl                    ;;
;; C-M-x: send the current function (as recognized by c-mark-function)        ;;
;;        to MozRepl                                                          ;;
;; C-c C-c: send the current function to MozRepl and switch                   ;;
;;          to the interaction buffer                                         ;;
;; C-c C-r: send the current region to MozRepl                                ;;
;;          In the interaction buffer:                                        ;;
;; C-c c: insert the current name of the REPL plus the dot operator           ;;
;;        (usually repl.)                                                     ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(autoload 'moz-minor-mode "moz" "Mozilla Minor and Inferior Mozilla Modes" t)
(add-hook 'js2-mode-hook 'js2-custom-setup)
(defun js2-custom-setup ()
  (moz-minor-mode 1))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;; interpréteur javascript en emacs lisp
(add-to-list 'load-path "~/.emacs.d/lisp/javascript/ejacs/")
(autoload 'js-console "js-console" nil t)

(provide 'conf-javascript)
;;; conf-javascript.el ends here
