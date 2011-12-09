;; perldoc pour eshell

(defun perldoc (man-args)
  (interactive "sPerldoc: ")
  (require 'man)
  (let ((manual-program "perldoc"))
    (man man-args)))

(defun eshell/perldoc (&rest args)
  "Like `eshell/man', but invoke `perldoc'."
  (funcall 'perldoc (apply 'eshell-flatten-and-stringify args)))

(provide 'eshell_perldoc)
