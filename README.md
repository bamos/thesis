# Differentiable Optimization-Based Modeling for Machine Learning

This repository is by [Brandon Amos](http://bamos.github.io)
and contains the full source code and data to produce
[my thesis document](https://github.com/bamos/thesis/blob/master/bamos_thesis.pdf).

The experimental source code and libraries produced for this
thesis are freely available as open source software and
are available in the following repositories.

+ https://github.com/locuslab/icnn:
  TensorFlow experiments for input-convex neural networks.
+ https://locuslab.github.io/qpth/:
  A stand-alone PyTorch library for the OptNet QP layers.
+ https://github.com/locuslab/optnet:
  PyTorch experiments for OptNet.
+ https://locuslab.github.io/mpc.pytorch:
  A stand-alone PyTorch library for the differentiable
  model predictive control approach.
+ https://github.com/locuslab/differentiable-mpc:
  PyTorch experiments for the differentiable MPC work.
+ https://github.com/bamos/block:
  An intelligent block matrix library for numpy, PyTorch, and beyond.
+ https://github.com/bamos/dcgan-completion.tensorflow:
  Image Completion with Deep Learning in TensorFlow.
+ https://github.com/cmusatyalab/openface:
  Face recognition with deep neural networks.
+ https://github.com/bamos/densenet.pytorch:
  A PyTorch implementation of DenseNet.

------

+ This repository started from
  [Cyrus Omar's thesis code](https://github.com/cyrus-/thesis),
  which is based on a CMU thesis template
  by [David Koes](http://bits.csb.pitt.edu/)
  and others before.
+ Of standalone interest,
  [refs.sort.sh](https://github.com/bamos/thesis/blob/master/refs.sort.sh)
  uses biber to alphabetize and standardize my bibliography in
  [refs.bib](https://github.com/bamos/thesis/blob/master/refs.bib)
  so it doesn't get too messy.
  This uses the configuration in
  [refs.conf](https://github.com/bamos/thesis/blob/master/refs.conf).
+ I use [update-pdf.sh](https://github.com/bamos/thesis/blob/master/update-pdf.sh)
  to keep the latest PDF only in HEAD, although Git LFS or a related
  project may be a better solution.

------

The BibTeX for this document is:

```
@phdthesis{amos2019differentiable,
  author       = {Brandon Amos},
  title        = {{Differentiable Optimization-Based Modeling for Machine Learning}},
  school       = {Carnegie Mellon University},
  year         = 2019,
  month        = 5,
}
```
