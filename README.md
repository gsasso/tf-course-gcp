# Use Application Default Credentials (ADC):

gcloud auth application-default login

# Create a new GCP Project:

gcloud projects create <PROJECT_ID>

# List all GCP Projects:

gcloud projects list

# Set active Project:

gcloud config set project <PROJECT_ID>

# Use Service Account Credentials:

gcloud iam service-accounts create <service-account>
gcloud projects add-iam-policy-binding <project> --member='serviceAccount:<service-account-email>' --role='roles/owner'
gcloud iam service-accounts keys create <credentials_file>.json --iam-account=<service_account>.iam.gserviceaccount.com
Set GCP Credentials: export GOOGLE_APPLICATION_CREDENTIALS=<Path to service account JSON key>

# Set ssh username (Optional): export TF_VAR_username=$(whoami)

Run terraform init

Run terraform validate

Run terraform plan -out <file_name>.tfplan

Run terraform apply
