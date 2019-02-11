(setq use-package-always-ensure t)
(require 'package)
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(package-initialize)

;; path variables
(setq gnu-global-bin "C:/Users/tckummer/Documents/Apps/GNUGlobal/bin")
(setq grep-bin "C:/Users/tckummer/Documents/Apps/ernie")
(setenv "PATH"
    (concat gnu-global-bin ";" grep-bin ";")
)
(add-to-list 'exec-path gnu-global-bin)
(add-to-list 'exec-path grep-bin)  
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" default)))
 '(org-agenda-files (list org-directory))
 '(org-directory "C:/Users/tckummer/Documents/Projects")
 '(package-selected-packages
   (quote
    (golden-ratio company clean-aindent-mode helm-fuzzy-find fuzzy dashboard page-break-lines helm-projectile projectile helm-gtags helm-sql-connect helm ggtags magit evil-escape smart-mode-line-atom-one-dark-theme sr-speedbar smart-mode-line org-link-minor-mode org-evil miniedit guide-key ample-theme))))
 
;; general appearance customization
(tool-bar-mode -1)   ;; [HKEY_CURRENT_USER\Software\GNU\Emacs]    = "Emacs.Toolbar"="-1"
(display-time-mode 1)
(setq truncate-lines t)
(load-theme 'ample-flat t t)
(enable-theme 'ample-flat)
(global-display-line-numbers-mode)

(require 'smart-mode-line)
(setq sml/no-confirm-load-theme t)
(setq sml/theme 'atom-one-dark)
(sml/setup)

(setq w32-pass-lwindow-to-system nil)
(setq w32-lwindow-modifier 'super) ; Left Windows key

;; golden ratio automatic window resizing
(require 'golden-ratio)
(add-to-list 'golden-ratio-exclude-modes "ediff-mode")
(add-to-list 'golden-ratio-exclude-modes "helm-mode")
(add-to-list 'golden-ratio-exclude-modes "dired-mode")
(add-to-list 'golden-ratio-exclude-modes "magit-log-mode")
(add-to-list 'golden-ratio-exclude-modes "magit-reflog-mode")
(add-to-list 'golden-ratio-exclude-modes "magit-status-mode")
(add-to-list 'golden-ratio-inhibit-functions 'pl/helm-alive-p)

(defun pl/helm-alive-p ()
  (if (boundp 'helm-alive-p)
      (symbol-value 'helm-alive-p)))
(setq golden-ratio-exclude-buffer-names '(" *SPEEDBAR*"))
;;(setq golden-ratio-exclude-modes '("ediff-mode"
;;                                   "gud-mode"
;;                                   "gdb-locals-mode"
;;                                   "gdb-registers-mode"
;;                                   "gdb-breakpoints-mode"
;;                                   "gdb-threads-mode"
;;                                   "gdb-frames-mode"
;;                                   "gdb-inferior-io-mode"
;;                                   "gud-mode"
;;                                   "gdb-inferior-io-mode"
;;                                   "gdb-disassembly-mode"
;;                                   "gdb-memory-mode"
;;                                   "magit-log-mode"
;;                                   "magit-reflog-mode"
;;                                   "magit-status-mode"
;;                                   "IELM"
;;                                   "eshell-mode" 
;;								   "dired-mode"))
(golden-ratio-mode 1)

;; clean empty indents 
(require 'clean-aindent-mode)
(add-hook 'prog-mode-hook 'clean-aindent-mode)

;; text completion
(add-hook 'after-init-hook 'global-company-mode)

;; dashboard
(require 'dashboard)
(dashboard-setup-startup-hook)
(setq initial-buffer-choice (lambda () (get-buffer "*dashboard*")))
(setq dashboard-banner-logo-title "Welcome to HSLU")
(setq dashboard-startup-banner "C:/Users/tckummer/Documents/Apps/emacs/emacs_config/hslu_logo.png")
  
(setq dashboard-items '((recents  . 5)
					(projects . 5)
					(agenda . 5)))
(add-to-list 'dashboard-items '(agenda) t)
(setq show-week-agenda-p t)


;; sr-speedbar
(require 'sr-speedbar)
(sr-speedbar-close)
(setq speedbar-show-unknown-files t)
(setq speedbar-use-images nil)
(setq sr-speedbar-right-side nil)
(setq sr-speedbar-max-width 40)
;;(sr-speedbar-open)   ;; do not activate per default, messes up golden ratio

;; user
(setq user-full-name "Raphael Kummer"
      user-mail-address "codeshredder726b@gmail.com")

;; handling settings and keys
(defalias 'yes-or-no-p 'y-or-n-p)

(require 'guide-key)
(setq guide-key/guide-key-sequence '("C-x" "C-c"))
(setq guide-key/highlight-command-regexp
    '("rectangle"
      ("register". font-lock-type-face)
      ("bookmark" . "hot pink")))
(guide-key-mode 1)  ; Enable guide-key-mode

;; packages to consider
;; - miniedit
;;

;; evil mode
(require 'evil)
(evil-mode 1)
(evil-escape-mode 1)
(setq-default evil-escape-key-sequence "jj")
(setq-default evil-escape-delay 0.2)
(setq evil-move-cursor-back nil)

;; org-mode
(require 'org)
(setq calendar-week-start-day 1)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

;; magit
(setq-default git-magit-status-fullscreen t)
(setq-default git-enable-magit-svn-plugin t)
(setq magit-repository-directories '("D:/"))
(global-git-commit-mode t)

;; ggtags
(setq ggtags-program-path '("global.exe"))
(require 'ggtags)
(define-key ggtags-mode-map (kbd "C-c g s") 'ggtags-find-other-symbol)
(define-key ggtags-mode-map (kbd "C-c g h") 'ggtags-view-tag-history)
(define-key ggtags-mode-map (kbd "C-c g r") 'ggtags-find-reference)
(define-key ggtags-mode-map (kbd "C-c g f") 'ggtags-find-file)
(define-key ggtags-mode-map (kbd "C-c g c") 'ggtags-create-tags)
(define-key ggtags-mode-map (kbd "C-c g u") 'ggtags-update-tags)

(define-key ggtags-mode-map (kbd "M-,") 'pop-tag-mark) 

;; ernie as grep
(setq grep-command "grep.bat -H -r -n -i -e ")
(setq grep-find-command "grep.bat -H -r -n -i -e ")
(setq grep-use-null-device nil)

;; helm
(require 'helm)
(require 'helm-config)

(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-unset-key (kbd "C-x c"))

(setq helm-M-x-fuzzy-match t) ;; optional fuzzy matching for helm-M-x

(when (executable-find "curl")
  (setq helm-google-suggest-use-curl-p t))

(setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
      helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t
      helm-echo-input-in-header-line t)

;;(defun spacemacs//helm-hide-minibuffer-maybe ()
;;  "Hide minibuffer in Helm session if we use the header line as input field."
;;  (when (with-helm-buffer helm-echo-input-in-header-line)
;;    (let ((ov (make-overlay (point-min) (point-max) nil nil t)))
;;      (overlay-put ov 'window (selected-window))
;;      (overlay-put ov 'face
;;                   (let ((bg-color (face-background 'default nil)))
;;                     `(:background ,bg-color :foreground ,bg-color)))
;;      (setq-local cursor-type nil))))


;;(add-hook 'helm-minibuffer-set-up-hook
;;          'spacemacs//helm-hide-minibuffer-maybe)

(setq helm-autoresize-max-height 0)
(setq helm-autoresize-min-height 20)
(helm-autoresize-mode 1)

;; disable golden ratio interference
(defun pl/helm-alive-p ()
  (if (boundp 'helm-alive-p)
      (symbol-value 'helm-alive-p)))
(add-to-list 'golden-ratio-inhibit-functions 'pl/helm-alive-p)

;; custom config
(projectile-global-mode 1)
(setq projectile-indexing-method 'native)
;;(setq projectile-enable-caching t)
;;(setq projectile-require-project-root nil)
(setq projectile-project-search-path '("C:/Users/tckummer/Documents/Development"))
(define-key projectile-mode-map (kbd "s-o") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(setq projectile-completion-system 'default)
(setq helm-semantic-fuzzy-match t
	  helm-imenu-fuzzy-match    t
	  helm-apropos-fuzzy-match  t)
(helm-mode 1)
(setq helm-projectile-on t)

;; c/c++

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
