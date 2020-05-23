#|
    Proyecto final
    Lenguajes de programación  
    César Armando Valladares Martínez 
    A01023506
|#

#lang racket

; Libreries
(require 2htdp/image)
(require picturing-programs)

; Funtion that generates a negative image from original
(define (apply-negative x y old-color)

    (make-color 
        (- 255 (color-red old-color))
        (- 255 (color-green old-color))
        (- 255 (color-blue old-color))))

; Function that generates dark image from original
(define (apply-dark x y old-color)

    (make-color 
        (round (/ (color-red old-color) 2))
        (round (/ (color-green old-color) 2))
        (round (/ (color-blue old-color) 2))))

; Function taht generates bright image from original, the top of each pixel is 255
(define (apply-birght x y old-color)

    (make-color 
        (if ( > (* 2 (color-red old-color)) 254)
            ( + (- 255 (color-red old-color)) (color-red old-color))
            (* 2 (color-red old-color))
        )
        (if ( > (* 2 (color-green old-color)) 254)
            ( + (- 255 (color-green old-color)) (color-green old-color))
            (* 2 (color-green old-color))
        )
        (if ( > (* 2 (color-blue old-color)) 254)
            ( + (- 255 (color-blue old-color)) (color-blue old-color))
            (* 2 (color-blue old-color))
        )
    )
)

; Function that generates a blur image from original
(define (apply-blur x y old-color)

    ; load the image again to get each pixel

    (define image (bitmap "dragon2.jpg"))
    ; (define pix (get-pixel-color x y image))
    (define red 0)
    (define green 0)
    (define blue 0)

    ; (thread (lambda ()
        ; Blur matrix
        (for ([i 3])
            (for ([j 3])  
                (define pixel (get-pixel-color (+ x (- i 1)) (+ y (- j 1)) image))
                (set! red (+ red (color-red pixel)))
                (set! green (+ green (color-green pixel)))
                (set! blue (+ blue (color-blue pixel)))
            )
        )   
    ; ))
    
    (set! red (round (/ red 9)))
    (set! green (round (/ green 9)))
    (set! blue (round (/ blue 9)))

    ; Generate the new pixel
    (make-color
        red
        green
        blue
    )
)

; Main funtion
(define (main)

    (define image (bitmap "dragon.jpg"))
    (define small (bitmap "dragon2.jpg"))

    ; (thread (lambda () 
        (define blur_image (map-image apply-blur small))
        (save-image blur_image "Blur.jpg")
    ; ))

    ; Each thread generates a new image and saves it 
    (thread (lambda () 
        (define new_image (map-image apply-negative image))
        (save-image new_image "Negative.jpg" )
    ))

    (thread (lambda () 
        (define new_image2 (map-image apply-dark image))
        (save-image new_image2 "Dark.jpg" )      
    ))

    (thread (lambda ()
        (define new_image3 (map-image apply-birght image))
        (save-image new_image3 "Bright.jpg" )
    ))
)
