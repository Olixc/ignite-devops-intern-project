provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "kind-my-cluster" # Please change this to your context e.g. kind-<cluster-name>
}
