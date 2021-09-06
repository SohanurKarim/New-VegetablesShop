import 'package:flutter/material.dart';
import 'package:foodtest0/config/color.dart';
import 'package:foodtest0/models/review_cart_model.dart';
import 'package:foodtest0/provider/review_cart_provider.dart';
import 'package:foodtest0/screens/check_out_delivery_details/delivery_details.dart';
import 'package:foodtest0/widget/single_item.dart';
import 'package:provider/provider.dart';

class ReviewCart extends StatelessWidget {
//  const ReviewCart({Key? key}) : super(key: key);
  late ReviewCartProvider reviewCartProvider;
  showAlertDialog(BuildContext context,ReviewCartModel delete) {

    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text(
          "No",
        style: TextStyle(
          color: primaryColor,
        ),
      ),
      onPressed:  () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = FlatButton(
      child: Text(
          "Yes",
        style: TextStyle(
          color: Colors.red,
        ),
      ),
      onPressed:  () {
      reviewCartProvider.reviewCartDataDelete(delete.cartID);
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Cart Product"),
      content: Text("Are you delete on Cart product?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }


  @override
  Widget build(BuildContext context) {

    reviewCartProvider = Provider.of(context);
    reviewCartProvider.getReviewCartData();

    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar:reviewCartProvider.getReviewCartDataList.isEmpty?Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/empty-cart.gif"),
            Text(
              "Your Cartlist is Empty",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8,),
            Text(
              "Create your first cartlist request",
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
        // child: Text("No Data"),
      ):ListTile(
        title: Text("Total Amount"),
        subtitle: Text(
            "\$${reviewCartProvider.getTotalPrice()}",
          style: TextStyle(
            color: Colors.green[900],
          ),
        ),
        trailing: Container(
          width: 160,
          child: MaterialButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DeliveryDetails(),),);
            },
            child: Text("Submit"),
            color: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: primaryColor,
        iconTheme: IconThemeData(color: textColor),
        title: Text(
            "Review Cart",
          style: TextStyle(
            color: textColor,
            fontSize: 18,
          ),
        ),
      ),
      body:ListView.builder(
        itemCount: reviewCartProvider.getReviewCartDataList.length,
        itemBuilder: (context,index) {
          ReviewCartModel data = reviewCartProvider.getReviewCartDataList[index];
          return Column(
            children: [
              SizedBox(height: 10,),
              SingleItem(
                isBool:true,
                wishLIst: false,
                productImage: data.cartImage,
                productName: data.cartName,
                productPrice: data.cartPrice,
                productId: data.cartID,
                productQuantity: data.cartQuantity,
                productUnit: data.cartUnit,
                onDelete:(){
                  showAlertDialog(context,data);
                },
              ),
             // SizedBox(height: 10,),
            ],
          );
        } ,
      ),
    );
  }
}
