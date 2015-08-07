;;; kp-packages -- package installation

;;; Code:

(require 'package)

(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("marmalade" . "https://marmalade-repo.org/packages/") t)

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar myPackages
  '(ac-js2
    better-defaults
    dockerfile-mode
    ein
    elpy
    exec-path-from-shell
    flycheck
    flycheck-color-mode-line
    go-mode
    company-go
    jekyll-modes
    js2-mode
    magit
    markdown-mode
    material-theme
    multiple-cursors
    neotree
    pbcopy
    puppet-mode
    py-autopep8
    rainbow-delimiters
    rubocop
    sass-mode
    sql-indent
    web-mode
    yaml-mode))


(mapc #'(lambda (package)
	  (unless (package-installed-p package)
	    (package-install package)))
      myPackages)

(provide 'kp-packages)

;;; kp-packages.el ends here
