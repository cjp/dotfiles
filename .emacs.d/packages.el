;; https://stackoverflow.com/questions/10092322/how-to-automatically-install-emacs-packages-by-specifying-a-list-of-package-name

(setq package-archives
      '(("gnu"         . "http://elpa.gnu.org/packages/")
        ("melpa"       . "http://melpa.org/packages/")
        ("marmalade"   . "http://marmalade-repo.org/packages/"))
      package-archive-priorities
      '(("melpa" . 20)
        ("marmalade" . 15)
        ("gnu" . 10))
      package-user-dir "~/.emacs.d/elpa")

(defun ensure-package-installed (&rest packages)
  "Assure every package is installed, ask for installation if it’s not.

Return a list of installed packages or nil for every skipped package."
  (mapcar
   (lambda (package)
     ;; (package-installed-p 'evil)
     (if (package-installed-p package)
         nil
       (if (y-or-n-p (format "Package %s is missing. Install it? " package))
           (package-install package)
         package)))
   packages))

;; make sure to have downloaded archive description.
;; Or use package-archive-contents as suggested by Nicolas Dudebout
(or (file-exists-p package-user-dir)
    (package-refresh-contents))

(ensure-package-installed 'solarized-theme
        'hc-zenburn-theme
        'magit
        'groovy-mode
        'markdown-mode
        'json-mode
        'go-mode
        'auto-complete
        'evil
        'ledger-mode)

;; activate installed packages
(package-initialize)

;; activate go-autocomplete
(when (file-exists-p "~/go/src/github.com/nsf/gocode/emacs/")
  (add-to-list 'load-path "~/go/src/github.com/nsf/gocode/emacs/")
  (require 'go-autocomplete)
  (require 'auto-complete-config)
  (ac-config-default))
