# Lenguajes de Programación, 2019-2

## Práctica 5: Análisis semántico

**Fecha de entrega: 11 de marzo de 2019**

### Descripción
La práctica consiste en completar correctamente el cuerpo de las funciones faltantes de los archivos `interp.rkt` y `practica5.rkt` que pertmiten implementar un analizador semántico sencillo (intérprete) para el lenguaje de programación `LDP`. La gramática del lenguaje `LDP`, se mantiene de la Práctica 4 y se muestra a continuación:

```
<expr> ::= <id>
         | <num>
         | {<binop> <expr> <expr>}
         | {with {<id> <expr>} <expr>}
         
<id> ::= A | B | ... | a | ... | z | aa | ...
         (Cualquier combinación de caracteres alfanumérica)
         
<num> ::= ... | -1 | 0 | 1 | ...
         (Cualquier número entero)
         
<binop> ::= + | - | * | /         
 ```        

### Entrega

La práctica debe descargarse y entregarse mediante el repositorio destinado a esta práctica en la plataforma
GitHub Classroom: https://classroom.github.com/g/oMVzAKEf.

### Ejercicios

**Ejercicio 1** Completar el cuerpo de la función `subst` dentro del archivo `interp.rkt` que realiza la sustitución textual de expresiones de tipo `WAE`. Por ejemplo,
```racket
(subst (id 'foo) 'foo (num 2))                        = (num 2)
(subst (id 'foo) 'bar (num 2))                        = (id 'foo)
(subst (num 1729) 'foo (num 2))                       = (num 1729)
(subst (binop + (id 'foo) (num 1729)) 'foo (num 2))   = (binop + (num 2) (num 1729))
(subst (with 'foo (id 'foo) (id 'foo)) 'foo (num 2))  = (with 'foo (num 2) (id 'foo))
(subst (with 'bar (id 'foo) (id 'foo)) 'foo (num 2))  = (with 'bar (num 2) (num 2))
```

```racket
;; Función que realiza la sustitución textual de expresiones de tipo WAE.
;; subst: WAE symbol WAE -> WAE
(define (subst sexp)
   #| Aquí va su código. |#)
```   

**Ejercicio 2** Completar el cuerpo de la función `interp` dentro del archivo `interp.rkt` que recibe un Árbol de Sintaxis Abstracta (ASA) y regresa el resultado de evaluar la expresión, es decir un número (`number`). Por ejemplo,

```racket
(interp (id 'foo))                                   = (error 'interp "Free Identifier")
(interp (num 1729))                                  = 1729
(interp (binop + (num 2) (num 3)))                   = 5
(interp (with 'a (num 2) (binop + (id 'a) (id 'a)))) = 4
```

```racket
;; Función que realiza el análisis semántico del lenguaje LDP.
;; interp: WAE -> number
(define (interp expr)
   #| Aquí va su código. |#)
```   

**Ejercicio 3** Usando los aspectos imperativos de Racket, modificar la función `main`, definida en la Práctica 4 para que realice los siguientes pasos.

1. Dar la bienvenida al usuario.   

   ```racket
   (λ) ¡Bienvenido a LDP v1.0!
   ```
   
2. Pasar al siguiente renglón en espera de que el usuario escriba una expresión.   

   ```racket
   (λ) ¡Bienvenido a LDP v1.0!
   (λ) 
   ```
   
3. Leer la expresión dada por el usuario usando la primitiva `read`.      

   ```racket
   (λ) {+ 1 2}
   ```
   
4. Una vez que se leyó la expresión, ésta debe ser pasada a la función `check-syntax`, definida en la Práctica 4, y en caso de que la función regrese `#f` como salida, indicar al usuario que ocurrió un error de sintaxis, en caso contrario, regresar la interpretación de la expresión mediante la función `interp` definida en el Ejercicio 2.

   ```racket
   (λ) {+ 1 2}
   3
   (λ) {1 2 3}
   Ocurrió un error de sintaxis.
   ```
