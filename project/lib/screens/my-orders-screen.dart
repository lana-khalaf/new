import 'package:flutter/material.dart';
import 'package:project/widgets/custom-order.dart';

class MyOrdersPage extends StatelessWidget {
  const MyOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   //   resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        centerTitle: true,
        title: Text('My Orders'),
          leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      
      body: ListView.builder(
 // itemCount: items.length,هون تعديل
  itemBuilder: (BuildContext context, int index) {
    return  Order(id: 1, orderStatus: "Dilevered",
    );
  },
)
     
    
      
       
    );
  }
}