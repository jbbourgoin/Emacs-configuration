;;; ESHELL

(eval-when-compile
  (require 'cl))

;;; eshell
;;;;;;;;;;;;;;;;;;;;;;;;;;;; DOC
;; Redirection :
;; >    means overwrite
;; >>   means append
;; >>>  means insert at point - this works when redirecting to a
;;        buffer or to an open file
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq eshell-directory-name "~/.emacs.d/public/eshell")
;; PROMPT
;; saute une ligne entre le chemin et le prompt :
(setq eshell-prompt-function
      (lambda ()
        (concat (eshell/pwd) "\n" (if (= (user-uid) 0) " # " " $ "))))

;; sauver l'historique à la fermeture
(setq eshell-save-history-on-exit t)

;;; Nouvelles fonctions
(require 'eshell_less)
(require 'eshell_bmk)
(when (eq system-type 'windows-nt)
  (require 'eshell_op))

(provide 'conf-eshell)
;;; conf-eshell.el ends here
