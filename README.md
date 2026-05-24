# Finance Analysis

An automated ETL data processing application designed to extract private transactional information from localized banking account statement files, execute formatting pipelines, ingest sanitized structures into Google Sheets and visualized in looker reporting dashboards.

[![Python Version](https://img.shields.io/badge/python-3.11-blue.svg)](https://www.python.org/)
[![GCP App](https://img.shields.io/badge/GCP-Cloud--Run-orange.svg)](https://cloud.google.com/run)
[![Terraform as IAC](https://img.shields.io/badge/IAC-Terraform-mediumpurple.svg)](https://developer.hashicorp.com/terraform)
[![Continuous Integration](https://img.shields.io/badge/CI-Ruff%20%7C%20Mypy%20%7C%20Bandit%20%7C%20Pytest-brightgreen.svg)](https://github.com/XaverHeuser/finance-analysis/actions)
[![Docker Configuration](https://img.shields.io/badge/Docker-Containerized-blue.svg)](Dockerfile)

---

## 🚀 Key Features

- **Automated Statement Ingestion**: Scans designated Google Drive input directories to locate and extract uncompiled PDF bank account statement structures natively
- **Infrastructure as Code**: Terraform as IAC Tool to declerate the GCP infrastructure and to avoid the need of doing this manually
- **Layout-Preserving Text Parsing**: Integrates advanced tabular layout-mode extractions via `pdfplumber` to maintain spacing bounds for accounting balance audits
- **Index-Boundary Transaction Mapping**: Programmatically evaluates isolated byte arrays bounded by historical ledger indicators (`alter Kontostand` and `neuer Kontostand`) to isolate row objects
- **Preserved Schema Updates**: Updates remote sheets through decoupled data-frame updates starting precisely beneath header validation lines to keep styling intact
- **Automated Continuous Delivery**: Packaged with multi-stage integration test runners (`pytest`), coverage calculators, security auditors (`Bandit`) and automated deployment recipes for Cloud Run Jobs
- **Data Viz in Data Studio:** Visualize data from Google Sheets in Data Studio

---

## 🏗 System Architecture & Workflow

The chart below maps structural boundaries across user upload layers, serverless job schedulers, and Google API authorization boundaries during active batch sync runs:

[![Architecture](https://img.plantuml.biz/plantuml/svg/VLH1Rjim4Bpp5LldqXxSOmyw574jsNNXe88L8mXGmA2fTKIO8eKbcSGjylUIj2B7Rb2TH79cTdSuqhLrd9nl5SoavbhWPgAvEbXfDmkz8suTUU4y8VlW6cmHEiMbPdOlTSU9jo1CsncDsbNke108XUFwGI5ZN3X3C5fRf15m2vEuPWCUHhT8n7U6sdGyhE3g1clfsz9J5tM4Chw6qToO80jtXlQsum8XDsre9N5FctyOXAVcZc-vnO6Latp4N_hZRN5JRcO_btcnsYpoJucyq9rtCwDg9BXQoeV6bLBltzUf6aHdWr1Lhef9NdqlYjj1Q9vEUurxLCey_R-RLJ5VBoUhouOc99e0-BUbbqipfcbLAku66-VJiZVXZTD7N2KQhBr22gMdP3GiZUcE9OUZljmtvV5zaPNNyCDi4oljn8qZQKw8kYz-mQq4oSxrfU9h0ht4YQHsIBjuTwzJXRRsePFA-LgQnEbt-ZBH5xqoTMynIy62COs_lhtB3DQTChosKEQp8CPTYAzsx9Ipn0X-PP2Z2BC7H4p3MUhPoPbn7U2l8sTGFAFmaH7SWDPerwW3OuCb2NtMJl7iA7mJ5hfw1piPedqEFiOdWpkIKLRZKqhE1Uei75bm9auuA1xDFKusy38eELcCdzYp2quGyjR2e-IHrodVRf4OwzCx3ipUxWo-V8Rge4KJmY9_1u6Iq0OFkPCXFUi5kqPTXt_7Nm00)](https://editor.plantuml.com/uml/VLH1Rjim4Bpp5LldqXxSOmyw574jsNNXe88L8mXGmA2fTKIO8eKbcSGjylUIj2B7Rb2TH79cTdSuqhLrd9nl5SoavbhWPgAvEbXfDmkz8suTUU4y8VlW6cmHEiMbPdOlTSU9jo1CsncDsbNke108XUFwGI5ZN3X3C5fRf15m2vEuPWCUHhT8n7U6sdGyhE3g1clfsz9J5tM4Chw6qToO80jtXlQsum8XDsre9N5FctyOXAVcZc-vnO6Latp4N_hZRN5JRcO_btcnsYpoJucyq9rtCwDg9BXQoeV6bLBltzUf6aHdWr1Lhef9NdqlYjj1Q9vEUurxLCey_R-RLJ5VBoUhouOc99e0-BUbbqipfcbLAku66-VJiZVXZTD7N2KQhBr22gMdP3GiZUcE9OUZljmtvV5zaPNNyCDi4oljn8qZQKw8kYz-mQq4oSxrfU9h0ht4YQHsIBjuTwzJXRRsePFA-LgQnEbt-ZBH5xqoTMynIy62COs_lhtB3DQTChosKEQp8CPTYAzsx9Ipn0X-PP2Z2BC7H4p3MUhPoPbn7U2l8sTGFAFmaH7SWDPerwW3OuCb2NtMJl7iA7mJ5hfw1piPedqEFiOdWpkIKLRZKqhE1Uei75bm9auuA1xDFKusy38eELcCdzYp2quGyjR2e-IHrodVRf4OwzCx3ipUxWo-V8Rge4KJmY9_1u6Iq0OFkPCXFUi5kqPTXt_7Nm00)

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

## 🌍 Infrastructure as Code (Terraform)

The project's Google Cloud Platform (GCP) infrastructure is fully modularized and provisioned using **Terraform**. The deployment utilizes variables targeting a custom repository setup.

### Core Architecture Components

- **`providers.tf`**: Configures the HashiCorp Google provider (pinned to `v6.8.0`) and programmatically enables required remote APIs (`Cloud Run`, `Cloud Scheduler`, `Cloud Build`, `Artifact Registry`, `Secret Manager`, and `Google Drive`).
- **`variables.tf`**: Sets localized deployment variables, defaulting to the `finance-analysis-id` project ID inside the `europe-west1` geographical region.
- **`cloudbuild.tf`**: Spins up a secure Docker Artifact Registry (`finance-analysis-repo`) to house application images. It also initializes a dedicated pipeline service account (`cloudbuild-runner-sa`) granted minimal-privilege roles (`run.invoker`, `storage.admin`, `logging.logWriter`, `artifactregistry.writer`, and `cloudbuild.builds.builder`).
- **`pipeline.tf`**: Defines the serverless `finance-analysis-job` on Cloud Run. It configures a task timeout window of 30 minutes (`1800s`) and maps structural runtime parameters (`SPREADSHEET_ID`, `TEMP_FOLDER_ID`, `REGULAR_FOLDER_ID`) securely using dynamic environment blocks tied to Secret Manager references.
- **`secrets.tf`**: Instantiates locked Secret Manager parameter definitions, providing explicit read/access permissions exclusively to the Cloud Run Job runtime service account.
- **`orchestration.tf`**: Establishes a serverless `google_cloud_scheduler_job` engine running on a Cron loop triggered automatically at **7:00 AM on the 2nd day of each month** to wake up the analysis job pipeline safely.

### Provisioning Infrastructure Locally

1. Create GCP project
2. Authenticate to project in `gcloud` terminal
3. Initialize Workspace & Providers

    ```bash
    # Create folder and initialize terraform
    cd terraform
    terraform init

    # Review execution spec
    terraform plan

    # Deploy terraform code
    terraform apply
    ```

4. Set secrets in Secret Manager
5. Apply Cloudbuild

    ```bash
    gcloud builds submit --config cloudbuild.yaml .
    ```

6. Update Cloud Run Job with Docker Image

    ```bash
    gcloud run jobs update finance-analysis-job --image=europe-west1-docker.pkg.dev/finance-analysis-id/finance-analysis-repo/analysis-image:latest  --region=europe-west1
    ```

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
├── terraform/               # Infrastructure as Code infrastructure definitions
|   ├── providers.tf         # Pinned provider dependencies & API activation lists
|   ├── pipeline.tf          # Serverless Cloud Run Job definitions
|   ├── variables.tf         # Project resource definitions & regional controls
|   ├── ...
├── tests/                   # Test suite matching application file layouts
├── Dockerfile               # Application container build script
├── cloudbuild.yaml          # Google Cloud Build compilation pipeline
└── pyproject.toml           # Package build properties and configuration specs
```

## 📄 License

Distributed directly under the terms of the open-source MIT License guidelines. See accompanying repository license files for deep details.
