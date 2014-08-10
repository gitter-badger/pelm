;;; pelm-defuns.el --- Custom functions
;;; grab from  git://github.com/rejeep/emacs.git, THANKS!




(require 'cl-lib)


(defmacro require-and-exec (feature &rest body)
  "Require the feature and execute body if it was successfull loaded."
  (declare (indent defun))
  `(if (require ,feature nil 'noerror)
       (progn ,@body)
     (message (format "%s not loaded" ,feature))))

(defmacro load-and-exec (file &optional &rest body)
  "Load the file and execute body if it was successfull loaded."
  (declare (indent 1))
  `(if (load ,file t)
        (progn ,@body)
    (message (format "%s not loaded" ,file))))

(defun in-mode? (mode)
  (eq major-mode mode))

(defun x-urgency-hint (frame set &optional source)
  "Set urgency hint for `frame' to `set' for `source'."
  (let* ((wm-hints (append (x-window-property
                            "WM_HINTS" frame "WM_HINTS"
                            (if source
                                source
                              (string-to-number
                               (frame-parameter frame 'outer-window-id)))
                            nil t)
                           nil))
         (flags (car wm-hints)))
    (setcar wm-hints
            (if set
                (logior flags #x00000100)
              (logand flags #xFFFFFEFF)))
    (x-change-window-property "WM_HINTS" wm-hints frame "WM_HINTS" 32 t)))

(defun add-to-hooks (fun hooks)
  "Add function to hooks"
  (dolist (hook hooks)
    (add-hook hook fun)))

(defun add-all-to-hook (hook &rest funs)
  "Add functions to hook."
  (add-to-hook hook funs))

(defun add-to-hook (hook funs)
  "Add list of functions to hook."
  (dolist (fun funs)
    (add-hook hook fun)))

(defvar pelm/before-kill-hook
  '(
    recentf-save-list
    bookmark-save
    )
  "Functions to be executed by `SAVE-KILL-EMACS'")

(defun modified-buffers? ()
  "Returns first modified buffer or nil if there is none."
  (cl-loop for b in (buffer-list)
           when (and (buffer-live-p b)
                     (buffer-modified-p b)
                     (buffer-file-name b))
           return b))

(defun dot? (fname &optional dotfiles)
  "Determines if `FNAME' is a dot or dotfile if `DOTFILES' is non-nil."
  (let ((f (file-name-nondirectory fname)))
     (if dotfiles
         (string-prefix-p "." f)
       (or (string= "." f) (string= ".." f)))))

(defun ls-no-dots (directory &optional full dotfiles match)
  "Returns files in `directory' without `.' and `..'.
`full', `match' and `nosort' act as in `directory-files'"
  (cl-remove-if (lambda (f) (dot? f dotfiles))
                (directory-files directory full match)))

(defun ls-dirs (directory &optional dotfiles match)
  "Returns all dirs in `DIR'.
`DOTFILES' -- if non-nil don't include dirs starting with a `.'
`MATCH' -- if non-nil only include dirs matching the regexp"
  (cl-remove-if-not #'file-directory-p
                    (ls-no-dots directory t dotfiles match)))

(defun ls-files (directory &optional dotfiles match)
  "Returns all files in `DIR'.
`DOTFILES' -- if non-nil don't include files starting with a `.'
`MATCH' -- if non-nil only include files matching the regexp"
  (cl-remove-if #'file-directory-p
             (ls-no-dots directory t dotfiles match)))



(defun parent-dir (file-name)
  "Parent directory of given file."
  (file-name-directory
   (directory-file-name (file-name-directory (expand-file-name file-name)))))

(defun find-makefile (file-or-dir)
  "Searches for file `Makefile' in up to 3 parent dirs of `file-or-dir'."
  (let ((f "Makefile")
        (dir (file-name-directory file-or-dir)))
    (cl-loop for i from 1 to 3             ; try 3 dirs up
             if (file-exists-p (concat dir f))
             return dir
             else
             do (setq dir (parent-dir dir)))))

(defun makefile-targets (makefile)
  "Gathers alphanumeric makefile targets from `MAKEFILE'."
  (let ((targets '())
        (was-open (cl-find makefile (buffer-list) :key #'buffer-file-name :test #'string=))
        (buf (find-file-noselect makefile)))
    (with-current-buffer buf
      (goto-char (point-min))
      (while (re-search-forward "^\\([[:alnum:]].+?\\):\\(:?$\\| \\)" nil t)
        (add-to-list 'targets (car (split-string (match-string-no-properties 1) " " t)) t)))
    (unless was-open
      (kill-buffer buf))
    targets))

(defun combinate (xs ys combinator)
  "Combinate each x with each y using the given combinator."
  (cl-loop for x in xs
           append (cl-loop for y in ys
                           collect (funcall combinator x y))))

(defun range (end-or-start &optional end step)
  "Range of numbers from `START' to (including) `END' with stepwidth `STEP'.
If only one argument is supplied it will be the end, 0 will be start.
Mimicks Python's `range'"
  (let ((step (or step 1))
        (start (if end
                   end-or-start
                 0))
        (end (if end
                 end
               end-or-start)))
    (cl-loop for i from start to end by step
             collect i)))

(defun empty? (x)
  "Test if `x' is empty."
  (cl-typecase x
    (string (string= x ""))
    (list (null x))
    (vector (= (length x) 0))))

(defun pelm/org-wmean (values weights)
  "Sum `VALUES' weighted according to `WEIGHTS' and divide by the sum of `WEIGHTS'.
Tailored specific to org tables, i.e. input expected as strings and output are
strings."
  (cl-loop for v in values
           for w in weights
           unless (or (empty? v) (empty? w))
           sum (string-to-number w) into wsum
           collect (* (string-to-number v) (string-to-number w))
           into weighted-values
           finally (cl-return (let ((weighted-sum (/ (apply #'+ weighted-values) wsum)))
                                (if (= weighted-sum 0)
                                    ""
                                  (format "%.1f" weighted-sum))))))

(defmacro turn-on-file (mode)
  "Return a `turn-on' fun for given mode that only turns on in buffers that visit files."
  `(lambda ()
     (if buffer-file-name
         (,mode 1))))

;;; keybinding
(defun pelm/set-key (map spec cmd)
  "Set in `map' `spec' to `cmd'.

`Map' may be `'global' `'local' or a keymap.
A `spec' can be a `read-kbd-macro'-readable string or a vector."
  (let ((setter-fun (cl-case map
                      (global #'global-set-key)
                      (local  #'local-set-key)
                      (t      (lambda (key def) (define-key map key def)))))
        (key (cl-typecase spec
               (vector spec)
               (string (read-kbd-macro spec))
               (t (error "wrong argument")))))
    (funcall setter-fun key cmd)))

(defmacro defkeymap (symbol &rest mappings)
  "Define keymap bound to `symbol'.
See `pour-mappings-to'"
  `(progn (unless (boundp ',symbol)
            (defvar ,symbol (make-sparse-keymap)))
          (fill-keymap ,symbol ,@mappings)))

(defun fill-keymap (keymap &rest mappings)
  "Fill `KEYMAP' with `MAPPINGS'.
See `pour-mappings-to'."
  (declare (indent defun))
  (pour-mappings-to keymap mappings))

(defun fill-keymaps (keymaps &rest mappings)
  "Fill `KEYMAPS' with `MAPPINGS'.
See `pour-mappings-to'."
  (declare (indent defun))
  (dolist (keymap keymaps keymaps)
    (let ((map (if (symbolp keymap)
                   (symbol-value keymap)
                 keymap)))
      (pour-mappings-to map mappings))))

(defmacro gen-fill-keymap-hook (keymap &rest mappings)
  "Build fun that fills `KEYMAP' with `MAPPINGS'.
See `pour-mappings-to'."
  (declare (indent defun))
  `(lambda () (fill-keymap ,keymap ,@mappings)))

(defmacro gen-local-fill-keymap-hook (&rest mappings)
  "Build fun that fills local keymap with `MAPPINGS'.
See `pour-mappings-to'."
  (declare (indent defun))
  `(lambda () (fill-keymap 'local ,@mappings)))

(defun pour-mappings-to (map mappings)
  "Calls `pelm/set-key' with `map' on every key-fun pair in `MAPPINGS'.
`MAPPINGS' is a list of string-fun pairs, with a `READ-KBD-MACRO'-readable string and a interactive-fun."
  (dolist (mapping (group mappings 2))
    (pelm/set-key map (car mapping) (cadr mapping)))
  map)

(defun group (lst n)
  "Group `LST' into portions of `N'."
  (let (groups)
    (while lst
      (push (take n lst) groups)
      (setq lst (nthcdr n lst)))
    (nreverse groups)))

(defun take (n lst)
  "Return atmost the first `N' items of `LST'."
  (let (acc '())
    (while (and lst (> n 0))
      (cl-decf n)
      (push (car lst) acc)
      (setq  lst (cdr lst)))
    (nreverse acc)))

(defmacro cmd (name &rest code)
  "Macro for shorter keybindings."
  `(progn
     (defun ,(intern (concat "cofi-cmd/" (symbol-name name))) ()
       (interactive)
       ,@code)
     ',(intern (concat "cofi-cmd/" (symbol-name name)))))

(defmacro cmd-arg (name args iflag &rest code)
  "Macro for shorter keybindings with argument.

For example:
  (cmd-arg foo (num) \"p\"
    (message \"num-prefix: %d\" num)"
  `(progn
     (defun ,(intern (concat "cofi-cmd/" (symbol-name name))) ,args
       (interactive ,iflag)
       ,@code)
     ',(intern (concat "cofi-cmd/" (symbol-name name)))))

(defun gen-extension-re (&rest extensions)
  "Generate a regexp that matches all `EXTENSIONS'."
  (concat "\\.\\("
          (mapconcat 'identity
                     extensions
                     "\\|")
          "\\)$"))

(defun pelm/var-file (filename)
  (format "~/var/%s" filename))

(defun add-major-mode (re mode)
  "Add new major-mode alist-pair."
  (pushnew (cons re mode) auto-mode-alist))

(defmacro catch-error-hook (&rest body)
  "Create function suitable for hooks and catching errors."
  `(lambda ()
     (ignore-errors
       ,@body)))

(defmacro p (&rest body)
  "Create anonymous predicate"
  `(lambda (x)
    ,@body))

(cl-defstruct (pelm/ring
               (:constructor nil)
               (:constructor pelm/make-ring (vec &key curr))
               (:conc-name pelm/ring--))
  "Constant ring buffer."
  vec curr)

(defun pelm/ring-current (ring)
  "Current element of `RING'."
  (let ((curr (pelm/ring--curr ring)))
    (aref (pelm/ring--vec ring)
          (or curr 0))))

(defun pelm/ring-next (ring)
  "Next element of `RING'."
  (let ((next (mod (1+ (or (pelm/ring--curr ring)
                           -1))
                    (pelm/ring-length ring))))
    (setf (pelm/ring--curr ring) next)
    (aref (pelm/ring--vec ring) next)))

(defun pelm/ring-length (ring)
  "Length of `RING'."
  (length (pelm/ring--vec ring)))

(defun flatten (xs)
  "Flattens `XS' into a single list."
  (cond
   ((null xs) nil)
   ((listp xs) (append (flatten (car xs)) (flatten (cdr xs))))
   (t (list xs))))

(defun get-equal (x)
  "Return a suitable equal fun for `X'."
  (typecase x
    (string             #'string=)
    (character          #'char-equal)
    ((or integer float) #'=)
    (t                  #'equal)))

(defun library-byte-compiled-p (library)
  "Test if library is byte-compiled."
  (string-match-p "\\.elc$" (locate-library library)))

(cl-defun find-index (x xs &key (test (get-equal x)))
  "Alike `cl-find' but return index.
Returns nil if `X' not in `XS'."
  (cl-loop for a being the elements of xs
           count t into i
           do (if (funcall test a x)
                  (cl-return (1- i)))
           finally (cl-return nil)))

(defun def-assoc (key alist default)
  "Return cdr of `KEY' in `ALIST' or `DEFAULT' if key is no car in alist."
  (let ((match (assoc key alist)))
    (if match
        (cdr match)
      default)))

(defun ends-with (string end)
  "Return if `STRING' ends with `END'."
  ;; ignore error if string smaller than end
  (ignore-errors
    (string= end
             (substring string (- (length end))))))

(defun begins-with (string begin)
  "Return if `STRING' begins with `BEGIN'."
  ;; ignore error if string smaller than begin
  (ignore-errors
    (string= begin
             (substring string 0 (length begin)))))

(defun byte-compile-config-on-save ()
  "Compile elisp files in the emacs.d dir unless they are themes."
  (let ((fname (buffer-file-name)))
    (when (string-match "emacs\\.d/plugis/.*\\.el$" fname)
      (byte-compile-file fname))))

(defun f-alt (&rest alternatives)
  "Test functions in `alternatives' and return first bound."
  (catch 'found
    (dolist (f alternatives)
      (if (functionp f)
          (throw 'found f)))))

(defmacro pour-lists (place &rest lists)
  "Append `LISTS' in front of list at `PLACE'."
  `(setq ,place (append ,@lists ,place)))

(defmacro on-full-instance (&rest body)
  `(when pelm/full-emacs
     ,@body))

(defmacro on-comm-instance (&rest body)
  `(when pelm/comm-instance
     ,@body))

(cl-defun pelm/contains-any (lst test &optional (test-fun #'memq))
  "Test if `lst' contains any of `test'."
  (cl-loop for x in test
           thereis (funcall test-fun x lst)))

(defun pelm/pos-in-string-p (pos)
  (let ((face-props (get-text-property pos 'face)))
    (pelm/contains-any (if (listp face-props)
                           face-props
                         (list face-props))
                       '(font-lock-doc-face
                         font-lock-string-face))))

(defun pelm/pos-in-comment-p (pos)
  (let ((face-props (get-text-property pos 'face)))
    (pelm/contains-any (if (listp face-props)
                           face-props
                         (list face-props))
                       '(font-lock-comment-face))))

(defun nuke-all-buffers ()
  "Kill all buffers, leaving *scratch* only."
  (interactive)
  (mapc
   (lambda (x)
     (kill-buffer x))
   (buffer-list))
  (delete-other-windows))

(defun open-line-below ()
  "Open a line below the line the point is at.
Then move to that line and indent accordning to mode"
  (interactive)
  (cond ((or (eq major-mode 'coffee-mode) (eq major-mode 'feature-mode))
         (let ((column
                (save-excursion
                  (back-to-indentation)
                  (current-column))))
           (move-end-of-line 1)
           (newline)
           (move-to-column column t)))
        (t
         (move-end-of-line 1)
         (newline)
         (indent-according-to-mode))))

(defun open-line-above ()
  "Open a line above the line the point is at.
Then move to that line and indent accordning to mode"
  (interactive)
  (cond ((or (eq major-mode 'coffee-mode) (eq major-mode 'feature-mode))
         (let ((column
                (save-excursion
                  (back-to-indentation)
                  (current-column))))
           (move-beginning-of-line 1)
           (newline)
           (forward-line -1)
           (move-to-column column t)))
        (t
         (move-beginning-of-line 1)
         (newline)
         (forward-line -1)
         (indent-according-to-mode))))

;; NOTE: (region-beginning) and (region-end) are not saved in
;; variables since they can change after each clean step.
(defun clean-up-buffer-or-region ()
  "Untabifies, indents and deletes trailing whitespace from buffer or region."
  (interactive)
  (save-excursion
    (unless (region-active-p)
      (mark-whole-buffer))
    (untabify (region-beginning) (region-end))
    (indent-region (region-beginning) (region-end))
    (save-restriction
      (narrow-to-region (region-beginning) (region-end))
      (delete-trailing-whitespace))))

(defun back-to-indentation-or-beginning-of-line ()
  "Moves point back to indentation if there is any
non blank characters to the left of the cursor.
Otherwise point moves to beginning of line."
  (interactive)
  (if (= (point) (save-excursion (back-to-indentation) (point)))
      (beginning-of-line)
    (back-to-indentation)))

(defun match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1))
        ((looking-back "\\s\)") (backward-list 1))
        (t (self-insert-command arg))))

(defun duplicate-current-line-or-region (arg)
  "Duplicates the current line or region ARG times.
If there's no region, the current line will be duplicated. However, if
there's a region, all lines that region covers will be duplicated."
  (interactive "p")
  (let (beg end (origin (point)))
    (if (and (region-active-p) (> (point) (mark)))
        (exchange-point-and-mark))
    (setq beg (line-beginning-position))
    (if (region-active-p)
        (exchange-point-and-mark))
    (setq end (line-end-position))
    (let ((region (buffer-substring-no-properties beg end)))
      (dotimes (i arg)
        (goto-char end)
        (newline)
        (insert region)
        (setq end (point)))
      (goto-char (+ origin (* (length region) arg) arg)))))

(defun swap-windows ()
  "If you have 2 windows, it swaps them."
  (interactive)
  (cond ((/= (count-windows) 2)
         (message "You need exactly 2 windows to do this."))
        (t
         (let* ((w1 (first (window-list)))
                (w2 (second (window-list)))
                (b1 (window-buffer w1))
                (b2 (window-buffer w2))
                (s1 (window-start w1))
                (s2 (window-start w2)))
           (set-window-buffer w1 b2)
           (set-window-buffer w2 b1)
           (set-window-start w1 s2)
           (set-window-start w2 s1))))
  (other-window 1))

(defun rename-this-buffer-and-file ()
  "Renames current buffer and file it is visiting."
  (interactive)
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
        (error "Buffer '%s' is not visiting a file!" name)
      (let ((new-name (read-file-name "New name: " filename)))
        (cond ((get-buffer new-name)
               (error "A buffer named '%s' already exists!" new-name))
              (t
               (rename-file filename new-name 1)
               (rename-buffer new-name)
               (set-visited-file-name new-name)
               (set-buffer-modified-p nil)
               (message "File '%s' successfully renamed to '%s'" name (file-name-nondirectory new-name))))))))

(defun delete-this-buffer-and-file ()
  "Removes file connected to current buffer and kills buffer."
  (interactive)
  (let ((filename (buffer-file-name))
        (buffer (current-buffer))
        (name (buffer-name)))
    (if (not (and filename (file-exists-p filename)))
        (error "Buffer '%s' is not visiting a file!" name)
      (when (yes-or-no-p "Are you sure you want to remove this file? ")
        (delete-file filename)
        (kill-buffer buffer)
        (message "File '%s' successfully removed" filename)))))

(defun google ()
  "Googles a query or region if any."
  (interactive)
  (browse-url
   (concat
    "http://www.google.com/search?ie=utf-8&oe=utf-8&q="
    (if (region-active-p)
        (buffer-substring (region-beginning) (region-end))
      (read-string "Query: ")))))

(defun comment-or-uncomment-current-line-or-region ()
  "Comments or uncomments current current line or whole lines in region."
  (interactive)
  (save-excursion
    (let (min max)
      (if (region-active-p)
          (setq min (region-beginning) max (region-end))
        (setq min (point) max (point)))
      (comment-or-uncomment-region
       (progn (goto-char min) (line-beginning-position))
       (progn (goto-char max) (line-end-position))))))

(defun join-line-or-lines-in-region ()
  "Join this line or the lines in the selected region."
  (interactive)
  (cond ((region-active-p)
         (let ((min (line-number-at-pos (region-beginning))))
           (goto-char (region-end))
           (while (> (line-number-at-pos) min)
             (join-line))))
        (t (call-interactively 'join-line))))

(defun scroll-down-five ()
  "Scrolls down five rows."
  (interactive)
  (scroll-down 5))

(defun scroll-up-five ()
  "Scrolls up five rows."
  (interactive)
  (scroll-up 5))

(defun re-builder-large ()
  "Just like `re-builder', only make the font and window larger."
  (interactive)
  (re-builder)
  (text-scale-increase 5)
  (set-window-text-height (selected-window) 7))

(defun url-decode-region (beg end)
  (interactive "r")
  (let ((content (url-unhex-string (buffer-substring beg end))))
    (goto-char end)
    (newline)
    (insert content)))

(defun url-encode-region (beg end)
  (interactive "r")
  (let ((content (url-hexify-string (buffer-substring beg end))))
    (goto-char end)
    (newline)
    (insert content)))

(defun dired-open-marked-files ()
  "Open marked files."
  (interactive)
  (let ((distinguish-one-marked nil))
    (mapc 'find-file
          (dired-map-over-marks (dired-get-file-for-visit)
                                current-prefix-arg))))

(defun find-project-root (dir)
  (f--up (f-dir? (f-expand ".git" it)) dir))

(defun projectile-completion-fn (prompt choises)
  "Projectile completion function that only shows file name.

If two files have same name, new completion appears to select between
them. These include the path relative to the project root."
  (interactive)
  (let* ((stripped-choises
          (-uniq (--map (file-name-nondirectory it) choises)))
         (choise
          (ido-completing-read prompt stripped-choises))
         (matching-files
          (-filter
           (lambda (file)
             (equal (file-name-nondirectory file) choise))
           choises)))
    (if (> (length matching-files) 1)
        (ido-completing-read prompt matching-files)
      (car matching-files))))


(if (fboundp 'with-eval-after-load)
    (defmacro after (feature &rest body)
      "After FEATURE is loaded, evaluate BODY."
      (declare (indent defun))
      `(with-eval-after-load ,feature ,@body))
  (defmacro after (feature &rest body)
    "After FEATURE is loaded, evaluate BODY."
    (declare (indent defun))
    `(eval-after-load ,feature
       '(progn ,@body))))


(defmacro lazy-major-mode (pattern mode)
  "Defines a new major-mode matched by PATTERN, installs MODE if necessary, and activates it."
  `(add-to-list 'auto-mode-alist
                '(,pattern . (lambda ()
                             (require-package (quote ,mode))
                             (,mode)))))

(defun require-package (package)
  "Install given PACKAGE."
  (unless (package-installed-p package)
    (unless (assoc package package-archive-contents)
      (package-refresh-contents))
    (package-install package)))

(provide 'pelm-defuns)
;;; pelm-defuns.el ends here

