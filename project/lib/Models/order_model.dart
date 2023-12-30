class OrdersModel {
  num id;
  String OrderDate;
  String status;
  num paid;
  String user;
  OrdersModel(
      {required this.OrderDate,
      required this.id,
      required this.paid,
      required this.status,
      required this.user});

  factory OrdersModel.fromJson(Map<String, dynamic> map) {
    return OrdersModel(
        OrderDate: map['OrderDate'],
        id: map['id'],
        paid: map['paid'],
        status: map['status'],
        user: map['user']);
  }
}
