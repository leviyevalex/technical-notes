+++
title = "Random Walk"
date = 2026-06-04
draft = false
+++

A random walk models a particle moving randomly through space. It arises in physics (Brownian motion), finance (stock prices), and combinatorics.

## Definition

<div class="definition">

**Definition.** A *symmetric random walk* on $\mathbb{Z}$ is a process $(X_n)_{n \geq 0}$ with $X_0 = 0$ and i.i.d. increments $\xi_k$ satisfying
$$P(\xi_k = +1) = P(\xi_k = -1) = \tfrac{1}{2}.$$

</div>

The transition diagram on the finite state space $\{-2, \ldots, 2\}$:

{{< figure src="/figures/random-walk.svg" caption="Transition diagram for a symmetric random walk." >}}

## The optional stopping theorem

<div class="theorem">

**Theorem.** Let $T = \min\{n \geq 0 : X_n \notin (-N, N)\}$. Then $E[T] = N^2 - X_0^2$ and
$$P(X_T = N \mid X_0 = x) = \frac{x + N}{2N}.$$

</div>

## Recurrence

<div class="theorem">

**Theorem.** The symmetric random walk on $\mathbb{Z}$ is *recurrent*: starting from any position, it returns with probability 1.

</div>

<div class="proof">

By Stirling's approximation, the return probability at time $2n$ satisfies
\begin{equation}
p_{2n} = \binom{2n}{n} \frac{1}{4^n} \sim \frac{1}{\sqrt{\pi n}}
\label{eq:return-prob}
\end{equation}
The series $\sum_{n=1}^{\infty} p_{2n}$ diverges since by \eqref{eq:return-prob} it behaves like the harmonic series $\sum n^{-1/2}$. Return is therefore certain by the second Borel-Cantelli lemma.

</div>

<div class="remark">

**Remark.** Recurrence fails in dimension $d \geq 3$: the symmetric random walk on $\mathbb{Z}^d$ is transient for $d \geq 3$.

</div>
