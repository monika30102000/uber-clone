resource "aws_eks_cluster" "my_cluster" {
  name     = "my-cluster"
  role_arn = "arn:aws:iam::835370685428:role/ec2-admin"  # Replace with your IAM role ARN

  vpc_config {
    subnet_ids         = ["subnet-02160107bcfbf413e", "subnet-064cc886dd33533ad"]  # Replace with your subnet IDs
    security_group_ids = ["sg-0bc1beb7788caf99a"]                         # Replace with your security group IDs
  }

  tags = {
    Environment = "Production"
  }
}

resource "aws_eks_node_group" "my_node_group" {
  cluster_name    = aws_eks_cluster.my_cluster.name
  node_group_name = "my-node-group"
  node_role_arn   = "arn:aws:iam::835370685428:role/ec2-admin"  # Replace with your IAM role ARN
  subnet_ids         = ["subnet-02160107bcfbf413e", "subnet-064cc886dd33533ad"]      # Replace with your subnet IDs

  scaling_config {
    desired_size = 0
    max_size     = 0
    min_size     = 0
  }

  tags = {
    Environment = "Production"
  }
}
