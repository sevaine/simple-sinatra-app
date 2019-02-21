resource "aws_subnet" "publicdmz-a-subnet" {
  vpc_id = "${aws_vpc.vpc.id}"
  cidr_block = "${var.publicdmz_subnet_a_cidr}"
  availability_zone = "${var.aws_region}a"
  tags {
    Name = "public DMZ subnet - A"
  }
}
resource "aws_subnet" "publicdmz-b-subnet" {
  vpc_id = "${aws_vpc.vpc.id}"
  cidr_block = "${var.publicdmz_subnet_b_cidr}"
  availability_zone = "${var.aws_region}b"
  tags {
    Name = "public DMZ subnet - B"
  }
}
resource "aws_subnet" "publicdmz-c-subnet" {
  vpc_id = "${aws_vpc.vpc.id}"
  cidr_block = "${var.publicdmz_subnet_c_cidr}"
  availability_zone = "${var.aws_region}c"
  tags {
    Name = "public DMZ subnet - C"
  }
}
resource "aws_subnet" "private-a-subnet" {
  vpc_id = "${aws_vpc.vpc.id}"
  cidr_block = "${var.private_subnet_a_cidr}"
  availability_zone = "${var.aws_region}a"
  tags {
    Name = "private subnet - A"
  }
}
resource "aws_subnet" "private-b-subnet" {
  vpc_id = "${aws_vpc.vpc.id}"
  cidr_block = "${var.private_subnet_b_cidr}"
  availability_zone = "${var.aws_region}b"
  tags {
    Name = "private subnet - B"
  }
}
resource "aws_subnet" "private-c-subnet" {
  vpc_id = "${aws_vpc.vpc.id}"
  cidr_block = "${var.private_subnet_c_cidr}"
  availability_zone = "${var.aws_region}c"
  tags {
    Name = "private subnet - C"
  }
}
resource "aws_subnet" "data-a-subnet" {
  vpc_id = "${aws_vpc.vpc.id}"
  cidr_block = "${var.data_subnet_a_cidr}"
  availability_zone = "${var.aws_region}a"
  tags {
    Name = "data subnet - A"
  }
}
resource "aws_subnet" "data-b-subnet" {
  vpc_id = "${aws_vpc.vpc.id}"
  cidr_block = "${var.data_subnet_b_cidr}"
  availability_zone = "${var.aws_region}b"
  tags {
    Name = "data subnet - B"
  }
}
resource "aws_subnet" "data-c-subnet" {
  vpc_id = "${aws_vpc.vpc.id}"
  cidr_block = "${var.data_subnet_c_cidr}"
  availability_zone = "${var.aws_region}c"
  tags {
    Name = "data subnet - C"
  }
}
