;; -*- mode: dotspacemacs -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration."
  (setq-default
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (ie. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '(~/.emacs.d/private)
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers '(themes-megapack git hdevtools scala butler syntax-checking rust typescript
                                       (auto-complete :variables auto-completion-enable-company-help-tooltip t)
                                       (haskell :variables haskell-enable-ghci-ng-support t))
;;                                                          ;; haskell-enable-hindent-support "johan-tibell")
   ;; A list of packages and/or extensions that will not be install and loadedw.
   dotspacemacs-excluded-packages '(avy)
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to a .PNG file.
   ;; If the value is nil then no banner is displayed.
   ;; dotspacemacs-startup-banner 'official
   dotspacemacs-startup-banner 'official
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(lush
                         solarized-light
                         solarized-dark
                         leuven
                         monokai
                         zenburn)
   ;; If non nil the cursor color matches the state color.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 11
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it.
   dotspacemacs-major-mode-leader-key ","
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; If non nil the paste micro-state is enabled. While enabled pressing `p`
   ;; several times cycle between the kill ring content.
   dotspacemacs-enable-paste-micro-state t
   ;; Guide-key delay in seconds. The Guide-key is the popup buffer listing
   ;; the commands bound to the current keystrokes.
   dotspacemacs-guide-key-delay 0.4
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil ;; to boost the loading time.
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up.
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX."
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'.
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'.
   dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line.
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen.
   dotspacemacs-smooth-scrolling t
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   dotspacemacs-smartparens-strict-mode nil
   ;; If non nil advises quit functions to keep server open when quitting.
   dotspacemacs-persistent-server nil
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now.
   dotspacemacs-default-package-repository nil
   ;; User initialization goes here
   evil-escape-key-sequence "jk" )
  (autoload 'haskell-indentation-enable-show-indentations "haskell-indentation")
  (autoload 'haskell-indentation-disable-show-indentations "haskell-indentation")
  )


(defun dotspacemacs/config ()
  "Configuration function
 This function is called at the very end of Spacemacs initialization after
layers configuration."
  (evil-escape-mode 1)
  (global-flycheck-mode t)

  (setq flycheck-check-syntax-automatically '(mode-enabled save idle-change))
  (add-hook 'shell-mode-hook 'compilation-shell-minor-mode)
  (add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

  ;; Haskell config
  (add-hook 'haskell-mode-hook
    (lambda ()
      (message "running haskell mode hook")
      (setq default-tab-width 4)
      (setq evil-shift-width 4)
      (setq haskell-indent-spaces 4)
      (setq tab-width 4)
      (define-key haskell-mode-map [f5] 'haskell-process-load-or-reload)
      (define-key haskell-mode-map [f12] 'haskell-process-reload-devel-main)
      (haskell-indentation-mode f)
      (setq haskell-process-suggest-hoogle-imports t)
      (flycheck-mode t)
    ))

  (eval-after-load 'flycheck-hdevtools
                   '(setq flycheck-hdevtools-options (concat "--socket="
                            (flycheck-module-root-directory
                              (flycheck-find-in-buffer flycheck-haskell-module-re))
                            ".hdevtools.sock")))

  ;; Rust config
  (setq racer-rust-src-path "/usr/local/src/rustc-1.0.0/src")
  (setq racer-cmd "/usr/local/bin/racer")
  (add-hook 'rust-mode-hook
    (lambda ()
        (message "running rust mode hook")
        (setq default-tab-width 4)
        (setq evil-shift-width 4)
        (setq tab-width 4)
        (flycheck-mode t)
        ))



;;  (setq debug-on-error t)
)


;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
