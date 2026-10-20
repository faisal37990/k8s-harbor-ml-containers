# 🚢 Kubernetes & Harbor Containerized ML Evaluation Sandbox

[![Docker](https://img.shields.io/badge/Docker-Multi--Stage%20Builds-2496ED?logo=docker&logoColor=white)](https://docker.com)
[![Harbor](https://img.shields.io/badge/Harbor-Enterprise%20Artifact%20Registry-60B982?logo=harbor&logoColor=white)](https://goharbor.io)
[![Kubernetes](https://img.shields.io/badge/Kubernetes-K8s%20Jobs%20%26%20CronJobs-326CE5?logo=kubernetes&logoColor=white)](https://kubernetes.io)
[![Bash](https://img.shields.io/badge/Terminal-Automated%20CLI-000000?logo=gnubash&logoColor=white)](https://gnu.org)
[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](LICENSE)

> **Enterprise containerization and orchestration harness for reproducible LLM evaluation, golden solution grading, and model AI Training & Evaluation sandboxes.**
> Maintained by **[Faisal Sharif](https://linkedin.com/in/mohammedalfaisal-sharif/)**.

---

## 🏛️ Overview

In production model evaluation (e.g. at Turing.com or Google Cloud environments), adversarial prompt testing and multi-turn agent evaluation require **hardened, isolated execution containers**:

1. **Harbor Registry Integration:** Automated scanning with Trivy, signed image releases (Cosign), and role-based access for evaluation artifacts.
2. **Kubernetes Job Execution:** Ephemeral K8s Pods that spin up, execute a batch of red-teaming business case studies, validate JSON outputs, and terminate.
3. **Reproducible Environment Isolation:** Ensuring that frontier models cannot access external state or leak evaluation secrets during test execution.

---

## 📁 Repository Structure

```
k8s-harbor-ml-containers/
├── k8s/
│   ├── eval-job.yaml                   # Kubernetes Job specification for batch evaluation
│   ├── configmap.yaml                  # Evaluation rubrics and JSON schema mounts
│   └── secret-template.yaml            # Secret management for cloud credentials
├── scripts/
│   ├── push_to_harbor.sh               # Terminal CLI script to build and push to Harbor
│   └── deploy_k8s_eval.sh              # Kubeclt orchestration script with health checks
├── Dockerfile.eval                     # Multi-stage hardened evaluation container
└── README.md
```

---

## 🚀 Quick Execution via Terminal CLI

```bash
# 1. Login to Harbor Registry
chmod +x scripts/*.sh
./scripts/push_to_harbor.sh registry.internal.corp/eval/llm-benchmark:v1.0

# 2. Deploy batch evaluation job to Kubernetes
./scripts/deploy_k8s_eval.sh
```

---

## 👤 Author
**Faisal Sharif** — *AI Evaluation Engineer & DevOps Systems Specialist*  
LinkedIn: [Mohammed Al Faisal Sharif](https://linkedin.com/in/mohammedalfaisal-sharif/) | GitHub: [@faisal37990](https://github.com/faisal37990)
