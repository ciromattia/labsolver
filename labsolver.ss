;; gonano  Ciro_Mattia Gonano 0000122354
;; mseno   Mauro Seno         0000122360
;; mvillan Mattia Villan      0000122357

             ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
             ;;;;;;;; LABYRINTH SOLVER� - version 1.2 ;;;;;;;;
             ;;;;;;;;;;;;;; for Scheme language ;;;;;;;;;;;;;;;
             ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

              ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
              ;;;;;;;;;;;;;;;;;;;; AUTHORS ;;;;;;;;;;;;;;;;;;;
              ;;;;;;;;;;;;;; Gonano Ciro Mattia ;;;;;;;;;;;;;;
              ;;;;;;;;;;;;;;;;;; Seno Mauro ;;;;;;;;;;;;;;;;;;
              ;;;;;;;;;;;;;;;;; Villan Mattia ;;;;;;;;;;;;;;;;
              ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; This program is freeware as it is.
;; None of its parts can be modified without the permission of the authors.
;; Enjoy with labyrinths!

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; REVISIONI E MODIFICHE ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                                                                         ;;
;;  LE VERSIONI CONSIDERATE "STABILI" O COMUNQUE CON INTRODUZIONI SIGNIFICATIVE A LIVELLO  ;;
;;  DI CODICE (FUNZIONI NUOVE, ECC...) VENGONO CONTRASSEGNATE CON UN INCREMENTO DI ALMENO  ;;
;;                               0.1 RISPETTO ALLA PRECEDENTE.                             ;;
;;   LE VERSIONI CON UN INCREMENTO MINORE (LETTERA MINUSCOLA DOPO IL NUMERO DI VERSIONE)   ;;
;;   SONO DA CONSIDERARE "INSTABILI", CON FUNZIONI DI PROVA, O CON MODIFICHE SOLO LIEVI    ;;
;;                                        AL CODICE.                                       ;;
;;      SARANNO SEMPRE DISPONIBILI L'ULTIMA VERSIONE "STABILE" E L'ULTIMA "INSTABILE".     ;;
;;                                                                                         ;;  
;; versione 0.1 -> inserite la funzione principale di risoluzione "xcorso", la funzione    ;;
;;                          di avvio programma "risolvi", la funzione di ricerca della     ;;
;;                          entrata "find-start" e la funzione higher-order "extract",     ;;
;;                          per estrarre un elemento in posizione n da una lista           ;;
;;                          (l'elemento pu� essere un numero oppure una lista, dipende     ;;
;;                          dalla lista data)                                              ;;
;;                                                                                         ;;
;; versione 0.2 ->  inserita la funzione "count-el" per determinare elementi di una lista  ;;
;;                  modificata la funzione higher-order "extract", mantenuta valida solo   ;;
;;                          per operare su liste, e non su liste di liste                  ;;
;;                  implementata funzione "ex-list" analoga a "extract", per operare su    ;;
;;                          liste di liste                                                 ;;
;;                                                                                         ;;
;; versione 0.2a -> inserito l'argomento "npasso" nella funzione "xcorso" per determinare  ;;
;;                          il numero di passi eseguiti fino a quel momento                ;;
;;                                                                                         ;;
;; versione 0.2b -> tolta la chiamata e ricerca per pos=1 e pos=2 in seguito alla          ;;
;;                          definizione per cui la prima e l'ultima colonna sono formate   ;;
;;                          solo da zeri                                                   ;;
;;                  inserita la cond di verifica dell'uscita (4)                           ;;
;;                                                                                         ;;
;; versione 0.2c -> SPERIMENTALE                                                           ;;
;;                  inserite le funzioni posdx, posun, possx, posov per snellire il codice ;;
;;                  inserite le funzione per lavorare i bivi "cross?" e "crosstype"        ;;
;;                  inserito l'argomento "croxx" nella funzione "xcorso" per avere una     ;;
;;                          lista di tutti gli incroci incontrati                          ;;
;;                  inserita la funzione "relist-2" che ridisegna una lista di liste       ;;
;;                          morfando un numero all'interno                                 ;;
;;                  inserita in via sperimentale la funzione "invway" che permette di fare ;;
;;                          �retromarcia� ripercorrendo la lista "croxx" di "xcorso"       ;;
;;                                                                                         ;;
;; versione 0.3 ->  completata e resa funzionante al 90% la funzione "invway"              ;;
;;                  inserite le funzioni di morphing "relist-5" e "relist-6" per gestire   ;;
;;                          correttamente i vari passaggi sulle celle                      ;;
;;                  rimossa la funzione "crosstype"                                        ;;
;;                  fixati la maggior parte di bugs delle vers. precedenti                 ;;
;;                                                                                         ;;
;; versione 0.4 ->  implementate le funzioni grafiche, la parte di GUI e di grafica        ;;
;;                  fixata la funzione "invway" con l'aggiunta dell'argomento "prev" alla  ;;
;;                          funzione "xcorso"                                              ;;
;;                  inserito l'argomento "prev" nella funzione "xcorso" per avere una      ;;
;;                          lista di tutte le �provenienze� delle varie celle.             ;;
;;                  inserita la funzione "roundup" che arrotonda per eccesso un numero     ;;
;;                          (servir� per le prossime implementazioni)                      ;;
;;                  inserite le definizioni di alcune costanti utilizzate dalle routines   ;;
;;                          grafiche                                                       ;;
;;                  ampliate le funzioni del tipo "relist" in previsione di prossime       ;;
;;                          implementazioni                                                ;;
;;                  aggiunto un autostart al programma finale                              ;;
;;                  funzioni grafiche commentate singolarmente                             ;;
;;                                                                                         ;;
;; versione 0.4a -> inserita la funzione "shade_rect" per disegnare lo sfondo della        ;;
;;                          finestra principale                                            ;;
;;                  inserita la legenda                                                    ;;
;;                  inserita la message box                                                ;;
;;                                                                                         ;;
;; versione 0.4b -> inseriti i bottoni e migliorata la legenda                             ;;
;;                  inserita la parte di interfaccia grafica anche sulla vp principale     ;;
;;                  parte grafica fixata al 70%                                            ;;
;;                  migliorata la funzione di ricerca soluzione                            ;;
;;                                                                                         ;;
;; versione 0.4c -> fixata completamente la parte grafica di interfaccia (bottoni)         ;;
;;                  completata la grafica della legenda                                    ;;
;;                  aggiunte numerose linee di commento per le sezioni pi� illeggibili     ;;
;;                                                                                         ;;
;; versione 0.4d -> quasi attiva al 100% la parte di ricerca e gestione soluzioni multiple ;;
;;                  completati tutti i messaggi e gli eventi mouse/tastiera                ;;
;;                                                                                         ;;
;; versione 1.0  -> attiva al 100% la parte di ricerca soluzioni multiple e il resto delle ;;
;;                          funzioni grafiche.                                             ;;
;;                  Versione NON ATTIVA.                                                   ;;
;;                                                                                         ;;
;; versione 1.1  -> riscontrati enormi problemi con la versione 1.0 (praticamente era      ;;
;;                          NON ATTIVA)                                                    ;;
;;                  versione di controllo, la versione ATTIVA dopo le dovute modifiche     ;;
;;                          sar� la 1.2                                                    ;;
;;                                                                                         ;;
;; versione 1.2  -> versione ATTIVA                                                        ;;
;;                  migliorato l'algoritmo di ricerca soluzioni multiple                   ;;
;;                  programma distribuibile                                                ;;
;;                                                                                         ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;; CONFIGURAZIONE LINGUAGGIO RICHIESTA ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                                                                         ;;
;; Il presente programma � stato sviluppato con PLT DrScheme v.103 usando costrutti        ;;
;; funzionali.                                                                             ;;
;; Le caratteristiche usate sono:                                                          ;;
;;                           - Language: Advanced Student                                  ;;
;;                           - Teachpacks:                                                 ;;
;;                                         + gui.ss                                        ;;
;;                                         + draw.ss                                       ;;
;;                                         + graphing.ss                                   ;;
;;                                                                                         ;;
;; Non si assicura il funzionamento con le specifiche del MIT Scheme (in particolar modo   ;;
;;     per la parte imperativa e per i comandi che sono stati modficiati da PLT)           ;;
;; E' possibile rendere funzionante il programma anche nella modalit� MrEd, avendo cura di ;;
;;     caricare la libreria graphics.ss                                                    ;;
;; Il programma NON E' funzionante con linguaggi di livello inferiore all'Advanced Student ;;
;;                                                                                         ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                                                                         ;;
;; Definizione del tipo di dato "labirinto": un labirinto � una lista di liste di numeri.  ;;
;;                                                                                         ;;
;; Definizione del tipo di dato "soluzione": una soluzione � una lista di liste di numeri. ;;
;;                                                                                         ;;
;; Tali numeri sono identificativi del tipo della singola cella, e nella fattispecie:      ;;
;;                   0 -> muro                                                             ;;
;;                   1 -> strada libera                                                    ;;
;;                   2 -> strada risolutiva                                                ;;
;;                   3 -> entrata                                                          ;;
;;                   4 -> uscita                                                           ;;
;;                   5 -> vicolo cieco                                                     ;;
;;                   6 -> numero di "servizio", bivio ripassato                            ;;
;;                   9 -> numero di "servizio", sbarramento per soluzioni multiple         ;;
;;                                                                                         ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;; chiude la finestra "Canvas" ;;;
(close-viewport @VP)

;;;;;;;;;;;;;; INIZIALIZZAZIONE COSTANTI ;;;;;;;;;;;;;;;;;;

(define ROWS 1)
(define COLS 1)
(define CELL_H 1)
(define CELL_W 1)
(define LABY empty)
(define CLICK 1)
(define KEYPRESS 1)
(define POS_START 1)
(define POS_GOAL 1)
(define L-SOL empty)
(define L-SOL-NX empty)
(define BEST-SOL empty)
(define WORST-SOL empty)
(define GRAY1 (make-rgb 0.83 0.83 0.83))
(define GRAY2 (make-rgb 0.75 0.75 0.75))
(define GRAY3 (make-rgb 0.5 0.5 0.5))
(define COL_LEGENDA (make-rgb 0.21 0.93 0.89)) 
(define COL_WALL (make-rgb 0.0 0.0 1.0))
(define COL_WAY (make-rgb 0.95 0.98 0.43))
(define COL_SOLN (make-rgb 0.66 0.66 0.08))
(define COL_START (make-rgb 1.0 0.0 0.0))
(define COL_GOAL (make-rgb 1.0 0.56 0.0))
(define COL_WRONGWAY (make-rgb 0.75 0.75 0.75))
(define COL_CROSSW (make-rgb 0.51 0.5 0.5))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;; FUNZIONI GENERALI DI SUPPORTO ;;;;;;;;;;;;;;;

;; arrotonda per eccesso un numero x;;

;;roundup: numero->numero;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (roundup x)
  (local ((define (rup x y)
            (cond
              [(and (>= x 0) (< x 1.0)) (+ x y)]
              [(>= x 1.0) (rup (- x 1.0) y)]
              [else (rup (+ x 1.0) y)])))
    (rup (- 1.0 x) x)))

;; conta le ricorrenze di un numero in una lista;;

;;howmany: numero, lista-di-numeri-> numero;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (howmany n list)
  (local ((define (how-many n list acc)
            (cond
              [(empty? list) acc]
              [(= n (first list))(how-many n (rest list) (+ 1 acc))]
              [else (how-many n (rest list) acc)])))
    (how-many n list 0)))

;; estrae l'ultimo elemento da una lista;;

;;last: lista-di-numeri -> numero;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (last l)
  (cond
    [(empty? (rest l))(first l)]
    [else (last (rest l))]))

;; restituisce una lista togliendo l'ultimo elemento;;

;;cutlast: lista-di-numeri->lista-di-numeri;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (cutlast l)
  (cond
    [(empty? (rest l)) empty]
    [else (cons (first l) (cutlast (rest l)))]))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; funzione relist ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ridisegna la lista di liste s cambiando l'elemento ;;
;; in posizione pos della lista row in un elemento x ;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;relist: numero,numero,lista-di-liste-di-numeri,numero->lista-di-numeri;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (relistX row pos s x)
  (cond
    [(empty? (first s)) (error 'debug_relistX "empty first s")]
    [(empty? (rest s)) (error 'debug_relistX "only a list left in s")]
    [(= row 1) (cons (cambia_in_X pos (first s) x) (rest s))]
    [else (cons (first s) (relistX (- row 1) pos (rest s) x))]))

;;cambia_in_X: numero, lista-di-numeri, numero->lista-di-numeri;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (cambia_in_X n list x)
  (cond
    [(empty? list) empty]
    [(= n 1)(cond
              [(= x 2)(cond
                        [(= 3 (first list)) (cons 3 (rest list))]
                        [(= 5 (first list)) (cons 5 (rest list))]
                        [else (cons 2 (rest list))])]
              [else (cons x (rest list))])]
    [else (cons (first list) (cambia_in_X (- n 1) (rest list) x))]))

;;extract: numero,lista-di-numeri->numero;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (extract n l)
  (cond
    [(empty? l) (error 'debug_extract "Empty list given as argument")]
    [(= n 1) (first l)]
    [else (extract (- n 1) (rest l))]))

;; estrae una lista da una lista di liste;;

;;ex-list: numero, lista-di-liste-di-numeri->lista-di-numeri;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (ex-list nlist s)
  (cond
    [(empty? s) (error 'debug_ex-list "Empty list given as argument")]
    [(list? (first s)) (cond
                         [(= nlist 1) (first s)]
                         [else (ex-list (- nlist 1) (rest s))])]
    [else (error 'debug_ex-list "Sorry, not a list of lists")]))


;; incolla la lista l2 in coda alla lista l1;;

;;myappend: lista-di-numeri, lista-di-numeri->lista-di-numeri;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (myappend l1 l2)
  (cond
    [(empty? l1) l2]
    [else (cons (first l1) (myappend (rest l1) l2))]))

;; restituisce il numero degli elementi presenti in
;; una lista l;;

;;count-el: lista-di-liste-di-numeri->numero;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (count-el l)
  (local ((define (count l acc)
            (cond 
              [(empty? l) acc]
              [else (count (rest l) (+ 1 acc))])))
    (count l 0)))

;; ritorna la posizione di un elemento n all'interno di
;; una lista l in una lista di liste s;;

;;find-n: numero, numero, lista-di-liste-di-numeri-> numero;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (find-n n l s)
  (local ((define (pos2 l acc)
            (cond 
              [(empty? l) false]
              [(equal? n (first l)) acc]
              [else (pos2 (rest l) (+ 1 acc))])))
    (pos2 (ex-list l s) 1)))

;; conta le occorrenze del numero 2 all'interno
;; di una lista di liste;;

;;n-step:lista-di-liste-di-numeri, numero-> numero;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (n-step s acc)
  (cond
    [(empty? s) acc]
    [else (local ((define (n-step2 s l acc)
                    (cond
                      [(empty? l)(n-step (rest s) acc)]
                      [(= 2 (first l))(n-step2 s (rest l) (+ 1 acc))]
                      [else (n-step2 s (rest l) acc)])))
            (n-step2 s (first s) acc))]))

;;screma: lista-di-liste-di-liste-di-liste-di-numeri -> lista-di-liste-di-liste-di-numeri;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (screma lista)
  (cond
    [(empty? lista) empty]
    [(empty? (first lista)) (screma (rest lista))] 
    [else (cons (first (first lista)) (screma (rest lista)))]))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;; PARTE GUI ;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; definizioni contenuti iniziali della GUI ;;;;;;;;;;;;;;;

(define text1 (make-message "WELCOME!"))
(define text2 (make-message "This is the Labyrinth Solver� v.1.2 for SCHEME"))
(define text3 (make-message "By RavenTeam�:"))
(define text4 (make-message "  - Ciro *Lestat* Gonano (gonano@cs.unibo.it)"))
(define text5 (make-message "  - Mattia Villan (mvillan@cs.unibo.it)"))
(define text6 (make-message "  - Mauro Seno (mseno@cs.unibo.it)"))
(define text7 (make-message " "))
(define text8 (make-message "Choose the pre-constructed labyrinth you want to solve or"))
(define text9 (make-message "choose �random labyrinth� to have a instant-generated"))
(define text10 (make-message "labyrinth. If you choose a pre-constructed labyrinth"))
(define text11 (make-message "the input for rows and columns WILL NOT be considered."))
(define text12 (make-message " "))
(define text13 (make-message "Remember that after the generation you will be able to"))
(define text14 (make-message "modify each single cell in the labyrinth."))
(define text15 (make-message " "))
(define text16 (make-message "We hope that you have fun with Labyrinth Solver�."))
(define text17 (make-message "Plz report any eventual bug to our mail addresses. Thx!!!"))
(define text18 (make-message "Enjoy!"))
(define text19 (make-message " "))
(define choose_type (make-message "Choose a type for your labyrinth:        "))
(define choose (make-choice (list "random labyrinth" "test 1"  "test 2"  "test 3" "test 4" "test 5")))
(define in_rows (make-text "Number of rows?       "))
(define in_cols (make-text "Number of columns? "))

;; definizione pulsante "Exit": chiude tutte le finestre
(define bottexit (make-button "Exit" (lambda (x)
                                         (begin
                                           (hide-window 'useless)
                                           (close-viewport princ_view)))))

;; definizione pulsante "Create labyrinth!": avvia il programma
;; dopo aver verificato la choice, settato le costanti, e definito
;; il labirinto sul quale si dovr� lavorare.
(define bottok (make-button "Create labyrinth!" (lambda (x)
                                                  (begin
                                                    (begin
                                                      (clear-msgbox 'useless)
                                                      (hide-window 'useless)
                                                      (cond
                                                        [(= (choice-index choose) 0)
                                                         (cond
                                                           [(and (and (number? (string->number(text-contents in_rows)))
                                                                      (< 1.0 (string->number(text-contents in_rows))))
                                                                 (and (number? (string->number(text-contents in_cols)))
                                                                      (< 1.0 (string->number(text-contents in_cols)))))
                                                            (begin
                                                              (set! ROWS (string->number(text-contents in_rows)))
                                                              (set! COLS (string->number(text-contents in_cols)))
                                                              (set! CELL_H (/ 480 ROWS))
                                                              (set! CELL_W (/ 640 COLS))
                                                              (set! LABY (lab_rand 1))
                                                              (draw-lab-border 'useless)
                                                              (draw_grid 1 LABY)
                                                              (copy-viewport lab_view princ_view)
                                                              (set! POS_START (find-n 3 1 LABY))
                                                              (set! POS_GOAL (find-n 4 ROWS LABY))
                                                              (onclick_gen 'useless))]
                                                           [else (begin
                                                                   (hide-window 'useless)
                                                                   (msg_wrong_input 'useless)
                                                                   (get-key-press princ_view)
                                                                   (show-window)
                                                                   (msg_waitfor_input 'useless)
                                                                   (viewport-flush-input princ_view))])]
                                                        [(= (choice-index choose) 1) (begin
                                                                                       (set! ROWS 6)
                                                                                       (set! COLS 7)
                                                                                       (set! CELL_H (/ 480 ROWS))
                                                                                       (set! CELL_W (/ 640 COLS))
                                                                                       (set! LABY p1)
                                                                                       (draw_grid 1 LABY)
                                                                                       (draw-lab-border 'useless)
                                                                                       (copy-viewport lab_view princ_view)
                                                                                       (set! POS_START (find-n 3 1 LABY))
                                                                                       (set! POS_GOAL (find-n 4 ROWS LABY))
                                                                                       (onclick_gen 'useless))]
                                                        [(= (choice-index choose) 2) (begin
                                                                                       (set! ROWS 7)
                                                                                       (set! COLS 11)
                                                                                       (set! CELL_H (/ 480 ROWS))
                                                                                       (set! CELL_W (/ 640 COLS))
                                                                                       (set! LABY p2)
                                                                                       (draw_grid 1 LABY)
                                                                                       (draw-lab-border 'useless)
                                                                                       (copy-viewport lab_view princ_view)
                                                                                       (set! POS_START (find-n 3 1 LABY))
                                                                                       (set! POS_GOAL (find-n 4 ROWS LABY))
                                                                                       (onclick_gen 'useless))]
                                                        [(= (choice-index choose) 3) (begin
                                                                                       (set! ROWS 8)
                                                                                       (set! COLS 7)
                                                                                       (set! CELL_H (/ 480 ROWS))
                                                                                       (set! CELL_W (/ 640 COLS))
                                                                                       (set! LABY p3)
                                                                                       (draw_grid 1 LABY)
                                                                                       (draw-lab-border 'useless)
                                                                                       (copy-viewport lab_view princ_view)
                                                                                       (set! POS_START (find-n 3 1 LABY))
                                                                                       (set! POS_GOAL (find-n 4 ROWS LABY))
                                                                                       (onclick_gen 'useless))]
                                                        [(= (choice-index choose) 4) (begin
                                                                                       (set! ROWS 8)
                                                                                       (set! COLS 11)
                                                                                       (set! CELL_H (/ 480 ROWS))
                                                                                       (set! CELL_W (/ 640 COLS))
                                                                                       (set! LABY p4)
                                                                                       (draw_grid 1 LABY)
                                                                                       (draw-lab-border 'useless)
                                                                                       (copy-viewport lab_view princ_view)
                                                                                       (set! POS_START (find-n 3 1 LABY))
                                                                                       (set! POS_GOAL (find-n 4 ROWS LABY))
                                                                                       (onclick_gen 'useless))]
                                                        [(= (choice-index choose) 5) (begin
                                                                                       (set! ROWS 14)
                                                                                       (set! COLS 14)
                                                                                       (set! CELL_H (/ 480 ROWS))
                                                                                       (set! CELL_W (/ 640 COLS))
                                                                                       (set! LABY p5)
                                                                                       (draw_grid 1 LABY)
                                                                                       (draw-lab-border 'useless)
                                                                                       (copy-viewport lab_view princ_view)
                                                                                       (set! POS_START (find-n 3 1 LABY))
                                                                                       (set! POS_GOAL (find-n 4 ROWS LABY))
                                                                                       (onclick_gen 'useless))]))))))


;; definisce la funzione "start" che avvia all'inizio il prg;;

(define (mystart useless)
  (begin
    (create-window (list (list text1)
                         (list text2)
                         (list text3)
                         (list text4)
                         (list text5)
                         (list text6)
                         (list text7)
                         (list text8)
                         (list text9)
                         (list text10)
                         (list text11)
                         (list text12)
                         (list text13)
                         (list text14)
                         (list text15)
                         (list text16)
                         (list text17)
                         (list text18)
                         (list text19)
                         (list choose_type choose)
                         (list in_rows)
                         (list in_cols)
                         (list bottok bottexit)))
    (msg_waitfor_input 'useless)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;; FINE PARTE GUI ;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;; INIZIO PARTE GRAFICA ;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; +++++++++ MESSAGGI X MSGBOX ++++++++++

;; visualizza un messaggio di attesa per input

(define (msg_waitfor_input useless)
  (begin
    (clear-msgbox 'useless)
    ((draw-string princ_view)(make-posn 20 513) "Waiting for input...")
    ((draw-string princ_view)(make-posn 20 514) "Waiting for input...")))

;;visualizza messaggio "no solution..";;

(define (msg_nosolution useless)
  (begin
    (clear-msgbox 'useless)
    ((draw-string princ_view)(make-posn 20 513) "No solution for this labyrinth; press a key to continue..." RED)
    ((draw-string princ_view)(make-posn 20 514) "No solution for this labyrinth; press a key to continue..." RED)
    ((draw-string princ_view)(make-posn 21 513) "No solution for this labyrinth; press a key to continue..." RED)
    ((draw-string princ_view)(make-posn 21 514) "No solution for this labyrinth; press a key to continue..." RED)))

;; visualizza un messaggio d'errore per input non valido;;

(define (msg_wrong_input useless)
  (begin
    (clear-msgbox 'useless)
    ((draw-string princ_view)(make-posn 20 513) "Invalid input given, press a key to re-enter data")
    ((draw-string princ_view)(make-posn 20 514) "Invalid input given, press a key to re-enter data")))

;; visualizza un messaggio di attesa per click;;

(define (msg_waitfor_click useless)
  (begin
    (clear-msgbox 'useless)
    ((draw-string princ_view)(make-posn 20 513) "Click on 'New' to make a new labyrinth, on 'Modify' to modify this labyrinth,")
    ((draw-string princ_view)(make-posn 20 514) "Click on 'New' to make a new labyrinth, on 'Modify' to modify this labyrinth,")
    ((draw-string princ_view)(make-posn 20 533) "on 'Solve' to enter in �Solution mode�, or 'Exit' to close the program.")
    ((draw-string princ_view)(make-posn 20 534) "on 'Solve' to enter in �Solution mode�, or 'Exit' to close the program.")))

;;visualizza messaggio "solving the labyrinth,....";;

(define (msg_solving useless)
  (begin
    (clear-msgbox 'useless)
    ((draw-string princ_view)(make-posn 20 513) "Solving the labyrinth, please wait...")
    ((draw-string princ_view)(make-posn 20 514) "Solving the labyrinth, please wait...")
    ((draw-string princ_view)(make-posn 20 533) "(in case of a very complex labyrinth, this operation may take several minutes.)")
    ((draw-string princ_view)(make-posn 20 534) "(in case of a very complex labyrinth, this operation may take several minutes.)")))

;;visualizza messaggio "sure you want to exit?";;

(define (msg_sure_exit useless)
  (begin
    (clear-msgbox 'useless)
    ((draw-string princ_view)(make-posn 20 513) "Sure you want to exit?")
    ((draw-string princ_view)(make-posn 20 514) "Sure you want to exit?")
    ((draw-string princ_view)(make-posn 20 533) "Hit 'Y' to exit, 'N' to stay.")
    ((draw-string princ_view)(make-posn 20 534) "Hit 'Y' to exit, 'N' to stay.")))

;;visualizza messaggio "sure you want.... and hit 'Y'or 'N'...;;

(define (msg_sure_new useless)
  (begin
    (clear-msgbox 'useless)
    ((draw-string princ_view)(make-posn 20 513) "Sure you want to create a new labyrinth?")
    ((draw-string princ_view)(make-posn 20 514) "Sure you want to create a new labyrinth?")
    ((draw-string princ_view)(make-posn 20 533) "Hit 'Y' to exit, 'N' to stay.")
    ((draw-string princ_view)(make-posn 20 534) "Hit 'Y' to exit, 'N' to stay.")))

;;visualizza messaggio "....click.....";;

(define (msg_modify useless)
  (begin
    (clear-msgbox 'useless)
    ((draw-string princ_view)(make-posn 20 513) "Please left click on the cell you want to switch,")
    ((draw-string princ_view)(make-posn 20 514) "Please left click on the cell you want to switch,")
    ((draw-string princ_view)(make-posn 20 533) "click with right button when finished.")
    ((draw-string princ_view)(make-posn 20 534) "click with right button when finished.")))

;;visualizza messaggio "you can't change.....";;

(define (msg_barred_lines useless)
  (begin
    (clear-msgbox 'useless)
    ((draw-string princ_view)(make-posn 20 513) "You can't change the first and the last lines, sorry.")
    ((draw-string princ_view)(make-posn 20 514) "You can't change the first and the last lines, sorry.")
    ((draw-string princ_view)(make-posn 20 533) "Please choose another cell.")
    ((draw-string princ_view)(make-posn 20 534) "Please choose another cell.")))

;;visualizza messaggio "out of the area"...;;

(define (msg_outof_modarea useless)
  (begin
    (clear-msgbox 'useless)
    ((draw-string princ_view)(make-posn 20 513) "You clicked out of the labyrinth area.")
    ((draw-string princ_view)(make-posn 20 514) "You clicked out of the labyrinth area.")
    ((draw-string princ_view)(make-posn 20 533) "Please click again.")
    ((draw-string princ_view)(make-posn 20 534) "Please click again.")))

;;visualizza messaggio "over a button...;;

(define (msg_click_outof_butt useless)
  (begin
    (clear-msgbox 'useless)
    ((draw-string princ_view)(make-posn 20 513) "You must click over a button; please click again.")
    ((draw-string princ_view)(make-posn 20 514) "You must click over a button; please click again.")))

;;visualizza messaggio "right-left button"...;;

(define (msg_click_right_gen useless)
  (begin
    (clear-msgbox 'useless)
    ((draw-string princ_view)(make-posn 20 513) "You clicked with right button; please click again with left button.")
    ((draw-string princ_view)(make-posn 20 514) "You clicked with right button; please click again with left button.")))

;;visualizza messaggio "Click with third"...;;

(define (msg_click_third useless)
  (begin
    (clear-msgbox 'useless)
    ((draw-string princ_view)(make-posn 20 513) "Click with third button mouse not allowed; please click again.")
    ((draw-string princ_view)(make-posn 20 514) "Click with third button mouse not allowed; please click again.")))

;;visualizza messaggio "finished to.....;;

(define (msg_sol_what useless)
  (begin
    (clear-msgbox 'useless)
    ((draw-string princ_view)(make-posn 20 513) "Finished to compute the solutions.")
    ((draw-string princ_view)(make-posn 20 514) "Finished to compute the solutions.")
    ((draw-string princ_view)(make-posn 20 533) "Hit 'B' to see the best solution, 'N' to see the next solution,")
    ((draw-string princ_view)(make-posn 20 534) "Hit 'B' to see the best solution, 'N' to see the next solution,")
    ((draw-string princ_view)(make-posn 20 553) "'W' to see the worst solution, and 'E' for exiting to New, Modify, Exit.")
    ((draw-string princ_view)(make-posn 20 554) "'W' to see the worst solution, and 'E' for exiting to New, Modify, Exit.")))

;;visualizza messaggio "end of solutions...";;

(define (msg_re_first_soln useless)
  (begin
    (clear-msgbox 'useless)
    ((draw-string princ_view)(make-posn 20 513) "End of possible solutions, returning to first solution.")
    ((draw-string princ_view)(make-posn 20 514) "End of possible solutions, returning to first solution.")))

;;visualizza messaggio "wrong key...";;

(define (msg_sol_no_key useless)
  (begin
    (clear-msgbox 'useless)
    ((draw-string princ_view)(make-posn 20 513) "Wrong key pressed, please choose 'N', 'W', 'B' or 'E'.")
    ((draw-string princ_view)(make-posn 20 514) "Wrong key pressed, please choose 'N', 'W', 'B' or 'E'.")))

;; +++++++++++++ END MSG X MSGBOX ++++++++++++++

;; +++++++++++++ DRAW LABYRINTH & RANDOM LABYRINTH ++++++++++++++++

;; crea una lista di liste (labirinto) richiamando le funzioni
;; firstline, list_rand e lastline

;;lab_rand: numero->lista-di-liste-di-numeri;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (lab_rand curr-row)
  (cond
    [(= curr-row 1) (cons (firstline 1 (+ 1 (random COLS))) (lab_rand (+ 1 curr-row)))]
    [(= curr-row ROWS) (cons (lastline 1 (+ 1 (random COLS))) empty)]
    [else (cons (list_rand 1) (lab_rand (+ 1 curr-row)))]))

;; crea una lista di lunghezza COLS dove ogni elemento
;; � casualmente settato a 0|1

;;list_rand: numero->lista-di-numeri;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (list_rand pos)
  (cond
    [(> pos COLS) empty]
    [else (cons (random 2) (list_rand (+ 1 pos)))]))

;; crea casualmente la prima riga del labirinto,
;; settando una casella come entrata e le altre come "muro";;

;;firstline: numero, numero->lista-di-numeri;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (firstline pos pos3)
  (cond
    [(> pos COLS) empty]
    [(= pos pos3) (cons 3 (firstline (+ 1 pos) pos3))]
    [else (cons 0 (firstline (+ 1 pos) pos3))]))

;; crea casualmente l'ultima riga del labirinto,
;; settando una casella come uscita e le altre come "muro"

;;lastline: numero, numero->lista-di-numeri;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (lastline pos pos4)
  (cond
    [(> pos COLS) empty] 
    [(= pos pos4) (cons 4 (lastline (+ 1 pos) pos4))]
    [else (cons 0 (lastline (+ 1 pos) pos4))]))

;; disegna l'intero labirinto richiamando ricorsivamente
;; la funzione draw_row

;;draw_grid: numero, lista-di-liste-di-numeri -> true;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (draw_grid curr-row s)
  (cond
    [(> curr-row ROWS) #t]
    [else (draw_row curr-row 1 (ex-list curr-row s) s)]))

;; disegna una riga di labirinto richiamando draw_cella;;

;;draw_row: numero,numero, lista-di-numeri,lista-di-liste-di-numeri->lista-di-numeri;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (draw_row curr-row curr-col list s)
  (cond
    [(> curr-col COLS) (draw_grid (+ 1 curr-row) s)]
    [else (draw_cella curr-row curr-col list s)]))

;; disegna una singola cella nella posizione specificata da
;; "curr-row" e "curr-col" prendendo in input il relativo
;; valore dalla lista s (labirinto) e settandone il colore
;; di conseguenza

;;draw_cella numero, numero,lista-di-numeri,lista-di-liste-di-numeri->cella;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (draw_cella curr-row curr-col list s)
  (begin
    (cond
      [(= 0 (first list))
       ((draw-solid-rectangle lab_view)
        (make-posn (*(- curr-col 1) CELL_W) (*(- curr-row 1) CELL_H)) CELL_W CELL_H COL_WALL)]
      [(= 1 (first list))
       ((draw-solid-rectangle lab_view)
        (make-posn (*(- curr-col 1) CELL_W) (*(- curr-row 1) CELL_H)) CELL_W CELL_H COL_WAY)]
      [(= 2 (first list))
       ((draw-solid-rectangle lab_view)
        (make-posn (*(- curr-col 1) CELL_W) (*(- curr-row 1) CELL_H)) CELL_W CELL_H COL_SOLN)]
      [(= 3 (first list))
       ((draw-solid-rectangle lab_view)
        (make-posn (*(- curr-col 1) CELL_W) (*(- curr-row 1) CELL_H)) CELL_W CELL_H COL_START)]
      [(= 4 (first list))
       ((draw-solid-rectangle lab_view)
        (make-posn (*(- curr-col 1) CELL_W) (*(- curr-row 1) CELL_H)) CELL_W CELL_H COL_GOAL)]
      [(= 5 (first list))
       ((draw-solid-rectangle lab_view)
        (make-posn (*(- curr-col 1) CELL_W) (*(- curr-row 1) CELL_H)) CELL_W CELL_H COL_WRONGWAY)]
      [(= 6 (first list))
       ((draw-solid-rectangle lab_view)
        (make-posn (*(- curr-col 1) CELL_W) (*(- curr-row 1) CELL_H)) CELL_W CELL_H COL_CROSSW)]
      [(= 9 (first list))
       ((draw-solid-rectangle lab_view)
        (make-posn (*(- curr-col 1) CELL_W) (*(- curr-row 1) CELL_H)) CELL_W CELL_H COL_WAY)]
      [else (error 'debug_lab_rand "Random list not correct")])
    ((draw-rectangle lab_view) (make-posn (* (- curr-col 1) CELL_W) (* (- curr-row 1) CELL_H)) CELL_W CELL_H (make-rgb 0.25 1.0 1.0))
    ((draw-rectangle lab_view) 
     (make-posn (+ 1 (* (- curr-col 1) CELL_W))
                (+ 1 (* (- curr-row 1) CELL_H))) (- CELL_W 2) (- CELL_H 2) (make-rgb 0 0 0.75))
    (draw_row curr-row (+ curr-col 1) (rest list) s)))

;; ++++++++ END DRAW LABYRINTH +++++++++

;; finestra 640x480 che riguarda il solo labirinto
;; pixmap, quindi invisibile, copiata di volta in volta
;; su princ_view
(define lab_view (open-pixmap "lab_base" 640 480))

;; finestra principale 800x580 dove sar� contenuto tutto
(define princ_view (open-viewport "Labyrinth Solver� v.1.2" 800 580))

;; funzione che disegna una trama sfumata in un rettangolo;;

;;shade-rect: viewport, posn, numero, numero -> grafica;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (shade_rect vp p w h)
  (begin
    ((draw-rectangle vp) p w h (make-rgb 1.0 0 0))
    (local ((define (gradient pos1 pos2 color dir)
              (begin
                ((draw-line vp) pos1 pos2 color)
                (cond
                  [(= (- (posn-y pos1) (posn-y p)) h) #t]
                  [(= (- (posn-x pos1) (posn-x p)) w)(gradient (make-posn (posn-x pos1)
                                                                          (+ 1 (posn-y pos1)))
                                                               (cond
                                                                 [(= (- (posn-y pos2) (posn-y p)) h)
                                                                  (make-posn (+ 1 (posn-x pos2))
                                                                             (posn-y pos2))]
                                                                 [else (make-posn (posn-x pos2)
                                                                                  (+ 1 (posn-y pos2)))])
                                                               (cond
                                                                 [(= dir 1)(make-rgb (+ (rgb-red color) 0.01)
                                                                                     (rgb-green color)
                                                                                     (rgb-blue color))]
                                                                 [else (make-rgb (- (rgb-red color) 0.01)
                                                                                 (rgb-green color)
                                                                                 (rgb-blue color))])
                                                               (cond
                                                                 [(= dir 0)(cond
                                                                             [(< (rgb-red color) 0.02) 1]
                                                                             [else 0])]
                                                                 [else (cond
                                                                         [(> (rgb-red color) 0.98) 0]
                                                                         [else 1])]))]
                  [(= (- (posn-y pos2) (posn-y p)) h)(gradient
                                                      (make-posn (+ 1 (posn-x pos1)) (posn-y pos1))
                                                      (make-posn (+ 1 (posn-x pos2)) (posn-y pos2))
                                                      (cond
                                                        [(= dir 1)(make-rgb (+ (rgb-red color) 0.01)
                                                                            (rgb-green color)
                                                                            (rgb-blue color))]
                                                        [else (make-rgb (- (rgb-red color) 0.01)
                                                                        (rgb-green color)
                                                                        (rgb-blue color))])
                                                      (cond
                                                        [(= dir 0)(cond
                                                                    [(< (rgb-red color) 0.02) 1]
                                                                    [else 0])]
                                                        [else (cond
                                                                [(> (rgb-red color) 0.98) 0]
                                                                [else 1])]))]
                  [else (gradient
                         (make-posn (+ 1 (posn-x pos1)) (posn-y pos1))
                         (make-posn (posn-x pos2) (+ 1 (posn-y pos2)))
                         (cond
                           [(= dir 1)(make-rgb (+ (rgb-red color) 0.01)
                                               (rgb-green color)
                                               (rgb-blue color))]
                           [else (make-rgb (- (rgb-red color) 0.01)
                                           (rgb-green color)
                                           (rgb-blue color))])
                         (cond
                           [(= dir 0)(cond
                                       [(< (rgb-red color) 0.02) 1]
                                       [else 0])]
                           [else (cond
                                   [(> (rgb-red color) 0.98) 0]
                                   [else 1])]))]))))
      (gradient p p (make-rgb 1.0 0 0) 0))))

;; disegna lo sfondo della finestra principale
(shade_rect princ_view (make-posn 0 0) 800 580)

;; funzioni che disegnano la message-box;;

;; pulisce finestra messaggi;;

(define (clear-msgbox useless)
  ((clear-solid-rectangle princ_view) (make-posn 19 499) 602 62))

;; disegna finestra msg;;

((clear-solid-rectangle princ_view) (make-posn 16 496) 608 68)
((draw-line princ_view) (make-posn 16 496) (make-posn 623 496) GRAY1)
((draw-line princ_view) (make-posn 16 496) (make-posn 16 564) GRAY1)
((draw-line princ_view) (make-posn 17 564) (make-posn 624 564) GRAY3)
((draw-line princ_view) (make-posn 624 497) (make-posn 624 564) GRAY3)
((draw-line princ_view) (make-posn 18 498) (make-posn 621 498) GRAY3)
((draw-line princ_view) (make-posn 18 498) (make-posn 18 561) GRAY3)
((draw-line princ_view) (make-posn 19 562) (make-posn 622 562) GRAY1)
((draw-line princ_view) (make-posn 622 499) (make-posn 622 562) GRAY1)
((draw-pixel princ_view) (make-posn 624 496) GRAY2)
((draw-pixel princ_view) (make-posn 16 564) GRAY2)
((draw-pixel princ_view) (make-posn 622 498) GRAY2)
((draw-pixel princ_view) (make-posn 18 562) GRAY2)
((draw-rectangle princ_view) (make-posn 17 497) 606 66 GRAY2)

;; disegna una trama sfumata blu->nero dal basso verso l'alto;;

;;shade-updown-rect viewport, posn, numero, numero -> grafica;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (shade-updown-rect vp p w h)
  (begin
    ((draw-rectangle vp) p w h (make-rgb 0 0 0))
    (local ((define (gradient y color)
              (begin
                ((draw-line vp) (make-posn (posn-x p) y) (make-posn (+ w (posn-x p)) y) color)
                (cond
                  [(= y (+ (posn-y p) h)) #t]
                  [else (gradient (+ 1 y) (make-rgb 0 0 (cond
                                                          [(> (+ (rgb-blue color) (/ 1.0 h)) 1.0) 1.0]
                                                          [else (+ (rgb-blue color) (/ 1.0 h))])))]))))
      (gradient (posn-y p) (make-rgb 0 0 0)))))

;; disegna un'ombreggiatura su un rettangolo;;

;;shade-rect viewport, posn, numero, numero -> grafica;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (shade-rect vp p w h)
  (local ((define (s-r pos1 pos2 count)
           (begin
             (cond
               [(= 4 count)((draw-line vp) pos1 pos2 GRAY3)]
               [else 'void])
             (cond
               [(= (posn-x pos2) (posn-x p)) #t]
               [(= (posn-x pos1) (posn-x p))(s-r (make-posn (posn-x pos1)
                                                            (+ 1 (posn-y pos1)))
                                                (cond
                                                  [(= (posn-y pos2) (+ h (posn-y p)))
                                                            (make-posn (- (posn-x pos2) 1) (posn-y pos2))]
                                                  [else (make-posn (posn-x pos2) (+ 1 (posn-y pos2)))])
                                                (cond
                                                  [(= 4 count) 1]
                                                  [else (+ 1 count)]))]
               [(= (posn-y pos2) (+ h (posn-y p)))(s-r (make-posn (- (posn-x pos1) 1) (posn-y pos1))
                                                       (make-posn (- (posn-x pos2) 1) (posn-y pos2))
                                                       (cond
                                                         [(= 4 count) 1]
                                                         [else (+ 1 count)]))]
               [else (s-r (make-posn (- (posn-x pos1) 1) (posn-y pos1))
                          (make-posn (posn-x pos2) (+ 1 (posn-y pos2)))
                          (cond[(= 4 count) 1]
                               [else (+ 1 count)]))]))))
    (s-r (make-posn (+ w (posn-x p)) (posn-y p)) (make-posn (+ w (posn-x p)) (posn-y p)) 1)))
                                                                              
;; funzioni per disegno legenda

(define (draw-leg-bord vp)
  (begin
    ((draw-pixel vp) (make-posn 646 296) GRAY2)
    ((draw-pixel vp) (make-posn 798 4) GRAY2)
    ((draw-line vp) (make-posn 646 4) (make-posn 798 4) GRAY1)
    ((draw-line vp) (make-posn 646 4) (make-posn 646 295) GRAY1)
    ((draw-line vp) (make-posn 647 296) (make-posn 798 296) GRAY3)
    ((draw-line vp) (make-posn 798 5) (make-posn 798 296) GRAY3)))

(define (draw-legenda vp)
  (begin
    ((draw-string vp) (make-posn 695 32) "Legenda" COL_LEGENDA)
    ((draw-string vp) (make-posn 695 33) "Legenda" COL_LEGENDA)
    ((draw-string vp) (make-posn 696 32) "Legenda" COL_LEGENDA)
    ((draw-string vp) (make-posn 696 33) "Legenda" COL_LEGENDA)
    ((draw-line vp) (make-posn 693 36) (make-posn 750 36) COL_LEGENDA)))

(define (draw-leg-start vp)
  (begin
    ((draw-string vp) (make-posn 685 70) "Start" COL_START)
    ((draw-string vp) (make-posn 685 71) "Start" COL_START)
    ((draw-string vp) (make-posn 686 70) "Start" COL_START)
    ((draw-solid-rectangle vp) (make-posn 655 55) 20 20 COL_START)))

(define (draw-leg-wall vp)
  (begin
    ((draw-string princ_view) (make-posn 685 110) "Wall" COL_WALL)
    ((draw-string princ_view) (make-posn 685 111) "Wall" COL_WALL)
    ((draw-string princ_view) (make-posn 686 110) "Wall" COL_WALL)
    ((draw-solid-rectangle princ_view) (make-posn 655 95) 20 20 COL_WALL)))

(define (draw-leg-way vp)
  (begin
    ((draw-string princ_view) (make-posn 685 150) "Free way" COL_WAY)
    ((draw-string princ_view) (make-posn 685 151) "Free way" COL_WAY)
    ((draw-string princ_view) (make-posn 686 150) "Free way" COL_WAY)
    ((draw-solid-rectangle princ_view) (make-posn 655 135) 20 20 COL_WAY)))

(define (draw-leg-soln vp)
  (begin
    ((draw-string princ_view) (make-posn 685 190) "Solution" COL_SOLN)
    ((draw-string princ_view) (make-posn 685 191) "Solution" COL_SOLN)
    ((draw-string princ_view) (make-posn 686 190) "Solution" COL_SOLN)
    ((draw-solid-rectangle princ_view) (make-posn 655 175) 20 20 COL_SOLN)))

(define (draw-leg-goal vp)
  (begin
    ((draw-string princ_view) (make-posn 685 230) "Goal" COL_GOAL)
    ((draw-string princ_view) (make-posn 685 231) "Goal" COL_GOAL)
    ((draw-string princ_view) (make-posn 686 230) "Goal" COL_GOAL)
    ((draw-solid-rectangle princ_view) (make-posn 655 215) 20 20 COL_GOAL)))

(define (draw-leg-wway vp)
  (begin
    ((draw-string princ_view) (make-posn 685 270) "Wrong way" COL_WRONGWAY)
    ((draw-string princ_view) (make-posn 685 271) "Wrong way" COL_WRONGWAY)
    ((draw-string princ_view) (make-posn 686 270) "Wrong way" COL_WRONGWAY)
    ((draw-solid-rectangle princ_view) (make-posn 655 255) 20 20 COL_WRONGWAY)))

;; disegna la legenda ;;

;;draw-all-legenda: viewport -> grafica;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (draw-all-legenda vp)
  (begin
    (shade-updown-rect princ_view (make-posn 647 5) 150 290)
    (draw-leg-bord princ_view)
    (draw-legenda vp)
    (draw-leg-start vp)
    (draw-leg-goal vp)
    (draw-leg-way vp)
    (draw-leg-wall vp)
    (draw-leg-soln vp)
    (draw-leg-wway vp)))
(draw-all-legenda princ_view)

;; disegna la cornice sotto la finestra del labirinto ;;

(define (draw-lab-border useless)
  (begin
    ((draw-line princ_view) (make-posn 0 481) (make-posn 641 480) GRAY2)
    ((draw-line princ_view) (make-posn 1 481) (make-posn 640 480) GRAY2)
    ((draw-line princ_view) (make-posn 0 480) (make-posn 641 481) GRAY2)
    ((draw-line princ_view) (make-posn 1 480) (make-posn 640 481) GRAY2)
    ((draw-line princ_view) (make-posn 0 483) (make-posn 641 482) GRAY3)
    ((draw-line princ_view) (make-posn 1 483) (make-posn 640 482) GRAY3)
    ((draw-line princ_view) (make-posn 0 482) (make-posn 641 483) GRAY3)
    ((draw-line princ_view) (make-posn 1 482) (make-posn 640 483) GRAY3)
    ((draw-line princ_view) (make-posn 640 0) (make-posn 641 480) GRAY2)
    ((draw-line princ_view) (make-posn 641 0) (make-posn 640 480) GRAY2)
    ((draw-line princ_view) (make-posn 640 1) (make-posn 641 481) GRAY2)
    ((draw-line princ_view) (make-posn 641 1) (make-posn 640 481) GRAY2)
    ((draw-line princ_view) (make-posn 642 1) (make-posn 643 482) GRAY3)
    ((draw-line princ_view) (make-posn 643 1) (make-posn 642 482) GRAY3)
    ((draw-line princ_view) (make-posn 642 0) (make-posn 643 483) GRAY3)
    ((draw-line princ_view) (make-posn 643 0) (make-posn 642 483) GRAY3)))

;; -------------- FUNZIONI X BOTTONI ----------------

(define (draw-buttup vp p w h col1 col2 col3 txt)
  (begin
    ((draw-solid-rectangle vp) (make-posn (+ 1 (posn-x p)) (+ 1 (posn-y p))) (- w 1) (- h 1) col2)
    ((draw-line vp) p (make-posn (+ (posn-x p) (- w 1)) (posn-y p)) col1)
    ((draw-line vp) p (make-posn (posn-x p) (+ (posn-y p) (- h 1))) col1)
    ((draw-line vp) (make-posn (+ 1 (posn-x p)) (+ h (posn-y p))) (make-posn (+ w (posn-x p)) (+ h (posn-y p))) col3)
    ((draw-line vp) (make-posn (+ w (posn-x p)) (+ 1 (posn-y p))) (make-posn (+ w (posn-x p)) (+ h (posn-y p))) col3)
    ((draw-pixel vp) (make-posn (+ w (posn-x p)) (posn-y p)) col2)
    ((draw-pixel vp) (make-posn (posn-x p) (+ h (posn-y p))) col2)
    ((draw-string vp) (make-posn (+ 33 (posn-x p)) (- (+ h (posn-y p)) 9)) txt BLACK)))

(define (draw-buttdown vp p w h col1 col2 col3 txt)
  (begin
    ((draw-solid-rectangle vp) (make-posn (+ 1 (posn-x p)) (+ 1 (posn-y p))) (- w 1) (- h 1) col2)
    ((draw-line vp) p (make-posn (+ (posn-x p) (- w 1)) (posn-y p)) col3)
    ((draw-line vp) p (make-posn (posn-x p) (+ (posn-y p) (- h 1))) col3)
    ((draw-line vp) (make-posn (+ 1 (posn-x p)) (+ h (posn-y p))) (make-posn (+ w (posn-x p)) (+ h (posn-y p))) col1)
    ((draw-line vp) (make-posn (+ w (posn-x p)) (+ 1 (posn-y p))) (make-posn (+ w (posn-x p)) (+ h (posn-y p))) col1)
    ((draw-pixel vp) (make-posn (+ w (posn-x p)) (posn-y p)) col2)
    ((draw-pixel vp) (make-posn (posn-x p) (+ h (posn-y p))) col2)
    ((draw-string vp) (make-posn (+ 33 (posn-x p)) (- (+ h (posn-y p)) 9)) txt BLACK)))

;; ++++++++++++ DISEGNO BOTTONI E FUNZIONI BASATE SU QUESTI ++++++++++++++++

;; ombreggia i quattro bottoni
(define (shade-all-buttons useless)
  (begin
    (shade-rect princ_view (make-posn 676 351) 98 28)
    (shade-rect princ_view (make-posn 676 411) 98 28)
    (shade-rect princ_view (make-posn 676 471) 98 28)
    (shade-rect princ_view (make-posn 676 531) 98 28)))

;; disegna i quattro bottoni
(define (draw-all-butts-up useless)
  (begin
    (draw-buttup princ_view (make-posn 675 350) 100 30 GRAY1 GRAY2 GRAY3 "New")
    (draw-buttup princ_view (make-posn 675 410) 100 30 GRAY1 GRAY2 GRAY3 "Modify")
    (draw-buttup princ_view (make-posn 675 470) 100 30 GRAY1 GRAY2 GRAY3 "Solve")
    (draw-buttup princ_view (make-posn 675 530) 100 30 GRAY1 GRAY2 GRAY3 "Exit")))
(draw-all-butts-up 'useless)

;; funzione che gestisce eventi di click su uno dei quattro bottoni
(define (onclick_gen useless)
  (begin
    (msg_waitfor_click 'useless)
    (set! CLICK (get-mouse-click princ_view))
    (cond
      [(left-mouse-click? CLICK)(cond
;; cond bottone NEW
                                  [(and (and (< 674 (posn-x (mouse-click-posn CLICK)))
                                             (> 776 (posn-x (mouse-click-posn CLICK))))
                                        (and (< 349 (posn-y (mouse-click-posn CLICK)))
                                             (> 381 (posn-y (mouse-click-posn CLICK)))))
                                   (begin
                                     (draw-buttdown princ_view (make-posn 675 350) 100 30 GRAY1 GRAY2 GRAY3 "New")
                                     (sleep-for-a-while 1)
                                     (draw-buttup princ_view (make-posn 675 350) 100 30 GRAY1 GRAY2 GRAY3 "New")
                                     (viewport-flush-input princ_view)
                                     (onclick_sure_new 'useless))]
;; cond bottone MODIFY
                                  [(and (and (< 674 (posn-x (mouse-click-posn CLICK)))
                                             (> 776 (posn-x (mouse-click-posn CLICK))))
                                        (and (< 409 (posn-y (mouse-click-posn CLICK)))
                                             (> 441 (posn-y (mouse-click-posn CLICK)))))
                                   (begin
                                     (draw-buttdown princ_view (make-posn 675 410) 100 30 GRAY1 GRAY2 GRAY3 "Modify")
                                     (sleep-for-a-while 1)
                                     (draw-buttup princ_view (make-posn 675 410) 100 30 GRAY1 GRAY2 GRAY3 "Modify")
                                     (viewport-flush-input princ_view)
                                     (shade-all-buttons 'useless)
                                     (onclick_modify 'useless))]
;; cond bottone SOLVE
                                  [(and (and (< 674 (posn-x (mouse-click-posn CLICK)))
                                             (> 776 (posn-x (mouse-click-posn CLICK))))
                                        (and (< 469 (posn-y (mouse-click-posn CLICK)))
                                             (> 501 (posn-y (mouse-click-posn CLICK)))))
                                   (begin
                                     (draw-buttdown princ_view (make-posn 675 470) 100 30 GRAY1 GRAY2 GRAY3 "Solve")
                                     (sleep-for-a-while 1)
                                     (draw-buttup princ_view (make-posn 675 470) 100 30 GRAY1 GRAY2 GRAY3 "Solve")
                                     (viewport-flush-input princ_view)
                                     (onclick_solve 'useless))]
;; cond bottone EXIT
                                  [(and (and (< 674 (posn-x (mouse-click-posn CLICK)))
                                             (> 776 (posn-x (mouse-click-posn CLICK))))
                                        (and (< 529 (posn-y (mouse-click-posn CLICK)))
                                             (> 561 (posn-y (mouse-click-posn CLICK)))))
                                   (begin
                                     (draw-buttdown princ_view (make-posn 675 530) 100 30 GRAY1 GRAY2 GRAY3"Exit")
                                     (sleep-for-a-while 1)
                                     (draw-buttup princ_view (make-posn 675 530) 100 30 GRAY1 GRAY2 GRAY3"Exit")
                                     (viewport-flush-input princ_view)
                                     (onclick_sure_exit 'useless))]
;; cond NOBUTTON
                                  [else (begin
                                          (msg_click_outof_butt 'useless)
                                          (sleep-for-a-while 3)
                                          (viewport-flush-input princ_view)
                                          (msg_waitfor_click 'useless)
                                          (onclick_gen 'useless))])]
      [(right-mouse-click? CLICK)(begin
                                   (msg_click_right_gen 'useless)
                                   (viewport-flush-input princ_view)
                                   (sleep-for-a-while 3)
                                   (msg_waitfor_click 'useless)
                                   (onclick_gen 'useless))]
      [else (begin
              (msg_click_third 'useless)
              (viewport-flush-input princ_view)
              (sleep-for-a-while 3)
              (msg_waitfor_click 'useless)
              (conclick_gen 'useless))])))

(define (onclick_sure_exit useless)
  (begin
    (msg_sure_exit 'useless)
    (viewport-flush-input princ_view)
    (set! KEYPRESS (char-upcase (key-value (get-key-press princ_view))))
    (cond
      [(char=? #\Y KEYPRESS)(begin
                              (hide-window 'useless)
                              (close-viewport princ_view))]
      [(char=? #\N KEYPRESS)(begin
                              (viewport-flush-input princ_view)
                              (msg_waitfor_click 'useless)
                              (onclick_gen 'useless))]
      [else (onclick_sure_exit 'useless)])))

(define (onclick_sure_new useless)
  (begin
    (msg_sure_new 'useless)
    (viewport-flush-input princ_view)
    (set! KEYPRESS (char-upcase (key-value (get-key-press princ_view))))
    (cond
      [(char=? #\Y KEYPRESS)(begin
                              (hide-window 'useless)
                              (shade_rect princ_view (make-posn 0 0) 643 483)
                              (show-window))]
      [(char=? #\Y KEYPRESS)(begin
                              (viewport-flush-input princ_view)
                              (msg_waitfor_click 'useless)
                              (onclick_gen 'useless))]
      [else (onclick_sure_new 'useless)])))

(define (onclick_modify useless)
  (begin
    (viewport-flush-input princ_view)
    (msg_modify 'useless)
    (begin
      (set! CLICK (get-mouse-click princ_view))
      (cond
        [(right-mouse-click? CLICK)(begin
                                     (viewport-flush-input princ_view)
                                     (draw-all-butts-up 'useless)
                                     (msg_waitfor_click 'useless)
                                     (onclick_gen 'useless))]
        [(left-mouse-click? CLICK)(begin
                                    (cond
                                      [(or (< 640 (posn-x (mouse-click-posn CLICK)))
                                           (< 480 (posn-y (mouse-click-posn CLICK))))
                                       (begin
                                         (msg_outof_modarea 'useless)
                                         (sleep-for-a-while 2)
                                         (onclick_modify 'useless))]
                                      [(or (= 1 (roundup (/ (posn-y (mouse-click-posn CLICK)) CELL_H)))
                                           (= ROWS (roundup (/ (posn-y (mouse-click-posn CLICK)) CELL_H))))
                                       (begin
                                         (msg_barred_lines 'useless)
                                         (sleep-for-a-while 2)
                                         (onclick_modify 'useless))]
                                      [(= 0 (extract (roundup (/ (posn-x (mouse-click-posn CLICK)) CELL_W))
                                                   (ex-list (roundup (/ (posn-y (mouse-click-posn CLICK)) CELL_H)) LABY)))
                                       (begin
                                         (set! LABY (relistX (roundup (/ (posn-y (mouse-click-posn CLICK)) CELL_H))
                                                              (roundup (/ (posn-x (mouse-click-posn CLICK)) CELL_W)) LABY 1))
                                         (draw_grid 1 LABY)
                                         (copy-viewport lab_view princ_view)
                                         (onclick_modify 'useless))]
                                      [(= 1 (extract (roundup (/ (posn-x (mouse-click-posn CLICK)) CELL_W))
                                                   (ex-list (roundup (/ (posn-y (mouse-click-posn CLICK)) CELL_H)) LABY)))
                                       (begin
                                         (set! LABY (relistX (roundup (/ (posn-y (mouse-click-posn CLICK)) CELL_H))
                                                              (roundup (/ (posn-x (mouse-click-posn CLICK)) CELL_W)) LABY 0))
                                         (draw_grid 1 LABY)
                                         (copy-viewport lab_view princ_view)
                                         (onclick_modify 'useless))]
                                      [else (begin
                                              (error 'onclick_modify "cell not switchable; please report to gonano@cs.unibo.it")
                                              (onclick_modify 'useless))]))]
        [else (onclick_modify 'useless)]))))

(define (onclick_solve useless)
  (begin
    (msg_solving 'useless)
    (shade-all-buttons 'useless)
;; assegnamento della lista di soluzioni alla costante L-SOL
    (set! L-SOL (screma (search-sols LABY)))
    (set! L-SOL-NX L-SOL)
    (set! BEST-SOL (local ((define (best-sol l-sol sol)
                             (cond
                               [(empty? (rest l-sol)) sol]
                               [(<= (n-step sol 0)
                                    (n-step (first (rest l-sol)) 0))
                                (best-sol (rest l-sol) sol)]
                               [else (best-sol (rest l-sol)
                                               (first (rest l-sol)))])))
                     (best-sol L-SOL (first L-SOL))))
    (set! WORST-SOL (local ((define (worst-sol l-sol sol)
                              (cond
                                [(empty? (rest l-sol)) sol]
                                [(>= (n-step sol 0)
                                     (n-step (first (rest l-sol)) 0))
                                 (worst-sol (rest l-sol) sol)]
                                [else (worst-sol (rest l-sol)
                                                 (first (rest l-sol)))])))
                      (worst-sol L-SOL (first L-SOL))))
    (cond
      [(empty? L-SOL)(begin
                       (nosolution LABY)
                       (get-key-press princ_view)
                       (viewport-flush-input princ_view)
                       (draw-all-butts-up 'useless)
                       (msg_waitfor_click 'useless)
                       (onclick_gen 'useless))]
      [else (begin
              (draw_soln (first L-SOL))
              (local ((define (fun-for-soln useless)
                        (begin
                          (msg_sol_what 'useless)
                          (viewport-flush-input princ_view)
                          (set! KEYPRESS (char-upcase (key-value (get-key-press princ_view))))
                          (cond
                            [(char=? #\B (char-upcase KEYPRESS))(begin
                                                                  (draw_soln BEST-SOL)
                                                                  (fun-for-soln 'useless))]
                            [(char=? #\N KEYPRESS)(begin
                                                    (cond
                                                      [(empty? (rest L-SOL-NX))(begin
                                                                                 (msg_re_first_soln 'useless)
                                                                                 (sleep-for-a-while 1)
                                                                                 (set! L-SOL-NX L-SOL)
                                                                                 (draw_soln (first L-SOL-NX))
                                                                                 (fun-for-soln 'useless))]
                                                      [else (begin
                                                              (set! L-SOL-NX (rest L-SOL-NX))
                                                              (draw_soln (first L-SOL-NX))
                                                              (fun-for-soln 'useless))]))]
                            [(char=? #\E (char-upcase KEYPRESS))(begin
                                                                  (viewport-flush-input princ_view)
                                                                  (draw-all-butts-up 'useless)
                                                                  (msg_waitfor_click 'useless)
                                                                  (onclick_gen 'useless))]
                            [(char=? #\W (char-upcase KEYPRESS))(begin
                                                                  (draw_soln WORST-SOL)
                                                                  (fun-for-soln 'useless))]
                            [else (begin
                                    (msg_sol_no_key 'useless)
                                    (sleep-for-a-while 3)
                                    (fun-for-soln 'useless))]))))
                (fun-for-soln 'useless)))])))

;; ------------- FINE FUNZIONI X BOTTONI --------------

;; disegna la soluzione di un labirinto
(define (draw_soln s)
  (begin
    (draw_grid 1 s)
    (copy-viewport lab_view princ_view)))

;; funzione che gestisce la possibilit� di un labirinto senza soluzione
(define (nosolution s)
  (begin
    (draw_grid 1 s)
    (copy-viewport lab_view princ_view)
    (msg_nosolution 'useless)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;; FINE PARTE GRAFICA ;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;; INIZIO PARTE RISOLUTIVA - NON GRAFICA ;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; funzioni di appoggio ;;;;;;;;;;;;;;;
;; ritornano i valori della casella ;;;
;; nella posizione indicata rispetto ;;
;; alla casella considerata ;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;posdx:lista-di-liste-di-numeri,numero,numero->numero;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (posdx s row pos)
  (cond
    [(= (count-el (first s)) pos) 0]
    [else (extract (+ 1 pos) (ex-list row s))]))

;;possx:lista-di-liste-di-numeri,numero,numero->numero;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (possx s row pos)
  (cond
    [(= 1 pos) 0]
    [else (extract (- pos 1) (ex-list row s))]))

;;posun:lista-di-liste-di-numeri,numero,numero->numero;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (posun s row pos)
  (cond
    [(= (count-el s) row) 0]
    [else (extract pos (ex-list (+ 1 row) s))]))

;;posov:lista-di-liste-di-numeri,numero,numero->numero;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (posov s row pos)
  (cond
    [(= 1 row) 0]
    [else (extract pos (ex-list (- row 1) s))]))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; funzione "risolvi" e derivate ;;
;; per richiamare la funzione ;;;;;
;; principale di risoluzione ;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;risolvi: lista-di-liste-di-numeri->lista-di-liste-di-numeri;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (risolvi s)
  (cond
    [(empty? s) (error 'general "Chosen labyrinth is empty")]
    [else (xcorso s 1 POS_START 1 empty empty)]))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; cross? restituisce #t se una cella ha due o tre uscite ;;
;; (oltre all' "entrata") ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;; altrimenti restituisce #f ;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;cross?: lista-di-liste-dinumeri->numero, numero-> booleano;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (cross? s row pos)
  (or
   (and (= 1 (posun s row pos)) (or (= 1 (posdx s row pos)) (= 1 (possx s row pos)) (= 1 (posov s row pos))))
   (and (= 1 (posdx s row pos)) (or (= 1 (possx s row pos)) (= 1 (posov s row pos))))
   (and (= 1 (possx s row pos)) (= 1 (posov s row pos)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;; funzione xcorso -> principale x soluzione ;;;;;;;;;;;
;; i "begin", i "display" e i "newline" sono stati inseriti per ;;
;; il debugging, come feedback pi� chiaro delle azioni del prg. ;;
;;;;;;;;;  Nella versione finale del prg NON ci saranno. ;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;xcorso:lista-di-liste-di-numeri,numero,numero,numero,lista-di-numeri,lista-di-numeri->lista-di-liste-di-numeri;;
;;;;;;;;;;;;;;;;;;;

(define (xcorso s row pos step croxx prev)
  (cond
    [(cross? s row pos)(cond
                         [(= 4 (posun s row pos))(list (relistX row pos s 2) (cons 0 (cons 1 croxx)) (cons 6 prev))]
                         [(= 1 (posun s row pos))(xcorso (relistX row pos s 2) (+ 1 row) pos (+ 1 step) (cons 1 croxx) (cons 6 prev))]
                         [(= 1 (posdx s row pos))(xcorso (relistX row pos s 2) row (+ 1 pos) (+ 1 step) (cons 1 croxx) (cons 7 prev))]
                         [(= 1 (possx s row pos))(xcorso (relistX row pos s 2) row (- pos 1) (+ 1 step) (cons 1 croxx) (cons 8 prev))]
                         [(= 1 (posov s row pos))(xcorso (relistX row pos s 2) (- row 1) pos (+ 1 step) (cons 1 croxx) (cons 9 prev))])]
    [else (cond
            [(= 4 (posun s row pos))(list (relistX row pos s 2) (cons 0 (cons 0 croxx)) (cons 6 prev))]
            [(= 1 (posun s row pos))(xcorso (relistX row pos s 2) (+ 1 row) pos (+ 1 step) (cons 0 croxx) (cons 6 prev))]
            [(= 1 (posdx s row pos))(xcorso (relistX row pos s 2) row (+ 1 pos) (+ 1 step) (cons 0 croxx) (cons 7 prev))]
            [(= 1 (possx s row pos))(xcorso (relistX row pos s 2) row (- pos 1) (+ 1 step) (cons 0 croxx) (cons 8 prev))]
            [(= 1 (posov s row pos))(xcorso (relistX row pos s 2) (- row 1) pos (+ 1 step) (cons 0 croxx) (cons 9 prev))]
           [else (invway (relistX row pos s 2) row pos (cons 0 croxx) prev)])]))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; funzione "invway", inverte il cammino della soluzione ;;
;; ripercorrendo la lista di bivi e ricominciando dall' ;;;
;; ultimo incontrato ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;xcorso:lista-di-liste-di-numeri,numero,numero,numero,lista-di-numeri,lista-di-numeri->lista-di-liste-di-numeri;;
;;;;;;;;;;;;;;;;;;;

(define (invway s row pos croxx prev)
  (cond
    [(= 0 (first croxx)) (cond
                           [(empty? prev) empty]
                           [else (cond
                                   [(= 6 (first prev))(invway (relistX row pos s 5) (- row 1) pos (rest croxx) (rest prev))]
                                   [(= 7 (first prev))(invway (relistX row pos s 5) row (- pos 1) (rest croxx) (rest prev))]
                                   [(= 8 (first prev))(invway (relistX row pos s 5) row (+ pos 1) (rest croxx) (rest prev))]
                                   [(= 9 (first prev))(invway (relistX row pos s 5) (+ row 1) pos (rest croxx) (rest prev))]
                                   [else empty])])]
    [(= 1 (first croxx))(xcorso (relistX row pos s 6) row pos 7 (rest croxx) prev)]))

;;;;;;;;;;;;;;;;;;;;;;;;;
;; ESEMPI DI LABIRINTO ;;
;;;;;;;;;;;;;;;;;;;;;;;;;

(define p1 (list(list 0 0 0 3 0 0 0)
                (list 0 1 1 1 1 1 1)
                (list 0 1 1 0 0 0 1)
                (list 0 1 1 1 1 1 1)
                (list 0 0 1 0 0 1 0)
                (list 0 0 0 0 0 4 0)))

(define p2 (list(list 0 0 0 3 0 0 0 0 0 0 0)
                (list 0 1 1 1 0 1 1 1 1 0 0)
                (list 0 1 0 1 1 1 0 0 1 0 0)
                (list 0 1 0 0 0 0 1 1 1 0 0)
                (list 0 1 0 0 0 0 1 0 1 0 0)
                (list 0 1 0 0 0 1 1 0 1 0 0)
                (list 0 4 0 0 0 0 0 0 0 0 0)))

(define p3 (list(list 0 0 3 0 0 0 0)
                (list 0 1 1 1 1 1 0)
                (list 0 1 0 0 1 0 0)
                (list 0 1 0 0 1 1 0)
                (list 0 1 0 1 1 0 0)
                (list 0 1 1 1 1 1 0)
                (list 0 1 0 0 1 0 0)
                (list 0 0 0 0 4 0 0)))

(define p4 (list(list 0 0 0 0 3 0 0 0 0 0 0)
                (list 0 0 0 1 1 1 1 1 0 0 0)
                (list 0 0 0 1 0 1 0 1 0 0 0)
                (list 0 0 1 1 0 1 0 1 1 0 0)
                (list 0 0 1 0 0 1 0 1 1 0 0)
                (list 0 0 1 1 1 1 1 1 0 0 0)
                (list 0 0 0 0 0 0 1 0 0 0 0)
                (list 0 0 0 0 0 0 4 0 0 0 0)))

(define p5 (list(list 0 0 0 0 3 0 0 0 0 0 0 0 0 0)
                (list 0 0 0 0 1 0 1 1 1 0 1 1 1 0)
                (list 0 0 1 1 1 1 1 0 1 1 1 0 1 0)
                (list 0 0 1 0 0 1 0 0 1 0 1 1 1 0)
                (list 0 0 1 0 0 1 0 0 1 0 0 0 1 0)
                (list 0 0 1 0 0 1 0 0 1 0 0 1 1 1)
                (list 0 1 1 1 0 1 0 0 1 0 0 1 0 1)
                (list 0 1 0 1 1 1 0 0 1 1 0 1 0 1)
                (list 1 1 0 0 0 1 0 0 0 1 0 1 0 1)
                (list 1 0 0 0 0 1 0 0 0 1 0 1 0 1)
                (list 1 1 1 0 0 1 1 0 0 1 1 1 1 1)
                (list 0 0 1 0 0 0 1 1 1 1 0 0 0 0)
                (list 0 0 1 1 1 1 1 0 0 0 0 0 0 0)
                (list 0 0 0 0 0 0 4 0 0 0 0 0 0 0)))

;;;;;;;;;;;;;;;;;;;;;SPERIMENTALE;;;;;;;;;;;;;;;;;;

;; funzione che "chiude" s

;;close-way: lista-di-liste-di-numeri, numero, numero, lista-di-numeri, lista-di-numeri, numero -> ;;
;; -> lista-di-liste-di-numeri ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (close-way s row pos croxx prev acc)
  (cond
    [(empty? croxx) empty]
    [(= 1 (first croxx))(cond
                          [(= acc 1)(cond
                                      [(= 1 (posun s row pos))(relistX (+ row 1) pos s 9)]
                                      [(= 1 (posdx s row pos))(relistX row (+ pos 1) s 9)]
                                      [(= 1 (possx s row pos))(relistX row (- pos 1) s 9)]
                                      [(= 1 (posov s row pos))(relistX (- row 1) pos s 9)])]
                          [else (cond
                                  [(empty? prev) empty]
                                  [(= 6 (first prev))(close-way s (- row 1) pos (rest croxx) (rest prev) (- acc 1))]
                                  [(= 7 (first prev))(close-way s row (- pos 1) (rest croxx) (rest prev) (- acc 1))]
                                  [(= 8 (first prev))(close-way s row (+ pos 1) (rest croxx) (rest prev) (- acc 1))]
                                  [(= 9 (first prev))(close-way s (+ row 1) pos (rest croxx) (rest prev) (- acc 1))]
                                  [else (error 'debug_prev "Malformed construction")])])]
    [else (cond
            [(empty? prev) empty]
            [(= 6 (first prev))(close-way s (- row 1) pos (rest croxx) (rest prev) acc)]
            [(= 7 (first prev))(close-way s row (- pos 1) (rest croxx) (rest prev) acc)]
            [(= 8 (first prev))(close-way s row (+ pos 1) (rest croxx) (rest prev) acc)]
            [(= 9 (first prev))(close-way s (+ row 1) pos (rest croxx) (rest prev) acc)]
            [else (error 'debug_prev "Malformed construction")])]))

;; ritorna una lista contenente le soluzioni possibili in base alla soluzione trovata,
;; la prima soluzione della lista � quella da usare per ripetere la funzione

;;sifs: lista-di-liste-di-numeri, lista-di-numeri, lista-di-numeri -> lista-di-liste-di-liste-di-numeri;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (sifs s croxx prev nbivio maxbivi)
  (cond
    [(> nbivio maxbivi) empty]
    [(empty? (close-way s ROWS POS_GOAL croxx prev nbivio)) empty]
    [else (cond
            [(empty? (risolvi (close-way s ROWS POS_GOAL croxx prev nbivio))) (cons empty (sifs s croxx prev (+ nbivio 1) maxbivi))]
            [(> 2 (howmany 1 (first (rest (risolvi (close-way s ROWS POS_GOAL croxx prev nbivio))))))
             (cons (risolvi (close-way s ROWS POS_GOAL croxx prev nbivio)) empty)]
            [else (myappend (myappend (search-sols (close-way s ROWS POS_GOAL croxx prev nbivio))
                                  (sifs s croxx prev (+ nbivio 1) maxbivi))
                          (cons (risolvi (close-way s ROWS POS_GOAL croxx prev nbivio)) empty))])]))

;; search-sols
;; ritorna una lista: (list (list (soln_lab)) (prev) (croxx))

;;search-sols: lista-di-liste-di-numeri -> lista-di-liste-di-liste-di-liste-di-numeri;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (search-sols s)
  (cond
    [(empty? (risolvi s)) empty]
    [(> 2 (howmany 1 (first (rest (risolvi s))))) (cons (risolvi s) empty)]
    [else (myappend (sifs s
                        (first (rest (risolvi s)))
                        (first (rest (rest (risolvi s))))
                        2
                        (howmany 1 (first (rest (risolvi s)))))
                  (cons (risolvi s) empty))]))

;;;;;;;;;;;;;;SPERIMENTALE;;;;;;;;;;;;;;;;;;;;;;;;;;;

(mystart 'useless)
