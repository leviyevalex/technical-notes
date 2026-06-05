+++
title = "Random Walk"
author = ["Alex Leviyev"]
date = 2026-06-04
draft = false
+++

<div class="ox-hugo-toc toc has-section-numbers">

<div class="heading">Table of Contents</div>

- <span class="section-num">1</span> [Definition](#definition)
- <span class="section-num">2</span> [The optional stopping theorem](#the-optional-stopping-theorem)
- <span class="section-num">3</span> [Recurrence](#recurrence)

</div>
<!--endtoc-->

A random walk is a stochastic process that models a particle moving randomly through space. It arises naturally in physics (Brownian motion), finance (stock prices), and combinatorics.


## <span class="section-num">1</span> Definition {#definition}

<div class="definition">

A **symmetric random walk** on \\(\mathbb{Z}\\) is a process \\((X\_n)\_{n \geq 0}\\) with \\(X\_0 = 0\\) and i.i.d. increments \\(\xi\_k\\) satisfying
\\[P(\xi\_k = +1) = P(\xi\_k = -1) = \tfrac{1}{2}.\\]

</div>

The transition diagram on the finite state space \\(\\{-2, \ldots, 2\\}\\):

{{< figure src="/figures/random-walk.svg" caption="<span class=\"figure-number\">Figure 1: </span>Transition diagram for a symmetric random walk on \\(\\{-2,-1,0,1,2\\}\\)." >}}


## <span class="section-num">2</span> The optional stopping theorem {#the-optional-stopping-theorem}

<div class="theorem">

Let \\(T = \min\\{n \geq 0 : X\_n \notin (-N, N)\\}\\). Then \\(E[T] = N^2 - X\_0^2\\) and
\\[P(X\_T = N \mid X\_0 = x) = \frac{x + N}{2N}.\\]

</div>


## <span class="section-num">3</span> Recurrence {#recurrence}

<div class="theorem">

The symmetric random walk on \\(\mathbb{Z}\\) is **recurrent**: starting from any position, it returns to that position with probability 1.

</div>

<div class="proof">

By Stirling&rsquo;s approximation, the return probability at time \\(2n\\) satisfies
\\[p\_{2n} = \binom{2n}{n} \frac{1}{4^n} \sim \frac{1}{\sqrt{\pi n}},\\]
and since \\(\sum\_{n=1}^{\infty} p\_{2n} = \infty\\), return is certain by the second Borel-Cantelli lemma.

</div>

<div class="remark">

Recurrence fails in three or more dimensions: the symmetric random walk on \\(\mathbb{Z}^d\\) is transient for \\(d \geq 3\\).

</div>
