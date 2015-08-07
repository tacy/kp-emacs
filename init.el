;;; init --- configuration initialization
;;; Commentary:

;; Thanks to Kevin Beam and Matt Savoie for starting me
;; on my emacs journey. Without there encouragment,
;; hand-me-down configurations and help along the way
;; I would not be a part of the wonderful emacs community!
;;
;; Kevin Beam:  https://github.com/kwbeam/kwb-emacs
;; Matt Savoie: https://github.com/flamingbear/emacs-config
;;
;; This configuration has grown from the two above.

;;; Code:

(let ((default-directory "~/.emacs.d/"))
  (normal-top-level-add-subdirs-to-load-path))

(setq default-directory "/bitly" )

(require 'kp-packages)
(require 'kp-ui)
(require 'kp-kbd)
(require 'kp-dev)

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(setq magit-last-seen-setup-instructions "1.4.0")

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(require 'multiple-cursors)

(require 'pbcopy)
(turn-on-pbcopy)

;;; init.el ends here
