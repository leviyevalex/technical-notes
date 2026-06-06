+++
title = "hugo-converstion-test"
author = ["Alex Leviyev"]
date = 2026-06-05T15:29:00-04:00
draft = false
+++

<div class="ox-hugo-toc toc has-section-numbers">

<div class="heading">Table of Contents</div>

- <span class="section-num">1</span> [Section One](#section-one)
- <span class="section-num">2</span> [Section Two](#section-two)
- <span class="section-num">3</span> [Geometric Series](#geometric-series)
- <span class="section-num">4</span> [Partial Sums](#partial-sums)
- <span class="section-num">5</span> [Symmetric Random Walk](#symmetric-random-walk)
- <span class="section-num">6</span> [Algorithm: Estimating \\(\pi\\) by Monte Carlo](#algorithm-estimating-pi-by-monte-carlo)
- <span class="section-num">7</span> [Fermat&rsquo;s Last Theorem](#fermat-and-rsquo-s-last-theorem)

</div>
<!--endtoc-->



## <span class="section-num">1</span> Section One {#section-one}

Text before any environments. Cross-references: \cref{thm:named} and
\cref{fig:test} and equation \\(\eqref{eq:test}\\).

<div class="theorem" id="thm:named" data-name="Named Theorem">

Every continuous function on a closed interval attains its maximum.

</div>

<div class="theorem">

This theorem is unnamed and unlabeled. It should be numbered Theorem 1.2.

</div>

<div class="definition" id="def:named" data-name="Named Definition">

A **metric space** is a set \\(X\\) with a distance function \\(d : X \times X \to \mathbb{R}\_{\geq 0}\\).

</div>

The labeled equation below:

\begin{equation}
  \label{eq:test}
  e^{i\pi} + 1 = 0.
\end{equation}

See also [Useful sequences and series results](../20251027T102650--useful-sequences-and-series-results__math_review/).
Citation: (<a href="#citeproc_bib_item_1">Blitzstein and Hwang 2019</a>).

{{< figure src="/figures/20260605T152947/test.svg" id="fig:test" caption="Test tikz figure." >}}


## <span class="section-num">2</span> Section Two {#section-two}

Counter should reset here. \cref{cor:test} is in this section.

<div class="lemma" id="lem:test" data-name="Test Lemma">

This is Lemma 2.1.

</div>

<div class="corollary" id="cor:test" data-name="Test Corollary">

This is Corollary 2.2, referencing \cref{thm:named} from section 1.

</div>


## <span class="section-num">3</span> Geometric Series {#geometric-series}

<div class="definition">

A **geometric series** with ratio \\(r\\) and first term \\(a\\) is the finite sum
\\[
  S\_n = \sum\_{k=0}^{n} a r^k = a + ar + ar^2 + \cdots + ar^n.
\\]

</div>

<div class="theorem" id="thm:geometric-sum" data-name="Geometric Sum Formula">

For \\(r \neq 1\\),

\begin{equation}
  \label{eq:geometric-sum}
  \sum\_{k=0}^{n} r^k = \frac{1 - r^{n+1}}{1 - r}.
\end{equation}

</div>

<div class="proof">

Let \\(S\_n = \sum\_{k=0}^{n} r^k\\).  Multiplying by \\(r\\) shifts the index:
\\[
  r S\_n = \sum\_{k=1}^{n+1} r^k.
\\]
Subtracting gives \\(S\_n(1 - r) = 1 - r^{n+1}\\), and dividing by \\((1-r)\\) yields the result.

</div>

Further results on related series can be found in [Useful sequences and series results](../20251027T102650--useful-sequences-and-series-results__math_review/).

<div class="corollary" id="cor:geometric-series" data-name="Infinite Geometric Series">

If \\(|r| < 1\\) then letting \\(n \to \infty\\) in \\(\eqref{eq:geometric-sum}\\) gives
\\(\displaystyle\sum\_{k=0}^{\infty} r^k = \dfrac{1}{1-r}\\).

</div>

<div class="remark">

The identity \\(\sum\_{k=0}^{\infty} r^k = (1-r)^{-1}\\) is the starting point for many generating-function arguments; see (<a href="#citeproc_bib_item_1">Blitzstein and Hwang 2019</a>) for applications to probability.

</div>


## <span class="section-num">4</span> Partial Sums {#partial-sums}

By \cref{thm:geometric-sum}, the partial sums \\(S\_n = \sum\_{k=0}^{n} (1/2)^k\\) satisfy \\(S\_n = 2(1 - 2^{-(n+1)})\\) via \\(\eqref{eq:geometric-sum}\\).  \Cref{fig:partial-sums} shows convergence to the limit given by \cref{cor:geometric-series}.

{{< figure src="/figures/20260605T152947/partial-sums.svg" id="fig:partial-sums" caption="Partial sums converging." >}}


## <span class="section-num">5</span> Symmetric Random Walk {#symmetric-random-walk}

<div class="definition" data-name="Symmetric random walk">

A **symmetric random walk** on \\(\mathbb{Z}\\) is a stochastic process \\((X\_n)\_{n \geq 0}\\) with \\(X\_0 = 0\\) and increments \\(\xi\_k \in \\{-1, +1\\}\\) each taken with probability \\(\tfrac{1}{2}\\).

</div>

The transition structure on the finite state space \\(\\{-2, \ldots, 2\\}\\) is shown in \cref{fig:random-walk}.

{{< figure src="/figures/20260605T152947/random-walk.svg" id="fig:random-walk" caption="Symmetric random walk on $\{-2,-1,0,1,2\}$." >}}

<div class="lemma" id="lem:optional-stopping" data-name="Optional Stopping">

Let \\(T = \min\\{n : X\_n \notin \\{-N, \ldots, N\\}\\}\\).  By the optional stopping theorem,
\\[
  \mathbb{E}[X\_T] = \mathbb{E}[X\_0] = 0.
\\]

</div>

\Cref{lem:optional-stopping} shows the walk is unbiased regardless of the stopping time.


## <span class="section-num">6</span> Algorithm: Estimating \\(\pi\\) by Monte Carlo {#algorithm-estimating-pi-by-monte-carlo}

<div class="exmple">

Throw \\(n\\) darts uniformly at random into the square \\([-1,1]^2\\).  A fraction \\(\approx \pi/4\\) land inside the unit disk.

</div>

{{< figure src="/figures/20260605T152947/algo-1.svg" >}}


## <span class="section-num">7</span> Fermat&rsquo;s Last Theorem {#fermat-and-rsquo-s-last-theorem}

<div class="theorem" id="thm:fermat" data-name="Fermat's Last Theorem">

For any integer \\(n > 2\\), there are no positive integers \\(a\\), \\(b\\), \\(c\\) satisfying
\\[
  a^n + b^n = c^n.
\\]

</div>

\Cref{thm:fermat} is in stark contrast to \cref{thm:geometric-sum}: the latter provides an explicit closed form for integer exponents, while the former rules out nontrivial integer solutions for exponents \\(n > 2\\).

## References

<style>.csl-entry{text-indent: -1.5em; margin-left: 1.5em;}</style><div class="csl-bib-body">
  <div class="csl-entry"><a id="citeproc_bib_item_1"></a>Blitzstein, Joseph K., and Jessica Hwang. 2019. <i>Introduction to Probability</i>. Chapman and Hall/CRC. <a href="https://doi.org/10.1201/9780429428357">https://doi.org/10.1201/9780429428357</a>.</div>
</div>
