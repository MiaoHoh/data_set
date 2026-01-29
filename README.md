
  
# Title
A method for evaluating and optimizing the quality of packaging graphic design by integrating visual salience and aesthetic rating.

## Describe
This project aims to develop a methodology for evaluating and optimizing the quality of packaging graphic design based on image aesthetic prediction and visual saliency analysis. The project implements a complete process from image input, saliency extraction, and aesthetic score prediction to joint quality assessment and design optimization.



## Dataset information
A dataset of 400 manually collected packaging design images.

## Structure
# Packaging Quality: Saliency + Aesthetic (U²-Net + NIMA)
- Experiment: U²-Net saliency map → entropy concentration \(C_s\) → NIMA aesthetic distribution/expectation \(A_s\) → joint score \(Q\) → design candidate optimization (selecting the one with the largest \(Q\)).

- Saliency concentration \(C_s\): \(C_s=1-\frac{H(S)}{\log N}\), \(H(S)=-\sum p_i\log p_i\) (pixel distribution entropy based on the saliency map).

- Aesthetic score \(A_s=\sum_{k=1}^{10} k\,p_k\), and output variance to represent consistency.

- Joint score \(Q=\alpha \tilde C_s + (1-\alpha)\tilde A_s\), \(\tilde A_s=(A_s-1)/9\), default \(\alpha=0.4\) (consistent with the paper's settings).

- Design optimization: Generate several candidates for a packaging image, sort them by \(Q\) and select the best one.

## Code information
project_name/
│
├── README.md # Project introduction and usage instructions
├── requirements.txt # List of Python dependency libraries
├── config/ # Configuration file directory
│
└── config.yaml # Project parameter configuration file
├── data/ # Data storage
├── src/ # Core source code directory
├── aesthetic.py # Aesthetic score prediction module (NIMA model wrapper)
├── config.py # Parameter configuration module
├── data.py # Data loading and preprocessing module
├── eval_metrics.py # Evaluation metric functions (PLCC, SRCC, MAE, RMSE, etc.)
├── joint_score.py # Joint score calculation of significance and aesthetics
├── main.py # Main program entry point
├── optimize.py # Layout design optimization module
├── saliency.py # Saliency extraction module (U²-Net wrapper)
├── utils.py # Utility functions (such as normalization, format conversion, etc.)
└── viz.py # Result visualization module (score distribution plot, error analysis plot, etc.)



## Usage Instructions

This section provides guidance on how to set up and run the project, as well as how to load the dataset and execute the main modules.

### 1. Install Dependencies

Ensure Python is installed (preferably Python 3.7+), then install all required libraries via:

```bash
pip install -r requirements.txt
```

---

### 2. Prepare Configuration

The configuration file is located at:

```
config/config.yaml
```

It defines essential parameters such as:

* Dataset paths
* Model weights
* Training or evaluation settings
* Output directories

You can modify this YAML file to suit your local environment or experiment needs.

---

### 3. Load and Preprocess Data

The data should be placed inside the `data/` directory. Use the provided `data.py` module to load and preprocess the dataset:

```python
from data import load_data

train_data, test_data = load_data(config_path="config/config.yaml")
```

The function will automatically handle normalization, resizing, and batching based on the configuration.

---

### 4. Run the Main Program

To start training, evaluation, or inference, execute:

```bash
python main.py --config config/config.yaml
```

Depending on the configuration, it will call the corresponding modules such as `aesthetic.py`, `saliency.py`, or `optimize.py`.

---

### 5. View Results

After execution, results such as predictions, visualizations, and logs will be saved in the output directory specified in `config.yaml`. You can visualize performance using:

```python
from viz import plot_results

plot_results("path/to/output")
```

---



## 需求
- Python 3.8+
- PyTorch ≥ 1.10
- OpenCV
- Matplotlib
- Pandas

## 方法论（如适用）




## 许可与贡献指南（如适用）
- 许可证信息
- 如何贡献
