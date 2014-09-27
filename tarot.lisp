23
;(defparameter awol-cards (make-hash-table))


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

(defun guess-path (card)
  (with-output-to-string (str)
    (format str "images/~a~a.png"
	    (third card)
	    (write-to-string (second card)))))
