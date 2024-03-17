ui = true

listener "tcp" {
  tls_disable = 1
  address = "[::]:8200"
  cluster_address = "[::]:8201"
  # Enable unauthenticated metrics access (necessary for Prometheus Operator)
  #telemetry {
  #  unauthenticated_metrics_access = "true"
  #}
}

#storage "inmem" {}

storage "file" {
  path = "/vault/data"
}

path "auth/token/lookup-self" {
  capabilities = ["read"]
}

path "sys/mounts/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}



# Example configuration for using auto-unseal, using Google Cloud KMS. The
# GKMS keys must already exist, and the cluster must have a service account
# that is authorized to access GCP KMS.
#seal "gcpckms" {
#   project     = "vault-helm-dev"
#   region      = "global"
#   key_ring    = "vault-helm-unseal-kr"
#   crypto_key  = "vault-helm-unseal-key"
#}

# Example configuration for enabling Prometheus metrics in your config.
#telemetry {
#  prometheus_retention_time = "30s"
#  disable_hostname = true
#}

secrets {
  enable = true
}

path "secret/*" {
  backend = "kv"
  version = 2
}