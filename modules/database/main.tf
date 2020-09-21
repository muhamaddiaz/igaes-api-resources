resource "aws_dynamodb_table" "attendances" {
  hash_key = "attendanceId"
  range_key = "studentId"
  name = "${var.stage}-igaes-${var.attendances_table_name}"
  billing_mode = "PAY_PER_REQUEST"
  attribute {
    name = "attendanceId"
    type = "S"
  }
  attribute {
    name = "studentId"
    type = "S"
  }
  tags = var.tags
}

resource "aws_ssm_parameter" "attendances_table_arn" {
  name = "${var.stage}-${var.attendances_table_name}-table-arn"
  type = "String"
  value = aws_dynamodb_table.attendances.arn
  tags = var.tags
}

resource "aws_dynamodb_table" "students" {
  hash_key = "studentId"
  range_key = "parentId"
  name = "${var.stage}-igaes-${var.students_table_name}"
  billing_mode = "PAY_PER_REQUEST"
  attribute {
    name = "studentId"
    type = "S"
  }
  attribute {
    name = "parentId"
    type = "S"
  }
  tags = var.tags
}

resource "aws_ssm_parameter" "students_table_arn" {
  name = "${var.stage}-${var.students_table_name}-table-arn"
  type = "String"
  value = aws_dynamodb_table.students.arn
  tags = var.tags
}

resource "aws_dynamodb_table" "parents" {
  hash_key = "parentId"
  range_key = "studentId"
  name = "${var.stage}-igaes-${var.parents_table_name}"
  billing_mode = "PAY_PER_REQUEST"
  attribute {
    name = "parentId"
    type = "S"
  }
  attribute {
    name = "studentId"
    type = "S"
  }
  tags = var.tags
}

resource "aws_ssm_parameter" "parents_table_arn" {
  name = "${var.stage}-${var.parents_table_name}-table-arn"
  type = "String"
  value = aws_dynamodb_table.parents.arn
  tags = var.tags
}

resource "aws_dynamodb_table" "teachers" {
  hash_key = "teacherId"
  range_key = "schoolId"
  name = "${var.stage}-igaes-teachers"
  billing_mode = "PAY_PER_REQUEST"
  attribute {
    name = "teacherId"
    type = "S"
  }
  attribute {
    name = "schoolId"
    type = "S"
  }
  tags = var.tags
}

resource "aws_ssm_parameter" "teachers_table_arn" {
  name = "${var.stage}-${var.teachers_table_name}-table-arn"
  type = "String"
  value = aws_dynamodb_table.teachers.arn
  tags = var.tags
}

resource "aws_dynamodb_table" "schools" {
  hash_key = "schoolId"
  name = "${var.stage}-igaes-${var.schools_table_name}"
  billing_mode = "PAY_PER_REQUEST"
  attribute {
    name = "schoolId"
    type = "S"
  }
  tags = var.tags
}

resource "aws_ssm_parameter" "schools_table_arn" {
  name = "${var.stage}-${var.schools_table_name}-table-arn"
  type = "String"
  value = aws_dynamodb_table.schools.arn
  tags = var.tags
}
