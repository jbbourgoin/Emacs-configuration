;;; LISP

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
;; (   - Inserts a balanced parenthesis pair.
;; M-) - Moves past one closing parenthesis and reindents.
;; )   - Moves past one closing delimiter, adds a newline, and reindents.
;; M-s - Splices the list that the point is on by removing its delimiters.
;; DEL - Deletes a character backward or moves backward over a delimiter.
;; C-) - Adds the S-expression following the current list
;;       into that list by moving the closing delimiter.
;; C-( - Adds the S-expression preceding the current list
;;       into that list by moving the closing ((sic) opening?) delimiter.
;; C-} - Removes the last S-expression in the current list
;;       from that list by moving the closing delimiter.
;; C-{ - Removes the first S-expression in the current list
;;       from that list by moving the closing ((sic) opening?) delimiter.
;; M-( - Wraps the following S-expression in a list.


(autoload 'paredit-mode "paredit"
  "Minor mode for pseudo-structurally editing Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       (lambda () (paredit-mode +1)))
(add-hook 'lisp-mode-hook             (lambda () (paredit-mode +1)))
(add-hook 'lisp-interaction-mode-hook (lambda () (paredit-mode +1)))

(provide 'conf-lisp)
;;; conf-lisp.el ends here
