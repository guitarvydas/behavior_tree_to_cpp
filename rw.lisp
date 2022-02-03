;; (ql:quickload :cl-json)
;; (ql:quickload :quri)
(defparameter *component-as-json* "/Users/tarvydas/projects/t2py/component.json")
(defparameter *script* "/Users/tarvydas/projects/t2py/script.lisp")


;; from https://riptutorial.com/common-lisp/example/19473/reading-and-writing-entire-files-to-and-from-strings
(defun read-file (infile)
  (with-open-file (instream infile :direction :input :if-does-not-exist nil)
    (when instream 
      (let ((string (make-string (file-length instream))))
        (read-sequence string instream)
        string))))

(defun run ()
  (with-open-file (inf *component-as-json* :direction :input)
    (let ((s (read-file inf)))
      (let ((strm (make-string-input-stream s)))
        (let ((json-input (cl-json::decode-json strm)))
          (with-open-file (fscript *script* :direction :input)
            (let ((script (read fscript)))
              (interpret-script script json-input)))))))
  (values))

(defun interpret-script (script object)
  (when script 
    (let ((command (first script)))
      (cond 
            ((eq 'program command)
             (map-json-array object
                             #'(lambda (sub-object)
                                 (map-script (cdr script) #'(lambda (sub-script) (interpret-script sub-script sub-object)))))) ;; cdr down complete script

            ((eq 'foreach command) (let ((field-name (make-field-name (second script)));; interpret sub-tree (sub-script) on object.field-name
                                         (sub-script (third script)))
                                     (let ((field (get-field object field-name)))
                                       (interpret-script sub-script field))))

            ((eq 'textblock command) (map-script (cdr script) #'(lambda (sub-script) (interpret-textblock sub-script object))))

            (t (error "illegal command"))))))

(defun interpret-textblock (script object)
  (when script
    (let ((command (first script))
          (arg (second script)))
      (cond
       ((eq 'text command) (output arg))
       ((eq 'fieldref command) (output (get-field object arg)))
       ((eq 'tosref command) (output object))
       (t (error "illegal textblock command"))))))

(defun output (x)
  (format *standard-output* "~a" (quri::url-decode x)))
;;;   (when (string= "%0A" (last3chars x))
;;;     (format *standard-output* "~%")))

(defun map-json-array (array-object func)
  (mapc func array-object))

(defun map-script (script-list func)
  (mapc func script-list))

;;; (defun last3chars (s)
;;;   (let ((len (length s)))
;;;     (if (> 3 len)
;;;         ""
;;;       (if (= 3 len)
;;;           s
;;;         (subseq s (- len 3) len)))))

;;;  (defun make-field-name (symbol)
;;;   (intern (symbol-name symbol) "KEYWORD"))

(defun get-field (json-object field-name)
  (assoc field-name json-object))