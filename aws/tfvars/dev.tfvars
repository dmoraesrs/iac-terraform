#Global Vars
environment = "dev"
globaltags = { "source" = "terraform", "product" = "Skymed", "managed" = "IAC", "environment" = "dev" }

###############################################################
#S3 Logs-01
s3_bucket_name            = "comunidadelogs-01"
s3_acl                    = "private"
s3_force_destroy          = true
s3_tags                   = {"files" = "general"}