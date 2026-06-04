+++
title = "Sorting Algorithms"
date = 2026-06-04
draft = false
+++

Sorting is a canonical problem in computer science. Merge sort achieves the optimal $O(n \log n)$ comparison complexity.

## Merge sort

The algorithm divides the input in half, recursively sorts each half, then merges.

{{< figure src="/figures/merge-sort.svg" caption="Merge sort algorithm." >}}

## Complexity analysis

<div class="theorem">

**Theorem.** Merge sort runs in $\Theta(n \log n)$ time and $\Theta(n)$ extra space.

</div>

<div class="proof">

Let $T(n)$ be the time to sort $n$ elements. The recurrence is
$$T(n) = 2T(n/2) + \Theta(n), \quad T(1) = \Theta(1).$$
By the Master Theorem (case 2), $T(n) = \Theta(n \log n)$. The merge step uses an auxiliary array of size $n$, giving $\Theta(n)$ space.

</div>

## Implementation

```python
def merge_sort(arr):
    if len(arr) <= 1:
        return arr
    mid = len(arr) // 2
    left  = merge_sort(arr[:mid])
    right = merge_sort(arr[mid:])
    return merge(left, right)

def merge(left, right):
    result = []
    i = j = 0
    while i < len(left) and j < len(right):
        if left[i] <= right[j]:
            result.append(left[i]); i += 1
        else:
            result.append(right[j]); j += 1
    return result + left[i:] + right[j:]
```

## Comparison table

| Algorithm | Best | Average | Worst | Space |
|---|---|---|---|---|
| Bubble sort | $\Omega(n)$ | $\Theta(n^2)$ | $O(n^2)$ | $O(1)$ |
| Merge sort | $\Omega(n \log n)$ | $\Theta(n \log n)$ | $O(n \log n)$ | $O(n)$ |
| Quicksort | $\Omega(n \log n)$ | $\Theta(n \log n)$ | $O(n^2)$ | $O(\log n)$ |
| Heapsort | $\Omega(n \log n)$ | $\Theta(n \log n)$ | $O(n \log n)$ | $O(1)$ |

<div class="remark">

**Remark.** The $\Omega(n \log n)$ lower bound follows from the decision tree model: any algorithm must distinguish $n!$ permutations, requiring at least $\log_2(n!) = \Theta(n \log n)$ comparisons.

</div>
