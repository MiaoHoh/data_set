# Packaging Quality: Saliency + Aesthetic (U²-Net + NIMA)

实现论文实验：U²-Net 显著图 → 熵集中度 \(C_s\) → NIMA 美学分布/期望 \(A_s\) → 联合分数 \(Q\) → 设计候选优化（选 \(Q\) 最大）。  
- 显著集中度 \(C_s\)：\(C_s=1-\frac{H(S)}{\log N}\)，\(H(S)=-\sum p_i\log p_i\)（基于显著图的像素分布熵）。  
- 美学分数 \(A_s=\sum_{k=1}^{10} k\,p_k\)，并输出方差表征一致性。  
- 联合分数 \(Q=\alpha \tilde C_s + (1-\alpha)\tilde A_s\)，\(\tilde A_s=(A_s-1)/9\)，默认 \(\alpha=0.4\)（与论文设置一致）。  
- 设计优化：对一张包装图生成若干候选，按 \(Q\) 排序取最优。  

## 快速开始
```bash
bash run.sh
