#
# default route
#
resource "aws_route" "internet-default-route" {
  route_table_id = "${aws_vpc.vpc.main_route_table_id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = "${aws_internet_gateway.internet-gateway.id}"
}

#
# private tier routes
#
resource "aws_route" "private-default-route" {
  route_table_id = "${aws_route_table.private-route-table.id}"
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id = "${aws_nat_gateway.nat-gateway-a.id}"
}
