;;; conf-org.el --- configuration pour le mode org

;; Copyright (C) 2010 Free Software Foundation, Inc.
;;
;; Author: Jean-Baptiste Bourgoin <monsieur.camille@gmail.com>
;; Maintainer: Jean-Baptiste Bourgoin <monsieur.camille@gmail.com>
;; Created: 26 Jul 2010
;; Version: 0.01
;; Keywords

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program; if not, write to the Free Software
;; Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

;;; Commentary:

;; 

;; Put this file into your load-path and the following into your ~/.emacs:
;;   (require 'conf-org)

;;; Code:

(eval-when-compile
  (require 'cl))

(require 'org-install)

;; Including all org files from a directory into the agenda
(setq org-agenda-files
      '("~/.emacs.d/public/documents/*.org"
        "~/.emacs.d/prive/documents/*.org"
        "/home/jbbourgoin/Documents/Travaux/Ar Vro Bagan/todo.org"))

;; afficher les images "en ligne" grâce à iimage
(require 'iimage)
(add-to-list 'iimage-mode-image-regex-alist
             (cons (concat "\\[\\[file:\\(~?" iimage-mode-image-filename-regex
                           "\\)\\]")  1))
(defun org-toggle-iimage-in-org ()
  "display images in your org file"
  (interactive)
  (if (face-underline-p 'org-link)
      (set-face-underline-p 'org-link nil)
    (set-face-underline-p 'org-link t))
  (iimage-mode))

;; intégration au diary
(setq org-agenda-include-diary t)


;;;; LATEX

;; code source en couleur
(setq org-export-latex-listings t)

;; class article
(require 'org-latex)
(unless (boundp 'org-export-latex-classes)
  (setq org-export-latex-classes nil))
(add-to-list 'org-export-latex-classes
             '("article"
               "\\documentclass{article}"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

;; class book
(add-to-list 'org-export-latex-classes
             `("book"
               "\\documentclass{book}"
               ("\\part{%s}" . "\\part*{%s}")
               ("\\chapter{%s}" . "\\chapter*{%s}")
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")))

;; class book qui commence avec \chapter
(add-to-list 'org-export-latex-classes
             `("bookchap"
               "\\documentclass{book}"
               ("\\chapter{%s}" . "\\chapter*{%s}")
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")))

;;; org & beamer
;; allow for export=>beamer by placing

;; #+LaTeX_CLASS: beamer in org files
(unless (boundp 'org-export-latex-classes)
  (setq org-export-latex-classes nil))
(add-to-list 'org-export-latex-classes
             ;; beamer class, for presentations
             '("beamer"
               "\\documentclass[11pt]{beamer}\n
      \\mode<{{{beamermode}}}>\n
      \\usetheme{{{{beamertheme}}}}\n
      \\usecolortheme{{{{beamercolortheme}}}}\n
      \\beamertemplateballitem\n
      \\setbeameroption{show notes}
      \\usepackage[utf8]{inputenc}\n
      \\usepackage[T1]{fontenc}\n
      \\usepackage{hyperref}\n
      \\usepackage{color}
      \\usepackage{listings}
      \\lstset{numbers=none,language=[ISO]C++,tabsize=4,
  frame=single,
  basicstyle=\\small,
  showspaces=false,showstringspaces=false,
  showtabs=false,
  keywordstyle=\\color{blue}\\bfseries,
  commentstyle=\\color{red},
  }\n
      \\usepackage{verbatim}\n
      \\institute{{{{beamerinstitute}}}}\n          
       \\subject{{{{beamersubject}}}}\n"

               ("\\section{%s}" . "\\section*{%s}")
               
               ("\\begin{frame}[fragile]\\frametitle{%s}"
                "\\end{frame}"
                "\\begin{frame}[fragile]\\frametitle{%s}"
                "\\end{frame}")))

;; letter class, for formal letters

(add-to-list 'org-export-latex-classes

             '("letter"
               "\\documentclass[11pt]{letter}\n
      \\usepackage[utf8]{inputenc}\n
      \\usepackage[T1]{fontenc}\n
      \\usepackage{color}"
               
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

;;; [you][too] => <span class="you">too</span> & \you{too}
(org-add-link-type
 "latex" nil
 (lambda (path desc format)
   (cond
    ((eq format 'html)
     (format "<span class=\"%s\">%s</span>" path desc))
    ((eq format 'latex)
     (format "\\%s{%s}" path desc))
    )))

;;; XELATEX

(add-to-list 'org-export-latex-classes
             '("xetex-article"
               "\\documentclass[12pt,a4paper]{article}
\\usepackage{xunicode}
\\usepackage{fontspec}
\\usepackage{xltxtra}
\\setmainfont[Mapping=tex-text]{Linux Libertine O}
\\usepackage[latin, french]{babel}
\\usepackage{textcomp}
\\usepackage{url}
\\usepackage{verse}
\\usepackage{tocbibind}
\\usepackage{multind}
\\usepackage{hyperref}
\\usepackage{color}
\\usepackage{xcolor}
\\usepackage{fontspec}
\\setromanfont[Mapping=tex-text, Numbers=OldStyle]{Linux Libertine O}
\\usepackage{geometry}
\\pagestyle{empty}
\\title{}
      [NO-DEFAULT-PACKAGES]
      [NO-PACKAGES]"
     ("\\section{%s}" . "\\section*{%s}")
     ("\\subsection{%s}" . "\\subsection*{%s}")
     ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
     ("\\paragraph{%s}" . "\\paragraph*{%s}")
     ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

;;; use xelatex instead of latex :

(setq org-latex-to-pdf-process 
  '("xelatex -interaction nonstopmode %f"
     "xelatex -interaction nonstopmode %f")) ;; for multiple passes

;; BABEL

(setq org-ditaa-jar-path "~/.emacs.d/public/bin/ditaa0_9.jar")
(setq org-plantuml-jar-path "~/java/plantuml.jar")

(add-hook 'org-babel-after-execute-hook 'bh/display-inline-images 'append)

; Make babel results blocks lowercase
(setq org-babel-results-keyword "results")

(defun bh/display-inline-images ()
  (condition-case nil
      (org-display-inline-images)
    (error nil)))

(org-babel-do-load-languages
 (quote org-babel-load-languages)
 (quote ((emacs-lisp . nil)
         (dot . t)
         (ditaa . t)
         (R . t)
         (python . nil)
         (ruby . nil)
         (gnuplot . t)
         (clojure . nil)
         (sh . nil)
         (ledger . t)
         (org . t)
         (plantuml . t)
         (latex . t))))

; Do not prompt to confirm evaluation
; This may be dangerous - make sure you understand the consequences
; of setting this -- see the docstring for details
(setq org-confirm-babel-evaluate nil)

; Use fundamental mode when editing plantuml blocks with C-c '
(add-to-list 'org-src-lang-modes (quote ("plantuml" . fundamental)))

(provide 'conf-org)
;;; conf-org.el ends here
