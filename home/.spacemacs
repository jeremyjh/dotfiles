;; -*- mode: dotspacemacs -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration."
  (setq-default
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (ie. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '("~/.emacs.d/private/")
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(sql python pony csv erlang html org
     themes-megapack git scala syntax-checking dash
     rust typescript elixir purescript yaml javascript aj-javascript
     (markdown :variables markdown-live-preview-engine 'vmd)
     (gtags :variables gtags-enable-by-default nil)
     (auto-completion :variables
                      auto-completion-enable-company-help-tooltip t
                      auto-completion-enable-snippets-in-popup t)
     (haskell :variables haskell-enable-hindent-style "chris-done"
                         haskell-completion-backend 'intero)
     (ruby :variables ruby-test-runner 'ruby-test))
   ;; A list of packages and/or extensions that will not be install and loadedw.
   dotspacemacs-excluded-packages '(avy)
   dotspacemacs-additional-packages '(dtrt-indent)
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
   dotspacemacs-themes '(
                         lush
                         solarized-dark
                         solarized-light
                         leuven
                         monokai
                         zenburn)
   ;; If non nil the cursor color matches the state color.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
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

(defun my-setup-indent (n)
    ;; java/c/c++
    (setq-local standard-indent n)
    (setq-local c-basic-offset n)
    ;; web development
    ;; (setq-local javascript-indent-level n) ; javascript-mode
    ;; (setq-local js-indent-level n) ; js-mode
    ;; (setq-local react-indent-level n) ; react-mode
    ;; (setq-local js2-basic-offset n) ; js2-mode, in latest js2-mode, it's alias of js-indent-level
    (setq-local web-mode-attr-indent-offset n) ; web-mode
    (setq-local web-mode-code-indent-offset n) ; web-mode, js code in html file
    (setq-local web-mode-css-indent-offset n) ; web-mode, css in html file
    (setq-local web-mode-markup-indent-offset n) ; web-mode, html tag in html file
    (setq-local web-mode-sql-indent-offset n) ; web-mode
    (setq-local web-mode-attr-value-indent-offset n) ; web-mode
    (setq-local css-indent-offset n) ; css-mode
    (setq-local sh-basic-offset n) ; shell scripts
    (setq-local sh-indentation n))

(defun my-personal-code-style ()
  (interactive)
  ;; use space instead of tab
  (setq indent-tabs-mode nil)
  ;; indent 2 spaces width
  (my-setup-indent 2))


(defun dotspacemacs/user-config ()
  "Configuration function
 This function is called at the very end of Spacemacs initialization after
layers configuration."
  (evil-escape-mode 1)
  ;;fix clipboard!
  (fset 'evil-visual-update-x-selection 'ignore)

  (spacemacs/toggle-indent-guide-globally-on)

  (global-linum-mode)
  (linum-relative-on)

  (add-hook 'shell-mode-hook 'compilation-shell-minor-mode)
  (add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

  ;; disable lockfiles
  ;; see http://www.gnu.org/software/emacs/manual/html_node/emacs/Interlocking.html
  (setq create-lockfiles nil)

  ;; store all backup files in the tmp dir
  ;; http://www.gnu.org/software/emacs/manual/html_node/emacs/Backup-Names.html
  (setq backup-directory-alist
        `((".*" . ,temporary-file-directory)))

  ;; store all autosave files in the tmp dir
  ;; http://www.gnu.org/software/emacs/manual/html_node/emacs/Auto-Save-Files.html
  (setq auto-save-file-name-transforms
        `((".*" ,temporary-file-directory t)))

  ;; autosave the undo-tree history
  (setq undo-tree-history-directory-alist
        `((".*" . ,temporary-file-directory)))
  (setq undo-tree-auto-save-history t)

  ;; enable dtrt-indent
  (add-hook 'prog-mode-hook #'(lambda ()
    (dtrt-indent-mode)
    (dtrt-indent-adapt)))

  ;;don't chdir when opening a file
  (add-hook 'find-file-hook
            (lambda ()
              (setq default-directory command-line-default-directory)))
  (defun intero-repl-reload-run-main (&optional prompt-options)
    (interactive "P")
    (intero-repl-load)
    (let (repl-buffer (intero-repl-buffer prompt-options))
      (with-current-buffer repl-buffer
        (comint-send-string
        (get-buffer-process (current-buffer))
        (":help \n")))))

  (defun intero-repl-reload-run-main ()
    (intero-repl-load)
    (let (
          (repl-buffer (intero-repl-buffer nil)))
      (with-current-buffer repl-buffer
        (comint-send-string
         (get-buffer-process (current-buffer))
         (concat "main" "\n")))
      (pop-to-buffer repl-buffer)))

  ;; Haskell config
  (add-hook 'haskell-mode-hook
    (lambda ()
      (message "running haskell mode hook")
      (setq-default evil-shift-width 4)
      (setq haskell-indent-spaces 4)
      (setq tab-width 4)
      (define-key haskell-mode-map [f5] 'intero-repl-load)
      (define-key haskell-mode-map [f6] 'intero-repl-reload-run-main)
      (define-key haskell-mode-map [f12] 'haskell-process-reload-devel-main)
      (setq haskell-process-suggest-hoogle-imports t)
      (setq haskell-process-use-presentation-mode t)
      (setq haskell-process-args-stack-ghci '("--ghc-options=-ferror-spans" "--test"))
      ;; (setq haskell-process-args-stack-ghci '("--ghc-options=-ferror-spans" "--test"))
      (company-mode)
      (let ((checkers '(haskell-ghc haskell-stack-ghc)))
        (if (boundp 'flycheck-disabled-checkers)
            (dolist (checker checkers)
            (add-to-list 'flycheck-disabled-checkers checker))
        (setq flycheck-disabled-checkers checkers)))
      (flycheck-add-next-checker 'intero
                                 '(warning . haskell-hlint))
    ))

  (evil-define-key 'normal haskell-presentation-mode-map
    (kbd "q") 'quit-window
    (kbd "c") 'haskell-presentation-clear)

  (eval-after-load 'flycheck-hdevtools
                   '(setq flycheck-hdevtools-options (concat "--socket="
                            (flycheck-module-root-directory
                              (flycheck-find-in-buffer flycheck-haskell-module-re))
                            ".hdevtools.sock")))

  (defun haskell-indentation-advice ()
    (when (and (< 1 (line-number-at-pos))
               (save-excursion
                 (forward-line -1)
                 (string= "" (s-trim (buffer-substring (line-beginning-position) (line-end-position))))))
      (delete-region (line-beginning-position) (point))))

  (advice-add 'haskell-indentation-newline-and-indent
              :after 'haskell-indentation-advice)

  ;; Rust config
  (setq-default rust-enable-racer t)
  (setq racer-cmd "/home/jeremy/.multirust/toolchains/stable/cargo/bin/racer")
  (setq racer-rust-src-path "/home/jeremy/repos/rust/rust/src")
  (add-hook 'racer-mode-hook #'eldoc-mode)
  (add-hook 'rust-mode-hook
    (lambda ()
        (message "running rust mode hook")
        (setq-default evil-shift-width 4)
        (setq tab-width 4)
        (company-mode)
        (racer-mode)
        (flycheck-mode)
        ))

  ;;Elixir
  (defun mix-dialyzer ()
    (interactive)
    (alchemist-mix-execute (list "dialyzer") nil))
  (evil-leader/set-key-for-mode 'elixir-mode
    "md" 'mix-dialyzer)

  (setq alchemist-mix-command "~/.asdf/shims/mix")
  (setq alchemist-iex-program-name "~/.asdf/shims/iex")
  (setq alchemist-execute-command "~/.asdf/shims/elixir")
  (setq alchemist-compile-command "~/.asdf/shims/elixirc")
  (setq flycheck-elixir-credo-executable "~/.asdf/shims/mix")

  (add-hook 'elixir-mode-hook
    (lambda ()
      (message "running elixir hook")
      ;;(spacemacs//elixir-enable-compilation-checking)
      (flycheck-mix-setup)

      (define-key elixir-mode-map [f4] (lambda ()
                                         (interactive)
                                         (save-buffer)
                                         (alchemist-iex-compile-this-buffer-and-go)))

      (define-key elixir-mode-map [f5] (lambda ()
        (interactive)
        (save-buffer)
        (f-touch (shell-quote-argument (buffer-file-name)))
        (alchemist-iex-reload-module)))

      (define-key elixir-mode-map [f6] (lambda ()
        (interactive)
        (save-buffer)
        (alchemist-mix-rerun-last-test)))

      (define-key elixir-mode-map [f7] (lambda ()
        (interactive)
        (save-buffer)
        (mix-dialyzer)))
   ))

  (add-hook 'python-mode-hook
    (lambda ()
      (message "running python hook")
      (define-key python-mode-map [f6] (lambda ()
        (interactive)
        (save-buffer)
        (shell-command "bin/run")))
  ))

  (add-hook 'markdown-mode-hook
    (lambda ()
      (message "running markdown mode hook")
      (spacemacs/toggle-visual-line-navigation)))

  ;;Scala
  (if (file-readable-p "./scalastyle-config.xml")
      (setq-default flycheck-scalastylerc "./scalastyle-config.xml")
    (setq-default flycheck-scalastylerc "~/scalastyle-config.xml"))

  (setq-default ensime-startup-notification nil)

  ;;javascript
  (add-to-list 'auto-mode-alist '("\\.vue\\'" . rjsx-mode))
  ;;use react-mode for all js
  (add-to-list 'auto-mode-alist '("\\.vue\\'" . rjsx-mode))
  ;; (spacemacs/helm-gtags-define-keys-for-mode 'react-mode)

  ;; somehow this is breaking rjsx mode
  ;; (my-personal-code-style)
  ;; (add-hook 'css-mode-hook 'my-personal-code-style)
  ;; (add-hook 'js2-mode-hook 'my-personal-code-style)
  ;; (add-hook 'react-mode-hook 'my-personal-code-style)
  ;; (add-hook 'sh-mode-hook 'my-personal-code-style)


  ;;Typescript
  (if (file-readable-p "node_modules/typescript/bin/tsserver")
      (setq tide-tsserver-executable "node_modules/typescript/bin/tsserver"))
  (add-to-list 'auto-mode-alist '("\\.tsx\\'" . typescript-mode))

  ;;Pony
  (add-hook 'ponylang-mode-hook
            (lambda ()
              (message "running pony hook")
              (define-key ponylang-mode-map [f5] (lambda ()
                                                 (interactive)
                                                 (save-buffer)
                                                 (shell-command "ponyc && ./out")))
   ))

;;  (setq debug-on-error t)
)

;;'(flycheck-disabled-checkers (quote (elixir-credo)))

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ahs-case-fold-search nil t)
 '(ahs-default-range (quote ahs-range-whole-buffer) t)
 '(ahs-idle-interval 0.25 t)
 '(ahs-idle-timer 0 t)
 '(ahs-inhibit-face-list nil t)
 '(auto-save-default nil)
 '(custom-safe-themes
   (quote
    ("0820d191ae80dcadc1802b3499f84c07a09803f2cb90b343678bdb03d225b26b" default)))
 '(ensime-sem-high-enabled-p nil)
 '(ensime-typecheck-idle-interval 1.5)
 '(exec-path-from-shell-arguments (quote ("-l")))
 '(flycheck-check-syntax-automatically (quote (save idle-change mode-enabled)))
 '(haskell-hoogle-command "stack hoogle --")
 '(package-selected-packages
   (quote
    (org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-download htmlize parent-mode gnuplot gitignore-mode pos-tip flx goto-chg dtrt-indent dash-at-point dash-functional pkg-info epl popup web-completion-data json-snatcher json-reformat rjsx-mode prettier-js eslintd-fix helm-gtags ggtags ghc dash json-mode diminish winum madhat2r-theme fuzzy csv-mode flycheck-pony ponylang-mode vmd-mode powerline pcre2el spinner org multiple-cursors hydra projectile request haml-mode seq iedit anzu sbt-mode scala-mode autothemer tern rust-mode bind-key yasnippet elixir-mode avy auto-complete inf-ruby company highlight smartparens bind-map evil undo-tree flycheck haskell-mode helm helm-core js2-mode magit magit-popup git-commit with-editor async purescript-mode f s flycheck-credo yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode helm-pydoc cython-mode company-anaconda anaconda-mode pythonic sql-indent markdown-toc mmm-mode markdown-mode gh-md yaml-mode uuidgen toc-org tide typescript-mode rake pug-mode org-plus-contrib org-bullets ob-elixir minitest livid-mode skewer-mode simple-httpd link-hint intero hlint-refactor hide-comnt helm-hoogle git-link flycheck-mix eyebrowse evil-visual-mark-mode evil-unimpaired evil-ediff dumb-jump darkokai-theme company-ghci column-enforce-mode cargo zeal-at-point helm-dash zonokai-theme zenburn-theme zen-and-art-theme ws-butler window-numbering which-key web-mode web-beautify volatile-highlights vi-tilde-fringe use-package underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme tss tronesque-theme toxi-theme toml-mode tao-theme tangotango-theme tango-plus-theme tango-2-theme tagedit sunny-day-theme sublime-themes subatomic256-theme subatomic-theme stekene-theme spacemacs-theme spaceline spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smooth-scrolling smeargle slim-mode shm seti-theme scss-mode sass-mode rvm ruby-tools ruby-test-mode ruby-end rubocop rspec-mode robe reverse-theme restart-emacs rbenv rainbow-delimiters railscasts-theme racer quelpa purple-haze-theme psci psc-ide professional-theme popwin planet-theme phoenix-dark-pink-theme phoenix-dark-mono-theme persp-mode pastels-on-dark-theme paradox page-break-lines orgit organic-green-theme open-junk-file omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noflet noctilux-theme niflheim-theme neotree naquadah-theme mustang-theme move-text monokai-theme monochrome-theme molokai-theme moe-theme minimal-theme material-theme majapahit-theme magit-gitflow lush-theme lorem-ipsum linum-relative light-soap-theme leuven-theme less-css-mode js2-refactor js-doc jbeans-theme jazz-theme jade-mode ir-black-theme inkpot-theme info+ indent-guide ido-vertical-mode hungry-delete hl-todo hindent highlight-parentheses highlight-numbers highlight-indentation heroku-theme hemisu-theme help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-gitignore helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag hc-zenburn-theme haskell-snippets gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme google-translate golden-ratio gitconfig-mode gitattributes-mode git-timemachine git-messenger gandalf-theme flycheck-rust flycheck-pos-tip flycheck-haskell flx-ido flatui-theme flatland-theme firebelly-theme fill-column-indicator farmhouse-theme fancy-battery expand-region exec-path-from-shell evil-visualstar evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-args evil-anzu eval-sexp-fu espresso-theme ensime emmet-mode dracula-theme django-theme define-word darktooth-theme darkmine-theme darkburn-theme dakrone-theme cyberpunk-theme company-web company-tern company-statistics company-racer company-quickhelp company-ghc company-cabal colorsarenice-theme color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized coffee-mode cmm-mode clues-theme clean-aindent-mode chruby cherry-blossom-theme busybee-theme bundler buffer-move bubbleberry-theme bracketed-paste birds-of-paradise-plus-theme badwolf-theme auto-yasnippet auto-highlight-symbol apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes alchemist aggressive-indent afternoon-theme adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell)))
 '(ring-bell-function (quote ignore))
 '(truncate-lines t)
 '(typescript-indent-level 2))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
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
 '(ahs-case-fold-search nil)
 '(ahs-default-range (quote ahs-range-whole-buffer))
 '(ahs-idle-interval 0.25)
 '(ahs-idle-timer 0 t)
 '(ahs-inhibit-face-list nil)
 '(auto-save-default nil)
 '(custom-safe-themes
   (quote
    ("0820d191ae80dcadc1802b3499f84c07a09803f2cb90b343678bdb03d225b26b" default)))
 '(ensime-sem-high-enabled-p nil)
 '(ensime-typecheck-idle-interval 1.5)
 '(exec-path-from-shell-arguments (quote ("-l")))
 '(flycheck-check-syntax-automatically (quote (save idle-change mode-enabled)))
 '(haskell-hoogle-command "stack hoogle --")
 '(package-selected-packages
   (quote
    (white-sand-theme symon string-inflection ruby-refactor rebecca-theme password-generator meghanada helm-purpose window-purpose imenu-list groovy-mode groovy-imports pcache gradle-mode evil-lion editorconfig dante company-emacs-eclim eclim org-projectile org-present org-pomodoro alert log4e gntp org-download org-brain gnuplot evil-org dtrt-indent impatient-mode htmlize web-completion-data json-snatcher json-reformat rjsx-mode prettier-js eslintd-fix helm-gtags ggtags ghc dash json-mode diminish winum madhat2r-theme fuzzy csv-mode flycheck-pony ponylang-mode vmd-mode powerline pcre2el spinner org multiple-cursors hydra projectile request haml-mode seq iedit anzu sbt-mode scala-mode autothemer tern rust-mode bind-key yasnippet elixir-mode avy auto-complete inf-ruby company highlight smartparens bind-map evil undo-tree flycheck haskell-mode helm helm-core js2-mode magit magit-popup git-commit with-editor async purescript-mode f s flycheck-credo yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode helm-pydoc cython-mode company-anaconda anaconda-mode pythonic sql-indent markdown-toc mmm-mode markdown-mode gh-md yaml-mode uuidgen toc-org tide typescript-mode rake pug-mode org-plus-contrib org-bullets ob-elixir minitest livid-mode skewer-mode simple-httpd link-hint intero hlint-refactor hide-comnt helm-hoogle git-link flycheck-mix eyebrowse evil-visual-mark-mode evil-unimpaired evil-ediff dumb-jump darkokai-theme company-ghci column-enforce-mode cargo zeal-at-point helm-dash zonokai-theme zenburn-theme zen-and-art-theme ws-butler window-numbering which-key web-mode web-beautify volatile-highlights vi-tilde-fringe use-package underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme tss tronesque-theme toxi-theme toml-mode tao-theme tangotango-theme tango-plus-theme tango-2-theme tagedit sunny-day-theme sublime-themes subatomic256-theme subatomic-theme stekene-theme spacemacs-theme spaceline spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smooth-scrolling smeargle slim-mode shm seti-theme scss-mode sass-mode rvm ruby-tools ruby-test-mode ruby-end rubocop rspec-mode robe reverse-theme restart-emacs rbenv rainbow-delimiters railscasts-theme racer quelpa purple-haze-theme psci psc-ide professional-theme popwin planet-theme phoenix-dark-pink-theme phoenix-dark-mono-theme persp-mode pastels-on-dark-theme paradox page-break-lines orgit organic-green-theme open-junk-file omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noflet noctilux-theme niflheim-theme neotree naquadah-theme mustang-theme move-text monokai-theme monochrome-theme molokai-theme moe-theme minimal-theme material-theme majapahit-theme magit-gitflow lush-theme lorem-ipsum linum-relative light-soap-theme leuven-theme less-css-mode js2-refactor js-doc jbeans-theme jazz-theme jade-mode ir-black-theme inkpot-theme info+ indent-guide ido-vertical-mode hungry-delete hl-todo hindent highlight-parentheses highlight-numbers highlight-indentation heroku-theme hemisu-theme help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-gitignore helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag hc-zenburn-theme haskell-snippets gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme google-translate golden-ratio gitconfig-mode gitattributes-mode git-timemachine git-messenger gandalf-theme flycheck-rust flycheck-pos-tip flycheck-haskell flx-ido flatui-theme flatland-theme firebelly-theme fill-column-indicator farmhouse-theme fancy-battery expand-region evil-visualstar evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-args evil-anzu eval-sexp-fu espresso-theme ensime emmet-mode dracula-theme django-theme define-word darktooth-theme darkmine-theme darkburn-theme dakrone-theme cyberpunk-theme company-web company-tern company-statistics company-racer company-quickhelp company-ghc company-cabal colorsarenice-theme color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized coffee-mode cmm-mode clues-theme clean-aindent-mode chruby cherry-blossom-theme busybee-theme bundler buffer-move bubbleberry-theme bracketed-paste birds-of-paradise-plus-theme badwolf-theme auto-yasnippet auto-highlight-symbol apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes alchemist aggressive-indent afternoon-theme adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell)))
 '(paradox-github-token t)
 '(ring-bell-function (quote ignore))
 '(safe-local-variable-values
   (quote
    ((eval progn
           (add-to-list
            (quote exec-path)
            (concat
             (locate-dominating-file default-directory ".dir-locals.el")
             "node_modules/.bin/")))
     (elixir-mode
      (elixir-enable-compilation-checking . t))
     (eval progn
           (add-to-list
            (quote exec-path)
            (concat
             (locate-dominating-file default-directory ".dir-locals.el")
             "assets/node_modules/.bin/"))
           (add-to-list
            (quote exec-path)
            "/home/jeremy/.asdf/shims"))
     (eval progn
           (add-to-list
            (quote exec-path)
            (concat
             (locate-dominating-file default-directory ".dir-locals.el")
             "assets/node_modules/.bin/")))
     (elixir-enable-compilation-checking . t)
     (elixir-enable-compilation-checking))))
 '(standard-indent 2)
 '(truncate-lines t)
 '(typescript-indent-level 2))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:foreground "#E0E0E0" :background "#202020")))))
)
