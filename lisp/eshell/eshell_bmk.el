;; eshell/bmk - version 0.1.2

(defun pcomplete/eshell-mode/bmk ()
  "Completion for `bmk'"
  (pcomplete-here (bookmark-all-names)))

(defun eshell/bmk (&rest args)
  "Integration between EShell and bookmarks.
For usage, execute without arguments."
  (setq args (eshell-flatten-list args))
  (let ((bookmark (car args))
        filename name)
    (cond
     ((eq nil args)
      (format "Usage: bmk BOOKMARK to change directory pointed to by BOOKMARK
    or bmk . BOOKMARK to bookmark current directory in BOOKMARK.
Completion is available."))
     ((string= "." bookmark)
      ;; Store current path in EShell as a bookmark
      (if (setq name (car (cdr args)))
          (progn
            (bookmark-set name)
            (bookmark-set-filename name (eshell/pwd))
            (format "Saved current directory in bookmark %s" name))
        (error "You must enter a bookmark name")))
     (t
       ;; Assume the user wants to go to the path pointed out by a bookmark.
       (if (setq filename (cdr (car (bookmark-get-bookmark-record bookmark))))
           (if (file-directory-p filename)
               (eshell/cd filename)
             ;; TODO: Handle this better and offer to go to directory
             ;; where the file is located.
             (error "Bookmark %s points to %s which is not a directory" 
                    bookmark filename))
         (error "%s is not a bookmark" bookmark))))))