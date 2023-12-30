class Cart {
  final int productId;
  int productPrice;
  final int id;
  final String productName;
  int? totalPrice;
  int quantity;

  Cart({
    required this.productName,
    required this.productPrice,
    required this.id,
    required this.productId,
  })  : totalPrice = productPrice, // Initialize totalPrice here
        quantity = 1;

  Cart.fromMap(Map<dynamic, dynamic> res, this.productPrice)
      : id = res['id'],
        productId = res['productId'],
        productName = res['productName'],
        quantity = res['quantity'];

  Map<String, Object?> toMap() {
    return {
      "id": id,
      'productId': productId,
      'productName': productName,
      'quantity': quantity,
    };
  }
}

List<Cart> carts = [
  // Cart(productPrice: 50, id: 1, productId: 5, productName: "paracetamol"),
  // Cart(productPrice: 50, id: 1, productId: 5, productName: "paracetamol"),
  // Cart(productPrice: 50, id: 1, productId: 5, productName: "paracetamol"),
  // Cart(
  //   productPrice: 50,
  //   id: 1,
  //   productId: 5,
  //   productName: "paracetamol",
  // ),
  // Cart(
  //   productPrice: 50,
  //   id: 1,
  //   productId: 5,
  //   productName: "paracetamol",
  // )
];



      // body: FutureBuilder(future: DioHelper.getDate(url: ORDERS), builder: 
      // (context, status) {
      //   if(status.hasData){
      //     dynamic temp = status.data;
      //     List<OrdersModel> orders = List.generate(temp.data['Data'].length, (index) => OrdersModel.fromJson(temp.data['Data'][index]));
          
      //     return ListView.separated(itemBuilder:
      //     (context, index) => ListTile(
      //       leading: CircleAvatar(child: Text(orders[index].id.toString()),),
      //       title: Text(orders[index].status),
      //       subtitle: Text(orders[index].OrderDate),
      //     ),
          
      //      separatorBuilder: (context, index) => Divider(), itemCount: orders.length);
      //   }
      //   else {
      //     return Center(child: LinearProgressIndicator(),);
      //   }
        
      // },
      
      // )