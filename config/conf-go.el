;;; GO

(eval-when-compile
  (require 'cl))

(when (eq system-type 'gnu/linux)
  (load "/usr/lib/go/misc/emacs/go-mode-load.el")
  (load "/usr/lib/go/misc/emacs/go-mode.el"))

(provide 'conf-go)
;;; conf-go.el ends here
