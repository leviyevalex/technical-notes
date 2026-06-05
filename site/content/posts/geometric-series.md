+++
title = "Geometric Series"
author = ["Alex Leviyev"]
date = 2026-06-04
draft = false
+++

<div class="ox-hugo-toc toc has-section-numbers">

<div class="heading">Table of Contents</div>

- <span class="section-num">1</span> [The closed form](#the-closed-form)
- <span class="section-num">2</span> [The infinite series](#the-infinite-series)
- <span class="section-num">3</span> [Application: generating functions](#application-generating-functions)
- <span class="section-num">4</span> [Convergence plot](#convergence-plot)

</div>
<!--endtoc-->

The geometric series is one of the most fundamental results in analysis, underpinning everything from probability generating functions to Fourier series.


## <span class="section-num">1</span> The closed form {#the-closed-form}

<div class="definition" data-name="Geometric Series">

A **geometric series** with ratio \\(r\\) and first term \\(a\\) is the sum
\\[S\_n = \sum\_{k=0}^{n} a r^k = a + ar + ar^2 + \cdots + ar^n.\\]

</div>

<div class="theorem" data-name="Partial Sum Formula">

For \\(r \neq 1\\),
\\[\sum\_{k=0}^{n} r^k = \frac{1 - r^{n+1}}{1 - r}.\\]

</div>

<div class="proof">

Let \\(S\_n = \sum\_{k=0}^{n} r^k\\). Then \\(r S\_n = \sum\_{k=1}^{n+1} r^k\\), so
\\[S\_n - r S\_n = 1 - r^{n+1} \implies S\_n = \frac{1 - r^{n+1}}{1-r}. \qquad \square\\]

</div>


## <span class="section-num">2</span> The infinite series {#the-infinite-series}

<div class="corollary" data-name="Infinite Geometric Series">

If \\(|r| < 1\\) then \\(\displaystyle\sum\_{k=0}^{\infty} r^k = \frac{1}{1-r}\\).

</div>

The rate of convergence is geometric: each term is \\(r\\) times the previous. For \\(r = 1/2\\):

\\[S\_n = 2\left(1 - \frac{1}{2^{n+1}}\right) \xrightarrow{n\to\infty} 2.\\]


## <span class="section-num">3</span> Application: generating functions {#application-generating-functions}

The identity \\((1-r)^{-1} = \sum r^k\\) is the starting point for many generating function arguments. For instance, the number of ways to make change for \\(n\\) cents using pennies satisfies a recurrence whose generating function is exactly a geometric series (Blitzstein, Joseph K. and Hwang, Jessica, 2019).


## <span class="section-num">4</span> Convergence plot {#convergence-plot}

The following figure shows the partial sums \\(S\_n\\) for \\(r = 1/2\\) approaching \\(2\\):

{{< figure src="/figures/partial-sums.svg" caption="<span class=\"figure-number\">Figure 1: </span>Partial sums of \\(\sum (1/2)^k\\) converging to 2." >}}
