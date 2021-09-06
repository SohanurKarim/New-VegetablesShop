import 'package:flutter/material.dart';
import 'package:foodtest0/config/color.dart';
import 'package:foodtest0/widget/custom_text_field.dart';

class AddDeliveryAddress extends StatefulWidget {

  @override
  _AddDeliveryAddressState createState() => _AddDeliveryAddressState();
}

enum AddressTypes{
  Home,
  Work,
  Other,
}

class _AddDeliveryAddressState extends State<AddDeliveryAddress> {

  var myType = AddressTypes.Home;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Add Delivery Address",
           style: TextStyle(
             fontSize: 18,
           ),
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        height: 48,
        child: MaterialButton(
          onPressed: (){},
          child: Text(
            "Add Address",
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
         children: [
           CustomTextField(
             //  controller: controller,
               labText: "First Name",
             //  keyboardType: keyboardType
           ),
           CustomTextField(
            //   controller: controller,
               labText: "Last Name",
            //   keyboardType: keyboardType
           ),
           CustomTextField(
             //  controller: controller,
               labText: "Mobile No",
            //   keyboardType: keyboardType
           ),
           CustomTextField(
             //  controller: ,
               labText: "Alternate Mobile No",
            //   keyboardType:
           ),
           CustomTextField(
              // controller: controller,
               labText: "Society",
             //  keyboardType: keyboardType
           ),
           CustomTextField(
             //  controller: controller,
               labText: "Street",
             //  keyboardType: keyboardType
           ),
           CustomTextField(
            //   controller: controller,
               labText: "Landmark",
             //  keyboardType: keyboardType
           ),
           CustomTextField(
             //  controller: controller,
               labText: "City",
           //    keyboardType: keyboardType
           ),
           CustomTextField(
              // controller: controller,
               labText: "Area",
              // keyboardType: keyboardType
           ),
           CustomTextField(
             //  controller: controller,
               labText: "Pincode",
             //  keyboardType: keyboardType
           ),
           InkWell(
             onTap: (){},
             child: Container(
               height: 47,
               width: double.infinity,
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text("Set Location",style: TextStyle(color: primaryColor),),
                 ],
               ),
             ),
           ),
           Divider(
             color: Colors.black,
           ),
           ListTile(
             title: Text("Address Type*", style: TextStyle(color: primaryColor),),
           ),
           RadioListTile(
              activeColor: primaryColor,
               value: AddressTypes.Home,
               groupValue: myType,
               title: Text("Home"),
               onChanged: (AddressTypes? value){
                 setState(() {
                   myType = value!;
                 });
               },
             secondary: Icon(Icons.home,color: primaryColor,),
           ),
           RadioListTile(
             activeColor: primaryColor,
               value: AddressTypes.Work,
               groupValue: myType,
               title: Text("Work"),
             onChanged: (AddressTypes? value){
               setState(() {
                 myType = value!;
               });
             },
             secondary: Icon(Icons.work,color: primaryColor,),
           ),
           RadioListTile(
             activeColor: primaryColor,
               value: AddressTypes.Other,
               groupValue: myType,
               title: Text("Other"),
             onChanged: (AddressTypes? value){
               setState(() {
                 myType = value!;
               });
             },
             secondary: Icon(Icons.home_work,color: primaryColor,),
           ),

          ],
        ),
      ),
    );
  }
}
