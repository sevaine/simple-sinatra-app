resource "aws_ecr_repository" "ecr_repo" {
  name = "${var.stack_name_prefix}-ecr-repo"
}
