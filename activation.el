;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Emacs 23 1999 - 2010   ;;
;; Jean-Baptiste Bourgoin ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; INIT
;; ajouter dossiers de config au load-path :
(setq load-path (cons "~/.emacs.d/public/config/" load-path))
(setq load-path (cons "~/.emacs.d/prive/config/" load-path))
(require 'conf-path)
(require 'conf-packagesm)

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
(require 'conf-bbcode)
(require 'conf-edition)
(require 'conf-dict)
(require 'conf-print)
;;(require 'conf-vim-emulation)
(require 'conf-wikipedia)
;; (require 'conf-yasnippet)
(require 'conf-markdown)

;;; mail & news
;;(require 'bbdb)
(setq gnus-init-file "~/.emacs.d/public/config/conf-gnus.el")
(require 'conf-mail)
(require 'conf-adressbook)


;;; multimédia
;; (require 'conf-emms)
(require 'conf-lilypond)

;;; web
(require 'conf-extbrowser)
(require 'conf-w3m)

;;; chat
;; (require 'conf-identica)
;; (require 'conf-twitter)
;; (require 'conf-jabber)
;; (require 'conf-irc)

;;; développement
(require 'conf-cedet)
(require 'conf-c)
(require 'conf-cobol)
;;(require 'conf-clojure)
;;(require 'conf-csharp)
;;(require 'conf-java)
;; (require 'conf-nxhtml)
(require 'conf-tex)
;;(require 'conf-haskell)
(require 'conf-javascript)
(require 'conf-lisp)
;;(require 'conf-parrot)
(require 'conf-perl)
(require 'conf-python)
(require 'conf-php)
(require 'conf-scheme)
;;(require 'sawfish)

;;; spécifiques aux OS :

(when (eq system-type 'cygwin)
   ;;(require 'conf-cygwin)
   (require 'conf-powershell))
;; (when (eq system-type 'gnu/linux)
;;     (require 'conf-gnome-integration))

;;; desactivations diverses :

;; pde active ido, le désactiver par défaut :
(ido-mode 1)
