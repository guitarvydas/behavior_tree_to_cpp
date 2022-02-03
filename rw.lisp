(defparameter *component-as-json* "/Users/tarvydas/projects/t2py/component.json")
(defparameter *script* "/Users/tarvydas/projects/t2py/rewrite.lisp")

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
              (interpret-script script json-input))))))))

(defun interpret-script (script object)
  (when script 
    (let ((command (first script))
          (arg (second script)))
      (cond ((eq 'program command) (iterate-json-array object #'(lambda (item) (interpret-script arg item)))) ;; cdr down complete object
            ((eq 'foreach command) (let ((field (second script))                                              ;; cdr down field of object
                                         (subscript (third script)))
                                     (iterate-json-array (slot-value object field) #'(lambda (item) (interpret-script subscript item)))))
            ((eq 'textblock command) (interpret-textblock arg object))
            (t (error "illegal command"))))))

(defun interpret-textblock (script object)
  (when script
    (let ((command (first script))
          (arg (second script)))
      (cond
       ((eq 'text command) (output arg))
       ((eq 'fieldfref command) (output (slot-value object arg)))
       ((eq 'tosref command) (output object))
       (t (error "illegal textblock command"))))))

(defun output (x)
  (format *standard-output* "~a" x))

(defun iterate-json-array (array-object func)
  (mapc func array-object))