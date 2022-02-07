#+nil(progn
  (ql:quickload :alexandria)
  (ql:quickload :cl-ppcre)
  (ql:quickload :cl-json)
  (ql:quickload :quri)
  )

;; Cl-json conversions:
;; esp. JSON array -> lisp alist
;;      JSON object -> lisp alist
;;      key -> lisp keyword (symol interned in "KEYWORD" namespace)
;;      JSON string -> lisp string
;;      JSON true/false -> T / NIL resp.
;;      JSON number -> lisp integer

(defun fjoin (a b)
  (concatenate 'string a b))

;; (defun xcall (func &optional x y z)
;;   (funcall func x y z))

;; (defun fcall (func &optional x y z)
;;   (cond ((and (boundp 'x) (boundp 'y) (boundp 'z)) (funcall func x y z))
;;         ((and (boundp 'x) (boundp 'y)) (funcall func x y))
;;         ((and (boundp 'x)) (funcall func x))
;;         (t (funcall func))))

(defun constant (x)
  x)

(defun _edit (text re replacement)
  (cl-ppcre::regex-replace-all re text replacement :preserve-case t))

(defun edit (text replacement)
  ;; replace /@/g with replacement
  (_edit text "@" replacement))

(defun edit1 (text replacement)
  ;; replace /@1/g with replacement
  (_edit text "@1" replacement))

(defun edit2 (text replacement)
  ;; replace /@2/g with replacement
  (_edit text "@2" replacement))

(defun edit3 (text replacement)
  ;; replace /@3/g with replacement
  (_edit text "@3" replacement))

(defun select (obj field-as-string)
  ;; obj is a JSON style object as produced by cl-json (i.e. an alist)
  (let ((field (intern (string-upcase field-as-string) "KEYWORD")))
    (let ((pair (assoc field obj)))
      (if pair
	  (cdr pair)
	  (assert nil)))))


(defun join-strings-with-newlines (slist)
  ;; slist is a list of strings (or NIL)
  ;; return one string, concatenate all strings with newlines in between
  (if slist
    (format nil "~s~%" (car slist) (join-strings-with-newlines (cdr slist)))
    ""))


;;//// main 

(defun box7 ()
  (constant "
#include \"behaviortree_cpp_v3/bt_factory.h\"

// file that contains the custom nodes definitions
#include \"dummy_nodes.h\"

int main()
{
  using namespace DummyNodes;

  BehaviorTreeFactory factory;

@

  auto tree = factory.createTreeFromFile(\"./my_tree.xml\");

  tree.tickRoot();
  return 0;
}
"))


;;//// end main

;;/// class
(defun box915 ()
  (constant "
class @1 : public SyncActionNode
{
public:
  @1(const std::string& name, const NodeConfiguration& config)
    : SyncActionNode(name, config)
  {
  }

@2

@3
};
}
"))

(defun box916 (attext text)
  (edit1 text attext))

(defun box914 (attext)
  (box916 attext (box915)))

(defun box810 (component)
  (box914 (select component "name")))

;;////// ports

(defun box24 (item)
  (box25 item (box26)))

(defun box23 (list)
  (join-strings-with-newlines (mapcar #'(lambda (item) (box24 item)) list)))

(defun box22 (item)
  (box23 (select item "inputs")))

(defun box25 (at text)
  (edit text at))

(defun box26 ()
  (constant "ports.insert( BT::InputPort<std::string>(\"@\"));"))




(defun box74 (item)
  (box75 item (box76)))

(defun box73 (list)
  (join-strings-with-newlines (mapcar #'(lambda (item) (box74 item)) list)))

(defun box72 (item)
  (box73 (select item "outputs")))

(defun box75 (at text)
  (edit text at))

(defun box76 ()
  (constant "ports.insert( BT::OutputPort<std::string>(\"@\"));"))

(defun box50 (A B)
  (fjoin A B))

(defun box51 (attext text)
  (edit text attext))

(defun box52 ()
  (constant "
static PortsList providedPorts () {
    PortsList ports;
    @
    return ports;
}
"))

(defun box21 (component)
    (box51 
     (box50 (box22 component)
            (box72 component))
     (box52)))

;;////////// end ports


;;////////// tick
(defun remove_nbsp (s) 
  s) ;; no-op for now (during bootstrap POC)

(defun decodeURIComponent (s)
  (quri::url-decode s))

(defun box932 (item)
  (decodeURIComponent
	 (remove_nbsp (select item "lines"))))

;;////////// end tick

;;///////// for each component
(defun box150 (text at2text)
  (edit2 text at2text))

(defun box160 (text at3text)
  (edit3 text at3text))

(defun box180 (list)
  (when list
    (let ((component (car list)))
      (when component
        (let ((clssports (box150
                          (box810 component)
                          (box21 component))))
          (let ((clssportstick (box160
                                clssports
                                (box932 component))))
            (join-strings-with-newlines (list clssportstick
                                              (box180 (cdr list))))))))))
;;///////// end for each component


;;//////// top
(defun box170 (text attext)
  (edit text attext))

(defun main ()
  (let ((json-components (alexandria:read-file-into-string (asdf:system-relative-pathname :emitcpp "component.json"))))
    (with-input-from-string (strm json-components)
    (let ((components (cl-json:decode-json strm)))
      (let ((string-main (box7)))
        (let ((string-instances (box180 components)))
          (let ((string-joined (box170 string-main string-instances)))
            (format *standard-output* "~s" string-joined))))))))
