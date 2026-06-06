+++
title = "Useful sequences and series results"
author = ["Alex Leviyev"]
date = 2025-10-27T10:26:00-04:00
tags = ["math", "review"]
draft = false
+++

## Motivation {#motivation}

I run into sequences and series all the time in practice.
However, I always feels like it takes me longer to manipulate them and perform the desired operations than necessary.
In this note I will keep a collection of the results I see used repeatedly, and those results that I find useful on this topic.

NOTE: Keep the context of where you used these results for future reference!!!


## Arithmetic sequence {#arithmetic-sequence}

\begin{align}
\sum\_{i=0}^{n} i = \sum\_{i=1}^{n} i = \frac{n(n+1)}{2}
\end{align}


## Finite Geometric Series {#finite-geometric-series}

A standard proof for the finite geometric series takes advantage of recursive structure in the sum:

<div class="proposition">

The finite geometric series formula is given by

\begin{equation}
\sum\_{k=0}^{n} r^k = \frac{1- r^{n+1}}{1-r}
\end{equation}

</div>

<div class="proof">

\begin{align\*}
S &= r^0 + r^1 + r^2 + \dots + r^n \\\\
  &= 1 + r^1 + r^2 + \dots + r^n \\\\
  &= 1 + r [1 + r + \dots + r^{n-1}] \\\\
  &= 1 + r [S - r^n] \\\\
\end{align\*}

Solving for \\(S\\) gives us

\begin{align\*}
&\Rightarrow \quad S = 1 + rS - r^{n+1} \\\\
&\Rightarrow \quad S[1-r] = 1 - r^{n+1} \\\\
&\Rightarrow \quad S = \frac{1-r^{n+1}}{1-r}. \qed
\end{align\*}

</div>


## Infinite geometric series {#infinite-geometric-series}

This follows as a corollary from the finite geometric series

<div class="corollary">

Assuming \\(|r| < 1\\), we have the following

\begin{equation\*}
\sum\_{n=0}^{\infty} r^n = \frac{1}{1-r}
\end{equation\*}

</div>

<div class="remark">

The geometric series formula is famous and comes up everywhere.
The finite geometric series formula also pops up everywhere, but is a bit more complicated to remember.
However, if we remember the geometric series result, we can recover the finite series result by remembering two things:

1.  The finite series must be _smaller_ than the infinite series since there are less terms.
    This reminds us that something must be subtracted in the numerator
2.  The thing that must be subtracted in the numerator should make it so that for n=0, we get r^0=1.
    The only thing that can do this is by subtracting \\(r^{n+1}\\) in the numerator!

</div>

<div class="proposition">

\begin{align}
\sum\_{k=1}^{\infty} k q^{k-1} = \frac{1}{(1-q)^2}
\end{align}

</div>

<div class="proof">

Recall that

\begin{align}
\sum\_{k=0}^{\infty} q^k = \frac{1}{1-q}
\end{align}

Hence

\begin{align\*}
\frac{d}{dq} \sum\_{k=0}^{\infty} q^k &= \sum\_{k=0}^{\infty} \frac{d}{dq} q^k \\\\
&= \sum\_{k=0}^{\infty} k q^{k-1} \\\\
&= \sum\_{k=1}^{\infty} k q^{k-1} \\\\
&= \frac{d}{dq} \frac{1}{1-q} \\\\
&= \frac{1}{(1-q)^2}
\end{align\*}

</div>

<div class="lemma">

Lemma: For \\(|q| < 1\\), define

\begin{align}
S\_n(q) = \sum\_{k=1}^{\infty} k^n q^{k-1}
\end{align}

Then the following recurrence is satisfied:

\begin{align}
S\_n(q) = \frac{d}{dq} [q S\_{n-1}(q)]
\end{align}

</div>

Example:

We know that

\begin{align}
S\_0(q) = \frac{1}{1-q}
\end{align}

Hence

\begin{align\*}
S\_1(q) &= \frac{d}{dq} \left[ \frac{q}{1-q} \right] \\\\
&= \frac{(1-q)1 - q(-1)}{(1-q)^2} \\\\
&= \frac{1}{(1-q)^2}
\end{align\*}

This agrees with our previous derivation.

One more time:

\begin{align\*}
S\_2(q) &= \frac{d}{dq} [q S\_1(q)] \\\\
&= \frac{d}{dq} \left[ \frac{q}{(1-q)^2} \right] \\\\
&= \frac{(1-q)^2 1 + q \cdot 2(1-q)}{(1-q)^4} \\\\
&= \frac{1 - 2q + q^2 + 2q - 2q^2}{(1-q)^4} \\\\
&= \frac{(1-q^2)}{(1-q)^4} \\\\
&= \frac{(1-q)(1+q)}{(1-q)^4} \\\\
&= \frac{1+q}{(1-q)^3}
\end{align\*}

It takes a bit of crunchwork to get, but at least we get to leverage known results to speed things up.

I think I needed to use the following in either the enumerative combinatorics course or proofs that really count.

<div class="corollary">

Let \\(r \in \mathbb{R}\\). Then for \\(|x| < |r|\\)
\\[
\frac{1}{x+r} = \sum\_{n=0}^{\infty} (-1)^n \frac{1}{r^{n+1}} x^n
\\]

</div>

<div class="proof">

\begin{align\*}
\frac{1}{x+r} &= \frac{1}{r} \left[ \frac{1}{1+\frac{x}{r}} \right] \\\\
&= \frac{1}{r} \left[ \frac{1}{1 - \left(-\frac{x}{r}\right)} \right] \\\\
&= \frac{1}{r} \sum\_{n=0}^{\infty} \left(-\frac{x}{r}\right)^n \quad \text{Assumption: } \left|\frac{x}{r}\right| < 1 \implies |x| < |r| \\\\
&= \sum\_{n=0}^{\infty} (-1)^n \frac{1}{r^{n+1}} x^n
\end{align\*}

</div>


### Geometric series generalizations {#geometric-series-generalizations}

<div class="proposition">

Let \\(n \ge 0\\), and define the following infinite sum

\begin{align}
S\_n(p) := \sum\_{k=0}^{\infty} k^n p^k
\end{align}

Then the following recursion relation holds:

\begin{align}
S\_n(p) = \left( p \frac{d}{dp} \right)^n \left[ \frac{1}{1-p} \right]
\end{align}

</div>

<div class="proof">

We verify this by induction.
Let \\(n=0\\).
Then

\begin{align}
S\_0(p) = \frac{1}{1-p}
\end{align}

This is the well known geometric series formula.
Now assume the expression holds for \\(n=m\\).
Then

\begin{align\*}
S\_{m+1} &= \sum\_{k=0}^{\infty} k^{m+1} p^k \\\\
&= \sum\_{k=0}^{\infty} k^m k p^k \\\\
&= \sum\_{k=0}^{\infty} k^m p \frac{d}{dp} [p^k] \\\\
&= p \sum\_{k=0}^{\infty} k^m \frac{d}{dp} [p^k] \\\\
&= p \sum\_{k=0}^{\infty} \frac{d}{dp} [k^m p^k] \\\\
&= p \frac{d}{dp} \sum\_{k=0}^{\infty} k^m p^k \\\\
&= \left( p \frac{d}{dp} \right) \left( p \frac{d}{dp} \right)^m \left[ \frac{1}{1-p} \right] \\\\
&= \left( p \frac{d}{dp} \right)^{m+1} \left[ \frac{1}{1-p} \right].
\end{align\*}

</div>

The benefit of this expression is that it allows us to calculate many seemingly different series using the same idea.
Any moment of the geometric series can be calculated quickly by repeated (careful) application of the quotient rule.

<div class="corollary">

Even and odd subsets can be calculated easily:

(i)

\begin{align}
\sum\_{\substack{k=0 \\\ \text{odds}}}^{\infty} k^n p^k = \frac{S\_n(p) - S\_n(-p)}{2}
\end{align}

(ii)

\begin{align}
\sum\_{\substack{k=0 \\\ \text{evens}}}^{\infty} k^n p^k = \frac{S\_n(p) + S\_n(-p)}{2}
\end{align}

</div>

<div class="proof">

(i) We have

\begin{align\*}
S\_n(p) + S\_n(-p) &= \sum\_{k=0}^{\infty} k^n p^k + \sum\_{k=0}^{\infty} k^n (-p)^k \\\\
&= \sum\_{k=0}^{\infty} k^n p^k [1 + (-1)^k] \\\\
&= 2 \sum\_{\substack{k=0 \\\ \text{evens}}}^{\infty} k^n p^k
\end{align\*}

(ii) Similar idea.

</div>


### (OLD) Proposition: Even and Odd Sub-sequences of Geometric Series {#old--proposition-even-and-odd-sub-sequences-of-geometric-series}

Let \\(S = \sum\_{k=0}^{\infty} r^k\\) be a convergent geometric series with \\(|r| < 1\\).

Then

\begin{align\*}
\sum\_{n \in \text{evens}} r^n &= \sum\_{i=0}^{\infty} r^{2i} \\\\
&= \sum\_{i=0}^{\infty} (r^2)^i \\\\
&= \frac{1}{1-r^2}
\end{align\*}

\begin{align\*}
\sum\_{m \in \text{odds}} r^n &= \frac{r}{r} \sum\_{m \in \text{odds}} r^m \\\\
&= r \sum\_{m \in \text{odds}} r^{m-1} \\\\
&= r \sum\_{n \in \text{evens}} r^n \\\\
&= \frac{r}{1-r^2}
\end{align\*}


## Selected results on sums {#selected-results-on-sums}

<div class="proposition">

Let \\(X, Y\\) be discrete sets.
(i)

\begin{align}
\sum\_{x \in X} \sum\_{y \in Y} f(x,y) = \sum\_{y \in Y} \sum\_{x \in X} f(x,y)
\end{align}

I.e, row major and column major sums are equivalent, which exhibits itself as commutativity of the summation operators.

(ii)

\begin{align}
\sum\_{x \in X} \sum\_{y \in Y} f(x)g(y) = \left[ \sum\_{x \in X} f(x) \right] \left[ \sum\_{y \in Y} g(y) \right]
\end{align}

</div>

<div class="proof">

(i) Since \\(X, Y\\) are discrete, all values \\(f(x\_i, y\_j)\\), \\(1 \le i \le m\\), \\(1 \le j \le n\\) can be organized in a matrix:

\begin{align}
M = \begin{bmatrix}
f\_{11} & f\_{12} & \cdots & f\_{1n} \\\\
f\_{21} & \ddots & & f\_{2n} \\\\
\vdots & & \ddots & \vdots \\\\
f\_{m1} & f\_{m2} & \cdots & f\_{mn}
\end{bmatrix}
\end{align}

\\(\sum\_{x \in X} \sum\_{y \in Y}\\) is a row major summing operation over \\(M\\).
\\(\sum\_{y \in Y} \sum\_{x \in X}\\) is a column major summing operation over \\(M\\).
Clearly, they should yield the same result.
NOTE: This implies that finite summation is commutative.

(ii) This assumes special structure in the matrix:

\begin{align}
M = \begin{bmatrix}
f(1)g(1) & f(1)g(2) & \cdots & f(1)g(n) \\\\
f(2)g(1) & & & f(2)g(n) \\\\
\vdots & & & \vdots \\\\
f(m)g(1) & f(m)g(2) & \cdots & f(m)g(n)
\end{bmatrix}
\end{align}

\begin{align\*}
\sum\_{x \in X} \sum\_{y \in Y} f(x)g(y) &= f(1) \left[ g(1) + g(2) + \cdots + g(n) \right] \\\\
&\quad + f(2) \left[ g(1) + g(2) + \cdots + g(n) \right] \\\\
&\quad \vdots \\\\
&\quad + f(m) \left[ g(1) + g(2) + \cdots + g(n) \right] \\\\
&= [f(1) + f(2) + \cdots + f(m)] [g(1) + g(2) + \cdots + g(n)] \\\\
&= \left[ \sum\_{x \in X} f(x) \right] \left[ \sum\_{y \in Y} g(y) \right]
\end{align\*}

</div>

NOTE: I had to use the generalized n version of this for the six fingered man problem!

<div class="lemma">

Let \\(\\{S\_i\\}\_{i=1}^n\\) be a collection of discrete sets, and \\(\\{f\_i\\}\_{i=1}^n\\) be a collection of functions.
Then the following holds:

\begin{align}
\sum\_{x\_1 \in S\_1} \sum\_{x\_2 \in S\_2} \dots \sum\_{x\_n \in S\_n} \left( \prod\_{1 \leq i \leq n} f\_i(x\_i) \right) = \prod\_{1 \leq i \leq n} \left[ \sum\_{x\_i \in S\_i} f\_i(x\_i) \right]
\end{align}

</div>

<div class="proof">

We've seen that for \\(X, Y\\) discrete sets,

\begin{align\*}
\sum\_{x \in X} \sum\_{y \in Y} f(x) g(y) = \left[ \sum\_{x \in X} f(x) \right] \left[ \sum\_{y \in Y} g(y) \right]
\end{align\*}

We now want to generalize this result.
To get this into the form we want, let \\(f\_1 = f\\), \\(f\_2 = g\\), \\(x\_1 = x\\), and \\(x\_2 = y\\).
Then the previous result can be rewritten as

\begin{align\*}
\sum\_{x\_1 \in X\_1} \sum\_{x\_2 \in X\_2} \prod\_{i \in \\{1,2\\}} f\_i(x\_i) = \prod\_{i \in \\{1,2\\}} \sum\_{x\_i \in X\_i} f\_i(x\_i)
\end{align\*}

This can generally be extended via induction.
To demonstrate the idea:

\begin{align\*}
&\sum\_{x\_1 \in X\_1} \sum\_{x\_2 \in X\_2} \sum\_{x\_3 \in X\_3} \prod\_{i \in \\{1,2,3\\}} f\_i(x\_i) \\\\
&= \sum\_{x\_3 \in X\_3} \sum\_{x\_1 \in X\_1} \sum\_{x\_2 \in X\_2} f\_3(x\_3) \prod\_{i \in \\{1,2\\}} f\_i(x\_i) \\\\
&= \sum\_{x\_3 \in X\_3} f\_3(x\_3) \left[ \sum\_{x\_1 \in X\_1} \sum\_{x\_2 \in X\_2} \prod\_{i \in \\{1,2\\}} f\_i(x\_i) \right] \\\\
&= \sum\_{x\_3 \in X\_3} f\_3(x\_3) \left[ \prod\_{i \in \\{1,2\\}} \sum\_{x\_i \in X\_i} f\_i(x\_i) \right] \\\\
&= \left[ \prod\_{i \in \\{1,2\\}} \sum\_{x\_i \in X\_i} f\_i(x\_i) \right] \sum\_{x\_3 \in X\_3} f\_3(x\_3) \\\\
&= \prod\_{i \in \\{1,2,3\\}} \left[ \sum\_{x\_i \in X\_i} f\_i(x\_i) \right]
\end{align\*}

The general case is much the same.

</div>

When we perform a sum over a Cartesian product, we can break up the sum in terms of its individual components.

<div class="theorem">

****Theorem****
Let \\(\\{X\_i\\}\_{i=1}^n\\) be a discrete collection of sets, and \\(f : \prod\_{i=1}^n X\_i \to \mathbb{R}\\).
Then the sum over tuples decomposes:

\begin{align}
\sum\_{(x\_1, \dots, x\_n) \in X\_1 \times \dots \times X\_n} f(x\_1, \dots, x\_n) = \sum\_{x\_1 \in X\_1} \dots \sum\_{x\_n \in X\_n} f(x\_1, \dots, x\_n)
\end{align}

</div>

\#+begin_proof (by example)
Let \\(X = \\{x\_1, x\_2\\}\\), \\(Y = \\{y\_1, y\_2\\}\\).
Then the Cartesian product has the following elements.

\begin{align}
X \times Y = \\{ (x\_1, y\_1), (x\_1, y\_2), (x\_2, y\_1), (x\_2, y\_2) \\}
\end{align}

We therefore have

\begin{align\*}
\sum\_{(x,y) \in X \times Y} f(x,y) &= [f(x\_1, y\_1) + f(x\_1, y\_2)] + [f(x\_2, y\_1) + f(x\_2, y\_2)] \\\\
&= \sum\_{y \in Y} f(x\_1, y) + \sum\_{y \in Y} f(x\_2, y) \\\\
&= \sum\_{y \in Y} [f(x\_1, y) + f(x\_2, y)] \\\\
&= \sum\_{y \in Y} \left[ \sum\_{x \in X} f(x, y) \right]
\end{align\*}

\#+end_proof (by example)
