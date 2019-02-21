resource "aws_internet_gateway" "internet-gateway" {
  vpc_id = "${aws_vpc.vpc.id}"
  tags {
    Name = "Internet Gateway"
  }
}

resource "aws_eip" "nat-gateway-eip-a" {
  vpc = true
  depends_on = ["aws_internet_gateway.internet-gateway"]
}

resource "aws_nat_gateway" "nat-gateway-a" {
  allocation_id = "${aws_eip.nat-gateway-eip-a.id}"
  subnet_id = "${aws_subnet.publicdmz-a-subnet.id}"
  depends_on = ["aws_internet_gateway.internet-gateway"]
}
