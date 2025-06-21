# 🚀 Monitoring Setup: Prometheus + Node Exporter + Grafana on AWS using Terraform & Ansible

This project automates the full setup of a cloud-based monitoring stack using **Terraform** and **Ansible**. It provisions EC2 instances on AWS, installs **Prometheus** for metrics scraping, **Node Exporter** for exposing Linux system metrics, and **Grafana** for visualization.

---

## 📌 Features

- Infrastructure provisioning using Terraform
- Configuration management using Ansible
- Prometheus + Node Exporter metrics collection
- Grafana integration for dashboards
- Dynamic Prometheus config generation with Ansible templates
- GitHub-ready structure

---

## 🧱 Architecture Overview

```text
+--------------+         +------------------+
|   Grafana    | <-----> |   Prometheus     |
+--------------+         +------------------+
                                ↑
                                |
                +----------------------------+
                |      Node Exporter x 2     |
                +----------------------------+
```

---

## 📁 Folder Structure

```
monitoring-setup/
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   └── provider.tf
├── ansible/
│   ├── ansible.cfg
│   ├── inventory.ini
│   ├── playbooks/
│   │   ├── install_prometheus.yml
│   │   ├── install_node_exporter.yml
│   │   └── install_grafana.yml
│   └── templates/
│       └── prometheus.yml.j2
└── README.md
```

---

## ⚙️ How to Run

### 1️⃣ Provision Infrastructure

```bash
cd terraform
terraform init
terraform apply -var="key_name=your_key" -auto-approve
```

> Replace `your_key` with your AWS EC2 SSH key pair name.

---

### 2️⃣ Configure with Ansible

```bash
cd ../ansible
ansible-playbook playbooks/install_prometheus.yml
ansible-playbook playbooks/install_node_exporter.yml
ansible-playbook playbooks/install_grafana.yml
```

---

### 3️⃣ Setup Grafana

- Visit: `http://<grafana_ip>:3000`
- Login: `admin / admin`
- Add data source → Prometheus → `http://<prometheus_ip>:9090`
- Import dashboard ID `1860` for Node Exporter

---

## 📸 Screenshots

![image](https://github.com/user-attachments/assets/133aa17c-736c-4a28-b1e4-a0accc6fde62)


---

## ✅ Requirements

- AWS Account + Key Pair
- Terraform v1.x
- Ansible v2.9+
- Python 3
- WSL or Linux shell environment

---

## 🤝 Contributing

Pull requests welcome. Feel free to fork and enhance!

---

## 📜 License

MIT License

---

## 🙋 Author

**Pasan Ravindu**  
[GitHub](https://github.com/m1ghtyfu) • [LinkedIn](https://www.linkedin.com/in/pasan-ravindu-821911203/)
