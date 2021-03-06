;; -*- mode: emacs-lisp; lexical-binding: t -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs

   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused

   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t

   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     ;; Look&feel
     (colors :variables
             colors-enable-nyan-cat-progress-bar nil)
     emoji
     themes-megapack

     ;; Tools
     csv
     docker
     ibuffer
     imenu-list
     ipython-notebook
     ;; do u really need two GH frontends are being provided in parallel?
     ;; `github' layer provides both `magithub' and `magit-gh-pulls' packages,
     ;; and they seem to clash w/ each other, as far as I'm concerned
     github
     lsp
     multiple-cursors
     nginx
     pass
     pdf
     prodigy
     restclient
     restructuredtext

     (semantic :variables
               semantic-idle-scheduler-queue '(semantic-fetch-tags))
     sphinx
     (treemacs :variables
               treemacs-follow-mode nil
               treemacs-lock-width t
               treemacs-use-filewatch-mode t)

     ;; Languages
     (haskell :variables
              haskell-process-type 'stack-ghci)
     html
     javascript
     lua
     (python :variables
             python-backend 'lsp)
     php
     sql
     yaml

     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
     ;; `M-m f e R' (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     helm
     (auto-completion :variables
                      auto-completion-return-key-behavior nil
                      auto-completion-tab-key-behavior nil
                      auto-completion-enable-snippets-in-popup t
                      auto-completion-complete-with-key-sequence nil
                      auto-completion-enable-sort-by-usage t
                      auto-completion-enable-help-tooltip 'manual)
     better-defaults
     emacs-lisp
     (git :variables
          git-commit-fill-column 72
          magit-save-repository-buffers 'dontask)
     markdown
     (org :variables
          org-enable-org-journal-support t
          org-journal-dir "~/org/journal/"
          org-journal-file-format "%Y-%m-%d.org"
          org-projectile-projects-directory (concat user-home-directory "org/projectile/")
          org-pomodoro-format "🍅 %s"
          org-agenda-files `(,(concat user-home-directory "org/")))
     (shell :variables
            shell-default-height '30
            shell-default-position 'bottom
            shell-default-shell 'vterm
            shell-default-term-shell "zsh"
            shell-enable-smart-eshell 't
            shell-protect-eshell-prompt 't)
     (spell-checking :variables
                     spell-checking-enable-by-default nil)
     syntax-checking
     version-control
     )

   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   ;; To use a local version of a package, use the `:location' property:
   ;; '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   dotspacemacs-additional-packages
   '(
     ;; geben ;; is being integrated into upstream's `php' layer
     ;; geben-helm-projectile-file
     minimap
     vue-mode
     )

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(evil-escape)

   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil then enable support for the portable dumper. You'll need
   ;; to compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper nil

   ;; File path pointing to emacs 27.1 executable compiled with support
   ;; for the portable dumper (this is currently the branch pdumper).
   ;; (default "emacs-27.0.50")
   dotspacemacs-emacs-pdumper-executable-file "emacs-27.0.50"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=~/.emacs.d/.cache/dumps/spacemacs.pdmp
   ;; (default spacemacs.pdmp)
   dotspacemacs-emacs-dumper-dump-file "spacemacs.pdmp"

   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default nil)
   dotspacemacs-verify-spacelpa-archives nil

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim

   ;; If non-nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official

   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (todos . 5)
                                (agenda . 5)
                                (projects . 7))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(rebecca
                         ;; purple-haze
                         ;; zenburn
                         ;; spacemacs-dark
                         ;; material
                         ;; soft-charcoal
                         leuven)

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(spacemacs :separator wave :separator-scale 1.1)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 15
                               :weight normal
                               :width normal)

   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"

   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"

   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"

   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","

   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"

   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab t

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Home"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1

   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache

   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5

   ;; If non-nil, the paste transient-state is enabled. While enabled, after you
   ;; paste something, pressing `C-j' and `C-k' several times cycles through the
   ;; elements in the `kill-ring'. (default nil)
   dotspacemacs-enable-paste-transient-state nil

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 80

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line.
   ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
   ;; the value to quoted `display-graphic-p'. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers
   '(:relative t
     :disabled-for-modes doc-view-mode
                         markdown-mode
                         org-mode
                         pdf-view-mode
                         text-mode
     :size-limit-kb 1000)

   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server nil

   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server t

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I :: %n%t :: %a"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'changed

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env)
  ;; for `prodigy' combined w/ `docker-compose' to run stuff as myself
  (setenv "UID" (number-to-string (user-uid)))
  (setenv "GID" (number-to-string (group-gid)))
  )

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."
  )

(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump."
  )

(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."

  ;; Temporary fixes
  (ido-mode -1)

  ;; Mode toggles
  (spacemacs/enable-transparency)
  (spacemacs/toggle-smartparens-globally-on)
  (spacemacs/toggle-mode-line-org-clock-on)
  (spacemacs/toggle-camel-case-motion-globally-on)
  (spaceline-toggle-minor-modes-off)
  (evil-goggles-mode 1)

  (setq-default
   word-wrap t
   truncate-lines t
   create-lockfiles nil

   ;; now, to PHP config.
   php-mode-coding-style 'psr2
   php-project-coding-style 'psr2

   sh-basic-offset 2
   )

  ;; Custom binds
  (evil-leader/set-key
    "`" #'treemacs-select-window
    "aDa" #'docker-container-shell
    "b C-r" #'rename-buffer
    "bl" #'buffer-menu-other-window
    "fet" #'dotspacemacs/test-dotfile

    ;; Treemacs hate zone
    "fT" nil
    "f C-t" nil

    "jQ" #'dumb-jump-go-other-window
    "jp" #'dumb-jump-go-prompt
    )

  ;; which-major-mode-should-I-use?
  (add-to-list 'auto-mode-alist '("\\.tpl\\'" . web-mode))
  ;; use smth more specific to templates than `php-mode', which doesn't suit
  ;; well for .blade templates, despite the .php extension
  (add-to-list 'auto-mode-alist '("\\.blade.php\\'" . web-mode))

  ;; Global (or close to global) userbinds
  (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char)
  ;; we're rebinding ~s~ to `magit-status' in the very next section
  ;; ~S~ seems to overlap w/ ~s~ - basically does the same thing
  (define-key evil-visual-state-map (kbd "S") 'evil-Surround-region)
  (global-set-key (kbd "<f8>") #'treemacs)
  ;; FIXME: `treemacs-projectile' tends to fail silently if called b4 `treemacs' in a session
  (global-set-key (kbd "<C-f8>") #'treemacs-projectile)

  ;; `magit' customization
  ;; kbds are defined outside of `with-eval-after-load' block since it's preferred to use
  ;; listed `magit' features right away, before those are even known to Emacs
  (define-key evil-normal-state-map (kbd "s") #'magit-status)
  (define-key evil-normal-state-map (kbd "S") #'magit-dispatch)
  (with-eval-after-load 'magit
    ;; load `magithub' ASAP, so one shouldn't trigger the load of it manually
    ;; FIXME: disabled for the time being
    ;; (require 'magithub)
    ;; Simplify navigation in `magit-log-mode'
    (evil-define-key 'normal magit-log-mode-map
      (kbd "k") #'magit-section-backward
      (kbd "j") #'magit-section-forward
      (kbd "K") (lambda () (interactive) (forward-line -10))
      (kbd "J") (lambda () (interactive) (forward-line 10))
      (kbd "C-k") #'evil-previous-line
      (kbd "C-j") #'evil-next-line)
    (transient-bind-q-to-quit))

  ;; Same applies to `Buffer-menu-mode'
  (define-key Buffer-menu-mode-map (kbd "K") (lambda () (interactive) (forward-line -10)))
  (define-key Buffer-menu-mode-map (kbd "J") (lambda () (interactive) (forward-line 10)))

  ;; Unbind n/N keys in `Buffer-menu-mode-map' to allow searching things
  (define-key Buffer-menu-mode-map (kbd "n") nil)
  (define-key Buffer-menu-mode-map (kbd "N") nil)

  ;; Launch external Python debugger when in `python-mode'
  (spacemacs/set-leader-keys-for-major-mode 'python-mode "d t" 'trepan2)
  (spacemacs/set-leader-keys-for-major-mode 'python-mode "d T" 'trepan3k)

  (with-eval-after-load 'emmet-mode
    (define-key emmet-mode-keymap (kbd "C-M-j") 'nil)
    (define-key emmet-mode-keymap (kbd "C-j") 'nil)
    )

  (with-eval-after-load 'yasnippet
    ; override `yas-next-field-or-maybe-expand' bind, since I don't
    ; really wanna nest snippets into each other that often :P
    (define-key yas-keymap (kbd "<tab>") 'yas-next-field)
    )

  ;; Custom hooks
  (add-hook 'csv-mode-hook (lambda () (csv-align-fields nil 1 (point-max))))
  (add-hook 'python-mode-hook 'spacemacs/toggle-fill-column-indicator-on)
  (add-hook 'python-mode-hook 'spacemacs/toggle-camel-case-motion-on)
  (add-hook 'php-mode-hook 'spacemacs/toggle-fill-column-indicator-on)
  (add-hook 'php-mode-hook 'spacemacs/toggle-camel-case-motion-on)

  (add-hook 'git-commit-mode-hook 'spacemacs/toggle-spelling-checking-on)
  (add-hook 'po-mode-hook (lambda () (read-only-mode -1)))
  (add-hook 'snippet-mode-hook (lambda () (sp-local-pair 'snippet-mode "'" nil :actions nil)))

  (with-eval-after-load 'web-mode
    (add-hook 'web-mode-hook 'turn-on-smartparens-mode)
    (setq-default
     web-mode-markup-indent-offset 2
     web-mode-engines-alist
     '(("php" . "\\.phtml\\'")
       ("blade" . "\\.blade\\."))))

  (with-eval-after-load 'treemacs
    ;; enhanced navigation (tho I barely ever use it, thankfully to ace jumps)
    (define-key evil-treemacs-state-map (kbd "K")
      (lambda () (interactive) (treemacs-previous-line 10)))
    (define-key evil-treemacs-state-map (kbd "J")
      (lambda () (interactive) (treemacs-next-line 10)))

    ;; strangely enough, `simple' `treemacs-git-mode' is the key for sourcing .gitignore
    ;; files, yet git awareness remains fully operational, despite the mode simpliness
    (treemacs-git-mode 'simple)
    ;; do not show .gitignored files - this is a project scope file manager,
    ;; in comparison to general purpose Dired.
    (add-to-list 'treemacs-pre-file-insert-predicates #'treemacs-is-file-git-ignored?)
    ;; additionally, hide commonly used tech names (this list here is to be extended)
    ;; since `treemacs-pre-file-insert-predicates' doesn't really handle empty dirs
    (defvar my-treemacs-ignored-file-names
      '(".gitkeep" ".mypy_cache" ".ropeproject" "__pytest__")
      "List of complete file (or directory) names to be always ignored by Treemacs.")
    (add-to-list 'treemacs-ignored-file-predicates
                 (lambda (filename _) (member filename my-treemacs-ignored-file-names))))

  ;; Navigation through HELM
  (with-eval-after-load 'helm
    (define-key helm-map (kbd "C-p") 'helm-previous-page)
    (define-key helm-map (kbd "C-n") 'helm-next-page)
    ;; kudos to @PanarinM for finding this one
    (defun helm-persistent-action-display-window (&optional split-onewindow)
      "Return the window that will be used for persistent action.
If SPLIT-ONEWINDOW is non-`nil' window is split in persistent action."
      (with-helm-window
        (setq helm-persistent-action-display-window (get-mru-window))))
    )

  ;; `helm-ag' improvements
  (with-eval-after-load 'helm-ag
    (define-key helm-ag-map (kbd "C-M-k") 'helm-follow-action-backward)
    (define-key helm-ag-map (kbd "C-M-j") 'helm-follow-action-forward)
    )

  ;; projectile
  (with-eval-after-load 'projectile
    (add-to-list 'projectile-globally-ignored-directories ".ropeproject")
    (add-to-list 'projectile-globally-ignored-directories ".mypy_cache")
    )

  (with-eval-after-load 'dired
    (evilified-state-evilify-map dired-mode-map
      :bindings
      "h" #'dired-up-directory
      "l" #'dired-find-file)
    (evil-set-initial-state 'dired-mode 'evilified)
    (add-hook 'dired-mode-hook
              (lambda () (dired-sort-other "-al --group-directories-first"))))

  (with-eval-after-load 'org
    ;; load org-projectile ASAP, we need it to build an informative agenda
    (require 'org-projectile)

    ;; Expand list of possible task states
    (setq org-todo-keywords
          '((sequence "TODO(t)" "WIP(s)" "REVIEW(i)" "|" "DONE(d)")
            (sequence "REPORT(r)" "BUG(b)" "KNOWNC(k)" "|" "FIXED(f)")
            (type "LOCKED(l)" "|" "CANCEL(c)" "ABNDND(x)" "PASSED(p)"))
          org-clock-persist t
          org-clock-idle-time 10
          org-enforce-todo-checkbox-dependencies t
          org-enforce-todo-dependencies t)
    (setq org-todo-keyword-faces
          '(("WIP" . (:foreground "DeepSkyBlue1"))
            ("REVIEW" . (:foreground "MediumSlateBlue"))
            ("REPORT" . (:foreground "goldenrod"))
            ("BUG" . (:foreground "tomato"))
            ("KNOWNC" . (:foreground "MediumSlateBlue"))
            ("LOCKED" . (:foreground "orange red"))
            ("CANCEL" . (:foreground "pink")))
          org-capture-templates
          (quote
           (("n" "Note" entry (file "~/org/notes.org")
             "")
            ("g" "General" entry (file "~/org/general.org")
             "")
            ("i" "Idea" entry (file "~/org/ideas.org")
             "")
            ("G" "General (clock in)" entry (file "~/org/general.org")
             "" :clock-in t :clock-resume t)
            ("t" "Task" entry (file "~/org/journal/landing-bay.org")
             "* TODO %^{Generic name} %?\n")
            ;; gone right after extensive time tracking @ C2C
            ;; goodnight, sweet prince
            ;; ("r" "Catchall for reviews" entry (file "~/org/reviews.org")
            ;;  "* Review %^{PR link}" :clock-in t :clock-resume t :prepend t)
            ("j" "Journal entry (discouraged)" entry (file+datetree "~/org/journal/journal.org")
             "%^G* %<%R> %?\n")
            )))

    ;; `org-clocktable' configuration
    ;; basically, purpose is to ignore zero-length timelogs and agenda
    ;; files w/ no timelogs in the scope
    ;; (file|step)skip0 both altered nil -> t
    (setq org-clocktable-defaults '(:stepskip0 t :fileskip0 t))
    (org-clock-persistence-insinuate)

    ;; Allow setting priorities on TODOs in `org-mode'
    (evil-leader/set-key-for-mode 'org-mode (kbd "i #") #'org-priority)
    (evil-leader/set-key-for-mode 'org-mode (kbd "C R") #'org-evaluate-time-range)

    ;; reasoning is questionable, worked w/o this
    (org-projectile-per-project-strategy)

    (setq org-projectile-per-project-filepath
          (lambda (project-path)
            (concat (projectile-project-name project-path) ".org")))

    (add-to-list 'org-agenda-files org-projectile-projects-directory)
    )

  (with-eval-after-load 'org-agenda
    (define-key org-agenda-keymap "P" 'org-pomodoro)
    )

  ;; Additional ghetto
  (with-eval-after-load 'minimap-mode
    (setq-local minimap-window-location 'right)
    )

  (with-eval-after-load 'shell
    (defun toggle-shell-pop-autocd (&optional arg)
      "Toggle value of `shell-pop-autocd-to-working-dir', effectively freezing term's cwd.

Surely, user can alter cwd by any possible means, via 'cd', for
instance, this just prevents automatic re-setting cwd to current
directory on every issued call to `spacemacs/default-pop-shell'.
Accepts a prefix argument in case the goal is to set this feature
in one call: negative argument disables it, positive - enables."
      (interactive "p")
      (if (when arg t)
          (setq shell-pop-autocd-to-working-dir (> arg 0))
        (setq shell-pop-autocd-to-working-dir (not shell-pop-autocd-to-working-dir)))
      (message "pop-shell autocd mode: %s" shell-pop-autocd-to-working-dir))

    ;; shortcuts for the above
    (defun toggle-shell-pop-autocd-on ()
      (toggle-shell-pop-autocd 1))
    (defun toggle-shell-pop-autocd-off ()
      (toggle-shell-pop-autocd -1))

    ;; bind it
    (evil-leader/set-key "o sk" #'toggle-shell-pop-autocd)

    ;; finally, disable this by default
    (toggle-shell-pop-autocd-off))

  (use-package vterm
    ;; XXX: fixing this on a shell@spacemacs side for the time being
    ;; (remove-hook 'shell-pop-in-after-hook #'evil-insert-state)
    :bind
    (:map vterm-mode-map
          ("C-'"   . #'spacemacs/default-pop-shell)
          ;; vterm tends to react to Shift-Spaces inadequatly, avoid that
          ("S-SPC" . " ")
          ("C-h"   . #'vterm--self-insert)
          ("C-u"   . #'vterm--self-insert))
    :config
    (progn
      (evil-set-initial-state 'vterm-mode 'emacs)))

  ;; unify binds - add the same to regular state binds
  (define-key evil-normal-state-map (kbd "C-'") 'spacemacs/default-pop-shell)
  (define-key evil-insert-state-map (kbd "C-'") 'spacemacs/default-pop-shell)

  ;; Self-authored helper defuns
  ;; Launch diff on currently selected buffers - still WIP
  (defun diff-current-layout ()
    (interactive)
    (let ((current-layout-buffers (mapcar 'window-buffer (window-list))))
      (ediff-buffers
       (car current-layout-buffers)
       (cadr current-layout-buffers))))

  ;; Toggle touchpad from inside Spacemacs
  (defun touchpad-toggle ()
    "Runs an external homebrew script that toggles touchpad state."
    (interactive)
    (shell-command "touchpad-toggle"))

  ;; Bind that homemade stuff somewhere
  ;; Bring it on home \m/
  (evil-leader/set-key
    "b C-d" #'diff-current-layout
    "t t" #'touchpad-toggle
    )

  ;; `o' prefix
  (spacemacs/declare-prefix "o" "user binds" "User-specific keybinds")
  (spacemacs/declare-prefix "ot" "toggles" "User-specific toggles")
  (spacemacs/declare-prefix "om" "mode toggles" "User-specific mode toggles")

  ;; Consider giving names to sections in case of populating those
  (evil-leader/set-key
    "o f" #'treemacs-find-file
    "o g" #'magit-save-repository-buffers
    "o i" #'ispell-buffer
    "o s" #'sql-connect
    "o p" #'org-pomodoro

    ;; Mode toggles
    "o mc" #'evil-mc-mode
    "o mm" #'minimap-mode

    ;; Toggles
    "o tc" #'centered-cursor-mode
    "o td" #'toggle-debug-on-error
    "o ts" #'toggle-shell-pop-autocd
    )

  ;; Always indent on `C-j'
  (define-key evil-normal-state-map (kbd "C-j") #'newline-and-indent)

  ;; `j' is prone to self-insert consequently in `evil-normal-state'
  ;; originally bound to `spacemacs//auto-completion-key-sequence-start'
  ;; no clue what that is, but the approach is in effect ¯\_(ツ)_/¯
  (with-eval-after-load 'company
    (define-key company-active-map "j" nil)
    (define-key evil-normal-state-map (kbd "<C-return>") #'company-complete)
    (define-key evil-insert-state-map (kbd "<C-return>") #'company-complete))

  (with-eval-after-load 'proced
    (evilified-state-evilify-map proced-mode-map)
    (evil-set-initial-state 'proced-mode 'evilified))

  ;; Display "OMG WE'RE OUTSIDE OF THE PROJECT AND WE'RE ALL GONNA DIE" message
  ;; as a warning instead of popping up a whole fucking window just to tell me that
  (setq lsp-message-project-root-warning t)

  ;; Use widely supported shell instead of my own zsh
  (setenv "ESHELL" "bash")
  (add-to-load-path dotspacemacs-directory)
  (load "prodigy-services")

  ;; Secrets.
  ;; The whole mess w/ private.d is to hold sensitive stuff outside of version
  ;; control while keeping track of a private directory itself.

  ;; load everything in ~/.spacemacs.d/private.d
  ;; Yup, I was too damn lazy to require this properly, so I've just snatched a
  ;; snippet from EmacsWiki. Feel free to consult the given URL for details.
  ;; https://www.emacswiki.org/emacs/LoadingLispFiles
  ;; Just b4 u ask - sure thing that snippet was adjusted.
  (defun load-directory (dir)
    ;; Faaaaaaaeeency. `let'-local function.
    ;; Such scope. Much flexibility. Wow.
    (-let [load-it (lambda (f) (load-file (concat (file-name-as-directory dir) f)))]
      (mapc load-it (directory-files dir nil "\\.el$"))))
  (load-directory (f-join dotspacemacs-directory (file-name-as-directory "private.d"))))

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(paradox-github-token t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ediff-current-diff-B ((t (:background "dark green"))))
 '(ediff-current-diff-C ((t (:background "dark magenta"))))
 '(ediff-even-diff-A ((t (:background "gray25"))))
 '(ediff-even-diff-B ((t (:background "grey20"))))
 '(ediff-even-diff-C ((t (:background "gray25"))))
 '(ediff-fine-diff-B ((t (:background "#114422"))))
 '(ediff-fine-diff-C ((t (:background "dark violet"))))
 '(ediff-odd-diff-A ((t (:background "gray20"))))
 '(ediff-odd-diff-B ((t (:background "gray25"))))
 '(ediff-odd-diff-C ((t (:background "gray20"))))
 '(flycheck-error ((t (:underline "Red1"))))
 '(flycheck-info ((t (:underline "ForestGreen"))))
 '(flycheck-warning ((t (:underline "DarkOrange"))))
 '(flyspell-duplicate ((t (:underline "DarkOrange"))))
 '(flyspell-incorrect ((t (:underline "Red1"))))
 '(hi-yellow ((t (:background "dark slate blue" :foreground "light goldenrod"))))
 '(lsp-face-highlight-read ((t (:background "dark slate blue"))))
 '(lsp-face-highlight-write ((t (:background "MediumOrchid4"))))
 '(org-agenda-dimmed-todo-face ((t (:foreground "cyan"))))
 '(treemacs-git-modified-face ((t (:inherit font-lock-variable-name-face :foreground "deep sky blue")))))
)
