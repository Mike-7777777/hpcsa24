# hpcsa24
Coursework Repository for "Intrusion Detection in High-Performance Computing (HPC)" Research Report

## Overview
This repository contains the code, experiments, and related files for the research report titled **"Intrusion Detection in High-Performance Computing"** as part of the HPCSA coursework. The primary focus of the study is to evaluate and compare various Intrusion Detection Systems (IDS) in High-Performance Computing environments.

## Key Features
- **Suricata IDS Plugin**: Experiment to identify performance bottlenecks of the Suricata IDS plugin.
- **Slips IDS Evaluation**: Comprehensive evaluation of the Slips IDS with a machine learning-based detection approach.
- **AutoGluon and TIG Stack**: Comparative analysis of ML models using the CIC-IDS2018 dataset.
- **Report Findings**: Highlighting the importance of network interface throughput, machine learning in IDS, and the need for high-quality datasets.

## Comparison of Network-based IDS
| Name, Year      | Dataset          | Hardware Needs (100Gbps) | Accessibility          | Scene  | Type          | Filtering                          |
|-----------------|------------------|--------------------------|------------------------|--------|---------------|-------------------------------------|
| **ZeekML [Gus19]** | CIC-IDS2017    | 100 CPUs                 | Closed source         | General| Anomaly-based | Custom, double                      |
| **Pulsar [TFD+19]**| Campus traffic | 8 TAP + 2 SPAN + 17 servers | Open source, free | HPC    | Signature-based | Whitelist                          |
| **RUAD [MBC+22]** | Campus traffic  | N/A                      | Closed source         | HPC    | Anomaly-based | N/A                               |
| **Pigasus [Zha21]**| DPDK pktgen   | 1 CPU + 1 FPGA           | Open source, free     | HPC    | Signature-based | Multi-layer, low latency           |
| **Retina [WGBD22]**| Campus traffic| 8-cores CPU              | Open source, free     | General| Hybrid       | Multi-layer                         |
| **AutoGluon\*, 2024**| CIC-IDS2018  | N/A                      | Open source, free     | General| Anomaly-based | N/A                                |

## Summary of Network Traffic Datasets
| Year | Dataset       | Source                     | Attack Types | Size (GB) | Feature Count | Open Source |
|------|---------------|----------------------------|--------------|-----------|---------------|-------------|
| 2015 | **UNSW-NB 15 [MS15]** | Simulation (Special Facility) | 9           | 100       | 49            | Yes         |
| 2017 | **CIC-DIS2017 [SLG18]**| Simulation (Infrastructure)  | 7           | 51        | 80            | Yes         |
| 2018 | **CIC-DIS2018 [SLG18]**| Simulation (Infrastructure)  | 7           | 450       | 83            | Yes         |
| 2020 | **MQTT-IoT-IDS2020 [HBB+20]**| Simulation (Special Facility) | 4     | 1.4       | 43            | Yes         |
| 2022 | **5G-NIDD [SSP+22]** | University (Real Traffic)     | 5           | 3.65      | 25            | Yes         |
| 2022 | **RUAD [MBC+22]**    | University (Real Traffic)     | Unknown     | Unknown   | 41            | No          |
| 2023 | **TII-SSRC-23 [HLA23]**| Simulation (Small Devices)   | 4           | 27.5      | 75            | Yes         |
| 2021 | **NF-UQ-NIDS-v2 [SLP21]**| Integrated                | 21          | 1.8       | 43            | Yes\*       |

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

├── ag/                 # AutoGluon experiments and models

├── slips/              # Slips IDS evaluation

├── suricata_plugin/    # Suricata IDS plugin experiments

├── report/             # Research report and related documents

└── README.md           # This file

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

