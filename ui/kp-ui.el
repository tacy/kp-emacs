;;; kp-ui --- ui configuration

;;; Code:

(setq inhibit-startup-message t)

(load-theme `material t)

(global-linum-mode t)
(setq linum-format "%4d \u2502 ")

(if (eq system-type 'darwin)
    (progn
           (add-to-list 'default-frame-alist '(font . "Inconsolata 11")))
     (progn
           (add-to-list 'default-frame-alist '(font . "Monospace 12"))))

(require 'neotree)

(provide 'kp-ui)

;;; kp-ui.el ends here
