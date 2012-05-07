;;; C

(eval-when-compile
  (require 'cl))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; mode d'indentation ;;;
(setq c-mode-hook '(lambda () 
                     (c-set-style "k&r") ; k&r, gnu etc.
                     (c-toggle-auto-hungry-state 1))
      comment-multi-line t)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(provide 'conf-c)
;;; conf-c.el ends here
