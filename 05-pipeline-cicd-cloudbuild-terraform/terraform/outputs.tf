# =========================================================================
# SAÍDAS DO TERRAFORM (outputs.tf)
# =========================================================================

output "vm_internal_ip" {
  description = "IP interno gerado para a instância de VM"
  value       = google_compute_instance.vm_instance.network_interface.0.network_ip
}

output "vm_external_ip" {
  description = "IP externo público associado à instância de VM"
  value       = google_compute_instance.vm_instance.network_interface.0.access_config.0.nat_ip
}
