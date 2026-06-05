+++
title = "Sorting Algorithms"
author = ["Alex Leviyev"]
date = 2026-06-04
draft = false
+++

<div class="ox-hugo-toc toc has-section-numbers">

<div class="heading">Table of Contents</div>

- <span class="section-num">1</span> [Merge sort](#merge-sort)
- <span class="section-num">2</span> [Complexity analysis](#complexity-analysis)
- <span class="section-num">3</span> [Comparison of sorting algorithms](#comparison-of-sorting-algorithms)

</div>
<!--endtoc-->

Sorting is a canonical problem in computer science. Here we examine merge sort, which achieves the optimal \\(O(n \log n)\\) comparison complexity.


## <span class="section-num">1</span> Merge sort {#merge-sort}

The algorithm divides the input in half, recursively sorts each half, then merges the sorted halves.

{{< figure src="/figures/merge-sort.svg" caption="<span class=\"figure-number\">Figure 1: </span>Merge sort algorithm." >}}


## <span class="section-num">2</span> Complexity analysis {#complexity-analysis}

<div class="theorem">

Merge sort runs in \\(\Theta(n \log n)\\) time and \\(\Theta(n)\\) extra space.

</div>

<div class="proof">

Let \\(T(n)\\) be the time to sort \\(n\\) elements. The recurrence is
\\[T(n) = 2T(n/2) + \Theta(n), \quad T(1) = \Theta(1).\\]
By the Master Theorem (case 2), \\(T(n) = \Theta(n \log n)\\). The merge step uses an auxiliary array of size \\(n\\), giving \\(\Theta(n)\\) space.

</div>


## <span class="section-num">3</span> Comparison of sorting algorithms {#comparison-of-sorting-algorithms}

| Algorithm   | Best                  | Average               | Worst            | Space           |
|-------------|-----------------------|-----------------------|------------------|-----------------|
| Bubble sort | \\(\Omega(n)\\)       | \\(\Theta(n^2)\\)     | \\(O(n^2)\\)     | \\(O(1)\\)      |
| Merge sort  | \\(\Omega(n\log n)\\) | \\(\Theta(n\log n)\\) | \\(O(n\log n)\\) | \\(O(n)\\)      |
| Quicksort   | \\(\Omega(n\log n)\\) | \\(\Theta(n\log n)\\) | \\(O(n^2)\\)     | \\(O(\log n)\\) |
| Heapsort    | \\(\Omega(n\log n)\\) | \\(\Theta(n\log n)\\) | \\(O(n\log n)\\) | \\(O(1)\\)      |

<div class="remark">

The \\(\Omega(n \log n)\\) lower bound for comparison-based sorting follows from the decision tree model: any algorithm must distinguish \\(n!\\) permutations, requiring at least \\(\log\_2(n!) = \Theta(n \log n)\\) comparisons.

</div>
