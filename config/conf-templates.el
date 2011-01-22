
;;; conf-templates.el --- templates configuration

;; Author: Jean-Baptiste Bourgoin <monsieur.camille@gmail.com>
;; Maintainer: Jean-Baptiste Bourgoin <monsieur.camille@gmail.com>
;; Created: 21 juin 2010
;; Version: 0.1
;; Keywords: template
;; licence: GNU GPL

;; Commentary:

;; Put this file into your load-path and the following into your ~/.emacs.el:
;;   (require 'conf-templates)

;;; Code:

(eval-when-compile
  (require 'cl))


;;; yasnippet
(add-to-list 'load-path
	     "~/.emacs.d/public/lisp/yasnippet")
(require 'yasnippet) ;; not yasnippet-bundle
(yas/initialize)
(yas/load-directory "~/.emacs.d/public/snippets")

;; (setq yas/trigger-key (kbd "s-e"))
;; (add-hook 'yas/minor-mode-on-hook
;;           (define-key yas/minor-mode-map yas/trigger-key 'yas/expand))

;;; js2 & yasnippet
(add-hook 'js2-mode-hook #'yas/minor-mode-on)

(eval-after-load 'js2-mode
  '(progn
     (define-key js2-mode-map (kbd "TAB")
       (lambda()
	 (interactive)
	 (let ((yas/fallback-behavior 'return-nil))
	   (unless (yas/expand)
	     (indent-for-tab-command)
	     (if (looking-back "^\s*")
		 (back-to-indentation))))))))



(provide 'conf-templates)
;;; conf-templates ends here