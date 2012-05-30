;;; MODES

(eval-when-compile
  (require 'cl))

;;; flymake
(require 'flymake)

;; helm
(require 'helm-config)
(global-set-key (kbd "C-c h") 'helm-mini)
(helm-mode 1)

;;; lilypond
;; (autoload 'LilyPond-mode "lilypond-mode")
;; (setq auto-mode-alist
;;       (cons '("\\.ly$" . LilyPond-mode) auto-mode-alist))
;; (add-hook 'LilyPond-mode-hook (lambda () (turn-on-font-lock)))

;;; html
;; html mode pour perl template
(add-to-list 'auto-mode-alist '("\\.tt\\'" . html-mode))

;;; css
;;(require 'css-complete) ; complétion des règles css
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

(provide 'conf-modes-divers)