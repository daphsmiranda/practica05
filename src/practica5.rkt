#lang plai

(require "grammars.rkt")
(require "parser.rkt")
(require "interp.rkt")

;; Función que indica si una expresión es correcta sintácticamente o
;; no.
;; check-syntax: s-expression -> boolean
(define (check-syntax sexp)
    #| Aquí va su código |# )

;; Función encargada de ejecutar el intérprete para que el usuario interactúe con el lenguaje. Para
;; diferenciar el prompt de Racket del nuestro, usamos "(λ)". Aprovechamos los aspectos imperativos
;; del lenguaje para esta función.
(define (main)
    #| Aquí va su código. |#)

;; Llamada a la función
(main)
