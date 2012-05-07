;;; TEX

(eval-when-compile
  (require 'cl))

;; AUCTEX

(load "auctex-autoloads.el" nil t t)
(load "preview.el" nil t t)

(setq TeX-engine 'xetex)
(setq TeX-PDF-mode t)

(provide 'conf-tex)
;;; conf-tex.el ends here
