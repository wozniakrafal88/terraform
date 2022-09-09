output "name" {
  value = var.app_name
}

output "port" {
  value = var.app_port
}

output "task_definition_arn" {
  value = aws_ecs_task_definition.task_definition.arn
}