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
(require 'conf-spell)
;;(require 'conf-vim-emulation)
(require 'conf-wikipedia)
(require 'conf-templates)

;;; mail & news
;;(require 'bbdb)
(setq gnus-init-file "~/.emacs.d/public/config/conf-gnus.el")
(require 'conf-mail)
(require 'conf-adressbook)


;;; multimédia
(require 'conf-emms)

;;; web
(require 'conf-extbrowser)
(require 'conf-w3m)

;;; chat
(require 'conf-identica)
(require 'conf-twitter)
(require 'conf-jabber)
(require 'conf-irc)

;;; développement
(require 'conf-cedet)
(require 'conf-c)
;;(require 'conf-clojure)
(require 'conf-csharp)
;;(require 'conf-java)
(require 'conf-javascript)
(require 'conf-xml)
(require 'conf-lisp)
(require 'conf-parrot)
(require 'conf-perl)
(require 'conf-php)
(require 'conf-scheme)

;;; spécifiques aux OS :

(when (eq system-type 'cygwin)
  (
   ;;(require 'conf-cygwin)
   (require 'conf-powershell)
   ))
(when (eq system-type 'gnu/linux)
  (
   ;;(require 'conf-gnome-integration)
   ))