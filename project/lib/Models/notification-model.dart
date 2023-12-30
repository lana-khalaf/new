class Notificatioin {
  num OrderID;
  String StatusFrom;
  String StatusTo;

  Notificatioin({
    required this.OrderID,
    required this.StatusFrom,
    required this.StatusTo,
  });

  factory Notificatioin.fromJson(Map<String, dynamic> map) {
    return Notificatioin(
      OrderID: map['OrderID'] as num,
      StatusFrom: map['StatusFrom'] as String,
      StatusTo: map['StatusTo'] as String,
    );
  }
}
