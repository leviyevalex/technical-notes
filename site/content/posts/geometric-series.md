+++
title = "Geometric Series"
date = 2026-06-04
draft = false
+++

The geometric series is one of the most fundamental results in analysis, underpinning everything from probability generating functions to Fourier series.

## The closed form

<div class="definition">

**Definition.** A *geometric series* with ratio $r$ and first term $a$ is the sum
$$S_n = \sum_{k=0}^{n} a r^k = a + ar + ar^2 + \cdots + ar^n.$$

</div>

<div class="theorem">

**Theorem.** For $r \neq 1$,
\begin{equation}
\sum_{k=0}^{n} r^k = \frac{1 - r^{n+1}}{1 - r}
\label{eq:partial-sum}
\end{equation}

</div>

<div class="proof">

Let $S_n = \sum_{k=0}^{n} r^k$. Then $r S_n = \sum_{k=1}^{n+1} r^k$, so
$$S_n - r S_n = 1 - r^{n+1} \implies S_n = \frac{1 - r^{n+1}}{1-r}. \label{eq:derivation} \quad \square$$

</div>

## The infinite series

<div class="corollary">

**Corollary.** If $|r| < 1$ then taking $n \to \infty$ in \eqref{eq:partial-sum} gives
\begin{equation}
\sum_{k=0}^{\infty} r^k = \frac{1}{1-r}
\label{eq:infinite-sum}
\end{equation}

</div>

The rate of convergence is geometric: each term is $r$ times the previous. For $r = 1/2$, equation \eqref{eq:infinite-sum} gives the limit $2$:

$$S_n = 2\!\left(1 - \frac{1}{2^{n+1}}\right) \xrightarrow{n\to\infty} 2. \label{eq:half-series}$$

## Application: generating functions

The identity $(1-r)^{-1} = \sum r^k$ is the starting point for many generating function arguments.

## Convergence plot

{{< figure src="/figures/partial-sums.svg" caption="Partial sums of $\\sum (1/2)^k$ converging to 2." >}}
