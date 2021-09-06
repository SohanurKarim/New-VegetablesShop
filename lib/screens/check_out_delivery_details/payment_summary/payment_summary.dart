import 'package:flutter/material.dart';
import 'package:foodtest0/config/color.dart';
import 'package:foodtest0/screens/check_out_delivery_details/payment_summary/order_item.dart';


enum AddressTypes{
  Cash,
  BKash,
  Visa,
}

class PaymentSummary extends StatefulWidget {


  @override
  _PaymentSummaryState createState() => _PaymentSummaryState();
}

class _PaymentSummaryState extends State<PaymentSummary> {
  var myType = AddressTypes.Cash;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Payment Summary",
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ),
      bottomNavigationBar: ListTile(
        title: Text("Total Amount"),
        subtitle: Text(
          "\$300",
          style: TextStyle(
            color: primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
        trailing: Container(
          width: 160,
          child: MaterialButton(
            onPressed: (){},
            child: Text(
                "Place Order",
              style: TextStyle(
                color: textColor,
              ),
            ),
            color: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: ListView.builder(
            itemCount:1,
            itemBuilder: (context,index){
              return Column(
                children: [
                  ListTile(
                    title: Text("Sohanur Karim"),
                    subtitle: Text("area: Dhaka/Bangladesh, Mirpur Section-1, Block:C, House:3, Road: 10"),
                  ),
                  Divider(),
                  ExpansionTile(
                    children: [
                      OrderItem(),
                      OrderItem(),
                      OrderItem(),
                      OrderItem(),
                      OrderItem(),
                    ],
                    iconColor: primaryColor,
                    title: Text("Order Item 5",style: TextStyle(color: textColor),),
                  ),
                  Divider(),

                  ListTile(
                    minVerticalPadding: 5,
                    leading: Text(
                      "Sub Total",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: Text(
                      "\$250",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  ListTile(
                    minVerticalPadding: 5,
                    leading: Text(
                      "Shipping Charge",
                      style: TextStyle(
                        color: Colors.grey[600],
                       // fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: Text(
                      "\$00",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  ListTile(
                    minVerticalPadding: 5,
                    leading: Text(
                      "Discount",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: Text(
                      "\$10",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  Divider(),
                  ExpansionTile(
                    children: [
                      // ListTile(
                      //   leading: Text("Payment Option"),
                      // ),

                      RadioListTile(
                        activeColor: primaryColor,
                        value: AddressTypes.Cash,
                        groupValue: myType,
                        title: Text("Cash"),
                        onChanged: (AddressTypes? value){
                          setState(() {
                            myType = value!;
                          });
                        },
                       // secondary: Icon(Icons.home,color: primaryColor,),
                        secondary: Image.asset(
                            "assets/Cash1.png",
                          height: 40,
                          width: 40,
                        ),
                      ),

                      RadioListTile(
                        activeColor: primaryColor,
                        value: AddressTypes.BKash,
                        groupValue: myType,
                        title: Text("BKash"),
                        onChanged: (AddressTypes? value){
                          setState(() {
                            myType = value!;
                          });
                        },
                        //secondary: Icon(Icons.book_online,color: primaryColor,),
                        secondary: Image.asset(
                            "assets/BKash.png",
                          height: 40,
                          width: 60,
                        ),
                      ),

                      RadioListTile(
                        activeColor: primaryColor,
                        value: AddressTypes.Visa,
                        groupValue: myType,
                        title: Text("Visa"),
                        onChanged: (AddressTypes? value){
                          setState(() {
                            myType = value!;
                          });
                        },
                        //secondary: Icon(Icons.book_online,color: primaryColor,),
                        secondary: Image.asset("assets/Visa.png"),
                      ),
                    ],
                    title: Text("Payment Option",style: TextStyle(color: textColor),),
                  ),
                ],
              );
            },
        ),

      ),
    );
  }
}
