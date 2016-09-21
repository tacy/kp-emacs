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

(setq default-directory "~/workspace/" )

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

(set-clipboard-coding-system 'utf-8)
(require 'multiple-cursors)
(require 'simpleclip)
(require 'php-mode)
(simpleclip-mode 1)

;; (add-hook 'after-init-hook 'global-company-mode)
;; (add-to-list 'company-backends 'company-yasnippet)

(require 'pbcopy)
(turn-on-pbcopy)

(setq elpy-rpc-backend "jedi")  ;; set elpy rpc backend to jedi
(setq flycheck-highlighting-mode 'lines)  ;; flycheck very slow set to symbols

;; ToggleWindows C-x |
(defun toggle-window-split ()
  (interactive)
  (if (= (count-windows) 2)
      (let* ((this-win-buffer (window-buffer))
         (next-win-buffer (window-buffer (next-window)))
         (this-win-edges (window-edges (selected-window)))
         (next-win-edges (window-edges (next-window)))
         (this-win-2nd (not (and (<= (car this-win-edges)
                     (car next-win-edges))
                     (<= (cadr this-win-edges)
                     (cadr next-win-edges)))))
         (splitter
          (if (= (car this-win-edges)
             (car (window-edges (next-window))))
          'split-window-horizontally
        'split-window-vertically)))
    (delete-other-windows)
    (let ((first-win (selected-window)))
      (funcall splitter)
      (if this-win-2nd (other-window 1))
      (set-window-buffer (selected-window) this-win-buffer)
      (set-window-buffer (next-window) next-win-buffer)
      (select-window first-win)
      (if this-win-2nd (other-window 1))))))

(global-set-key (kbd "C-x |") 'toggle-window-split)
