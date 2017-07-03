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
