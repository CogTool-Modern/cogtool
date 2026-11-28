;; Experimental test adapter for ACT-Touch revision 13. This file is not
;; loaded by CogTool. It exercises the six styles below, not the full device
;; and hand-position behavior required by a production integration.
(defun handle-style-request (motor spec)
  (declare (ignore motor))
  (let* ((style (chunk-spec-chunk-type spec))
         (features (case style
                     ((tap tap-hold tap-release) '(hand finger))
                     (swipe '(hand finger r theta num-fngrs))
                     (pinch '(hand finger start-width end-width))
                     (rotate '(hand finger rotation))
                     (otherwise nil)))
         (values (loop for feature in features collect
                       (if (slot-in-chunk-spec-p spec feature)
                           (verify-single-explicit-value
                            (chunk-spec-slot-spec spec feature) :motor style feature)
                           (case feature (hand 'right) (finger 'index) (num-fngrs 1))))))
    (if (or (null features) (member nil values))
        (print-warning "Missing or invalid feature in ~s request" style)
        (schedule-event-relative 0 style :destination :motor :module :motor
                                 :params (loop for feature in features for value in values
                                               append (list (intern (symbol-name feature) :keyword) value))))))
