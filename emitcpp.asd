(defsystem :emitcpp
  :depends-on (:alexandria :cl-json :cl-ppcre :quri)
  :around-compile (lambda (next)
                    (proclaim '(optimize (debug 3) (safety 3) (speed 0)))
                    (funcall next))
  :components ((:module "source"
                        :pathname "./"
                        :components ((:file "package")
                                     (:file "emitcpp" :depends-on ("package"))))))

