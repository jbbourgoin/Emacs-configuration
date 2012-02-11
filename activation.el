;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Emacs 23 1999 - 2010   ;;
;; Jean-Baptiste Bourgoin ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; hacks pour corriger des bugs
(setq warning-suppress-types nil)

;;; INIT
;; ajouter dossiers de config au load-path :
(setq load-path (cons "~/.emacs.d/public/config/" load-path))
(setq load-path (cons "~/.emacs.d/prive/config/" load-path))
(require 'conf-packagesm)
(require 'conf-path)

;;; emacs
(require 'conf-buffers)
(require 'conf-dired)
(require 'conf-emacs-server)
(require 'conf-interface)
(require 'conf-mode-line)
(require 'conf-window)
(require 'conf-org)

;;; terminal
(require 'conf-eshell)

;;; édition
(require 'conf-edition)
(require 'conf-dict)
(require 'conf-print)
;;(require 'conf-vim-emulation)
(require 'conf-wikipedia)
(require 'conf-yasnippet)
(require 'conf-markdown)

;;; mail & news
(setq gnus-init-file "~/.emacs.d/public/config/conf-gnus.el")
(require 'conf-mail)

;;; multimédia
(require 'conf-lilypond)

;;; web
(require 'conf-extbrowser)
;(require 'conf-w3m)

;;; chat
;;(require 'conf-irc)

;;; développement
(require 'conf-cedet)
(require 'conf-c)
(require 'conf-tex) ;bug avec la version elpa à corriger
(require 'conf-javascript)
(require 'conf-lisp)
;;(require 'conf-parrot)
(require 'conf-perl)
(require 'conf-php)
(require 'conf-xml) ; XML & HTML conf
(require 'conf-yaml)
(require 'conf-git)

;;; desactivations diverses :

;; pde active ido, le désactiver par défaut :
(ido-mode 1)
