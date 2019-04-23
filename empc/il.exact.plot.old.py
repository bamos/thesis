#!/usr/bin/env python3

import argparse
import glob
import json
import os

import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
plt.style.use('bmh')

from matplotlib import rc
rc('text', usetex=True)

import numpy as np

import pandas as pd

from collections import namedtuple

SCRIPT_DIR = os.path.dirname(os.path.realpath(__file__))

def main():
    Exp = namedtuple('Exp', 'name n_iter smooth')
    smooth = 25
    exps = [
        Exp('unknown-cost.pendulum', 300, smooth),
        Exp('sysid-dx.pendulum', 300, smooth),
        Exp('unknown-cost-sysid.pendulum', 300, smooth),
        Exp('unknown-cost.cartpole', 2000, smooth),
        Exp('sysid-dx.cartpole', 100, smooth),
        Exp('unknown-cost-sysid.cartpole', 1000, smooth),
    ]

    n_row, n_col = 2, 3
    fig, axs = plt.subplots(n_row, n_col, figsize=(4*n_col, 3*n_row))
    axs[0,0].set_ylabel('\\textbf{Pendulum}\nImitation Loss')
    axs[1,0].set_ylabel('\\textbf{Cartpole}\nImitation Loss')
    axs[0,0].set_title('Unknown Cost')
    axs[0,1].set_title('SysId')
    axs[0,2].set_title('Unknown Cost + SysId')
    for i in range(n_col):
        axs[-1,i].set_xlabel('Iteration')

    axs_flat = axs.reshape(-1)

    for ax, exp in zip(axs_flat, exps):
        fname = os.path.join(SCRIPT_DIR, exp.name, 'losses.csv')
        df = pd.read_csv(fname)

        y = df['im_loss']
        if exp.smooth > 1:
            N = exp.smooth
            y = np.convolve(y, np.full(N, 1./N), mode='valid')
            x = np.arange(len(y))+N
            ax.plot(x, y)
        else:
            ax.plot(y)
        ax.set_ylim((0, None))
        ax.set_xlim((0, exp.n_iter))
    fig.tight_layout()

    for ext in ['png', 'pdf']:
        fname = os.path.join(SCRIPT_DIR, 'im_loss.{}'.format(ext))
        fig.savefig(fname)
        print('Saving to: {}'.format(fname))


if __name__ == "__main__":
    main()
