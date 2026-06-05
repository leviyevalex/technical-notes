+++
title = "The Coupon Collector"
author = ["Alex Leviyev"]
date = 2026-06-04
draft = false
+++

A cereal box contains one of \\(n\\) distinct coupons uniformly at random. How many boxes must you buy to collect all \\(n\\) coupons?

<div class="theorem">

The expected number of boxes to collect all \\(n\\) coupons is
\\[E[T] = n \sum\_{k=1}^{n} \frac{1}{k} = n H\_n \sim n \ln n.\\]

</div>

<div class="proof">

Let \\(T\_k\\) be the number of additional boxes needed to go from \\(k-1\\) distinct coupons to \\(k\\). At that stage, each box yields a new coupon with probability \\((n - k + 1)/n\\), so \\(T\_k \sim \text{Geom}\\!\left(\frac{n-k+1}{n}\right)\\) and \\(E[T\_k] = \frac{n}{n-k+1}\\). Summing over \\(k = 1, \ldots, n\\):
\\[E[T] = \sum\_{k=1}^{n} \frac{n}{n-k+1} = n \sum\_{j=1}^{n} \frac{1}{j} = n H\_n. \qquad \square\\]

</div>
