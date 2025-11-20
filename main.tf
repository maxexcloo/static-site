resource "google_storage_bucket" "website" {
  force_destroy               = true
  location                    = var.region
  name                        = var.bucket_name
  uniform_bucket_level_access = true

  website {
    main_page_suffix = "index.html"
  }
}

resource "google_storage_bucket_iam_member" "all_users" {
  bucket = google_storage_bucket.website.name
  member = "allUsers"
  role   = "roles/storage.objectViewer"
}

resource "google_storage_bucket_object" "index" {
  bucket       = google_storage_bucket.website.name
  content_type = "text/html"
  name         = "index.html"
  source       = "index.html"
}
