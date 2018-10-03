;;; init.el --- Where all the magic begins


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(defun load-user-file (file)
  (interactive "f")
  "Load a file in current user's configuration directory"
  (load-file (expand-file-name file user-init-dir)))

(defconst user-init-dir
  (cond ((boundp 'user-emacs-directory)
         user-emacs-directory)
        ((boundp 'user-init-directory)
         user-init-directory)
        (t "~/.emacs.d/")))

(load-user-file "packages.el")

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

;; load other files `after-init-hook' so all packages are loaded
(add-hook 'after-init-hook
 `(lambda ()
    (load-user-file "bindings.el")
    (load-user-file "misc.el")
    (load-user-file "window.el")
    (load-user-file "spell.el")
    ;;(load-user-file "ledger.el")
    (when (file-exists-p custom-file)
      (load custom-file :noerror :nomessage))))
