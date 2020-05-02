(require 'init-straight)

(require 'init-org)

;; required reps from org-gtd
;; (straight-use-package 'cl-lib)
;; (straight-use-package 'f)
;; (straight-use-package 'org)

(straight-use-package '(org-gtd :type git :host github :repo "trevoke/org-gtd.el" :branch "master"))

(defun init-org-gtd (directory)
  (require 'org-gtd)
  (with-eval-after-load 'org-gtd
    (setq-local org-gtd-directory directory)) ;; where org-gtd will put its files
  (require 'org-agenda)
  (with-eval-after-load 'org-agenda
    (setq-local org-agenda-files `(,org-gtd-directory)))
  (require 'org-cliplink)
  (require 'org-macs) ;; needed for templating ...
  (require 'org-capture)
  (with-eval-after-load 'org-cliplink
    (with-eval-after-load 'org-macs
      (with-eval-after-load 'org-gtd
	(setq-local org-capture-templates
		    `(("i" "GTD item"
		       entry (file ,(org-gtd--path org-gtd-inbox-file-basename))
		       "* %?\n%U\n\n  %i"
		       :kill-buffer t)
		      ("e" "GTD item with link to where you are in emacs now"
		       entry (file ,(org-gtd--path org-gtd-inbox-file-basename))
		       "* %?\n%U\n\n  %i\n  %a"
		       :kill-buffer t)
		      ("c" "GTD item with link to what you have in clip-board"
		       entry (file ,(org-gtd--path org-gtd-inbox-file-basename))
		       "* %?\n%U\n\n %(org-cliplink-capture)\n  %a"
		       :kill-buffer t))))))
  t)

(with-eval-after-load  'org-gtd
  (progn
    ;; these are the interactive functions you're likely to want to use as you go about GTD.
    (global-set-key (kbd "C-c d c") 'org-gtd-capture) ;; add item to inbox
    (global-set-key (kbd "C-c d p") 'org-gtd-process-inbox) ;; process entire inbox
    (global-set-key (kbd "C-c d a") 'org-agenda-list) ;; see what's on your plate today
    (global-set-key (kbd "C-c d n") 'org-gtd-show-all-next) ;; see all NEXT items
    (global-set-key (kbd "C-c d s") 'org-gtd-show-stuck-projects) ;; see projects that don't have a N
     (global-set-key (kbd "C-c d l") 'org-cliplink) ;; capture link 
     
     (init-org-gtd "~/gtd")
     
     ;; package: https://www.nongnu.org/org-edna-el/
     ;; org-edna is used to make sure that when a project task gets DONE,
     ;; the next TODO is automatically changed to NEXT.
     (setq org-edna-use-inheritance t)
     (org-edna-load)

     ;; package: https://github.com/Malabarba/org-agenda-property
     ;; this is so you can see who an item was delegated to in the agenda
     (setq org-agenda-property-list '("DELEGATED_TO"))
     ;; I think this makes the agenda easier to read
     (setq org-agenda-property-position 'next-line)
     (add-hook 'org-capture-before-finalize-hook 'org-gtd-auto-tag)
     t))

(defun org-gtd-auto-tag ()
  (interactive)
  (let ((alltags (append org-tag-persistent-alist org-tag-alist))
        (headline-words (split-string (org-get-heading t t))))
    (mapcar (lambda (word) (if (assoc word alltags)
                             (org-toggle-tag word 'on)))
            headline-words)))

(provide 'init-org-gtd)

