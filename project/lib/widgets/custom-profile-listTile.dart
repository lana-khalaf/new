import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileInfo extends StatelessWidget {
   ProfileInfo({super.key,required this.icon,required this.subtitle,required this.title});
  String title;
 
  String subtitle;
IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 5),
                          color: Colors.blue.withOpacity(.4),
                          spreadRadius: 5,
                          blurRadius: 10
                        )
                      ]
                    ),
                    child: ListTile(
                      title: Text(title,
                      style:TextStyle(
fontSize: 17,
                      ), ),
                      subtitle:Text(subtitle)
                        
                      ,
                      leading: Icon(icon,
                      size: 40,),
                   

                    )
                  );

                
              
            
  }
}