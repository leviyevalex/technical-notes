+++
title = "propositional logic"
author = ["Alex Leviyev"]
date = 2025-12-17T12:27:00-05:00
tags = ["math", "results", "theory"]
draft = false
+++

<div class="ox-hugo-toc toc has-section-numbers">

<div class="heading">Table of Contents</div>

- <span class="section-num">1</span> [Motivation](#motivation)
- <span class="section-num">2</span> [Some results from logic.](#some-results-from-logic-dot)
- <span class="section-num">3</span> [XNOR operator](#xnor-operator)

</div>
<!--endtoc-->



## <span class="section-num">1</span> Motivation {#motivation}

A lot of set theory identities can be proven quite directly using propositional logic.
I like this approach because it requires you to really understand how to work with these primitive objects, and the proofs become very obvious as a result.
In this note my goal is to keep track of those results from propositional logic that I need to go on to work with more complicated proofs.


## <span class="section-num">2</span> Some results from logic. {#some-results-from-logic-dot}

Let \\(p, q\\) be propositions.
We want the logical and operator &ldquo;\\(\wedge\\)&rdquo; to operationally implement the following idea:
\\(p \wedge q\\) is true iff \\(p\\) and \\(q\\) are both true.
This motivates the following:

<div class="definition">

The logical and \\(\wedge\\) is a map which takes two Booleans and outputs a Boolean according to the following rule:

| \\(p\\) | \\(q\\) | \\(p \wedge q\\) |
|---------|---------|------------------|
| T       | T       | T                |
| T       | F       | F                |
| F       | T       | F                |
| F       | F       | F                |

</div>

Similarly, an or should operationally implement the following: &ldquo;\\(p \vee q\\) is true iff at least one \\(p, q\\) is true&rdquo;.

<div class="definition">

Logical or is the Boolean map defined as follows:

| \\(p\\) | \\(q\\) | \\(p \vee q\\) |
|---------|---------|----------------|
| T       | T       | T              |
| T       | F       | T              |
| F       | T       | T              |
| F       | F       | F              |

</div>

<div class="corollary">

\\(p \wedge q \equiv q \wedge p\\) and \\(p \vee q \equiv q \vee p\\).

</div>

<div class="proof">

Follows immediately from the respective truth tables.

</div>

<div class="proposition">

We have the following

1.  \\(p \wedge q \equiv \neg (\neg p \vee \neg q)\\)

2.  \\(p \vee q \equiv \neg (\neg p \wedge \neg q)\\)

</div>

<div class="proof">

Simplest thing I can think of are tables again:
(i) We get:

| \\(p\\) | \\(q\\) | \\(\neg (\neg p \vee \neg q)\\) | \\(p \wedge q\\) |
|---------|---------|---------------------------------|------------------|
| T       | T       | \\(\neg(F \vee F) \equiv T\\)   | T                |
| F       | T       | $&not;(T &or; F) &equiv; F      | F                |
| T       | F       | F (by symmetry)                 | F                |
| F       | F       | \\(\neg(T \vee T) \equiv F\\)   | F                |

Hence (i) is true.

(ii)

| \\(p\\) | \\(q\\) | \\(\neg (\neg p \wedge \neg q)\\) | \\(p \vee q\\) |
|---------|---------|-----------------------------------|----------------|
| T       | T       | \\(\neg(F \wedge F) \equiv T\\)   | T              |
| F       | T       | \\(\neg(T \wedge F) \equiv T\\)   | T              |
| T       | F       | T (by symmetry)                   | T              |
| F       | F       | \\(\neg(T \wedge T) \equiv F\\)   | F              |

Hence, (ii) is true as well.

</div>

<div class="proposition">

We have the following

1.  \\((p \vee q) \wedge r \equiv (p \wedge r) \vee (q \wedge r)\\)
2.  \\((p \wedge q) \vee r \equiv (p \vee r) \wedge (q \vee r)\\)

</div>

<div class="proof">

This is an equality between Booleans.
We can see that they are equivalent by organizing the \\(2^3 = 8\\) possibilities in a table, and making sure they agree in each case.

(i): \\((p \vee q) \wedge r \equiv (p \wedge r) \vee (q \wedge r)\\)

| No. | \\(p\\) | \\(q\\) | \\(r\\) | \\(p \vee q\\) | \\((p \vee q) \wedge r\\) | \\(p \wedge r\\) | \\(q \wedge r\\) | \\((p \wedge r) \vee (q \wedge r)\\) |
|-----|---------|---------|---------|----------------|---------------------------|------------------|------------------|--------------------------------------|
| 1.  | T       | T       | T       | T              | T                         | T                | T                | T                                    |
| 2.  | T       | T       | F       | T              | F                         | F                | F                | F                                    |
| 3.  | T       | F       | T       | T              | T                         | T                | F                | T                                    |
| 4.  | T       | F       | F       | T              | F                         | F                | F                | F                                    |
| 5.  | F       | T       | T       | T              | T                         | F                | T                | T                                    |
| 6.  | F       | T       | F       | T              | F                         | F                | F                | F                                    |
| 7.  | F       | F       | T       | F              | F                         | F                | F                | F                                    |
| 8.  | F       | F       | F       | F              | F                         | F                | F                | F                                    |

(ii): \\((p \wedge q) \vee r \equiv (p \vee r) \wedge (q \vee r)\\)

| No. | \\(p\\) | \\(q\\) | \\(r\\) | \\(p \wedge q\\) | \\((p \wedge q) \vee r\\) | \\(p \vee r\\) | \\(q \vee r\\) | \\((p \vee r) \wedge (q \vee r)\\) |
|-----|---------|---------|---------|------------------|---------------------------|----------------|----------------|------------------------------------|
| 1.  | T       | T       | T       | T                | T                         | T              | T              | T                                  |
| 2.  | T       | T       | F       | T                | T                         | T              | T              | T                                  |
| 3.  | T       | F       | T       | F                | T                         | T              | T              | T                                  |
| 4.  | T       | F       | F       | F                | F                         | T              | F              | F                                  |
| 5.  | F       | T       | T       | F                | T                         | T              | T              | T                                  |
| 6.  | F       | T       | F       | F                | F                         | F              | T              | F                                  |
| 7.  | F       | F       | T       | F                | T                         | T              | T              | T                                  |
| 8.  | F       | F       | F       | F                | F                         | F              | F              | F                                  |

</div>

We can also use (i) and De Morgan to prove (ii) if we get sick of truth tables

<div class="proof">

Alternative proof of (ii):

\begin{align\*}
(p \wedge q) \vee r &\equiv \neg (\neg ((p \wedge q) \vee r)) & \text{by double negation} \\\\
&\equiv \neg (\neg (p \wedge q) \wedge \neg r) & \text{by De Morgan} \\\\
&\equiv \neg ((\neg p \vee \neg q) \wedge \neg r) & \text{by De Morgan} \\\\
&\equiv \neg ((\neg p \wedge \neg r) \vee (\neg q \wedge \neg r)) & \text{by result (i)} \\\\
&\equiv \neg (\neg p \wedge \neg r) \wedge \neg (\neg q \wedge \neg r) & \text{by De Morgan} \\\\
&\equiv (p \vee r) \wedge (q \vee r) & \text{by De Morgan}
\end{align\*}

</div>

This proof is good practice in manipulating propositions.

<div class="proposition">

If \\(p \implies q\\), then \\(p \land q \iff p\\).

</div>

<div class="proof">

This can be proven via a truth table:

{{< figure src="/figures/20251217T122705/tab-1.svg" >}}

The truth table demonstrates that the biconditional \\(p \land q \iff p\\) is true whenever the implication \\(p \implies q\\) is true.

</div>


## <span class="section-num">3</span> XNOR operator {#xnor-operator}

<div class="definition">

Let \\(A, B\\) be propositions.
The ****XNOR operator****:

\begin{align}
A \leftrightarrow B :\Leftrightarrow (A \wedge B) \vee (\neg A \wedge \neg B)
\end{align}

</div>

<div class="proposition">

We have the following

1.  Commutativity: \\(A \leftrightarrow B = B \leftrightarrow A\\)

2.  Associativity: \\((A \leftrightarrow B) \leftrightarrow C = A \leftrightarrow (B \leftrightarrow C)\\)

3.  Identity: \\(A \leftrightarrow 1 = A\\)

4.  Inversion: \\(A \leftrightarrow 0 = \neg A\\)

5.  Cancelation: \\(A \leftrightarrow A = 1\\)

6.  Parity: \\(\neg(A \leftrightarrow B) = (\neg A) \leftrightarrow B = A \leftrightarrow (\neg B)\\)

7.  Truth table

{{< figure src="/figures/20251217T122705/tab-2.svg" >}}

</div>
