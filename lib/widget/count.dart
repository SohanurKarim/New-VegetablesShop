import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodtest0/config/color.dart';
import 'package:foodtest0/provider/review_cart_provider.dart';
import 'package:provider/provider.dart';

class Count extends StatefulWidget {
  //const Count({Key? key}) : super(key: key);

 String productName;
 String productImage;
 String productId;
 int productPrice;

 Count({
   required this.productName,
   required this.productImage,
   required this.productId,
   required this.productPrice
 });

  @override
  _CountState createState() => _CountState();
}

class _CountState extends State<Count> {
  int count = 1;
  bool isTrue = false;

  getAddAndQuantity(){
    FirebaseFirestore.instance
        .collection("ReviewCart")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("YourReviewCart")
        .doc(widget.productId)
        .get()
        .then((value) =>{
         if(this.mounted)
           {
             if(value.exists){
               setState((){
                 count = value.get("cartQuantity");
                 isTrue=value.get("isAdd");
               })
             }
           }
          // value.docs.forEach((element) {
          //   //print(element.data());
          //   setState(() {
          //     isTrue = element.get("isAddi");
          //   });
          // }),
    },);
  }


  @override
  Widget build(BuildContext context) {
   // print(widget.productId);
    getAddAndQuantity();
    ReviewCartProvider reviewCartProvider = Provider.of(context);
    return Expanded(
      child: Container(
        height: 25,
        width: 45,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
          //color: Colors.red,
          borderRadius: BorderRadius.circular(10),
        ),
        child: isTrue == true
            ? Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: (){
                if(count==1){
                  setState(() {
                    isTrue=false;
                  });
                  reviewCartProvider.reviewCartDataDelete(widget.productId);
                }
                if(count>1){
                  setState(() {
                    count--;
                  });
                  reviewCartProvider.updateReviewCartData(
                    cartID: widget.productId,
                    cartName: widget.productName,
                    cartImage: widget.productImage,
                    cartPrice: widget.productPrice,
                    cartQuantity: count,
                  );
                }
              },
              child: Icon(
                Icons.remove,
                size: 15,
                color: textColor,
              ),
            ),
            Text(
              ' $count ',
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            InkWell(
              onTap: (){
                setState(() {
                  count++;
                });
                reviewCartProvider.updateReviewCartData(
                  cartID: widget.productId,
                  cartName: widget.productName,
                  cartImage: widget.productImage,
                  cartPrice: widget.productPrice,
                  cartQuantity: count,
                );
              },
              child: Icon(
                Icons.add,
                size: 15,
                color: textColor,
              ),
            )
          ],
        ):Center(
          child: InkWell(
            onTap: (){
              setState(() {
                isTrue = true;
              });
              reviewCartProvider.addReviewCartData(
                  cartID: widget.productId,
                  cartName: widget.productName,
                  cartImage: widget.productImage,
                  cartPrice: widget.productPrice,
                  cartQuantity: count,
                 // isAdd: true,
              );
            },            
            child: Text(
                "ADD",
              style: TextStyle(
                color: primaryColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
