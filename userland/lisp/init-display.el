(require 'init-straight)

;; select theme
;;; modus-operandi (best ever but no iterm2 theme)
(straight-use-package 'modus-operandi-theme)
(require 'modus-operandi-theme)
(load-theme 'modus-operandi t)

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
