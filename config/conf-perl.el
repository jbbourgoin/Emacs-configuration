;;; PERL

(eval-when-compile
  (require 'cl))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; cperl ;;;
(mapc
 (lambda (pair)
   (if (eq (cdr pair) 'perl-mode)
       (setcdr pair 'cperl-mode)))
 (append auto-mode-alist interpreter-mode-alist))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'conf-perl)
;;; conf-perl.el ends here
