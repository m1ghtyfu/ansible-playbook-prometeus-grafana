output "prometheus_ip" {
  value = aws_instance.prometheus.public_ip
}

output "node_ips" {
  value = [for i in aws_instance.node_exporter : i.public_ip]
}

output "grafana_ip" {
  value = aws_instance.grafana.public_ip
}
