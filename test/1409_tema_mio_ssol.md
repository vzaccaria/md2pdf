# Politecnico di Milano - Facoltà di Ingegneria Industriale

## INFORMATICA B - Appello del 1 Settembre 2014

    COGNOME ________________________ NOME _____________________________________

    MATRICOLA ______________________ (spazio riservato) _______________________



* Il presente plico contiene 3 esercizi e __deve essere debitamente compilato con cognome e nome, numero di matricola__.

* Il tempo a disposizione è di 1 ora e mezza.

* Non separate questi fogli. Scrivete la soluzione solo sui fogli distribuiti, utilizzando il retro delle pagine in caso di necessità. Cancellate le parti di brutta (o ripudiate) con un tratto di penna.

* Ogni parte non cancellata a penna sarà considerata parte integrante della soluzione.

* È possibile scrivere a matita (e non occorre ricalcare al momento della consegna!).

* __È vietato utilizzare calcolatrici, telefoni o pc__. Chi tenti di farlo vedrà annullata la sua prova.

* È ammessa la consultazione di libri e appunti, purché con pacata discrezione e senza disturbare.

* __Qualsiasi tentativo di comunicare con altri studenti comporta l’espulsione dall’aula__.

* È possibile ritirarsi senza penalità.

* __Non è possibile lasciare l’aula conservando il tema della prova in corso__.

\newpage

# Esercizio 1 (C)

Si sviluppi un programma in linguaggio C per gestire l’inserimento di _descrizioni_ da associare alle immagini presenti su un sito web. 

Il programma richiede l'inserimento di due parole `p1` e `p2` (di massimo 20 caratteri) che descrivano un immagine e concatena `p1` e `p2` nella stringa `descr` per ottenere la descrizione finale dell’immagine. Le parole devono essere separate da una virgola, senza spazi intermedi ed al termine il programma deve stampare la stringa `descr` a schermo.

N.B. Per il concatenamento tra stringhe non è possibile utilizzare la funzione `strcat` della libreria `string`.

Esempio: Quando l’utente inserisce `"cane"` in `p1` e `"prato"` in `p2`, la stringa `descr` conterrà `"cane,prato"`.

**Spazio soluzione:**

&#183;

&#183;

&#183;

&#183;

&#183;

&#183;

&#183;

&#183;

&#183;

&#183;

&#183;

&#183;

&#183;

&#183;

&#183;

&#183;

\newpage

# Esercizio 2 (Matlab)

Una signora al mercato compra un sacchetto di mele, che purtroppo le cade durante il tragitto verso casa. Il commerciante si offre di darle un altro sacchetto contenente lo stesso numero di mele del precedente e le chiede quindi quale fosse questo numero. La signora, abilissima negli indovinelli matematici, risponde così:

* Organizzandole in file da 5 mele, ne rimangono fuori 2
* Organizzandole in file da 7 mele, ne rimangono fuori 3

Quanto indicato dalla signora è rappresentabile dalle seguenti equazioni, dove $m$ è il numero di mele che vogliamo trovare:

$$
\left\{
\begin{array}{ccc}
\textrm{mod}(m,5) & = & 2 \\
\textrm{mod}(m,7) & = & 3 \\
\end{array}
\right.
$$

Le equazioni di sopra sono un'esempio di _equazione alle congruenze_: 

$$
\left\{
\begin{array}{ccc}
\textrm{mod}(m,a) & = & w_1 \\
\textrm{mod}(m,b) & = & w_2 \\
\end{array}
\right.
$$
Che ci porta finalmente ad una delle soluzioni: 

$$
m = b * w_1 * y + a * w_2 * x
$$

Dove $x$ e $y$ sono calcolati con l'**algoritmo esteso di euclide** (nota bene: la funzione è ricorsiva e calcola contemporaneamente una coppia di valori): 

$$
(x, y) = \textrm{calcolaCoeff}(a, b) = \left\{
\begin{array}{cc}
(1, 0)     & \textrm{quando}~(b=0) \\
(r_x, r_y) & \textrm{negli altri casi} \\
\end{array}
\right. 
$$

dove:

$$
\begin{array}{rcl}
r_x        & =  & t_y \\
r_y        & =  & t_x - t_y * (a ~ \textrm{div} ~ b) \\
(t_x, t_y) & =  & \textrm{calcolaCoeff}(b, a ~ \textrm{mod} ~ b) \\
\end{array}
$$

Si noti che $a ~ \textrm{div} ~ b$ rappresenta la divisione intera tra due numeri $a$ e $b$, e $a ~ \textrm{mod} ~ b$ rappresenta il calcolo del resto della divisione intera del valore di $a$ per il valore di $b$.

\newpage

## Domanda 1

Implementare la funzione `calcolaCoeff` in Matlab/Octave (si usi `fix(a/b)` per la divisione intera):

**Spazio soluzione:**

&#183;

&#183;

&#183;

&#183;

&#183;

&#183;


## Domanda 2 

Si chiede di scrivere una funzione matlab che riceve i valori $a$, $b$, $w_1$ e $w_2$ e calcoli il valore risultante delle mele $m$ utilizzando la funzione di cui sopra:

**Spazio soluzione:**

&#183;

&#183;

&#183;

&#183;

&#183;

&#183;

## Domanda 3
Come invochereste la funzione `numero_di_mele` per risolvere il problema iniziale della signora del mercato? Quante mele verrebbero calcolate?

**Spazio soluzione:**

&#183;

&#183;

&#183;

&#183;


\newpage

# Esercizio 3

Un calcolatore dotato solamente di memoria centrale (ovvero, sprovvisto di memoria cache) ha un tempo di accesso ai dati pari a 200 ns. Per poter migliorare il tempo di accesso si decide di aggiungere una memoria cache con le seguenti caratteristiche:

* Miss Rate = 30 % 
* Miss Penalty = 600 ns
* Hit Time = 50 ns

Rispondere alle seguenti domande (giustificando i risultati ottenuti con gli opportuni calcoli):

## Domanda 1
Calcolare il tempo medio di accesso ai dati del sistema con memoria cache. 

**Spazio soluzione:**

&#183;

&#183;

&#183;

&#183;

&#183;

&#183;

&#183;

&#183;

## Domanda 2
Mantenendo invariati Miss Penalty e Hit Time, qual è il valore massimo che può avere Miss Rate affinché la cache offra un vantaggio in termini di prestazioni (cioè il tempo medio di accesso con la cache sia inferiore a 200 ns)?

**Spazio soluzione:**

&#183;

&#183;

&#183;

&#183;

&#183;

&#183;

&#183;

&#183;


## Domanda 3
Il progettista della memoria cache è in grado di ridurre Hit Time a 10 ns a fronte di un aumento del Miss Rate al 40%. Questa modifica sarebbe conveniente in termini di prestazioni rispetto al sistema originale?

**Spazio soluzione:**

&#183;

&#183;

&#183;

&#183;

&#183;

&#183;

&#183;

&#183;




