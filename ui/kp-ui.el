;;; kp-ui --- ui configuration

;;; Code:

(setq inhibit-startup-message t)

(load-theme `material t)

(global-linum-mode t)
(setq linum-format "%4d \u2502 ")

(set-default-font "Inconsolata 16")

(require 'neotree)

;; expand the name column on ibuffer windows
(setq ibuffer-formats
      '((mark modified read-only " "
              (name 50 50 :left :elide) " "
              (size 9 -1 :right) " "
              (mode 16 16 :left :elide) " " filename-and-process)
        (mark " " (name 16 -1) " " filename)))

(provide 'kp-ui)

;;; kp-ui.el ends here
