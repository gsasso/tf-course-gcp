output "load_balancer_ip_address" {
  description = "IP address of the Cloud Load Balancer"
  value       = module.load-balancer_http-load-balancer.load_balancer_ip_address
}