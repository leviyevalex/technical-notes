+++
title = "St. Petersburg Paradox"
author = ["Alex Leviyev"]
date = 2026-06-04
draft = false
+++

A fair coin is flipped until the first head. If the first head appears on flip \\(k\\), you win \\(2^k\\) dollars. What is a fair price to pay to play?

The expected winnings are
\\[E[X] = \sum\_{k=1}^{\infty} 2^k \cdot \frac{1}{2^k} = \sum\_{k=1}^{\infty} 1 = \infty.\\]

Despite the infinite expected value, no rational person would pay more than a few dollars to play. This is the **St. Petersburg paradox**, resolved by noting that expected value alone does not capture risk — one must account for the utility of money.

<div class="remark">

Daniel Bernoulli (1738) proposed using logarithmic utility \\(u(x) = \ln x\\), under which the expected utility is finite: \\(E[\ln X] = \sum\_{k=1}^{\infty} k \ln 2 \cdot 2^{-k} = 2 \ln 2 < \infty\\).

</div>
