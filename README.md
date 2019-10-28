# Differentiable Optimization-Based Modeling for Machine Learning

+ This repository is by [Brandon Amos](http://bamos.github.io)
  and contains the full source code and data to produce
  [my thesis document](https://github.com/bamos/thesis/raw/master/bamos_thesis.pdf).
+ The slides are available in
  [pdf](https://github.com/bamos/thesis/raw/master/slides.pdf)
  and
  [pptx](https://github.com/bamos/thesis/raw/master/slides.pptx)
  format.

## Unpublished work in this thesis

+ [Chapter 2](https://github.com/bamos/thesis/blob/master/bamos_thesis_ch2.pdf)
  provides some preliminaries and background information on differentiable convex
  optimization layers, including derivations for the optimization (or variational)
  viewpoints of the ReLU, sigmoid, and softmax.
+ [Chapter 7](https://github.com/bamos/thesis/blob/master/bamos_thesis_ch7.pdf)
  presents an early version of differentiable CVXPY layers,
  which is now available [here](https://github.com/cvxgrp/cvxpylayers).
  As a bibliographic note, the cone program differentiation derivation
  in section 7.3 here remains unpublished in this thesis and was done
  concurrent to and independent of
  [Differentiating Through a Cone Program](https://arxiv.org/abs/1904.09043).

## Publications behind this thesis

Some of the content here is behind these publications:

<table class="table table-hover">
<tr>
<td>
<strong>Differentiable Convex Optimization Layers</strong><br />
A. Agrawal\*, <strong>B. Amos\*</strong>, S. Barratt\*, S. Boyd\*, S. Diamond\*, and J. Kolter\*<br />
NeurIPS 2019<br />
[1] [<a href="http://web.stanford.edu/~boyd/papers/pdf/diff_cvxpy.pdf" target="_blank">pdf</a>]  [<a href="https://github.com/cvxgrp/cvxpylayers" target="_blank">code</a>] <br />
</td>
</tr>
<tr>
<td>
<strong>Differentiable MPC for End-to-end Planning and Control</strong><br />
<strong>B. Amos</strong>, I. Rodriguez, J. Sacks, B. Boots, and J. Kolter<br />
NeurIPS 2018<br />
[2] [<a href="https://arxiv.org/abs/1810.13400" target="_blank">pdf</a>]  [<a href="https://locuslab.github.io/mpc.pytorch/" target="_blank">code</a>] <br />
</td>
</tr>
<tr>
<td>
<strong>Depth-Limited Solving for Imperfect-Information Games</strong><br />
N. Brown, T. Sandholm, and <strong>B. Amos</strong><br />
NeurIPS 2018<br />
[3] [<a href="http://arxiv.org/abs/1805.08195" target="_blank">pdf</a>] <br />
</td>
</tr>
<tr>
<td>
<strong>Learning Awareness Models</strong><br />
<strong>B. Amos</strong>, L. Dinh, S. Cabi, T. Roth&ouml;rl, S. Colmenarejo, A. Muldal, T. Erez, Y. Tassa, N. de Freitas, and M. Denil<br />
ICLR 2018<br />
[4] [<a href="https://openreview.net/forum?id=r1HhRfWRZ" target="_blank">pdf</a>] <br />
</td>
</tr>
<tr>
<td>
<strong>Task-based End-to-end Model Learning</strong><br />
P. Donti, <strong>B. Amos</strong>, and J. Kolter<br />
NeurIPS 2017<br />
[5] [<a href="http://arxiv.org/abs/1703.04529" target="_blank">pdf</a>]  [<a href="https://github.com/locuslab/e2e-model-learning" target="_blank">code</a>] <br />
</td>
</tr>
<tr>
<td>
<strong>OptNet: Differentiable Optimization as a Layer in Neural Networks</strong><br />
<strong>B. Amos</strong> and J. Kolter<br />
ICML 2017<br />
[6] [<a href="http://arxiv.org/abs/1703.00443" target="_blank">pdf</a>]  [<a href="https://github.com/locuslab/optnet" target="_blank">code</a>] <br />
</td>
</tr>
<tr>
<td>
<strong>Input Convex Neural Networks</strong><br />
<strong>B. Amos</strong>, L. Xu, and J. Kolter<br />
ICML 2017<br />
[7] [<a href="http://arxiv.org/abs/1609.07152" target="_blank">pdf</a>]  [<a href="https://github.com/locuslab/icnn" target="_blank">code</a>] <br />
</td>
</tr>
<tr>
<td>
<strong>Collapsed Variational Inference for Sum-Product Networks</strong><br />
H. Zhao, T. Adel, G. Gordon, and <strong>B. Amos</strong><br />
ICML 2016<br />
[8] [<a href="http://www.cs.cmu.edu/~hzhao1/papers/ICML2016/BL-SPN-main.pdf" target="_blank">pdf</a>] <br />
</td>
</tr>
<tr>
<td>
<strong>OpenFace: A general-purpose face recognition library with mobile applications</strong><br />
<strong>B. Amos</strong>, B. Ludwiczuk, and M. Satyanarayanan<br />
CMU 2016<br />
[9] [<a href="http://reports-archive.adm.cs.cmu.edu/anon/anon/2016/CMU-CS-16-118.pdf" target="_blank">pdf</a>]  [<a href="https://cmusatyalab.github.io/openface" target="_blank">code</a>] <br />
</td>
</tr>
</table>

---

The experimental source code and libraries produced for this
thesis are freely available as open source software and
are available in the following repositories.

+ [[cvxgrp/cvxpylayers](https://github.com/cvxgrp/cvxpylayers)]
  Differentiable convex optimization layers in CVXPY.
+ [[locuslab/mpc.pytorch](https://locuslab.github.io/mpc.pytorch)]
  A stand-alone PyTorch library for the differentiable
  model predictive control approach.
+ [[locuslab/differentiable-mpc](https://github.com/locuslab/differentiable-mpc)]
  PyTorch experiments for the differentiable MPC work.
+ [[locuslab/qpth](https://locuslab.github.io/qpth/)]:
  A stand-alone PyTorch library for the OptNet QP layers.
+ [[locuslab/optnet](https://github.com/locuslab/optnet)]
  PyTorch experiments for OptNet.
+ [[locuslab/icnn](https://github.com/locuslab/icnn)]
  TensorFlow experiments for input-convex neural networks.
+ [[cmusatyalab/openface](https://cmusatyalab.github.io/openface)]
  Face recognition with deep neural networks.
+ [[bamos/block](https://github.com/bamos/block)]
  An intelligent block matrix library for numpy, PyTorch, and beyond.
+ [[bamos/dcgan-completion.tensorflow](https://github.com/bamos/dcgan-completion.tensorflow)]
  Image Completion with Deep Learning in TensorFlow.
+ [[bamos/densenet.pytorch](https://github.com/bamos/densenet.pytorch)]
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

<img src='https://raw.githubusercontent.com/bamos/thesis/master/cvxpyth/polytopes-ellipsoids.gif'></img>

---

The BibTeX for this document is:

```
@phdthesis{amos2019differentiable,
  author       = {Brandon Amos},
  title        = {{Differentiable Optimization-Based Modeling for Machine Learning}},
  school       = {Carnegie Mellon University},
  year         = 2019,
  month        = May,
}
```
