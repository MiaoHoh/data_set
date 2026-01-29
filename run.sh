#!/usr/bin/env bash
set -e


python3 -m venv .venv
source .venv/bin/activate

python -m pip install --upgrade pip
pip install -r requirements.txt


python -m src.main --config experiments/exp_baseline.yaml


python -m src.main --config experiments/exp_rf.yaml
