;; -*- mode: newlisp -*-

;; To address your request, here is a newlisp script example 
;; for a logistic model where the carrying capacity varies randomly, 
;; particularly focusing on the effect on small populations. This example 
;; incorporates random variation in carrying capacity using a uniform 
;; distribution similar to MATLAB's rand(1).

;; The logistic model is defined as:

;; $$
;; P_{t+1} = P_t + r \cdot P_t \cdot \left(1 - \frac{P_t}{K_t}\right)
;; $$

;; where:
;; - $$ P_t $$ is the population at time $$ t $$,
;; - $$ r $$ is the intrinsic growth rate,
;; - $$ K_t $$ is the carrying capacity at time $$ t $$ which varies randomly.

;; In newlisp, we simulate $$ K_t = 10 + \text{rand}()$$ where rand() generates a random number between 0 and 1.

;; Here is the content for the requested file medium_names.lisp in newlisp syntax:

;; ```lisp
;; medium_names.lisp - Logistic model with random carrying capacity in newlisp

(define (logistic-random-capacity r P0 T)
  ;; r: growth rate
  ;; P0: initial population
  ;; T: number of time steps
  (define P (vector P0))
  (for (t 1 (- T 1))
    (let ((K (+ 10 (rand)))) ; carrying capacity varies between 10 and 11
      (define Pt (vector-ref P (- t 1)))
      (define Pt1 (+ Pt (* r Pt (- 1 (/ Pt K)))))
      (vector-set! P t (max Pt1 0)))) ; prevent negative population
  P)

;; Example usage:
;; Set parameters
(define r 0.4)     ; growth rate
(define P0 1)      ; small initial population
(define T 50)      ; simulate 50 time steps

(define population (logistic-random-capacity r P0 T))

;; Print population over time
(for (i 0 (- T 1))
  (println (format "Time ~a: Population = ~a" i (vector-ref population i))))
;; ```

;; This script simulates the population dynamics using the logistic equation with a randomly varying carrying capacity between 10 and 11, showing how the population evolves across 50 time steps starting from a small population of 1. The effect of randomness in carrying capacity on small populations can be observed through the printed population values over time.

;; This approach aligns with the MATLAB function rand(1) usage you mentioned and suits exploration of random environmental effects on population growth in the logistic model.[1][3]

;; If you want, this can be adapted further to include normally distributed variation (randn equivalent) or different parameter values.

;; [1](https://mathinsight.org/environmental_carrying_capacity)
;; [2](https://nou.edu.ng/coursewarecontent/CIT478.pdf)
;; [3](https://jonesor.github.io/BB512_Book/basic-logistic-population-growth.html)
;; [4](https://www.csail.mit.edu/sites/default/files/2022-10/moses_memoirs.pdf)
;; [5](https://www.khanacademy.org/science/ap-biology/ecology-ap/population-ecology-ap/a/exponential-logistic-growth)
;; [6](https://math.libretexts.org/Bookshelves/Calculus/Calculus_(OpenStax)/08:_Introduction_to_Differential_Equations/8.04:_The_Logistic_Equation)
;; [7](https://www.opentextbooks.org.hk/ditatopic/35685)
;; [8](https://www.sciencedirect.com/science/article/abs/pii/S0040162599000220)
;; [9](https://journal.austms.org.au/ojs/index.php/ANZIAMJ/article/view/1058/999)
;; [10](https://pubmed.ncbi.nlm.nih.gov/32621114/)
