(unless window-system
  (menu-bar-mode -1)
  (load-theme 'solarized-dark t)
  (custom-set-faces '(default ((t (:background "nil"))))))

(when window-system
  (set-face-attribute 'default nil
                    :family "Source Code Pro"
                    :height 150
                    :weight 'light
                    :width 'normal)
  (load-theme 'hc-zenburn t)
  (add-to-list 'default-frame-alist '(height . 50))
  (add-to-list 'default-frame-alist '(width . 82))
  (set-frame-position (selected-frame) 0 0)
  (set-frame-size (selected-frame) 82 50)
  (tooltip-mode -1)
  (tool-bar-mode -1)
  (menu-bar-mode -1)
  (toggle-scroll-bar -1)
  (setq frame-title-format '(buffer-file-name "%f" ("%b")))
  (blink-cursor-mode -1)
  (when (require 'mwheel nil 'no-error) (mouse-wheel-mode t)))

(defun my/disable-scroll-bars (frame)
  (modify-frame-parameters frame
                           '((vertical-scroll-bars . nil)
                             (horizontal-scroll-bars . nil))))
(add-hook 'after-make-frame-functions 'my/disable-scroll-bars)

(setq browse-url-browser-function 'browse-url-default-windows-browser)

;; make the tilting scroll wheel cycle through buffers

(defvar *my-previous-buffer* t
  "can we switch?")

(defun my-previous-buffer ()
  (interactive)
  (message "custom prev: *my-previous-buffer*=%s" *my-previous-buffer*)
  (when *my-previous-buffer*
    (previous-buffer)
    (setq *my-previous-buffer* nil)
    (run-at-time "0.3 sec" nil (lambda ()
                               (setq *my-previous-buffer* t)))))

(defvar *my-next-buffer* t
  "can we switch?")

(defun my-next-buffer ()
  (interactive)
  (message "custom prev: *my-next-buffer*=%s" *my-next-buffer*)
  (when *my-next-buffer*
    (next-buffer)
    (setq *my-next-buffer* nil)
    (run-at-time "0.3 sec" nil (lambda ()
                               (setq *my-next-buffer* t)))))

(global-set-key [wheel-right] 'my-next-buffer)
(global-set-key [wheel-left] 'my-previous-buffer)

;; make PC keyboard's Win key or other to type Super or Hyper, for emacs running on Windows.
(setq w32-pass-lwindow-to-system nil)
(setq w32-lwindow-modifier 'super) ; Left Windows key

(setq w32-pass-rwindow-to-system nil)
(setq w32-rwindow-modifier 'super) ; Right Windows key

(setq w32-pass-apps-to-system nil)
(setq w32-apps-modifier 'hyper) ; Menu/App key


