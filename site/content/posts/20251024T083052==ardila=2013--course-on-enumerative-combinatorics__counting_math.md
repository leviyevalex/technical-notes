+++
title = "course on enumerative combinatorics"
author = ["Alex Leviyev"]
date = 2025-10-24T08:30:00-04:00
tags = ["counting", "math"]
draft = false
+++

## Motivation {#motivation}

Great series of lectures on enumerative combinatorics.
I like this because it is a rigorous course!
<https://www.youtube.com/watch?v=Ss9ukTUJlCo&list=PL-XzhVrXIVeSi7xym1XAfFIxOAaHVhjtP&index=2>


## Lecture 1 {#lecture-1}

What is enumerative combinatorics (EC)?
We can say that EC is about counting.
More precisely, we will be interested in problems where we need to count the number of objects with certain given properties.

However, to say that EC is only about counting misses the mark.
The higher goal of EC, and arguably of most fields, is to deeply _understand_ the problem we are studying.
Counting is but one tool we may use in the higher goal of deeply understanding a problem.
We seek a set of shortcuts, tools, and procedures that facilitate this program.

Most interesting applications require us to count the cardinality of sets that are "unwieldy", in the sense that listing out all the elements is not a feasible approach.
Thus, we need to be clever and exploit _structure_ inherit to the problems we are investigating to make progress.
This creates a positive feedback loop.
Counting requires us to understand the problem.
Understanding facilitates counting, which in turn leads to a deeper understanding of the problem.
We will see that this process occurs organically.

A counting problem follows a predictable template.
We want to count the number of elements in a family of sets \\(S\_n\\), where $n=1, 2, 3, ...$ is some positive integer.
E.g, what is the number of permutations of a set with \\(n\\) elements?
Observe that a solution to this counting problem handles the entire family.

A philosophical question that merits attention is the following: what _is_ a "solution" to a counting problem?
Certainly an explicit expression for the count may be considered a solution.
However, what is considered a solution largely depends on context.
Any one of the following may be what we _actually_ need for our application:

1.  Explicit formula (if its simple then we're happy, if its a horrible mess, then we're not happy.)
2.  Recurrence formula
3.  Formula for _generating function_
4.  Asymptotic formula (sometimes we don't need the exact formula, we just want to know its growth behavior)

Analysis plays a big role in case 4.

To make things concrete, we will consider the following running example.

```text
Let $t_n$ be the number of tilings for a $2 \times n$ rectangle/board, where the tiles are $2 \times 1$ pieces we call "dominoes".
```


### Explicit Formula {#explicit-formula}

An explicit formula for this problem is given by
\\(t\_n = \sum\_{k=0}^{\lfloor{n/2}\rfloor} \binom{n-k}{k}\\),
which is not trivial to guess.
This is interesting from a mathematical and aesthetic standpoint.
However, using this to actually _calculate_ \\(t\_n\\) is not ideal (try it for \\(n=100\\)).

<div class="remark">

Suppose for our application we are only interested in the asymptotic growth behavior of \\(t\_n\\).
Then this explicit formula does _not_ help us, as the asymptotic growth is opaque from this point of view.
This is an example of how even though we have the "answer", it does not help us answer the question we are really interested in.

</div>

We are now interested in deriving a recurrence formula for this problem.

<div class="definition">

A _composition_ of \\(n\\) is an ordered sequence of \\(1\\)'s and \\(2\\)'s that sum to \\(n\\).

</div>

<div class="remark">

A composition can intuitively be thought of as a tiling of an $n$-board with "squares" and "dominoes", where the squares are the 1's and the dominoes are the 2's.

</div>

<div class="proposition">

There is a bijection between the \\(2 \times n\\) board domino tilings and the number of compositions of \\(n\\).

</div>

<div class="proof">

Copy over from notes later

</div>

The explicit formula can is derived by grouping the compositions by the number of "2"'s that appear in the sequence and summing based on those groups.
A similar proof to the one in the lecture is provided in  (NO_ITEM_DATA:Benjamin_2003) (see proof of Identity 4).


### Recursive Formula {#recursive-formula}

Because of the _sum rule_, which states that the number of outcomes of two independent experiments is the sum, we discover that the compositions have a recursive structure
\\[ t\_{n+1} = t\_n + t\_{n-1} \\].
FOOTNOTE: The sum rule is discussed in Lecture 2.
This is identical to the Fibonacci recursion, but we will see the initial conditions are slightly different.
The initial conditions for the standard Fibonacci sequence are \\(t\_0=1, t\_1=1\\).
However, to count the number of compositions, we use \\(t\_1=1, t\_2=2\\).
The relationship between the two sequences is \\(t\_{n} = f\_{n+1\\)}, where \\(f\_n\\) denote the standard Fibonacci numbers.

<div class="remark">

With the defined recursion and initial conditions \\(t\_1=1, t\_2=2\\), the resulting sequence is

| Index | 1 | 2 | 3 | 4 | ... |
|-------|---|---|---|---|-----|
| Value | 1 | 2 | 3 | 5 | ... |

The same sequence can be generated starting from index \\(0\\) by using \\(t\_0=1, t\_1=1\\).
For this reason, it is convention to actually count the "empty sequence" as a valid configuration.

</div>


### Generating function {#generating-function}

<div class="definition">

The _generating function_ associated with a sequence \\(f\_n\\) is an infinite power series
\\[F(x) = f\_0 x^0 + f\_1 x^1 + f\_2 x^2 + f\_3 x^3 ...\\]

</div>

It it curious that an infinite power series (an object usually appearing in analysis) makes its way into combinatorics.
However, it turns out that this is a clever tool to use.
Our analysis training immediately leads to the following questions:

1.  Am I allowed to write this down (i.e, does this series converge)?
2.  If so, what is its _radius_ of convergence?
3.  What is the convergence _rate_?

These types of questions require additional mathematical structure which, for our needs, are not necessary.
We will treat this at the level of a [formal power series](https://en.wikipedia.org/wiki/Formal_power_series), which we manipulate using standard algebraic operations.
Formal power series are colloquially referred to as "clotheslines", and are rigorously defined using notions from abstract algebra.
The term "clothesline" was originally used to describe generating functions by Herbert Wilf, who wrote a book called [generatingfunctionology](https://www2.math.upenn.edu/~wilf/gfology2.pdf).
Also see [Abel - Multivariate Generating Functions and Other Tidbits](http://zacharyabel.com/papers/Multi-GF_A06_MathRefl.pdf) for interesting applications.

<div class="proposition">

The generating function for the Fibonacci sequence is

\begin{equation}
F(x) = \frac{x}{1-x-x^2}
\end{equation}

</div>

<div class="proof">

Proof given in handwritten notes.

</div>

This is an interesting result in its own right.

<div class="remark">

From a high level, we can try to derive one type of solution from another.
For example, we will use the generating function to obtain an explicit formula, from which we will derive the asymptotic formula.
Another method (which uses complex analysis) allows us to extract asymptotic behavior from the generating function directly.

</div>

<div class="definition">

The **golden ratio** (\\(\phi\_+\\)) and its "conjugate'' (\\(\phi\_-\\)) are defined by the roots of the denominator of the generating function for the Fibonacci sequence:
\\[\phi\_{\pm} := \frac{1 \pm \sqrt{5}}{2}\\]
They satisfy the following relations:

1.  \\(\phi\_{+} \phi\_{-} = -1\\)
2.  \\(\phi\_{+} + \phi\_{-} = 1\\)
3.  \\(\phi\_{+} - \phi\_{-} = \sqrt{5}\\)

</div>

<div class="proof">

Verify that the roots of \\(1-x-x^2\\) are \\(\phi\_{\pm}\\).
(i)

\begin{align\*}
        \phi\_{+} \phi\_{-} &= \frac{1}{4} (1 + \sqrt{5})(1 - \sqrt{5}) \\\\
        &= \frac{1}{4} (1^2 - (\sqrt{5})^2) \\\\
        &= \frac{1}{4} (1 - 5) \\\\
        &= -1.
 \end{align\*}

(ii) and (iii) are analogous to adding and subtracting complex conjugates (\\(z + \bar{z}\\) and \\(z - \bar{z}\\)).
The results are, of course, \\(2\text{Re}(z)\\) and \\(2\text{Im}(z)\\).
For the golden ratio, the "real'' part is \\(1/2\\), and the "imaginary'' part is \\(\sqrt{5}/2\\).
The result follows.

</div>

<div class="proposition">

The closed-form expression for the $n$-th Fibonacci number (\\(f\_n\\)) is given by:
\\[f\_n = \frac{1}{\sqrt{5}} \left[ \phi\_+^n - \phi\_-^n \right].\\]

</div>

<div class="proof">

This result is proven in the handwritten notes.
It requires the partial fraction decomposition ((NO_ITEM_DATA:bradley2012two)) and a series expansion for \\(1/(x+a)\\).
Put in the full cleaned up proof of this later.

</div>


### Asymptotic Formula {#asymptotic-formula}

Note that \\(\phi\_+ \approx 1.6\\), whereas \\(\phi\_- \approx -0.6\\).
Hence, as \\(n \to \infty\\), \\(f\_n \sim \phi\_+^n\\).
I.e, the Fibonacci numbers grow exponentially.


### Computational Complexity {#computational-complexity}

The results we derive have different implications for _computational complexity_.
This is an interesting perspective to consider.
For a summary of the properties of binomial coefficients and algorithms to compute them, see:
<https://cp-algorithms.com/combinatorics/binomial-coefficients.html>

Computing the factorial operation efficiently is also a deep and interesting topic.
Theoretically, there are different approaches with better and worse asymptotic space and time complexity.
In practice, constants also matter.
See [this](https://www.luschny.de/math/factorial/conclusions.html?utm_source=chatgpt.com) for benchmarking results.


## Lecture 2 {#lecture-2}

There are two basic counting principles.

1.  _Multiplication principle_ - Assume that there are \\(a\\) ways of performing task \\(A\\).
    Also assume that---regardless of the outcome of $A$---there are \\(b\\) ways of performing task \\(B\\).
    Then there are \\(a \cdot b\\) ways of performing \\(A\\) then \\(B\\).
2.  _Addition principle_ - Assume that there are \\(a\\) ways of performing \\(A\\) and \\(b\\) ways of performing \\(B\\).
    Then there are \\(a+b\\) ways of performing one or the other of \\(A\\) or \\(B\\).

      One of the founding problems in combinatorics was the 4 color problem.
    The following gives us some practice using these counting principles

<!--listend-->

```text
Suppose we are given $q$ colors and want to count the number of ways we can color "states" such that no who neighboring states have the same color.
How many such "proper" coloring are there?
```

<div class="solution">

See handwritten notes.

</div>

There are different ways of getting to the answer, all of which (if done appropriately) should yield the same answer.
If the solution to a combinatorial problem is cleaner than what you expected, you should consider coming up with a more direct proof of the result.
Oftentimes the answer can suggest what the best proof should look like!
This occurs frequently in combinatorics.
We first come up with some stupid procedure to get the answer.
Then, we think to ourselves "wow, this is much nicer than I thought", surely there must be a cleaner proof.
We develop this cleaner proof, then hide our ugly first draft so that nobody sees it.
Then you look really smart when you show your beautiful answer.
Every textbook does this, every mathematician does this.
Don't be fooled!
Almost always, the first procedure is not the best procedure.
But its a good way towards finding the "best" procedure.

NOTE: The answer to the number of colorings is always a polynomial.
E.g, look at the answer we got in the example.


### Permutations {#permutations}

We are going to count permutations.
\\(S\_n := {\text{permutations of } [n]}\\), where \\([n]:=\\{1, 2, \ldots, n\\}\\).

<div class="proposition">

\\(|S\_n|=n!\\)

</div>

<div class="proof">

To construct a permutation, we follow a sequence of decisions.
There are \\(n\\) choices for the first entry in the list.
There are \\(n-1\\) choices for the second entry.
Note that this logic holds regardless of the particular entry chosen in each position.
We continue until we get to the last element, for which we only have one remaining number left, and therefore the number of choices at the end is \\(1\\).
Hence, by the multiplication principle, there are \\(n!\\) number of ways to produce a unique permutation.

</div>

<div class="definition">

Let \\(2^S:=\\{\text{subsets of } S\\}\\).
\\(\binom{S}{k} := \\{\text{size } k \text{ subsets of } S \\}\\)

</div>

<div class="proposition">

\\(|2^S|=2^n\\)

</div>

<div class="proof">

Lets begin with an empty set.
Then we will follow a sequence of decisions that constructs a prototypical subset, then use the multiplication principle.
The sequence of decisions is the following.
For each element \\(s \in S\\), we decide whether or not to include it in the initially empty set.
There are two ways to make the first decision (yes/no).
The next decision is also yes or no, etc...
Upon concluding we notice that there are \\(2^n\\) many sets we can construct in this manner.

</div>

<div class="remark">

Notice that this gives us a bijection between subsets of \\(S\\) and binary sequences of length \\(n\\).
1 for in 0 for out.

</div>

<div class="definition">

Given a set \\(S\\) with cardinality \\(n\\), we define
\\(\binom{n}{k} := \left|\binom{S}{k}\right|\\).
This denotes the _number_ of $k$-subsets of \\(S\\).
We say "\\(n\\) choose \\(k\\)".

</div>

<div class="proposition">

\\(\binom{n}{k} = \frac{n!}{k!(n-k)!}\\)

</div>

<div class="proof">

We begin by following a sequence of two decisions to construct an _ordered set_ of size \\(k\\).
The first decision is to select which \\(k\\) elements will be in the ordered set.
This, by definition, is \\(\binom{n}{k}\\).
The second decision is to select a permutation of these elements.
This, by the previous proposition, is given by \\(k!\\).
By the multiplication principle, we conclude the number of ways to create an ordered set of size \\(k\\) is given by \\(\binom{n}{k} k!\\).

Alternatively, we can use a sequence of \\(k\\) decisions in order to construct the ordered set.
Namely, we have \\(n\\) options for the first element in the set, \\(n-1\\) options for the second, etc..., until the k'th element, which has \\(n-k+1\\) possibilities.
By the multiplication principle therefore, this is equivalent to \\(n(n-1)\ldots(n-k+1) = n! / (n-k)!\\).

Since both methods count the same underlying thing, they must be equal.
Therefore
\\[
\binom{n}{k} = \frac{n!}{k!(n-k)!}.
\\]

</div>


### Subsets and generating functions {#subsets-and-generating-functions}

See handwritten notes


## Lecture 3 {#lecture-3}

See the handwritten notes.


## Lecture 4 {#lecture-4}

Suppose we begin by obtaining data, such as the population of Columbia.
We are then free to ask more pointed and specific questions, like what is the gender, age, or height distributions within the population?

Likewise, once we've counted permutations or the number of subsets of \\([n]\\), we too can ask more specific questions.
These "more specific questions" fall under the banner of _statistics_.
One such statistic we already investigated (of the subsets of \\([n]\\)) was: "how many subsets of \\(n\\) have size \\(k\\)"?
However, there are many different kinds of statistics.
In the following lectures, we will discuss cycles, records, majors, and other _permutation statistics_.

See the handwritten notes from here on.


### <span class="org-todo todo TODO">TODO</span> Get org-babel working {#get-org-babel-working}

```python
def find_permutation_cycles(n, pi):
    """
    Finds the disjoint cycles of a permutation pi of n elements.

    :param n: The size of the set.
    :param pi: The permutation represented as a list.
    :return: A list of lists, where each inner list is a cycle.
    """
    visited = set()
    cycles = []
    for i in range(n):
        if i not in visited:
            cycle = []
            x = i
            while x not in visited:
                cycle.append(x)
                visited.add(x)
                x = pi[x]
            cycles.append(cycle)
    return cycles

n_example = 5
pi_example = [0, 2, 1, 4, 3]
result = find_permutation_cycles(n_example, pi_example)
print(result)  # Expected output: [[0], [1, 2], [3, 4]]
```

The first observation we need to make is that cycle notation (in sequence form) is not unique.
This is due to two reasons.
First, since each group forms cycles, the sequence can begin at any point in the cycle.
Consequently, all permutations applied within any cycle represent the same data.
Further, there is no inherent order to the cycles, and hence permutations of the cycles themselves corresponds to a rearrangement of the same data.
We will be interested in forming bijections, and hence have to eliminate this ambiguity.
The convention we select is described in the following

<div class="definition">

The  ...

</div>

This eliminates ambiguity in the sequence associated with the permutation.


### Permutation Statistics {#permutation-statistics}

Now lets think about what kind of statistics may be interesting to think about.
The first obvious thing would be to count the number permutations of \\([n]\\) with \\(k\\) cycles!
We define this quantity as \\(c(n,k)\\).
A related quantity is defined in the following

<div class="remark">

The \\(c(n,k)\\) we have been working with are related to the _Sterling numbers of the first kind_ via
\\[s(n,k) := (-1)^{n-k} c(n,k)\\].

</div>

As we discussed in Lecture 1, there are several different "solutions" to a counting problem.
We begin by providing a recursive formula for \\(c(n,k)\\).

<div class="proposition">

\\[c(n,k) = (n-1) c(n-1,k) + c(n-1, k-1)\\]

</div>

<div class="proof">

Included in the handwritten notes.

</div>

The following is the analog of the binomial theorem for Sterling numbers:

<div class="proposition">

The generating function for a fixed n
\\(\sum\_{k=1}^n c(n,k) x^k = x(x+1)(x+2) \ldots (x +n-1)\\)

</div>

<div class="proof">

We use induction, the simplest, "ugliest" proof.
See handwritten notes.

</div>

<div class="remark">

The previous proposition is why Sterling numbers pop up in so many areas of mathematics.
Products of this form arise naturally in many different contexts!

</div>

There are at least two other proofs of this statement, both of which are useful in their own right.

<div class="proof">

This proof analyzes the coefficient of \\(x^k\\) on the RHS, and can be found in Stanley.

</div>

<div class="proof">

You restrict to the integer domain, and construct a counting problem with the solution you desire.
The LHS the number of ways of choosing a permutaiton and giving the cycles one of x colors?
To each cycle assign a color between 1 and x
After doing this, you'll have proved that this holds for x.
This then extends to the polynomials.
The way this holds is because polynomials have a finite number of roots.
This is apparently a standard proof strategy, and the book discusses it.
There are apparently four proofs of this theorem in the book.

</div>

<div class="remark">

In math, we approach problems from both directions.
If a problem is too hard, we invent an easier one to solve.
Is a problem is too easy, we invent a harder one to solve.

</div>

We now want to count the number of permutations that have cycles of a particular type.

<div class="definition">

The _type_ of \\(w \in S\_n\\) is \\(\text{type}(w) = (c\_1, \ldots, c\_n)\\), where \\(c\_i\\) is the number of cycles of length \\(i\\).

</div>

<div class="proposition">

There are \\(\frac{n!}{1^{c1} c\_1! 2^{c2} c\_2! \ldots}\\) number of permutations of type \\((c\_1, \ldots, c\_n)\\).

</div>


### <span class="org-todo todo TODO">TODO</span> complete this proof {#complete-this-proof}

<div class="proof">

...

</div>

<div class="definition">

In combinatorics, a _record_ is an element in a sequence that is larger than all preceding elements

</div>

We talked about cycles and records.
Now we talk about another statistic, called "number of inversions".

<div class="definition">

An inversion of \\(w=w\_1 \ldots w\_n\\) is a pair of \\(w\_i,w\_j\\) such that \\(i<j, w\_i>w\_j\\).
Each inversion counts a pair that is in the wrong order.
We also define \\(\text{inv}(w):= \\# \text{ of inversions}\\).
The _inversion table_ of \\(w\\) is \\(I(w) := (a\_1, \ldots, a\_n) where a\_i := \\#{j: \text{s.t } (j,i)\\) is an inversion}.

</div>

```text
inv(2 4 1 6 3 5)
I(2 4 1 6 3 5) = (2,0,2,0,1,0)
```

It turns out that it is possible to reconstruct the permutation from its respective inversion table.
This is proven in the following

<div class="proposition">

The map \\(w \mapsto I(w)\\) is a bijection.

</div>

We are looking for bijections with nice properties.

<div class="definition">

An _inversion_ of a permutation pi is any pair pi(i), pi(j) such that for i &lt; j pi(i) &gt; pi(j).
inv(pi) is the number of inversions present in pi.

The _inversion table_ of pi is
(a_1, \ldots, a_n) where a_i denotes the number of inversions that can be constructed by looking backwards at a given index.

</div>

Intuitively, this measures how far a permutation is from being sorted in increasing order.

Is it possible to reconstruct the permutation from the inversion table?
It turns out that the answer is yes!

<div class="proposition">

The map pi &rarr; I(&pi;) is a bijection

</div>

<div class="proof">



</div>


## Lecture 5 {#lecture-5}

Various statistics of permutations.
Inversions, descents, major index, etc...


## Lecture 6 {#lecture-6}

Pattern avoidance

Whenever you find an integer sequence in a counting problem, you can check out
<https://oeis.org>
Which is the online encyclopedia of integer sequences.
I saw this pop up in the brilliant ideas in computer science course from CMU as well!

Defines Catalan numbers as the number of ways to get to 2n on the x axis using diagonal steps (not allowed to go backwards).


## Lecture 7 {#lecture-7}

A permutation can be expressed as a tree!
I can see how this could potentially be useful.
Holy crap man, permutations are simple, but theres a lot of depth in the patterns they exhibit.
This is pretty cool.

GOAL: Get an overview of this stuff.
If you ever need to use similar results, you can dig deeper then.


### <span class="org-todo todo TODO">TODO</span> I decided to stop the course at this lecture. {#i-decided-to-stop-the-course-at-this-lecture-dot}

<span class="timestamp-wrapper"><span class="timestamp">[2025-11-04 Tue]</span></span>
This is where I'm calling it for the time being.
This is a pretty rigorous course.
The lecturer is clear enough that I can follow along.
He also provides good intuition, philosophy, and explains how to think.
The book he uses is one of the big ones in the field, and immediately begins linking to open research problems!
On the other hand, I've found another good reference called "A walk through combinatorics".
This is a significantly easier read than Stanley.
I've also added references where lectures are associated with the text.
Combined, I think I can cover the rest of combinatorics when needed.
For the time being, the most important thing I can do is to LeetCode.
I need to prep for these interviews ASAP.


## Three types of proofs {#three-types-of-proofs}

There are three types of proofs you should be aware of.

The first is the "brute force proof".
When first exploring a result such a proof is useful.
This is because the steps for such a proof are oftentimes known in advance, and simply requires following a simple procedure to its eventual conclusion.
These are nice because it requires the least amount of thought.

The second type of proof is a "clumsy proof".
Oftentimes you will prove or disprove a result by trying a lot of things and seeing what sticks.
These are nice because when you find a line of reasoning that works, you can usually explain the thoughts you had that led you down that road.
Someone reading the proof will appreciate that with enough thought, they may have landed on the same line of reasoning.
It is clever, reproducible, and gives you confidence.

Then there are "slick proofs", the ones that only experts appreciate and newbies fucking loath.
These have a bad reputation, because if you are trying to learn a subject, and all you see are the slick, polished proofs, you'll have no fucking idea how anyone could have come up with these.
The answer is obvious though.
The person writing the book started with a brute force or clumsy proof, and then after familiarizing themselves with the result, was able to cut a bunch of the steps out.
It is exceedingly unlikely a proof like this would exist if the answer were not known beforehand.
These have a feeling of being "magical" or pulled out of ones ass.
For these reasons, I hate these kinds of proofs.

My goal is to understand results by rederiving them.
Further, I am interested in presenting these results to people that may be unfamiliar with them.
From a pedagogical perspective, for both yourself and for others, "clumsy" and "brute force" proofs actually accomplish what you want.

The "slick proofs" may be useful in research to derive new results, etc.
Hence, I argue that these are most useful in research after you are already familiar with a subject.
Do not fly before learning to walk.
These proofs should be completely avoided.


## Completed tasks {#completed-tasks}


### ANSWERED Are these the same as the combinatorial definition of f_n in "proofs that really count?" {#answered-are-these-the-same-as-the-combinatorial-definition-of-f-n-in-proofs-that-really-count}

Note that there are combinatorial interpretations of these numbers.
Problems 1-9 are examples of the various interpretations.
Not a bad idea to go through those problems and convince yourself of these facts.
This will expand the value you get from knowing the properties of the Fib numbers!!!

The answer is yes, I was able to show the bijection.


### CANCELED How do we go from the generating function to the exact formula? {#canceled-how-do-we-go-from-the-generating-function-to-the-exact-formula}

This was left as an exercise in the lecture.
Although interesting, its not urgent.
