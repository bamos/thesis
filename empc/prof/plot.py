#!/usr/bin/env python3

import argparse

import matplotlib as mpl
mpl.use('Agg')
import matplotlib.pyplot as plt
plt.style.use('bmh')
import numpy as np
import pandas as pd
import math

from matplotlib import rcParams
rcParams.update({'figure.autolayout': True})
rcParams['pdf.fonttype'] = 42
rcParams['ps.fonttype'] = 42

import os
import sys
import json
import glob

SCRIPT_DIR = os.path.dirname(os.path.realpath(__file__))

def main():
    # msesF = os.path.join(args.workDir, 'mses.csv')
    fname = os.path.join(SCRIPT_DIR, 'prof.csv')
    df = pd.read_csv(
        fname, sep=',',
        names=['_', 'lqr_iter', 'fp_f', 'fp_b', 'unroll_f', 'unroll_b'],
        skiprows=1,
    )
    g = df.groupby('lqr_iter')

    m = g.mean()
    std = g.std()

    nsteps = [1, 32, 64, 128]
    idxs = [0, 4, 5, 6]

    fp_f, fp_b = [], []
    unroll_f, unroll_b = [], []
    for i in idxs:
        fp_f.append((m.iloc[i].fp_f, std.iloc[i].fp_f))
        fp_b.append((m.iloc[i].fp_b, std.iloc[i].fp_b))
        unroll_f.append((m.iloc[i].unroll_f, std.iloc[i].unroll_f))
        unroll_b.append((m.iloc[i].unroll_b, std.iloc[i].unroll_b))

    fp_f, fp_b, unroll_f, unroll_b = map(np.array, [fp_f, fp_b, unroll_f, unroll_b])

    nSamples = len(nsteps)
    indices = np.array(list(range(nSamples)))
    barWidth = 0.2

    # cmap = plt.get_cmap("Set1")
    # colors = cmap(np.linspace(0, 1, 9))
    cmap = plt.get_cmap("RdBu")
    colors = cmap([0.1, 0.3, 0.9, 0.7])
    alpha = 1.0

    # fig = plt.figure(figsize=(10, 4))
    # ax = fig.add_subplot(111)
    fig, ax = plt.subplots(1, 1, figsize=(5,3))
    plt.bar(indices, fp_f[:,0], barWidth,
            yerr=fp_f[:,1], label='FP Forward',
            color=colors[0], ecolor='0.3', alpha=alpha)
    plt.bar(indices + barWidth, fp_b[:,0], barWidth,
            yerr=fp_b[:,1], label='FP Backward',
            color=colors[1], ecolor='0.3', alpha=alpha)
    plt.bar(indices + 2.*barWidth, unroll_f[:,0], barWidth,
            yerr=unroll_f[:,1], label='Unroll Forward',
            color=colors[2], ecolor='0.3', alpha=alpha)
    plt.bar(indices + 3.*barWidth, unroll_b[:,0], barWidth,
            yerr=unroll_b[:,1], label='Unroll Backward',
            color=colors[3], ecolor='0.3', alpha=alpha)

    lgd = plt.legend(loc='upper center', bbox_to_anchor=(0.4, 1.1), ncol=2,
                     fancybox=True, shadow=True, fontsize=8.7)
    plt.ylabel("Runtime (s)")
    plt.xlabel("Number of LQR Steps", fontsize=12)

    ax.set_xlim(indices[0]-barWidth, indices[-1]+(nSamples+1.)*barWidth)

    ax.set_xticks(indices + 2. * barWidth)
    xticks = []
    for nstep in nsteps:
        xticks.append(nstep)
    ax.set_xticklabels(xticks)
    ax.set_yscale('log')

    # locs, labels = plt.xticks()
    plt.ylim(1e-3, 1e1)

    for ext in ['pdf', 'png']:
        f = 'fig' + '.' + ext
        # fig.savefig(f)
        fig.savefig(f, bbox_extra_artists=(lgd,), bbox_inches='tight')
        if ext == 'pdf':
            os.system('pdfcrop "{}" "{}"'.format(f, f))
        print("Created {}".format(f))

if __name__ == '__main__':
    main()
