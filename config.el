;;
;;   -------------------------------------------------------------------------------
;;   |                                                                             |
;;   |whenever you reconfigure a package, make sure to wrap your config in an      |
;;   |`after!' block, otherwise doom's defaults may override your settings. e.g.   |
;;   |                                                                             |
;;   |  (after! package                                                            |
;;   |    (setq x y))                                                              |
;;   |                                                                             |
;;   |the exceptions to this rule:                                                 |
;;   |                                                                             |
;;   |  - setting file/directory variables (like `org-directory')                  |
;;   |  - setting variables which explicitly tell you to set them before their     |
;;   |    package is loaded (see 'c-h v variable' to look up their documentation). |
;;   |  - setting doom variables (which start with 'doom-' or '+').                |
;;   |                                                                             |
;;   |here are some additional functions/macros that will help you configure doom. |
;;   |                                                                             |
;;   |- `load!' for loading external *.el files relative to this one               |
;;   |- `use-package!' for configuring packages                                    |
;;   |- `after!' for running code after a package has loaded                       |
;;   |- `add-load-path!' for adding directories to the `load-path', relative to    |
;;   |  this file. emacs searches the `load-path' when you load packages with      |
;;   |  `require' or `use-package'.                                                |
;;   |- `map!' for binding new keys                                                |
;;   |                                                                             |
;;   -------------------------------------------------------------------------------

(setq user-full-name "john doe"
      user-mail-address "john@doe.com")

;;   ----------------------------------------------
;;   |                                            |
;;   |                                            |
;;   |               requires                     |
;;   |                                            |
;;   |                                            |
;;   ----------------------------------------------
(require 'org)
(require 'key-chord)

;;   ----------------------------------------------
;;   |                                            |
;;   |                                            |
;;   |                   theme                    |
;;   |                                            |
;;   |                                            |
;;   ----------------------------------------------

(setq doom-theme 'doom-dracula)


;;   ----------------------------------------------
;;   |                                            |
;;   |                                            |
;;   |               something                    |
;;   |                                            |
;;   |                                            |
;;   ----------------------------------------------
(setq display-line-numbers-type t)
;; if you use `org' and don't want your org files in the default location below,
;; change `org-directory'. it must be set before org loads!
(setq org-directory "~/org/")

;;   ----------------------------------------------
;;   |                                            |
;;   |                                            |
;;   |                  settings                  |
;;   |                                            |
;;   |                                            |
;;   ----------------------------------------------
(setq evil-split-window-below t
      evil-vsplit-window-right t)

(defadvice! prompt-for-buffer (&rest _)
  :after '(evil-window-split evil-window-vsplit)
  (consult-buffer))


;;   ----------------------------------------------
;;   |                                            |
;;   |                                            |
;;   |                   remaps                   |
;;   |                                            |
;;   |                                            |
;;   ----------------------------------------------
;;
;;      --god remap!!!!dksfjaslkdjfasdf
(use-package! key-chord)
(setq key-chord-two-keys-delay 0.5)
(key-chord-define evil-insert-state-map "jj" 'evil-normal-state)
(key-chord-mode 1)

;;      --move betwen buffers/tabs/windows
(map! :n "C-k" #'evil-window-up
      :n "C-j" #'evil-window-down
      :n "C-h" #'evil-window-left
      :n "C-l" #'evil-window-right
      :n "J" #'evil-next-buffer
      :n "K" #'evil-prev-buffer

)


;;   ----------------------------------------------
;;   |                                            |
;;   |                                            |
;;   |                  neotree                   |
;;   |                                            |
;;   |                                            |
;;   ----------------------------------------------
(after! neotree
  (setq neo-smart-open t
        neo-window-fixed-size nil))
(map! "<f6>" #'neotree-toggle)


;;   ----------------------------------------------
;;   |                                            |
;;   |                                            |
;;   |                 dired-maps                 |
;;   |                                            |
;;   |                                            |
;;   ----------------------------------------------
(map! :leader
      "t l" #'dired-jump-other-window)
(map! :map dired-mode-map
      :n "C-u" #'dired-up-directory
      :n "C-C" #'dired-create-directory
      :n "C-c" #'dired-create-empty-file
      :n "V" #'dired-find-file
      :n "R" #'dired-do-rename
      :n "D" #'dired-do-delete
      :leader (:prefix ("d". "dired") "j" #'dired-jump)
)
