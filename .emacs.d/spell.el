;; (eval-after-load "ispell"
;;   '(when (executable-find ispell-program-name)
;;      (add-hook 'text-mode-hook 'turn-on-flyspell)))
(setq ispell-program-name "aspell")
(setq ispell-personal-dictionary "~/.ispell")
(require 'ispell)
