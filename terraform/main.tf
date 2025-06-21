resource "aws_key_pair" "default" {
  key_name   = var.key_name
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_security_group" "prom_sg" {
  name = "prometheus-sg"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  

  ingress {
    from_port   = 9090
    to_port     = 9090
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 9100
    to_port     = 9100
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "prometheus" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = var.key_name
  vpc_security_group_ids      = [aws_security_group.prom_sg.id]
  associate_public_ip_address = true

  tags = {
    Name = "Prometheus"
    Role = "prometheus"
  }
}

resource "aws_instance" "node_exporter" {
  count                       = 2
  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = var.key_name
  vpc_security_group_ids      = [aws_security_group.prom_sg.id]
  associate_public_ip_address = true

  tags = {
    Name = "NodeExporter-${count.index}"
    Role = "node_exporter"
  }
}

resource "aws_instance" "grafana" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = var.key_name
  vpc_security_group_ids      = [aws_security_group.prom_sg.id]
  associate_public_ip_address = true

  tags = {
    Name = "Grafana"
    Role = "grafana"
  }
}
