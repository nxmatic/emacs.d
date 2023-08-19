(require 'xdg)

(unless (xdg-runtime-dir)
  (setenv "XDG_RUNTIMR_DIR"
	  (expand-file-name ".xdg" HOME)))

(provide 'init-xdg)

