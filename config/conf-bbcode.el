;;; conf-bbcode.el --- bbcode configuration

;; Author: Jean-Baptiste Bourgoin <jbbourgoin@linuxette.stpabu.org>
;; Maintainer: Jean-Baptiste Bourgoin <jbbourgoin@linuxette.stpabu.org>
;; Created: 14 May 2010
;; Version: 0.01
;; Keywords

;; Commentary:

;; 

;; Put this file into your load-path and the following into your ~/.emacs:
;;   (require 'conf-bbcode)

;;; Code:

(eval-when-compile
  (require 'cl))

(require 'bbcode-mode)

(global-set-key "\C-c\C-f\C-i" 'bbcode-insert-italic)
(global-set-key "\C-c\C-f\C-b" 'bbcode-insert-bold)
(global-set-key "\C-c\C-f\C-q" 'bbcode-insert-quote)
(global-set-key "\C-c\C-f\C-l" 'bbcode-insert-link)
(global-set-key "\C-c\C-fi"    'bbcode-insert-image)

(add-to-list 'auto-mode-alist '("\\.bbcode\\'" . bbcode-mode))

(provide 'conf-bbcode)
;;; conf-bbcode.el ends here
