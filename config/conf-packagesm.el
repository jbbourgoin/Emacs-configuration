;;; conf-packagesm.el --- package manager configuration

;; Author: Jean-Baptiste Bourgoin <monsieur.camille@gmail.com>
;; Maintainer: Jean-Baptiste Bourgoin <monsieur.camille@gmail.com>
;; Created: 
;; Version: 0.1
;; Keywords:
;; licence: GNU GPL

;; Commentary:

;; Put this file into your load-path and the following into your ~/.emacs.el:
;;   (require 'conf-packagesm)

;;; Code:


(eval-when-compile
  (require 'cl))


;;; AUTO-INSTALL
;;; installer un paquet : M-x auto-install-from-emacswiki
(require 'auto-install)
;; répertoire de téléchargement des fichiers elisp
(setq auto-install-directory "~/.emacs.d/public/lisp/")
;; met à jour la liste emacs-wiki au démarrage d'emacs
(setq auto-install-update-emacswiki-package-name t)
;; utilise wget pour le téléchargement
(setq auto-install-use-wget nil)

;;; ELPA
;;; installer un paquet : M-x package-list-packages
;;; i : sélectionner pour installer
;;; r : update
;;; x : install
(when
    (load
     (expand-file-name "~/.emacs.d/public/lisp/elpa/package.el"))
  (package-initialize))


;;; web vcs (pour nxhtml)
(require 'web-vcs)

(provide 'conf-packagesm)
;;; conf-packagesm ends here
