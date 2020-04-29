(require 'init-straight)

(require 'init-org)

;; required reps from org-gtd
;; (straight-use-package 'cl-lib)
;; (straight-use-package 'f)
;; (straight-use-package 'org)

(straight-use-package '(org-gtd :type git :host github :repo "trevoke/org-gtd.el" :branch "master"))

(defun init-org-gtd (directory)
  (require 'org-gtd)
  (setq-local org-gtd-directory directory) ;; where org-gtd will put its files
  ;; the above happens to also be the default location, if left uncustomized.

  ;; assuming you don't have another setup, use this line as written
  ;; otherwise, push the org-gtd-directory to your existing agenda files
  (require 'org-agenda)
  (setq-local org-agenda-files `(,org-gtd-directory))

  ;; assuming you don't have existing capture templates
  ;; otherwise, push these to your existing capture templates
  ;; and of course, you can adjust the keys "i" and "l"
  (require 'org-capture)
  (require 'org-cliplink)
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
		 :kill-buffer t)))
  t)

(eval-after-load 'org-gtd
  '(progn

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
     t))

(provide 'init-org-gtd)
