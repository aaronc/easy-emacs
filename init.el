(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(when (not package-archive-contents)
    (package-refresh-contents))

;; Add in your own as you wish:
(defvar my-packages '(ergoemacs-mode
		      smex
		      ido-ubiquitous
		      idle-highlight-mode
		      auto-complete
		      cider
		      paredit
		      smartparens
		      rainbow-delimiters
		      solarized-theme)
     "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
      (when (not (package-installed-p p))
	        (package-install p)))


(require 'ergoemacs-mode)

(setq ergoemacs-theme nil)
(setq ergoemacs-keyboard-layout "us")
(ergoemacs-mode 1)

(require 'smex)
;(smex-initialize)
;(global-set-key (kbd "M-x") 'smex)
;(global-set-key (kbd "M-a") 'smex)

(defun smex-if-exists (&optional prefix-arg)
    (interactive "p")
      (if (fboundp 'smex)
	      (smex)
	          (execute-extended-command prefix-arg)))

(define-key ergoemacs-keymap "\M-a" 'smex-if-exists)
(define-key ergoemacs-keymap "\M-x" 'smex-if-exists)


;(ido-mode t)
;(ido-ubiquitous-mode)
(show-paren-mode 1)

;(load-theme 'solarized-light)

(when (display-graphic-p)
  (when (eq system-type 'windows-nt) 
    (set-face-attribute 'default nil :font "Consolas-14")))

(require 'rainbow-delimiters)
(add-hook 'clojure-mode-hook 'smartparens-mode)
(add-hook 'inferior-lisp-mode-hook 'smartparens-mode)
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)
(add-hook 'clojure-mode-hook 'auto-complete-mode)
(add-hook 'inferior-lisp-mode-hook 'auto-complete-mode)

(setq inferior-lisp-program "repl")
(setq clojure-inf-lisp-command "repl")


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ido-ubiquitous-mode t)
 '(org-CUA-compatible nil)
 '(shift-select-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
