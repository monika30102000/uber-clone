resource "aws_eks_cluster" "my_cluster" {
  name     = "my-cluster"
  role_arn = "arn:aws:iam::835370685428:role/ec2-admin"  # Replace with your IAM role ARN

  vpc_config {
    subnet_ids         = ["subnet-04ab99c2c1c71a727", "subnet-0739caaeaf292a4cf"]  # Replace with your subnet IDs
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
  subnet_ids         = ["subnet-04ab99c2c1c71a727", "subnet-0739caaeaf292a4cf"]      # Replace with your subnet IDs

  scaling_config {
    desired_size = 1
    max_size     = 2
    min_size     = 1
  }

  tags = {
    Environment = "Production"
  }
}
