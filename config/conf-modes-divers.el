;;; MODES

(eval-when-compile
  (require 'cl))

;;; lilypond
;; (autoload 'LilyPond-mode "lilypond-mode")
;; (setq auto-mode-alist
;;       (cons '("\\.ly$" . LilyPond-mode) auto-mode-alist))
;; (add-hook 'LilyPond-mode-hook (lambda () (turn-on-font-lock)))

;;; html
;; html mode pour perl template
(add-to-list 'auto-mode-alist '("\\.tt\\'" . html-mode))

;;; css
(require 'less-css-mode)
(setq less-css-compile-at-save t)
(setq less-css-lessc-command "lessc")

;;; yaml
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

;;; markdown
(autoload 'markdown-mode "markdown-mode.el"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;;; php
(autoload 'php-mode "php-mode" "PHP editing mode" t)
(add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode))
(add-to-list 'auto-mode-alist '("\\.php3\\'" . php-mode))
(add-to-list 'auto-mode-alist '("\\.php4\\'" . php-mode))


(provide 'conf-modes-divers)