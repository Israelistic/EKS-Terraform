resource "aws_key_pair" "example" {
  key_name   = "eks-terraform-key"
  public_key = file("~/.ssh/eks-terraform-key.pub")
}
