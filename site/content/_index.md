+++
title = "Technical Notes"
author = ["Alex Leviyev"]
draft = false
+++

## About {#about}

<img src="images/profile.png" alt="Alex Leviyev" class="profile-photo">

I'm Dr. Alex Leviyev, a researcher working at the intersection of machine learning, optimization, statistics, and algorithms.
I completed my Physics Ph.D at UT Austin's [Center for Gravitational Physics](https://weinberg.utexas.edu/research/center-gravitational-physics) under Aaron Zimmerman.
My research focused on developing first-order parameter estimation algorithms for gravitational wave astronomy (<a href="#citeproc_bib_item_1">Leviyev, 2024</a>).
The broader thrust of this work has been building high-performance, GPU-accelerated sampling algorithms that handle multimodality, degeneracy, and non-Euclidean support spaces.
These are the kinds of challenges that arise naturally in gravitational wave data science (<a href="#citeproc_bib_item_3">Leviyev, Iacovelli, &#38; Zimmerman, 2025</a>).
Our code is written in pure [JAX](https://docs.jax.dev/en/latest/) and available on [Github](https://github.com/leviyevalex/langevin_birth_death).
I recently learned that my work on second-order variational inference algorithms (<a href="#citeproc_bib_item_2">Leviyev, Chen, Wang, Ghattas, &#38; Zimmerman, 2022</a>) is being used by a group at the [National Oceanic and Atmospheric Administration](https://www.noaa.gov) for weather forecasting, which was a fun surprise.


## Purpose {#purpose}

> "What I cannot create, I do not understand."
> — Richard P. Feynman

This blog is, first and foremost, selfish in its purpose.
Writing about a topic and explaining it to others forces me to understand it deeply and keeps me honest.
My work demands a steady stream of calculations and concepts to internalize: re-deriving results from papers, filling in gaps left by textbooks, and documenting my thinking on various problems and puzzles (interview prep included).
Over time, I've accumulated a sizable collection of derivations that rarely see the light of day.
Rather than let them gather dust, this blog is my way of getting them into a presentable state.
Some of these notes may eventually find their way into research papers or books.
In the meantime, I hope they're useful to anyone working through similar topics.

All of these notes started as a personal knowledge base written in org-mode.
The content here spans a range of subjects, but mostly revolve around algorithms, machine learning, and probability theory.
You will also find my solutions to various coding challenges and puzzles I encounter for quantitative finance and tech interviews.
If you spot an error, a gap in reasoning, or a cleaner proof, please reach out: I'd like to know!

## References

<style>.csl-entry{text-indent: -1.5em; margin-left: 1.5em;}</style><div class="csl-bib-body">
  <div class="csl-entry"><a id="citeproc_bib_item_1"></a>Leviyev, A. (2024). <i>First order sampling methods in gravitational wave parameter estimation</i> (University of Texas at Austin). University of Texas at Austin. Retrieved from <a href="https://repositories.lib.utexas.edu/items/b2df8bbb-e2f6-4fb0-b7f6-7a8e209c91d0">https://repositories.lib.utexas.edu/items/b2df8bbb-e2f6-4fb0-b7f6-7a8e209c91d0</a></div>
  <div class="csl-entry"><a id="citeproc_bib_item_2"></a>Leviyev, A., Chen, J., Wang, Y., Ghattas, O., &#38; Zimmerman, A. (2022). <i>A stochastic Stein variational Newton method</i>. Retrieved from <a href="https://arxiv.org/abs/2204.09039">https://arxiv.org/abs/2204.09039</a></div>
  <div class="csl-entry"><a id="citeproc_bib_item_3"></a>Leviyev, A., Iacovelli, F., &#38; Zimmerman, A. (2025). <i>Efficient Bayesian sampling with Langevin birth-death dynamics</i>. Retrieved from <a href="https://arxiv.org/abs/2509.01942">https://arxiv.org/abs/2509.01942</a></div>
</div>
