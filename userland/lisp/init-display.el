(require 'init-straight)

;; select theme
;;; modus-operandi (best ever but no iterm2 theme)

(progn
  (straight-use-package 'modus-themes)
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
  (use-package modus-themes
    :ensure
    :init
    ;; Add all your customizations prior to loading the themes
    (setq modus-themes-italic-constructs t
	  modus-themes-bold-constructs nil
	  modus-themes-region '(bg-only no-extend))
    :config
    ;; Load the theme of your choice:
    ;; (load-theme 'modus-vivendi :no-confirm t)
    (load-theme 'modus-operandi-deuteranopia t))
  (modus-themes-alt-mode))

;; color theme (apropriate lignt theme)
(straight-use-package 'tango-plus-theme)

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


;; smart mode line
(straight-use-package 'smart-mode-line)

;; clipboard (should go in a macos specific module)

(straight-use-package 'simpleclip)
(require 'simpleclip)
(simpleclip-mode 1)

(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))

;; load system display init

(require (intern
	  (concat
	   "init-display-"
	   (symbol-name system-type))))

(provide 'init-display)
