;;; conf-emms.el --- conf-emms

;; Copyright (C) 2010 Free Software Foundation, Inc.
;;
;; Author:  <jbbourgoin@PABUSIENNE>
;; Maintainer:  <jbbourgoin@PABUSIENNE>
;; Created: 11 Nov 2010
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
;;   (require 'conf-emms)

;;; Code:

(eval-when-compile
  (require 'cl))

;; configuration standard
(emms-all)
(emms-default-players)

;; When asked for emms-play-directory,
;; always start from this one
(when (eq system-type 'cygwin)
  (setq emms-source-file-default-directory
        "/cygdrive/c/Users/jbbourgoin/Music"))

(when (eq system-type 'gnu/linux)
  (setq emms-source-file-default-directory
        "~/Musique/"))


;; (define-emms-simple-player mplayer '(file url)
;;       (regexp-opt
;;        '(".ogg" ".OGG" ".mp3" ".MP3" ".flac" ".FLAC" ".aac" ".AAC")
;;        ) "/usr/bin/ogg123")
;; (add-to-list 'emms-player-list 'emms-player-mplayer)

;;; Add music file to playlist on '!', --lgfang
(add-to-list 'dired-guess-shell-alist-user
             (list "\\.\\(flac\\|mp3\\|ogg\\|wav\\)\\'"
                   '(if (y-or-n-p "Add to emms playlist?")
                        (progn (emms-add-file (dired-get-filename))
                               (keyboard-quit))
                      "mplayer")))

(setq emms-info-asynchronously t)

(provide 'conf-emms)
;;; conf-emms.el ends here
