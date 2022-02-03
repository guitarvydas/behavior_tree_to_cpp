(defparameter *component-as-json* "/Users/tarvydas/projects/t2py/component.json")

;; from https://riptutorial.com/common-lisp/example/19473/reading-and-writing-entire-files-to-and-from-strings
(defun read-file (infile)
  (with-open-file (instream infile :direction :input :if-does-not-exist nil)
    (when instream 
      (let ((string (make-string (file-length instream))))
        (read-sequence string instream)
        string))))

(defun run ()
  (with-open-file (inf *component-as-json* :direction :input)
    (read-file inf)))