;; https://stackoverflow.com/questions/10092322/how-to-automatically-install-emacs-packages-by-specifying-a-list-of-package-name

(setq package-archives
      '(("gnu"         . "http://elpa.gnu.org/packages/")
        ("melpa"       . "http://melpa.org/packages/"))
      package-archive-priorities
      '(("melpa" . 20)
        ("gnu" . 10))
      package-user-dir "~/.emacs.d/elpa")

(setq package-list '(sunburn-theme magit groovy-mode markdown-mode
                     json-mode go-mode auto-complete evil ledger-mode))

;; activate installed packages
(package-initialize)

; fetch package list
(unless package-archive-contents
  (package-refresh-contents))

; install missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

;; activate go-autocomplete
(when (file-exists-p "~/go/src/github.com/nsf/gocode/emacs/")
  (add-to-list 'load-path "~/go/src/github.com/nsf/gocode/emacs/")
  (require 'go-autocomplete)
  (require 'auto-complete-config)
  (ac-config-default))
