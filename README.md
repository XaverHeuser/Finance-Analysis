# Finance Analysis

An automated ETL data processing application designed to extract private transactional information from localized banking account statement files, execute formatting pipelines, ingest sanitized structures into Google Sheets and visualized in looker reporting dashboards.

[![Python Version](https://img.shields.io/badge/python-3.11-blue.svg)](https://www.python.org/)
[![GCP App](https://img.shields.io/badge/GCP-Cloud--Run-orange.svg)](https://cloud.google.com/run)
[![Continuous Integration](https://img.shields.io/badge/CI-Ruff%20%7C%20Mypy%20%7C%20Bandit%20%7C%20Pytest-brightgreen.svg)](https://github.com/XaverHeuser/finance-analysis/actions)
[![Docker Configuration](https://img.shields.io/badge/Docker-Containerized-blue.svg)](Dockerfile)

---

## 🚀 Key Features

- **Automated Statement Ingestion**: Scans designated Google Drive input directories to locate and extract uncompiled PDF bank account statement structures natively
- **Layout-Preserving Text Parsing**: Integrates advanced tabular layout-mode extractions via `pdfplumber` to maintain spacing bounds for accounting balance audits
- **Index-Boundary Transaction Mapping**: Programmatically evaluates isolated byte arrays bounded by historical ledger indicators (`alter Kontostand` and `neuer Kontostand`) to isolate row objects
- **Preserved Schema Updates**: Updates remote sheets through decoupled data-frame updates starting precisely beneath header validation lines to keep styling intact
- **Automated Continuous Delivery**: Packaged with multi-stage integration test runners (`pytest`), coverage calculators, security auditors (`Bandit`) and automated deployment recipes for Cloud Run Jobs
- **Data Viz in Data Studio:** Visualize data from Google Sheets in Data Studio

---

## 🏗 System Architecture & Workflow

The chart below maps structural boundaries across user upload layers, serverless job schedulers, and Google API authorization boundaries during active batch sync runs:

[![Architecture](https://img.plantuml.biz/plantuml/svg/VLF1Zfim4BtxAwRfeUqXFVR0eTfi86cgL4MmqQfIfSY1IR1YR3Gskqch_VSEXcMRT5LEC9xtPjxpuyPvIRwjDIoKaQR0xSn8VNRARLTcJz9vQWlV4eetli8QeT5I6U6EoZIIP0s5hHjhqFZSdpK2OU6bEMWKGXRU4ams3ca2qi6i-nQ5jcq9awMrt0JtbewkaGL2R6ic3eqlnTy2-2cbbplfS4J5f1xmftb_btnBjullwpZ9jgluGm2lJDFwXTKb4hnTgqFbKsMEh_Fa5Q9tJ9IdMJAByoz9SZSIBSFfmF43jRQF_zycIvQRzIoxNcX6HSKD_wxq9AxCc8UlL4k_jrHF1lMZmJ3f6_AYmhBLI3npJjR0sjgcdpKU3NDkTOklasIjWQzs5r2XqXLwq98GpJ3y2fiNf1e_ZEfUGzDJ9qKPZxJlBkrP3gzrv4rotvRA1inG6SPqXfZCbeEtuXtCBR6Tx2_VuW6TLonkqPs5wC2Kff__ljy8DessidIGnWkU8pq7r7ZnuiAqPCIpl0YI4nQjHzSfXzeQN-cp4AFyq7t1dvmySOmTDEKUzefJVTdSPoI2Ur8ThS7748-hhei4HEn2j_B8s1lPYnjn4QII75FUuScpD49PEtXGiiCrkgrtI48C4PqoSh0sWayV8J-Rek9Wg5zCa18wDaK6CpShSOEcvD_z3m00)](https://editor.plantuml.com/uml/VLF1Zfim4BtxAwRfeUqXFVR0eTfi86cgL4MmqQfIfSY1IR1YR3Gskqch_VSEXcMRT5LEC9xtPjxpuyPvIRwjDIoKaQR0xSn8VNRARLTcJz9vQWlV4eetli8QeT5I6U6EoZIIP0s5hHjhqFZSdpK2OU6bEMWKGXRU4ams3ca2qi6i-nQ5jcq9awMrt0JtbewkaGL2R6ic3eqlnTy2-2cbbplfS4J5f1xmftb_btnBjullwpZ9jgluGm2lJDFwXTKb4hnTgqFbKsMEh_Fa5Q9tJ9IdMJAByoz9SZSIBSFfmF43jRQF_zycIvQRzIoxNcX6HSKD_wxq9AxCc8UlL4k_jrHF1lMZmJ3f6_AYmhBLI3npJjR0sjgcdpKU3NDkTOklasIjWQzs5r2XqXLwq98GpJ3y2fiNf1e_ZEfUGzDJ9qKPZxJlBkrP3gzrv4rotvRA1inG6SPqXfZCbeEtuXtCBR6Tx2_VuW6TLonkqPs5wC2Kff__ljy8DessidIGnWkU8pq7r7ZnuiAqPCIpl0YI4nQjHzSfXzeQN-cp4AFyq7t1dvmySOmTDEKUzefJVTdSPoI2Ur8ThS7748-hhei4HEn2j_B8s1lPYnjn4QII75FUuScpD49PEtXGiiCrkgrtI48C4PqoSh0sWayV8J-Rek9Wg5zCa18wDaK6CpShSOEcvD_z3m00)

## ⚙️ Environment Configuration

The application parses environment variables to configure runtime behavior. Ensure the following variables are specified in your execution space:

## Deployment

- The app/ main script is deployed on GCP
- Execution status: 0 7 2 * * (Every second day of a month at 7am.)

## 💻 Local Workspace Installation

### 1. Initialize Sandbox Environment

```bash
# Clone the repository structure locally
git clone [https://github.com/XaverHeuser/finance-analysis.git](https://github.com/XaverHeuser/finance-analysis.git)
cd finance-analysis

# Initialize isolated runtime virtual dependencies
python3 -m venv .venv
source .venv/bin/activate
```

### 2. Deploy Pinned Package Inventories

```bash
# Update local installer configurations to safe margins
python -m pip install --upgrade pip==26.1.1

# Deploy core data-processing layers
python -m pip install -r requirements.txt

# Deploy validation layers (linters, type-checkers, unit tests)
python -m pip install -r requirements-dev.txt

# Initialize pre-commit automation hooks locally
pre-commit install
```

### 3. Local Runtime Execution

To verify extraction behaviors using a local credentials file before deployment:

1. Save your Service Account credentials file to a non-tracked folder named credentials/.
2. Export your environment variable configurations.
3. Run the script execution command:

```bash
export SPREADSHEET_ID="your_sheet_id"
export TEMP_FOLDER_ID="your_temp_folder_id"
export REGULAR_FOLDER_ID="your_regular_folder_id"

python src/main.py
```

## ☁️ Continuous Integration & Deployment (CI/CD)

### Continuous Integration Safeguards

The configured GitHub Actions pipeline performs multi-stage quality control checks on every code push or pull request to the main branch:

- **Quality Audits:** Enforces code style guidelines using Ruff
- **Static Type Invariants:** Assesses type safety definitions with strict mypy evaluations
- **Security Testing:** Scans for vulnerabilities and exposed secrets using Bandit
- **Unit Test Execution:** Runs automated tests via pytest with code coverage verification

### Automated Production Deployment Steps

The application utilizes an automated multi-stage Google Cloud Build runner pipeline (cloudbuild.yaml) triggered on merges to the main branch to handle serverless application packaging:

```bash
# Manual trigger option via gcloud SDK
gcloud builds submit --config cloudbuild.yaml .
```

The production system operates on a serverless scheduling model inside Google Cloud Run Jobs, configured on an automated loop via Cloud Scheduler:

- Cron Trigger: `0 7 2 * *` (Executes automatically at 7:00 AM on the 2nd day of each calendar month).

## 🔒 Security Posture & Vulnerability Logs

### Handled Security Advisories: `pip` (GHSA-4xh5-x5gv-qwph)

The continuous security scanning infrastructure flags a specific structural advisory concerning `pip` below version 25.2:

- **Advisory ID:** [GHSA-4xh5-x5gv-qwph](https://github.com/advisories/GHSA-4xh5-x5gv-qwph)
- **Mitigation Strategy:** The risk applies to untrusted source distributions (`sdists`). Because this workflow uses pinned Python Wheels from verified PyPI mirrors within a controlled workspace, the rule is explicitly ignored using `--ignore-vuln` in the continuous integration environment.

## 📂 Repository Structure

```text
├── .github/                 # Automated deployment workflow blueprints & validation logic
│   └── workflows/
│       ├── ci-pipeline.yml  # Multi-stage code verification and testing workflow
│       └── deploy.yml       # Production Cloud Run deployment configuration
├── notebooks/               # Analysis and prototyping environments
├── src/                     # Application source modules
│   ├── config/              # Scope allocations and environmental configurations
│   ├── domain/              # Core balance checking and transaction parsing logic
│   ├── infrastructure/      # Drive/Sheets integration clients and text parsers
│   ├── models/              # Dataclass modeling schemas
│   ├── processing/          # Core transaction orchestration logic
│   └── main.py              # Application entry point gateway
├── tests/                   # Test suite matching application file layouts
├── Dockerfile               # Application container build script
├── cloudbuild.yaml          # Google Cloud Build compilation pipeline
└── pyproject.toml           # Package build properties and configuration specs
```

## 📄 License

Distributed directly under the terms of the open-source MIT License guidelines. See accompanying repository license files for deep details.
