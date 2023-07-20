
data "aws_ami" "ubuntu_ami" {
  most_recent = true
  owners      = ["099720109477"]  # Ubuntu official account ID

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
}


module "jenkins" {
  source = "../../modules/jenkins"

  name                        = "${var.environment}-Jenkins-Master"
  instance_type               = var.jenkins_instance_type
  environment                 = var.environment
  instance_ami_id             = data.aws_ami.ubuntu_ami.id
  # instance_ami_id             = var.jenkins_ami_id
  disable_api_termination     = true
  vpc_id                      = module.vpc.vpc_id
  key_name                    = var.key_name
  vpc_sg_id                   = []
  subnet_id                   = tolist(module.vpc.public_subnets_id)[0]
  # subnet_id                   = tolist(module.vpc.private_subnets_id)[0]
  associate_public_ip_address = true

  additional_ingress_rule     = var.jenkins_additional_ingress
  ingress_cidrs               = var.jenkins_ingress_cidrs
  user_data                   = file("../../files/jenkins-master.sh")

  depends_on = [
    module.vpc
  ]

  tags = merge(
    var.tags,
    {
      dept = "ci"
      purpose  = "jenkins"
      dept     = "devops"
      sub-dept = "cicd"
    }
  )

}

# resource "aws_eip" "jenkins_eip" {
#   instance    = module.jenkins.id
#   domain      = "vpc"
# }

output "jenkins_public_ip" {
  value = {
    pub_ip = module.jenkins.jenkins_public_ip,
    pri_ip = module.jenkins.jenkins_private_ip
  }
}
