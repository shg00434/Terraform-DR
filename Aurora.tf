#Aurora Global_culster
resource "aws_rds_global_cluster" "Golbal_DB_cluster" {
  global_cluster_identifier = "global-test"
  engine                    = "aurora-mysql"
  engine_version            = "5.7.mysql_aurora.2.11.2"
  database_name             = "Golbal_db"
}

#서울리전 cluster
resource "aws_rds_cluster" "SeoulDB" {
  provider                  = aws.Seoul
  engine                    = aws_rds_global_cluster.Golbal_DB_cluster.engine
  engine_version            = aws_rds_global_cluster.Golbal_DB_cluster.engine_version
  cluster_identifier        = "seoul-cluster"
  master_username           = "root"
  master_password           = "soldesk1!"
  database_name             = "Seoul_db"
  global_cluster_identifier = aws_rds_global_cluster.Golbal_DB_cluster.id
  db_subnet_group_name      = aws_db_subnet_group.Seoul_DB_subnet_group.name
  vpc_security_group_ids = [aws_security_group.Seoul_allow_all.id]
  skip_final_snapshot = true
}

#서울리전 DB인스턴스
resource "aws_rds_cluster_instance" "Seoul_DB_main_instance" {
  provider             = aws.Seoul
  engine               = aws_rds_global_cluster.Golbal_DB_cluster.engine
  engine_version       = aws_rds_global_cluster.Golbal_DB_cluster.engine_version
  identifier           = "seoul-main-instance"
  cluster_identifier   = aws_rds_cluster.SeoulDB.id
  instance_class       = "db.r4.large"
  db_subnet_group_name = aws_db_subnet_group.Seoul_DB_subnet_group.name
  promotion_tier = 0
}

resource "aws_rds_cluster_instance" "Seoul_DB_sub_instance" {
  provider             = aws.Seoul
  engine               = aws_rds_global_cluster.Golbal_DB_cluster.engine
  engine_version       = aws_rds_global_cluster.Golbal_DB_cluster.engine_version
  identifier           = "seoul-sub-instance"
  cluster_identifier   = aws_rds_cluster.SeoulDB.id
  instance_class       = "db.r4.large"
  db_subnet_group_name = aws_db_subnet_group.Seoul_DB_subnet_group.name
  promotion_tier = 1
}

#도쿄리전_cluster

resource "aws_rds_cluster" "Tokyo_DB_cluster" {
  provider                  = aws.Tokyo
  engine                    = aws_rds_global_cluster.Golbal_DB_cluster.engine
  engine_version            = aws_rds_global_cluster.Golbal_DB_cluster.engine_version
  cluster_identifier        = "tokyo-cluster"
  global_cluster_identifier = aws_rds_global_cluster.Golbal_DB_cluster.id
  db_subnet_group_name      = aws_db_subnet_group.Tokyo_DB_subnet_group.name
  vpc_security_group_ids = [aws_security_group.Tokyo_allow_all.id]
  skip_final_snapshot = true

  depends_on = [
    aws_rds_cluster_instance.Seoul_DB_main_instance
  ]
}

#도쿄리전 DB인스턴스
resource "aws_rds_cluster_instance" "Tokyo_DB_instance" {
  provider             = aws.Tokyo
  engine               = aws_rds_global_cluster.Golbal_DB_cluster.engine
  engine_version       = aws_rds_global_cluster.Golbal_DB_cluster.engine_version
  identifier           = "ttokyo-sub-instance"
  cluster_identifier   = aws_rds_cluster.Tokyo_DB_cluster.id
  instance_class       = "db.r4.large"
  db_subnet_group_name = aws_db_subnet_group.Tokyo_DB_subnet_group.name
  promotion_tier = 2
}

#서울 DB_subnet_Group
resource "aws_db_subnet_group" "Seoul_DB_subnet_group" {
  provider = aws.Seoul
  name = "seoul-db-subnet-group"
  subnet_ids = [
    aws_subnet.Seoul_subnet5.id,
    aws_subnet.Seoul_subnet6.id
  ]

  tags = {
    "Name" = "seoul-db-subnet-group"
  }
}

#도쿄 DB_subnet_Group
resource "aws_db_subnet_group" "Tokyo_DB_subnet_group" {
  provider = aws.Tokyo
  name = "tokyo-db-subnet-group"
  subnet_ids = [
    aws_subnet.Tokyo_subnet5.id,
    aws_subnet.Tokyo_subnet6.id
  ]

  tags = {
    "Name" = "tokyo-db-subnet-group"
  }
}
