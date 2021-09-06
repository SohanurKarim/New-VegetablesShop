import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodtest0/config/color.dart';
import 'package:foodtest0/screens/check_out_delivery_details/add_delivery_address.dart';
import 'package:foodtest0/screens/check_out_delivery_details/payment_summary/payment_summary.dart';
import 'package:foodtest0/screens/check_out_delivery_details/single_delivery_item.dart';

class DeliveryDetails extends StatelessWidget {

 List<Widget> address =[
   // SingleDeliveryItem(
   //    address: "area, Dhaka/Bangladesh, Mirpur Section-1, Block:C, House:3, Road: 10",
   //    title: "Sohanur Karim",
   //    number: "+8801732107202",
   //    addressType: "Home",
   //  )
  ];


  // bool isAddress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Delivery Details",),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        child: Icon(Icons.add),
        onPressed: () {  },
      ),

      bottomNavigationBar: Container(
       // width: 160,
        height: 48,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: MaterialButton(
          child: address.isEmpty
                   ? Text("Add new Address")
                   : Text("Payment Summary"),
          color: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          onPressed: (){
            address.isEmpty
             ? Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddDeliveryAddress(),),)
             : Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PaymentSummary(),),);
          },
        ),
      ),
      
      body: ListView(
        children: [
          SizedBox(height: 10,),
          ListTile(
            title: Text("Deliver To"),
            leading: Image.asset("assets/Location.png"),
          ),
          Divider(
            height: 1,
          ),
          Column(
              children: [
                address.isEmpty
                    ? Container()
                    : SingleDeliveryItem(
                  address: "area, Dhaka/Bangladesh, Mirpur Section-1, Block:C, House:3, Road: 10",
                  title: "Sohanur Karim",
                  number: "+8801732107202",
                  addressType: "Home",
                ),
                // SingleDeliveryItem(
                //   address: "area, Dhaka/Bangladesh, Mirpur Section-1, Block:C, House:3, Road: 10",
                //   title: "Sohanur Karim",
                //   number: "+8801732107202",
                //   addressType: "Home",
                // ),
              ],
          ),
        ],
      ),
      

    );
  }
}
