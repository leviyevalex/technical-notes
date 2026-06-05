+++
title = "The Birthday Problem"
author = ["Alex Leviyev"]
date = 2026-06-04
draft = false
+++

How many people must be in a room before the probability that two share a birthday exceeds \\(1/2\\)?

<div class="theorem">

In a group of \\(n\\) people, the probability that at least two share a birthday is
\\[P(n) = 1 - \frac{365!}{(365-n)! \cdot 365^n}.\\]

</div>

<div class="proof">

The complement is the event that all birthdays are distinct. The first person can have any birthday, the second must avoid 1 date, and so on:
\\[P(\text{all distinct}) = 1 \cdot \frac{364}{365} \cdot \frac{363}{365} \cdots \frac{365-n+1}{365}.\\]
Subtracting from 1 gives the result.

</div>

The threshold is \\(n = 23\\): with 23 people, \\(P(23) \approx 0.507\\).
