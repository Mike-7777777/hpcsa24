# hpcsa24
Coursework Repository for "Intrusion Detection in High-Performance Computing (HPC)" Research Report

## Overview
This repository contains the code, experiments, and related files for the research report titled **"Intrusion Detection in High-Performance Computing"** as part of the HPCSA coursework. The primary focus of the study is to evaluate and compare various Intrusion Detection Systems (IDS) in High-Performance Computing environments.

## Key Features
- **Suricata IDS Plugin**: Experiment to identify performance bottlenecks of the Suricata IDS plugin.
- **Slips IDS Evaluation**: Comprehensive evaluation of the Slips IDS with a machine learning-based detection approach.
- **AutoGluon and TIG Stack**: Comparative analysis of ML models using the CIC-IDS2018 dataset.
- **Report Findings**: Highlighting the importance of network interface throughput, machine learning in IDS, and the need for high-quality datasets.

## Experiments
### Suricata IDS Plugin
- **Goal**: Identify performance bottlenecks in the Suricata IDS plugin within HPC environments.
- **Findings**: Network interface and CPU are primary limitations, while memory and disk I/O have minimal impact.

### Slips IDS Evaluation
- **Goal**: Assess the efficacy of Slips IDS and its machine learning component for identifying network threats.
- **Findings**: Slips IDS effectively detected network anomalies and provided detailed insights into security breaches.

### Machine Learning Models (AutoGluon, TIG Stack)
- **Goal**: Evaluate various machine learning models for IDS using the CIC-IDS2018 dataset.
- **Models Tested**: Decision Trees, Random Forests, Ensemble Methods
- **Findings**: Ensemble methods achieved accuracy rates exceeding 99%, underscoring the benefits of combining multiple algorithms.

## Repository Structure
hpcsa24/
├── ag/ # AutoGluon experiments and models
├── slips/ # Slips IDS evaluation
├── suricata_plugin/ # Suricata IDS plugin experiments
├── report/ # Research report and related documents
└── README.md # This file

## Getting Started
### Prerequisites
- Python 3.x
- Docker
- [AutoGluon](https://github.com/awslabs/autogluon)
- [Suricata](https://suricata.io/)
- [Slips](https://github.com/jasonish/slips)
- [TIG Stack](https://github.com/alekece/tig-stack)

## License
This project is licensed under the MIT License - see the LICENSE file for details. 
If you'd like to update the `README.md` file directly, let me know, and I'll save the changes. &#8203;``【oaicite:0】``&#8203;

