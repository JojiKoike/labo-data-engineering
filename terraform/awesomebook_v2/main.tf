provider "google" {
  project = "awesomebook-v2-439100"
  region  = "asia-northeast1"
}

resource "google_storage_bucket" "data_bucket" {
  name                        = "awesomebook-v2"
  location                    = "asia-northeast1"
  storage_class               = "STANDARD"
  uniform_bucket_level_access = true
}
