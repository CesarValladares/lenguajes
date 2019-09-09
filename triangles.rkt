#|

Temperature converter

César Armando Valladares Martínez

02-sep-2019
|#

(define (aux a b c)
    (/ (+ a b c) 2)
)

(define (area a b c)
    (sqrt (* (aux a b c) (- (aux a b c) a) (- (aux a b c) b) (- (aux a b c) c)))
)