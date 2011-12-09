;;; conf-lisp.el --- LISP configuration

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
;;   (require 'conf-lisp)

;;; Code:

(eval-when-compile
  (require 'cl))

;;; CLASSIC :
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; general ;;;
(setq colon-double-space t)
(require 'hl-sexp) ;; highlight currebt sexp
;; run REPL with *M-x run-lisp*
;; ABCL : "java -jar c:/Users/jbbourgoin/Applications/abcl/abcl.jar"
;; CLISP : "/usr/bin/clisp"
(when (eq system-type 'windows-nt)
  (setq inferior-lisp-program
        "c:/Program Files/Steel Bank Common Lisp/1.0.53/sbcl.exe")) ; _your Lisp system_
(when (eq system-type 'gnu/linux)
  (setq inferior-lisp-program
        "/usr/bin/clisp")) ; _your Lisp system_

;;; paredit
;; paredit-open-list (() - Inserts a balanced parenthesis pair.
;; paredit-close-list (M-)) - Moves past one closing parenthesis and reindents.
;; paredit-close-list-and-newline ()) - Moves past one closing delimiter, adds a newline, and reindents.
;; paredit-splice-sexp (M-s) - Splices the list that the point is on by removing its delimiters.
;; paredit-backward-delete (DEL) - Deletes a character backward or moves backward over a delimiter.
;; paredit-forward-slurp-sexp (C-)) - Adds the S-expression following the current list into that list by moving the closing delimiter.
;; paredit-backward-slurp-sexp (C-() - Adds the S-expression preceding the current list into that list by moving the closing ((sic) opening?) delimiter.
;; paredit-forward-barf-sexp (C-}) - Removes the last S-expression in the current list from that list by moving the closing delimiter.
;; paredit-backward-barf-sexp (C-{) - Removes the first S-expression in the current list from that list by moving the closing ((sic) opening?) delimiter.
;; paredit-wrap-sexp (M-() - Wraps the following S-expression in a list.


(autoload 'paredit-mode "paredit"
  "Minor mode for pseudo-structurally editing Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       (lambda () (paredit-mode +1)))
(add-hook 'lisp-mode-hook             (lambda () (paredit-mode +1)))
(add-hook 'lisp-interaction-mode-hook (lambda () (paredit-mode +1)))

(provide 'conf-lisp)
;;; conf-lisp.el ends here
