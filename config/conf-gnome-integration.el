(eval-when-compile
  (require 'cl))

;;; intégration avec le "recent items" de GNOME.
;;; il faut d'abord ajouter un script "addtorecent" dans "bin" :
;; ,-----------------------------------------------------------------
;; | #!/usr/bin/env python
;; | #-*- coding: utf-8  mode: python-*-
;; | 
;; | import sys, os, os.path, gtk
;; | 
;; | 
;; | data = {
;; |   "mime_type": 'text/plain',
;; |   "app_name": 'xdg-open',
;; |   "app_exec": 'xdg-open %F',  
;; | }
;; | 
;; | if len(sys.argv) < 2:
;; |     print "Adds a given URI to the list of recently used files"
;; |     print "  Syntax:  addtorecent. URI [MIME-type] [app] [cmd]"
;; |     print "  Defaults:   MIME-type: %(mime_type)s \n" \
;; |           "              app:       %(app_name)s\n" \
;; |           "              cmd:       %(app_exec)s\n"%data
;; |  
;; |     sys.exit(1)
;; | 
;; | newuri = sys.argv[1]
;; | if not newuri.startswith('file://'):
;; |     if not newuri.startswith('/'):
;; |         newuri = os.path.join(os.getcwd(), newuri)
;; |     newuri = 'file://%s'%newuri
;; | 
;; | try:
;; |     data['mime-type'] = sys.argv[2]
;; |     data['app_name'] = sys.argv[3]
;; |     data['app_exec'] = sys.argv[4]
;; | except IndexError:
;; |     pass
;; | 
;; | 
;; | manager = gtk.recent_manager_get_default()
;; | manager.add_full(newuri, data)
;; `-----------------------------------------------------------------
;;
;;; et faire en sorte que les fichiers texte soient ouverts par emacs,
;;;  ou emacsclient par défaut


(defun fd-add-file-to-recent ()
  (when buffer-file-name
    (start-process "addtorecent" nil "~/.emacs.d/public/bin/addtorecent"
                   (concat "file://" buffer-file-name)
                   "text/plain"
                   "Emacs"
                   "emacsclient %F")))

(add-hook 'find-file-hook 'fd-add-file-to-recent)

;; système (GNOME etc.) :
;;(setq font-use-system-font t)

(provide 'conf-gnome-integration)
;;; conf-gnome-integration.el ends here
