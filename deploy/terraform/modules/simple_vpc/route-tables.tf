#
# publicdmz route table associations
#
resource "aws_route_table_association" "publicdmz-a-subnet-rtassoc" {
  subnet_id      = "${ aws_subnet.publicdmz-a-subnet.id }"
  route_table_id = "${ aws_vpc.vpc.main_route_table_id }"
}
resource "aws_route_table_association" "publicdmz-b-subnet-rtassoc" {
  subnet_id      = "${ aws_subnet.publicdmz-b-subnet.id }"
  route_table_id = "${ aws_vpc.vpc.main_route_table_id }"
}
resource "aws_route_table_association" "publicdmz-c-subnet-rtassoc" {
  subnet_id      = "${ aws_subnet.publicdmz-c-subnet.id }"
  route_table_id = "${ aws_vpc.vpc.main_route_table_id }"
}

#
# private route table and associations
#
resource "aws_route_table" "private-route-table" {
  vpc_id = "${aws_vpc.vpc.id}"
  tags {
    Name = "Private Route table - A"
  }
}

resource "aws_route_table_association" "private-a-subnet-rtassoc" {
  subnet_id      = "${ aws_subnet.private-a-subnet.id }"
  route_table_id = "${ aws_route_table.private-route-table.id }"
}
resource "aws_route_table_association" "private-b-subnet-rtassoc" {
  subnet_id      = "${ aws_subnet.private-b-subnet.id }"
  route_table_id = "${ aws_route_table.private-route-table.id }"
}
resource "aws_route_table_association" "private-c-subnet-rtassoc" {
  subnet_id      = "${ aws_subnet.private-c-subnet.id }"
  route_table_id = "${ aws_route_table.private-route-table.id }"
}

#
# data route table and associations
#
resource "aws_route_table" "data-route-table" {
  vpc_id = "${aws_vpc.vpc.id}"
  tags {
    Name = "Private Route table - A"
  }
}

resource "aws_route_table_association" "data-a-subnet-rtassoc" {
  subnet_id      = "${ aws_subnet.data-a-subnet.id }"
  route_table_id = "${ aws_route_table.data-route-table.id }"
}
resource "aws_route_table_association" "data-b-subnet-rtassoc" {
  subnet_id      = "${ aws_subnet.data-b-subnet.id }"
  route_table_id = "${ aws_route_table.data-route-table.id }"
}
resource "aws_route_table_association" "data-c-subnet-rtassoc" {
  subnet_id      = "${ aws_subnet.data-c-subnet.id }"
  route_table_id = "${ aws_route_table.data-route-table.id }"
}
