(require 'init-straight)

;; select theme
(straight-use-package 'spacemacs-theme)
(require 'spacemacs-light-theme)
(load-theme 'spacemacs-light t)

;; UTF-8 support
(prefer-coding-system       'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))

(provide 'init-display)
