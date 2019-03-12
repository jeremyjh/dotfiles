;; -*- mode: dotspacemacs -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration."
  (setq-default
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (ie. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '("~/.spacemacs-private/")
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(go elm restclient terraform
     syntax-checking sql python csv erlang html
     themes-megapack git scala dash clojure
     rust typescript elixir purescript yaml javascript aj-javascript
     (markdown :variables markdown-live-preview-engine 'vmd)
     (gtags :variables gtags-enable-by-default nil)
     (auto-completion :variables
                      auto-completion-enable-company-help-tooltip t
                      auto-completion-enable-snippets-in-popup t)
     (haskell :variables haskell-enable-hindent t
                         haskell-enable-hindent-style "johan-tibell"
                         haskell-completion-backend 'intero)
     (ruby :variables ruby-test-runner 'ruby-test))
   ;; A list of packages and/or extensions that will not be install and loadedw.
   dotspacemacs-excluded-packages '(avy)
   dotspacemacs-additional-packages '(dtrt-indent vue-mode eslint-fix)
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/user-init ()


  (setq configuration-layer-elpa-archives '(("melpa" . "melpa.org/packages/")
  ("org" . "orgmode.org/elpa/") ("gnu" . "elpa.gnu.org/packages/")))
  (setq custom-file "~/.spacemacs-custom.el")
  (load custom-file)
  (setq evil-respect-visual-line-mode t)
  )

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
   dotspacemacs-themes '(spacemacs-dark
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
   dotspacemacs-default-font '("Hasklig"
                               :size 13
                               :weight medium
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

  (setq tab-always-indent t)

  (global-linum-mode t)

  (add-hook 'shell-mode-hook 'compilation-shell-minor-mode)
  (add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

  (setq spacemacs-default-jump-handlers
        (remove 'evil-goto-definition spacemacs-default-jump-handlers))

  ;; display full buffer path in title window
  (setq frame-title-format
  (list (format "%s %%S: %%j " (system-name))
        '(buffer-file-name "%f" (dired-directory dired-directory "%b"))))

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

  ;; ;; in all source buffers
  (add-hook 'prog-mode-hook #'(lambda ()
    (message "running prog-mode-hook")
    (dtrt-indent-mode)
    (dtrt-indent-adapt)
    (spacemacs/toggle-truncate-lines-on)
    (linum-mode t)
    (linum-relative-mode)))

  ;;don't chdir when opening a file
  (add-hook 'find-file-hook
            (lambda ()
              (setq default-directory command-line-default-directory)))

  ;; Haskell config
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

  (defun my-haskell-run-devel ()
    "Reloads the current module and then hot-reloads code via DevelMain.update."
    (interactive)
    (save-buffer)
    (intero-devel-reload))

  (evil-leader/set-key-for-mode 'haskell-mode
    "," 'haskell-navigate-imports-return)

  (add-hook 'haskell-mode-hook
    (lambda ()
      (message "running haskell mode hook")
      (hindent-mode)
      (setq-default evil-shift-width 4)
      (setq haskell-indent-spaces 4)
      (dtrt-indent-mode nil)
      (setq tab-width 4)
      (haskell-indent-mode 0)
      (define-key haskell-mode-map [f5] 'intero-repl-load)
      (define-key haskell-mode-map [f6] 'intero-devel-reload)
      (setq haskell-process-suggest-hoogle-imports t)
      (setq haskell-process-use-presentation-mode t)
      (setq haskell-process-args-stack-ghci '("--ghc-options=-ferror-spans" "--test"))
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

  (defun my-correct-symbol-bounds (pretty-alist)
    "Prepend a TAB character to each symbol in this alist,
    this way compose-region called by prettify-symbols-mode
    will use the correct width of the symbols
    instead of the width measured by char-width."
    (mapcar (lambda (el)
              (setcdr el (string ?\t (cdr el)))
              el)
            pretty-alist))

  (defun my-ligature-list (ligatures codepoint-start)
    "Create an alist of strings to replace with
     codepoints starting from codepoint-start."
    (let ((codepoints (-iterate '1+ codepoint-start (length ligatures))))
      (-zip-pair ligatures codepoints)))

  ; list can be found at https://github.com/i-tu/Hasklig/blob/master/GlyphOrderAndAliasDB#L1588
  (setq my-hasklig-ligatures
    (let* ((ligs '("&&" "***" "*>" "\\\\" "||" "|>" "::"
                   "==" "===" "==>" "=>" "=<<" "!!" ">>"
                   ">>=" ">>>" ">>-" ">-" "->" "-<" "-<<"
                   "<*" "<*>" "<|" "<|>" "<$>" "<>" "<-"
                   "<<" "<<<" "<+>" ".." "..." "++" "+++"
                   "/=" ":::" ">=>" "->>" "<=>" "<=<" "<->")))
      (my-correct-symbol-bounds (my-ligature-list ligs #Xe100))))

  ;; nice glyphs for haskell with hasklig
  (defun my-set-hasklig-ligatures ()
    "Add hasklig ligatures for use with prettify-symbols-mode."
    (setq prettify-symbols-alist
          (append my-hasklig-ligatures prettify-symbols-alist))
    (prettify-symbols-mode))

  (add-hook 'haskell-mode-hook 'my-set-hasklig-ligatures)

  (add-hook 'purescript-mode-hook
            (lambda ()
              (message "running purescript mode hook")
              (my-set-hasklig-ligatures)
              (setq purescript-indent-mode nil)
              ))

  ;; Rust config
  (setq-default rust-enable-racer t)
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

  ;; Ocaml

  (add-hook 'tuareg-mode-hook
      (lambda ()
        (message "running Ocaml mode hook")
        (flycheck-mode)))

  (setq save-abbrevs t)

  ;;Elixir
  (defun mix-dialyzer ()
    (interactive)
    (save-buffer)
    (alchemist-mix-execute (list "dialyzer") nil))
  (evil-leader/set-key-for-mode 'elixir-mode
    "md" 'mix-dialyzer)
  (defun mix-format()
    (interactive)
    (save-buffer)
    (alchemist-mix-execute (list "format") nil))
  (evil-leader/set-key-for-mode 'elixir-mode
    "mf" 'mix-format)

  (add-to-list 'spacemacs-indent-sensitive-modes 'elixir-mode)
  (setq alchemist-mix-command "~/.asdf/shims/mix")
  (setq alchemist-mix-env "dev")
  (setq alchemist-iex-program-name "~/.asdf/shims/iex")
  (setq alchemist-execute-command "~/.asdf/shims/elixir")
  (setq alchemist-compile-command "~/.asdf/shims/elixirc")
  (setq flycheck-elixir-credo-executable "~/.asdf/shims/mix")

  (defun mix-format-on-save ()
    (when (eq major-mode 'elixir-mode)
      (elixir-format)))

  ;;(add-hook 'after-save-hook #'mix-format-on-save)

  (add-hook 'elixir-mode-hook
    (lambda ()
      (message "running elixir hook")
      ;;(spacemacs//elixir-enable-compilation-checking)
      (flycheck-mix-setup)
      (setenv "IN_EDITOR" "true")
      (setenv "MIX_ENV" "test")
      (setenv "VERBOSE" "false")

      (define-key elixir-mode-map [f4] (lambda ()
                                         (interactive)
                                         (save-buffer)
                                         (alchemist-iex-compile-this-buffer-and-go)))

      (define-key elixir-mode-map [f5] (lambda ()
        (interactive)
        (save-buffer)
        (f-touch (shell-quote-argument (buffer-file-name)))
        (alchemist-iex-compile-this-buffer-and-go)))

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
      (visual-line-mode)
      ))

  ;;Scala
  (if (file-readable-p "./scalastyle-config.xml")
      (setq-default flycheck-scalastylerc "./scalastyle-config.xml")
    (setq-default flycheck-scalastylerc "~/scalastyle-config.xml"))

  (setq-default ensime-startup-notification nil)

  ;;javascript

  (eval-after-load 'vue-mode
    '(add-hook 'vue-mode-hook (lambda () (add-hook 'after-save-hook 'eslint-fix nil t))))

  (eval-after-load 'js2-mode
    '(add-hook 'js2-mode-hook (lambda () (add-hook 'after-save-hook 'eslint-fix nil t))))

  (eval-after-load 'rjsx-mode
    '(add-hook 'rjsx-mode-hook (lambda () (add-hook 'after-save-hook 'eslint-fix nil t))))

  (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
  (add-to-list 'auto-mode-alist '("\\.vue\\'" . vue-mode))

  (add-hook 'vue-mode-hook
            (lambda ()
              (message "running vue hook")
              (flycheck-add-mode 'javascript-eslint 'vue-html-mode)
              (electric-indent-local-mode)
              (dtrt-indent-mode)
              (flycheck-mode)
              ))

  ;; somehow this is breaking rjsx mode
  ;; (my-personal-code-style)
  ;; (add-hook 'css-mode-hook 'my-personal-code-style)
  ;; (add-hook 'js2-mode-hook 'my-personal-code-style)
  ;; (add-hook 'react-mode-hook 'my-personal-code-style)
  ;; (add-hook 'sh-mode-hook 'my-personal-code-style)

  (defun copy-file-name-to-clipboard ()
    "Copy the current buffer file name to the clipboard."
    (interactive)
    (let ((filename (if (equal major-mode 'dired-mode)
                        default-directory
                      (buffer-file-name))))
      (when filename
        (kill-new filename)
        (message "Copied buffer file name '%s' to the clipboard." filename))))

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

  ;; Purescript
  (setq psc-ide-use-npm-bin t)
  (defun my/append-char ()
    (interactive)
    (save-excursion
      (unless (eolp)
        (forward-char))
      (insert-char #x2200)))

  (evil-leader/set-key-for-mode 'purescript-mode
    "a" 'my/append-char)


;;  (setq debug-on-error t)
)
