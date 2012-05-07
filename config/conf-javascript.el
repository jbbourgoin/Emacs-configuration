;;; JAVASCRIPT

(eval-when-compile
  (require 'cl))

(require 'js3-mode-autoloads)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js3-mode))

(require 'coffee-mode)
(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
(add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode))

(provide 'conf-javascript)
;;; conf-javascript.el ends here
