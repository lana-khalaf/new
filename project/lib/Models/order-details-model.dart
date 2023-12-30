class OrdersDetailsModel {
  num id;
  num order_id;
  num quantitiy;
  String tradeName;

  OrdersDetailsModel({
    required this.order_id,
    required this.tradeName,
    required this.quantitiy,
    required this.id,
  });

  factory OrdersDetailsModel.fromJson(Map<String, dynamic> map) {
    return OrdersDetailsModel(
      order_id: map['order_id'] as num,
      id: map['id'] as num,
      tradeName: map['tradeName'] as String,
      quantitiy: map['Quantity'] as num,
    );
  }
}
