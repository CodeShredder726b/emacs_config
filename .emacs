(setq use-package-always-ensure t)
(require 'package)
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(package-initialize)

;; path variables
(setq gnu-global-bin "D:/Applications/GNUGlobal/bin")
(setq grep-bin "D:/Applications/ernie")
(setenv "PATH"
    (concat gnu-global-bin ";" grep-bin ";")
)
(add-to-list 'exec-path gnu-global-bin)
(add-to-list 'exec-path grep-bin)  

;; general appearance customization
(tool-bar-mode -1)
(display-time-mode 1)
(setq truncate-lines t)
(load-theme 'ample-flat t t)
(enable-theme 'ample-flat)
(global-display-line-numbers-mode)

(require 'smart-mode-line)
(setq sml/no-confirm-load-theme t)
(setq sml/theme 'atom-one-dark)
(sml/setup)

;; sr-speedbar
(require 'sr-speedbar)
(setq speedbar-show-unknown-files t)
(setq speedbar-use-images nil)
(setq sr-speedbar-right-side nil)
(setq sr-speedbar-width 30)
(sr-speedbar-open)

;; user
(setq user-full-name "Raphael Kummer"
      user-mail-address "codeshredder726b@gmail.com")

;; handling settings and keys
(fset 'yes-or-no-p 'y-or-no-p)

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

;; c/c++

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" default)))
 '(package-selected-packages
   (quote
    (helm-gtags helm-sql-connect helm ggtags magit evil-escape smart-mode-line-atom-one-dark-theme sr-speedbar smart-mode-line org-link-minor-mode org-evil miniedit guide-key ample-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
