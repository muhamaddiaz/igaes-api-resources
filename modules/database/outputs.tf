output "attendances_table_arn" {
  value = aws_dynamodb_table.attendances.arn
}
output "attendances_table_name" {
  value = aws_dynamodb_table.attendances.name
}

output "students_table_arn" {
  value = aws_dynamodb_table.students.arn
}
output "students_table_name" {
  value = aws_dynamodb_table.students.name
}

output "parents_table_arn" {
  value = aws_dynamodb_table.parents.arn
}
output "parents_table_name" {
  value = aws_dynamodb_table.parents.name
}

output "teachers_table_arn" {
  value = aws_dynamodb_table.teachers.arn
}
output "teachers_table_name" {
  value = aws_dynamodb_table.teachers.name
}

output "schools_table_arn" {
  value = aws_dynamodb_table.schools.arn
}
output "schools_table_name" {
  value = aws_dynamodb_table.schools.name
}
