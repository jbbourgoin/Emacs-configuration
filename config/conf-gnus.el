;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Jean-Baptiste Bourgoin  ;;
;; GNUS configuration file ;;
;; nouvelle version 2010   ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;
;;; qui suis-je ;;;
(setq user-mail-address "monsieur.camille@gmail.com")
(setq user-full-name "Jean-Baptiste Bourgoin")
;;;;;;;;;;;;;;;;;;;


;;;; trier :
;; par date (plus récent en premier) puis par sujets
(setq gnus-thread-sort-functions
      '(
        gnus-thread-sort-by-subject
        (not gnus-thread-sort-by-date)
        ))

;;; rendu html
;;(setq mm-text-html-renderer 'w3) ;; W3
(setq mm-text-html-renderer 'w3m) ;; W3

;;;;;;;;;;;;;;;;;;;;;;;;
;;; méthodes d'accès ;;;
;; NNTP : login et mdp dans nntp-authinfo
;; authinfo : machine news.eternal-september.org login LOGIN password MDP force yes
(setq nntp-authinfo-file "~/.emacs.d/prive/config/nntp-authinfo")
(setq gnus-select-method '(nntp "news.eternal-september.org"))
;; IMAP
(when (eq system-type 'cygwin)
  (setq imap-ssl-program-binary "/bin/openssl.exe"))
(setq imap-ssl-program-arguments "s_client -quiet -ssl3 -connect %s:%p")
(setq imap-ssl-program (concat imap-ssl-program-binary
                               " "
                               imap-ssl-program-arguments))
(add-to-list 'gnus-secondary-select-methods
             '(nnimap "imap.gmail.com"
                      (nnimap-address "imap.gmail.com")
                      (nnimap-server-port 993)
                      (nnimap-authinfo-file "~/.emacs.d/prive/config/imap-authinfo")
                      (nnimap-stream ssl))) ;; openssl : (nnimap-stream ssl) gnutls : (nnim... tls)
;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;
;;; méthodes d'envoie ;;;
;;; conf standard ;;;;;;;
;; SMTPmail :
;; authinfo : machine imap.gmail.com login LOGIN password MDP port 993
(setq smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))
      smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-default-smtp-server "smtp.gmail.com"
      send-mail-function 'smtpmail-send-it
      message-send-mail-function 'smtpmail-send-it
      smtpmail-smtp-service 587
      smtpmail-auth-credentials '(("smtp.gmail.com" 587 "monsieur.camille@gmail.com" nil)))

;;;; conf multi-smtp ;;;;;

;; Choose account label to feed msmtp -a option based on From header in Message buffer;
;; This function must be added to message-send-mail-hook for on-the-fly change of From address
;; before sending message since message-send-mail-hook is processed right before sending message.
;; ----
;; with Emacs 23.1, you have to set this explicitly (in MS Windows)
;; otherwise it tries to send through OS associated mail client
(setq message-send-mail-function 'message-send-mail-with-sendmail)
;; we substitute sendmail with msmtp
(when (eq system-type 'cygwin)
  (setq sendmail-program "~/.emacs.d/bin/msmtp.exe -C ~/.emacs.d/prive/config/msmtprc"))
(defun cg-feed-msmtp ()
  (if (message-mail-p)
      (save-excursion
        (let* ((from
                (save-restriction
                  (message-narrow-to-headers)
                  (message-fetch-field "from")))
               (account
                (cond
                 ;; I use email address as account label in ~/.msmtprc
                 ((string-match "monsieur.camille@gmail.com" from)"monsieur.camille@gmail.com")
                 ;; Add more string-match lines for your email accounts
                 ((string-match "jeanbaptiste.bourgoin@gmail.com" from)"jeanbaptiste.bourgoin@gmail.com"))))
          (setq message-sendmail-extra-arguments (list "-a" account))))))
(setq message-sendmail-envelope-from 'header)
(add-hook 'message-send-mail-hook 'cg-feed-msmtp)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; affichage des groupes ;;;
;;(add-hook 'gnus-topic-mode-hook 'gnus-topic-mode) ; activer les topics
(setq gnus-permanently-visible-groups ".*.*") ; voir tous les groupes tout le temps
(setq gnus-fetch-old-headers t) ; je veux accéder à mes précédents posts
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; affichage des articles ;;;
;;(setq mm-text-html-renderer 'w3m) ; w3m affiche le mails html
(setq gnus-visible-headers nil) ; montrer toutes les entêtes
(setq gnus-ignored-headers
      "^References:\\|^Cancel-Lock\\|^Cache-Post-Path:\\|^Sender\\|^Delivered-To\\|^Mailing-Lis\\|^Content-Disposition\\|^Mail-Copies-To\\|^Envelope-To\\|^Original-X-From\\|^Supersedes\\|^Expires\\|^Original-Received\\|^Original-To\\|^Original-X-Complaints-To\\|^Original-Lines\\|^Original-Path\\|^Original-Newsgroups\\|^Original-NNTP-Posting-Host\\|^Original-X-Trace\\|^Original-NNTP-Posting-Date\\|^Content-Language\\|^Mail-To-News-Contact\\|^List-Id\\|^Errors-To\\|^List-Post\\|^List-Help\\|^List-Unsubscribe\\|^List-Subscribe\\|^Disposition-Notification-To\\|^Cancel-Key\\|^Delivery-Date\\|Received:\\|^Message-ID\\|^Content-Type:\\|^Lines:\\|^Face:\\|^NNTP-Posting-Date\\|^MIME-Version:\\|^MBOX-Line\\|^Precedence\\|^Priority:\\|^Content-Transfer\\|^In-Reply-To:\\|^NNTP-Posting-Host:\\|^Approved:\\|^Path:\\|^Resent-\\|^Return\\|^X400\\|^Status:\\|^Received-SPF:\\|^Authentication-Results:\\|^Message-ID:\\|^Precedence:\\|^List-Subscribe:\\|^List-Owner:\\|^DKIM-Signature:\\|^DomainKey-\\|^X-") ; et ignorer celles qui nous embêtes
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;
;;; PGP ;;;
(require 'pgg) ; activation
;;(add-hook 'gnus-message-setup-hook 'mml-secure-message-sign-pgpmime) ; signer automatiquement
;;;;;;;;;;;


;;; gravatars
(require 'gravatar)
(require 'gnus-gravatar)
