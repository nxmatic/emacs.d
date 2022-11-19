(require 'init-straight)

;; select theme
;;; modus-operandi (best ever but no iterm2 theme)

(use-package modus-themes
  :ensure
  :init
  ;; Add all your customizations prior to loading the themes
  (setq modus-themes-italic-constructs t
	modus-themes-bold-constructs nil
	modus-themes-region '(bg-only no-extend))

  ;; Load the theme files before enabling a theme
  (modus-themes-load-themes)
  :config
  ;; Load the theme of your choice:
  ;; (modus-themes-load-operandi) ;; OR (modus-themes-load-vivendi)
  (modus-themes-load-vivendi)
  :bind ("<f5>" . modus-themes-toggle))

(define-minor-mode modus-themes-alt-mode
  "Override Modus themes' palette variables with custom values.

     This is intended as a proof-of-concept.  It is, nonetheless, a
     perfectly accessible alternative, conforming with the design
     principles of the Modus themes.  It still is not as good as the
     default colors."
  :init-value nil
  :global t
  (if modus-themes-alt-mode
      (setq modus-operandi-theme-override-colors-alist
            '(("bg-main" . "#f1f1f0")))))

(modus-themes-alt-mode)	    

(require 'display-theme)

;; (straight-use-package 'base16-theme)
;; (require 'base16-theme)
;; (load-theme 'base16-harmonic-light)
;; 
;; (straight-use-package 'gruvbox-theme)
;; (require 'gruvbox-theme)
;; (load-theme 'gruvbox-light-medium t)

;; theme magic for sharing with iterm2 ...
;;(straight-use-package 'theme-magic)

;; UTF-8 support
(prefer-coding-system       'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)


(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))

(provide 'init-display)
