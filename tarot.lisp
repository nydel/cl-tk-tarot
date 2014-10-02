;(defparameter awol-cards (make-hash-table))



;;;;;;;;;;
;; #'draw is close to being functional
;; some say it doesn't need to be but i kinda don't care
;;;;;;;;;;

(defun draw (num)
  (let ((awol-cards (make-hash-table))
	(hand (list)))
    (loop
       for n = (1+ (random 78))
       unless (gethash n awol-cards) do
	 (setf (gethash n awol-cards) t)
	 (push n hand)
       until (= (length hand) num))
    hand))

(defun assoc-draw (&key draw deck)
  (let ((draw (if draw draw (draw 10)))
	(deck (if deck deck *crowleycards*)))
    (mapcar
     (lambda (draw-value)
       (assoc draw-value deck))
     draw)))


;;;;;;;;;
;; arbitrary messy & temporary card predicate
;; until we decide how cards, decks, spreads are treated
;; in terms of the CLOS etc
;;;;;;;;;

(defun cardp (list)
  (when (and
	 (listp list)
	 (integerp (first list))
	 (integerp (second list))
	 (stringp (third list))
	 (stringp (fourth list))
	 (pathnamep (fifth list)))
    t))

(defun guess-path (card)
  (with-output-to-string (str)
    (format str "images/~a~a.png"
	    (third card)
	    (write-to-string (second card)))))
