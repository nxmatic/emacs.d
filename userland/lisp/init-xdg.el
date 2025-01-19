(require 'xdg)

(unless (xdg-runtime-dir)
  (setenv "XDG_RUNTIMR_DIR"
	  (expand-file-name ".xdg" "~")))

(setenv "XDG_BIN_HOME" (expand-file-name ".local/bin" "~"))
(setenv "XDG_CACHE_HOME" (expand-file-name ".cache" "~"))
(setenv "XDG_CONFIG_HOME" (expand-file-name ".config" "~"))
(setenv "XDG_DATA_HOME" (expand-file-name ".local/share" "~"))
(setenv "XDG_STATE_HOME" (expand-file-name ".local/state" "~"))

(provide 'init-xdg)

