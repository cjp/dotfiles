(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x M-g") 'magit-dispatch-popup)

(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

(setq visible-bell t
      echo-keystrokes 0.1
      font-lock-maximum-decoration t
      inhibit-startup-message t
      transient-mark-mode t
      color-theme-is-global t
      delete-by-moving-to-trash t
      shift-select-mode nil
      truncate-partial-width-windows nil
      uniquify-buffer-name-style 'forward
      whitespace-style '(trailing lines space-before-tab
                                  indentation space-after-tab)
      whitespace-line-column 100
      ediff-window-setup-function 'ediff-setup-windows-plain
      xterm-mouse-mode t
      )

(auto-compression-mode t)

(show-paren-mode 1)

(when (> emacs-major-version 21)
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  (global-set-key "\C-s" 'swiper)
  (global-set-key (kbd "C-c C-r") 'ivy-resume)
  (global-set-key (kbd "<f6>") 'ivy-resume)
  (global-set-key (kbd "M-x") 'counsel-M-x)
  (global-set-key (kbd "C-x C-f") 'counsel-find-file)
  ;; (global-set-key (kbd "<f1> f") 'counsel-describe-function)
  ;; (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
  ;; (global-set-key (kbd "<f1> l") 'counsel-find-library)
  ;; (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
  ;; (global-set-key (kbd "<f2> u") 'counsel-unicode-char)
  (global-set-key (kbd "C-c g") 'counsel-git)
  (global-set-key (kbd "C-c j") 'counsel-git-grep)
  (global-set-key (kbd "C-c k") 'counsel-ag)
  (global-set-key (kbd "C-x l") 'counsel-locate)
  (global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
  (define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)

;; (ido-mode t)
;; (setq ido-enable-prefix nil
;;       ido-enable-flex-matching t
;;       ido-create-new-buffer 'always
;;       ido-use-filename-at-point t
;;       ido-max-prospects 10)
)

(set-default 'indent-tabs-mode nil)
(set-default 'indicate-empty-lines t)
(set-default 'imenu-auto-rescan t)

;;(add-hook 'text-mode-hook 'turn-on-auto-fill)
(defvar starter-kit-coding-hook nil
  "Hook that gets run on activation of any programming mode.")

(defalias 'yes-or-no-p 'y-or-n-p)
;; Seed the random-number generator
(random t)

(when (boundp 'hippie-expand-try-functions-list)
  (delete 'try-expand-line hippie-expand-try-functions-list)
  (delete 'try-expand-list hippie-expand-try-functions-list))

(setq backup-directory-alist `(("." . ,(expand-file-name "~/.emacs.d/backups"))))
 
(setq diff-switches "-u")

(eval-after-load 'diff-mode
  '(progn
     (set-face-foreground 'diff-added "green4")
     (set-face-foreground 'diff-removed "red3")))

(add-to-list 'auto-mode-alist '("Jenkinsfile\\'" . groovy-mode))
(add-to-list 'auto-mode-alist '("\\.amber\\'" . jade-mode))

(server-start)

(when (eq system-type 'windows-nt)
    (setq request-curl "~/curl-7.53.1-win64-mingw/bin/curl"
          request-backend 'curl)
    (add-to-list 'exec-path "C:/Program Files (x86)/Aspell/bin/"))

(add-to-list 'load-path (expand-file-name "~/go/src/github.com/nsf/gocode/emacs/"))
(require 'go-autocomplete)
(require 'auto-complete-config)
(ac-config-default)

(unless (eq system-type 'windows-nt)
    (add-to-list 'exec-path "/usr/local/go/bin/")
    (add-to-list 'exec-path "~/go/bin/")
    (add-hook 'before-save-hook #'gofmt-before-save)
    (defun set-exec-path-from-shell-PATH ()
      (let ((path-from-shell (replace-regexp-in-string
                              "[ \t\n]*$"
                              ""
                              (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
        (setenv "PATH" path-from-shell)
        (setq eshell-path-env path-from-shell) ; for eshell users
        (setq exec-path (split-string path-from-shell path-separator))))
    (when window-system (set-exec-path-from-shell-PATH))
    (setenv "GOPATH" "/home/cjp/go"))

;; Set to the location of your Org files on your local system
(setq org-directory "~/org")
;; Set to the name of the file where new notes will be stored
(setq org-mobile-inbox-for-pull "~/org/flagged.org")
;; Set to <your Dropbox root directory>/MobileOrg.
(setq org-mobile-directory "~/Dropbox/Apps/MobileOrg")

;; (setq org-journal-dir "~/org/journal")
;; (require 'org-journal)

(setq org-agenda-files '())
(add-to-list 'org-agenda-files (expand-file-name "~/org"))
;; (add-to-list 'org-agenda-files (expand-file-name "~/org/journal"))
(setq org-agenda-file-regexp "\\`[^.].*\\.org\\'\\|\\`[0-9]+\\'")


(require 'org-ref)

(setq reftex-default-bibliography '("~/src/bibliography/references.bib"))

;; see org-ref for use of these variables
(setq org-ref-bibliography-notes "~/src/bibliography/notes.org"
      org-ref-default-bibliography '("~/src/bibliography/references.bib")
      org-ref-pdf-directory "~/src/bibliography/bibtex-pdfs/")
(global-set-key (kbd "C-c ]") 'org-ref-ivy-cite)

(setq org-latex-pdf-process (list "/Library/TeX/texbin/latexmk -shell-escape -bibtex -f -pdf %f"))

(require 'doi-utils)

(require 'org-ref-url-utils)

;; from https://zzamboni.org/post/beautifying-org-mode-in-emacs/

(setq org-hide-emphasis-markers t)

(font-lock-add-keywords 'org-mode
                        '(("^ *\\([-]\\) "
                           (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

(use-package org-bullets
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

;; (let* ((variable-tuple
;;         (cond ((x-list-fonts "Source Sans Pro") '(:font "Source Sans Pro"))
;;               ((x-list-fonts "Lucida Grande")   '(:font "Lucida Grande"))
;;               ((x-list-fonts "Verdana")         '(:font "Verdana"))
;;               ((x-family-fonts "Sans Serif")    '(:family "Sans Serif"))
;;               (nil (warn "Cannot find a Sans Serif Font.  Install Source Sans Pro."))))
;;        (base-font-color     (face-foreground 'default nil 'default))
;;        (headline           `(:inherit default :weight bold :foreground ,base-font-color)))

;;   (custom-theme-set-faces
;;    'user
;;    `(org-level-8 ((t (,@headline ,@variable-tuple))))
;;    `(org-level-7 ((t (,@headline ,@variable-tuple))))
;;    `(org-level-6 ((t (,@headline ,@variable-tuple))))
;;    `(org-level-5 ((t (,@headline ,@variable-tuple))))
;;    `(org-level-4 ((t (,@headline ,@variable-tuple :height 1.1))))
;;    `(org-level-3 ((t (,@headline ,@variable-tuple :height 1.25))))
;;    `(org-level-2 ((t (,@headline ,@variable-tuple :height 1.5))))
;;    `(org-level-1 ((t (,@headline ,@variable-tuple :height 1.75))))
;;    `(org-document-title ((t (,@headline ,@variable-tuple :height 2.0 :underline nil :foreground ,base-font-color))))))

(custom-theme-set-faces
 'user
 '(variable-pitch ((t (:family "Source Serif Pro" :height 150 :weight light))))
 '(fixed-pitch ((t ( :family "Source Code Pro" :slant normal :weight normal :height 1.0 :width normal)))))

;;(add-hook 'org-mode-hook 'variable-pitch-mode)
(add-hook 'org-mode-hook
            '(lambda ()
               (variable-pitch-mode 1)
               (mapc
                (lambda (face) ;; Rescale and inherit the properties from the fixed-pitch font.
                  (set-face-attribute face nil :inherit 'fixed-pitch))
                (list 'org-code 'org-link 'org-block 'org-table 'org-property-value 'org-formula
                      'org-tag 'org-verbatim 'org-date 'company-tooltip
                      'org-special-keyword 'org-block-begin-line
                      'org-block-end-line 'org-meta-line
                      'org-document-info-keyword))))

(add-hook 'org-mode-hook 'visual-line-mode)

;; (custom-theme-set-faces
;;  'user
;;  '(org-block                 ((t (:inherit fixed-pitch))))
;;  '(org-document-info         ((t (:foreground "dark orange"))))
;;  '(org-document-info-keyword ((t (:inherit (shadow fixed-pitch)))))
;;  '(org-link                  ((t (:foreground "royal blue" :underline t))))
;;  '(org-meta-line             ((t (:inherit (font-lock-comment-face fixed-pitch)))))
;;  '(org-property-value        ((t (:inherit fixed-pitch))) t)
;;  '(org-special-keyword       ((t (:inherit (font-lock-comment-face fixed-pitch)))))
;;  '(org-tag                   ((t (:inherit (shadow fixed-pitch) :weight bold :height 0.8))))
;;  '(org-verbatim              ((t (:inherit (shadow fixed-pitch))))))

(add-hook 'after-init-hook
    (lambda ()
     (require 'org-indent)       ; for org-indent face
     (set-face-attribute 'org-indent nil
         :inherit '(org-hide fixed-pitch))))

(load-file "~/src/spotlight.el/spotlight.el")
