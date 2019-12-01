#|

Homework 1

César Armando Valladares Martínez

A01023506

|#

(define (squareR a b c)     ; Square Root 
    (sqrt 
        (- (* b b) (* 4 a c) )  ; Return sqrt of the operation inside 
    )
)

(define (result a b c)      ; Final operation
    (cons                   ; Return a list with 2 posible values
        (/ (+ (- 0.0 b) (squareR a b c)) (* 2 a)) ; Sum option
        (/ (- (- 0.0 b) (squareR a b c)) (* 2 a)) ; Rest option 
    )
)

(define (quadratic a b c)
    (if (equal? a 0)
        (- 0 (/ c b))       ; Especial Case
        (result a b c)      ; Get 'x'
    )
)