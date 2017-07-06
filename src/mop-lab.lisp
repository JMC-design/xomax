;; Set of functions that prints the methods, slots superclass(s) of an
;; object.


(defclass point ()
  ((x :initarg :x :accessor x :initform 0)
   (y :initarg :y :accessor y :initform 0)))

(defmethod move-point ((point point) translation)
  (setf (x point) (nth 0 translation))
  (setf (y point) (nth 1 translation)))

(defparameter *point* (make-instance 'point))

(defun print-slots (object)
  (let (result)
  (dolist  (slot (sb-mop:class-direct-slots (class-of object)) result)
    (push (sb-mop:slot-definition-name slot) result))))

;; print all non-access methods supported by the class of object.
(defun print-methods (object)
  (let ((result '())
	(accessors (print-slots object)))
    (dolist (f (sb-mop:specializer-direct-generic-functions
		(find-class (type-of object)))
	     result)
      (let* ((function-name-or-setf (sb-mop:generic-function-name f))
	     (function-name (if (listp function-name-or-setf)
				(cadr function-name-or-setf)
				function-name-or-setf)))
	(unless (member  function-name accessors)
	  (push function-name result))))))


















(dolist (f (sb-mop:specializer-direct-generic-functions
		  (find-class  (type-of *point*))))
    (pprint (sb-mop:generic-function-name f)))



      
  (do-symbols (s (symbol-package (type-of object)))
    (when (and (fboundp s))
;	       (typep s 'standard-method))
	(format t "class-of ~s~%" (typep (symbol-function s) 'standard-method)))))




  
  (sb-mop:lass-direct-subclasses (class-of 'standard-method)))


(defun collect-all-subclasses ()
  (sb-mop:class-direct-subclasses (find-class 'standard-method))



;; (defun define-cocktail-class (ingredients)
;;   (make-instance 'standard-class
;; 		 :name (gensym)
;; 		 :direct-superclasses (mapcar #'find-class ingredients)
;; 		 :direct-slots nil))

(defun define-cocktail-class (ingredients)
  (let* ((name (intern (string (gensym "COCKTAIL-"))))
	 (class (make-instance 'standard-class
			       :name name
			       :direct-superclasses (mapcar #'find-class ingredients)
			       :direct-slots nil)))
    (setf (find-class name) class)
    name
    ))





;; MOP Tutorial -- Exercise 1: Geometric point that keeps track of its
;;                 children.
;;
;; First lets describe the operations that we'd like

(defparameter point-1 (make-instance 'geometric-object :x 0 :y 0))
(defparameter point-2 (make-instance 'geometric-object :x 10 :y 10))

(setf (x point-1) 2)
(setf (x point-2) 12)

(setf (y point-1) 4)
(setf (y point-2) 14)

;; prints each child with its original coordinates
(get-children geometric-object)


;; Add a new slot to the class.
(defclass child-tracker-metalevel-class (standard-class)
  ((geometric-objecs :initform '() :reader geometric-objecs)))

(defclass geometric-object ()
  ((x :initform nil :accessor :x)
   (y :initform nil :accessor :y))
  (:metaclass child-tracker-metalevel-class))



(defclass persistent-metalevel-class2 (standard-class)
  ((checked-schema-congruence-p :initform NIL
				:reader class-checked-schema-congruence-p)))


(defclass hypertext-node ()
  ((contents :initform "" :accessor contents)
   (in-links :initform NIL)
   (out-links :initform NIL))
  (:metaclass persistent-metalevel-class2))


;; (validate-superclass
;;  SB-MOP:VALIDATE-SUPERCLASS

 (defclass our-class (standard-class)())

 (defclass note (standard-class)
   ((pitch :accessor pitch
	   :initarg :pitch
	   :initform 60
	   :documentation "Pitch in MIDI numbers"))
   (:documentation "A pitched note")
   (:metaclass our-class))

 ;; (make-instance 'note)


(ensure-class 'color-rectangle
	      :direct-superclasses (list (find-class 'color-mixin)
					 (find-class 'rectangle))
	      :direct-slots ())





(let (result)
  (dolist (slot
	    (sb-mop:class-direct-slots (class-of *point*))
	   result)
    (push  slot result)))

