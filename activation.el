;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Emacs 23 1999 - 2012   ;;
;; Jean-Baptiste Bourgoin ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; hacks pour corriger des bugs
(setq warning-suppress-types nil)

;;; INIT
;; ajouter dossiers de config au load-path :
(setq load-path (cons "~/.emacs.d/public/config/" load-path))
(setq load-path (cons "~/.emacs.d/prive/config/" load-path))
(require 'conf-init)

;;; conf générale
(require 'conf-commun)
(require 'conf-modes-divers)
(setq gnus-init-file "~/.emacs.d/public/config/conf-gnus.el")

;;; modes spécifiques
(require 'conf-org)
(require 'conf-eshell)
(require 'conf-c)
(require 'conf-tex) ;bug avec la version elpa à corriger
(require 'conf-javascript)
(require 'conf-lisp)
(require 'conf-perl)
;;(require 'conf-go)

;; pde active ido, le désactiver par défaut :
(ido-mode 1)
