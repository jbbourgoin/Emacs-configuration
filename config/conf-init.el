;;; INIT

(eval-when-compile
  (require 'cl))

                    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                    ;;;  GESTIONNAIRE DE PAQUETS  ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; ELPA
;;; installer un paquet : M-x package-list-packages
;;; i : sélectionner pour installer
;;; r : update
;;; x : install

;; Personnal directory
(setq package-user-dir "~/.emacs.d/public/lisp/elpa/")
;; Packages Archives
(setq package-archives '(("ELPA" . "http://tromey.com/elpa/")))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
             '("gnu" . "http://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)

;;; web vcs (pour nxhtml)
;;(require 'web-vcs)






                    ;;;;;;;;;;;;;;;
                    ;;;  PATH  ;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; variable PATH
;;; Define a function to setup additional path
(defun my-add-path (path-element)
  "Add the specified path element to the Emacs PATH"
  (interactive "DEnter directory to be added to path: ")
  (if (file-directory-p path-element)
      (setenv "PATH"
              (concat (expand-file-name path-element)
                      path-separator (getenv "PATH")))))
;;; Set localized PATH for Emacs.
(if (fboundp 'my-add-path)
    (let ((my-paths (list
                     "~/Applications/bin"
		     "~/.emacs.d/public/bin/"
                     )))
      (dolist (path-to-add my-paths (getenv "PATH"))
        (my-add-path path-to-add))))


(setenv "PATH" (concat (getenv "PATH") ":~/.emacs.d/public/bin/"))
(setq exec-path (append exec-path '("~/.emacs.d/public/bin/")))

;;;;;;   répertoires
;; ajouter .emacs.d/lisp ainsi que tous ses sous-répertoires au load-path :
(if (fboundp 'normal-top-level-add-subdirs-to-load-path)
    (let* ((my-lisp-dir "~/.emacs.d/public/lisp")
           (default-directory my-lisp-dir))
      (setq load-path (cons my-lisp-dir load-path))
      (normal-top-level-add-subdirs-to-load-path)))

;;;;;; INFO
;; pour recomposer *info* évaluer : (setq Info-dir-contents nil)
(require 'info)
(setq Info-directory-list
      (append '("~/.info"
                "/MinGW/share/info/"
                "/MinGW/msys/1.0/local/share/info/"
                "~/.emacs.d/public/lisp/manual/geiser/doc/"
                "~/.emacs.d/public/info/"
                )
              Info-default-directory-list
              Info-directory-list))

;;; backup
(setq backup-directory-alist
      '(("." . "~/.emacs.d/backup-files")))

;;; les configurations apportées par customize sont
;;; enregistrés dans ~.emacs-custom
(setq custom-file "~/.emacs.d/emacs-custom")
(load-file custom-file)

                    ;;;;;;;;;;;;;;;;;;;;;;;
                    ;;;  SERVEUR EMACS  ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(server-force-delete)
(server-start)
(global-set-key (kbd "C-x C-c") 'save-buffers-kill-emacs)
(global-set-key (kbd "C-x <f4>") 'save-buffers-kill-terminal)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(provide 'conf-init)
