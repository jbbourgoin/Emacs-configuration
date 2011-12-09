;; FONCTION OPEN POUR WINDOWS
;; $ op * :
;; $ op . : ouvre Explorer dans le dossier courant
;; $ op file.doc : ouvre le fichier dans le lecteur doc système etc.
(defun eshell/op (FILE)
  "Invoke (w32-shell-execute \"Open\" FILE) and substitute slashes for backslashes"
  (w32-shell-execute "Open" (substitute ?\\ ?/ (expand-file-name FILE))))

(provide 'eshell_op)
