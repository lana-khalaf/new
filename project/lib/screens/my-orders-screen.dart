import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:project/Models/cart-model.dart';
import 'package:project/Models/order_model.dart';
import 'package:project/cubit/dio-helper.dart';
import 'package:project/cubit/end-points.dart';
import 'package:project/cubit/token.dart';
import 'package:project/screens/cart-page.dart';
import 'package:project/widgets/custom-button.dart';
import 'package:project/widgets/custom-order.dart';

class MyOrdersPage extends StatelessWidget {
  const MyOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: () async {

              try {
                 var value = await DioHelper.getDate(
                url: ADDORDER + '/5',
              );
              if (value.statusCode == 201) {
                
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartPage(id: value.data['OrderID']),
                    ));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
                  behavior: SnackBarBehavior.floating,
                  content: Text('Error '),
                  backgroundColor: Colors.red,
                ));
              }
              } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
                  behavior: SnackBarBehavior.floating,
                  content: Text('Error '),
                  backgroundColor: Colors.red,
                ));
              }
             
            },
            child: Icon(Icons.card_giftcard)),
        //   resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey.shade300,
        appBar: AppBar(
          actions: [IconButton(onPressed: (){
            if(context.locale.languageCode == 'ar'){
              context.setLocale(Locale('en'));
            }
            else {
              context.setLocale(Locale('ar'));
            }
          }, icon: Icon(Icons.translate))],
          centerTitle: true,
          title: Text('My Orders').tr(),
        ),
        body: FutureBuilder(
          future: DioHelper.getDate(url: ORDERS),
          builder: (context, status) {
            if (status.hasData) {
              dynamic temp = status.data;
              List<OrdersModel> orders = List.generate(temp.data['Data'].length,
                  (index) => OrdersModel.fromJson(temp.data['Data'][index]));

              return ListView.separated(
                  itemBuilder: (context, index) => Order(
                      id: orders[index].id as int,
                      orderStatus: orders[index].status),
                  separatorBuilder: (context, index) => Divider(
                        indent: 40,
                        endIndent: 40,
                      ),
                  itemCount: orders.length);
            } else {
              return Center(
                child: LinearProgressIndicator(),
              );
            }
          },
        ));
  }
}
