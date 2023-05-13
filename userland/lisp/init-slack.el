(require 'init-straight)

(straight-use-package 'alert)
(straight-use-package 'circe)
(straight-use-package 'emoji-display)
(straight-use-package 'oauth2)
(straight-use-package 'request)
(straight-use-package 'websocket)
(straight-use-package 'slack)

(use-package slack
  :commands (slack-start)
  :init
  (setq slack-buffer-emojify t) ;; if you want to enable emoji, default nil
  (setq slack-prefer-current-team t)
  :config
  (slack-register-team
   :name "nuxeo"
   :token "xoxs-2374523005-3061926134-1545278131718-02458802d92d1ad81a08d9b03f036e581e7c1576dcd68f9672d4cee1e9a3a838"
   :subscribed-channels '((team-nos-priv team-nos-ui-priv nxmatic)))

;;; Big QOL changes.
  (setq slack-completing-read-function
	#'ido-completing-read)
  (setq slack-buffer-function #'switch-to-buffer)
  (setq slack-prefer-current-team t)
  (setq slack-display-team-name t)

;;; Emoji ...
  (add-hook 'slack-mode-hook #'emojify-mode)
;;; In order to keep track of new messages in the mode-line, slack.el uses
;;; a package called tracking, which is the same one circe uses for IRC
;;; chats. The command tracking-next-buffer is a fantastic way to cycle
;;; through your pending messages, bind it to something short.
  (with-eval-after-load 'tracking
    (define-key tracking-mode-map [f11]
      #'tracking-next-buffer))
;;; I’ll never know who thought user statuses were a good idea for
;;; Slack. But, thanks to a tip by _asummers on HackerNews, I can live in
;;; a world where they don’t exist.
(defun slack-user-status (_id _team) "")

;;; Ensure the buffer exists when a message arrives on a
;;; channel that wasn't open.
  (setq slack-buffer-create-on-notify t)
;;; Go to any channel with `C-x j'.
  (define-key ctl-x-map "j" #'slack-select-rooms)
;;; Quick 'n dirty way of opening the most recent link
;;; in the current chat room.
  (define-key slack-mode-map (kbd "M-o")
    (kbd "<backtab> RET M->"))
;;; I thumbs-up a lot. Don't judge me.
  (define-key slack-mode-map (kbd "C-;") ":+1:")
;;; Bring up the mentions menu with `@', and insert a
;;; space afterwards.
  (define-key slack-mode-map "@"
    (defun endless/slack-message-embed-mention ()
      (interactive)
      (call-interactively #'slack-message-embed-mention)
      (insert " ")))

;;; Pretty straightforward.
  (define-key slack-mode-map (kbd "C-c C-d")
    #'slack-message-delete)
  (define-key slack-mode-map (kbd "C-c C-e")
    #'slack-message-edit)
  (define-key slack-mode-map (kbd "C-c C-k")
    #'slack-channel-leave))

(use-package alert
  :commands (alert)
  :init
  (setq alert-default-style 'notifier))

(provide 'init-slack)
