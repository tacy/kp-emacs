;;; kp-ui --- ui configuration

;;; Code:
(setq inhibit-splash-screen t
      inhibit-startup-message t
      initial-scratch-message nil)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(load-theme `material t)

(global-linum-mode t)
(setq linum-format "%4d \u2502 ")
(column-number-mode 1)

(if (eq system-type 'darwin)
    (progn
           (add-to-list 'default-frame-alist '(font . "Inconsolata 11")))
     (progn
           (add-to-list 'default-frame-alist '(font . "Monospace 12"))))

(require 'neotree)

(provide 'kp-ui)

;;; kp-ui.el ends here
