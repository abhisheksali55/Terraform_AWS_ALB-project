# key pair (lgin)
resource "aws_key_pair" "my_key"  {
    key_name = "demo-ec2-key"
    public_key = file("demo-ec2-key.pub")

}


# VPC & Security Group

resource "aws_default_vpc" "default" {
  
}

data "aws_subnets" "default" {
  filter {
    name   = "default-for-az"
    values = ["true"]
  }
}

resource "aws_security_group" "demo_security_group" {
    name = "Demo-sg"
    description = "this is a TF security group" 
    vpc_id = aws_default_vpc.default.id
     
     # inbound ruls
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "SSH open"
     }
     
    ingress {
         from_port = 80 
         to_port = 80 
         protocol = "tcp"
         cidr_blocks = ["0.0.0.0/0"]
         description = " HTTP open"
     }
     # outbound ruls
    egress {
          from_port = 0
          to_port = 0
          protocol = "-1"
          cidr_blocks = ["0.0.0.0/0"]
          description = "all access open outbound"
     }
     tags = {
        name = "Demo-sg"
           }
}
# ec2 instance -1

resource "aws_instance" "veb_1" {
    for_each = tomap({                        # meta argument (for_each)
       Firts-terra-server = "t2.micro", 
       
    })
    key_name = aws_key_pair.my_key.key_name
    security_groups = [aws_security_group.demo_security_group.name]
    instance_type = each.value
    ami = "ami-06468be052a4195a6"

     user_data = <<-EOF
#!/bin/bash
apt-get update -y
apt-get install nginx -y
systemctl enable nginx
systemctl start nginx

echo "<h1>Terraform Nginx Server-1</h1>" > /var/www/html/index.html
EOF

   

    root_block_device {
        volume_size = 10
        volume_type = "gp3"
    }  
    tags = {
        Name = each.key  # meta argument (for_each)
    }
}   

# ec2 instance -2

resource "aws_instance" "veb_2" {
    for_each = tomap({                        
       
       second-terra-server = "t2.micro"      # meta argument (for_each)
           # meta argument (for_each)
    })
    key_name = aws_key_pair.my_key.key_name
    security_groups = [aws_security_group.demo_security_group.name]
    instance_type = each.value
    ami = "ami-06468be052a4195a6"

    user_data = <<-EOF
#!/bin/bash
apt-get update -y
apt-get install nginx -y
systemctl enable nginx
systemctl start nginx

echo "<h1>Terraform Nginx Server-2</h1>" > /var/www/html/index.html
EOF


    root_block_device {
        volume_size = 10
        volume_type = "gp3"
    }  
    tags = {
        Name = each.key  # meta argument (for_each)
    }
}   