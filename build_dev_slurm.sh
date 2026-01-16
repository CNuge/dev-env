#!/bin/bash
#SBATCH --partition="comp"

conda env create -f dev_environment.yaml 
