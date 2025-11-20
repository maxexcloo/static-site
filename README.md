# Static Site

OpenTofu configuration to host a static website on GCP.

## Basic Configuation

### Setup

This project uses mise to manage tools.

1. Install mise (https://mise.jdx.dev).
2. Clone the repo and change to the repo directory.
3. Run `mise install` to install required tools.
4. Log into the Google Cloud Console (https://console.cloud.google.com) and create a new project.
5. Run `gcloud auth application-default login` to authenticate with GCP.
6. Edit `variables.auto.tfvars` to set the bucket name and GCP project ID.

### Deploy

2. Run `tofu init` to initialise OpenTofu.
2. Run `tofu apply` to apply changes.

The output url will show the direct link to your bucket.

## Custom Domain & HTTPS

As GCP buckets only support HTTP for custom domains, we will use Cloudflare to get free HTTPS on our custom domain.

1. Edit `variables.auto.tfvars` to set the bucket name to your full domain (e.g., subdomain.domain.com).
2. Run `tofu apply` to apply changes.  
   You may need to verify domain ownership in the Google Search Console if OpenTofu fails to create the bucket.
3. Log in to Cloudflare and select your domain.
4. Go to DNS > Records and add a CNAME record:  
   Name: `subdomain`  
   Target: `c.storage.googleapis.com`  
   Proxy Status: `Proxied`

Your website should now be live on the custom subdomain with HTTPS.
