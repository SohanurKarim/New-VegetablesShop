import 'package:flutter/material.dart';
import 'package:foodtest0/config/color.dart';
import 'package:foodtest0/models/product_models.dart';
import 'package:foodtest0/widget/count.dart';
import 'package:foodtest0/widget/product_unit.dart';

class SingleProduct extends StatefulWidget {
  final String productImage;
  final String productName;
  final int productPrice;
  final VoidCallback? onTap;
  final String productId;
  final ProductModel productUnit;

  SingleProduct(
      {required this.productId,
        required this.productImage,
        required this.productName,
        required this.onTap,
        required this.productPrice,
        required this.productUnit,
      });

  @override
  _SingleProductState createState() => _SingleProductState();
}

class _SingleProductState extends State<SingleProduct> {
  var unitData;
  var firstValue;
  @override
  Widget build(BuildContext context) {
    widget.productUnit.productUnit.firstWhere((element){
      setState(() {
         firstValue = element;
      });
      return true;
    });
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 10),
            height: 230,
            width: 165,
            decoration: BoxDecoration(
              color: Color(0xffd9dad9),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: widget.onTap,
                  child: Container(
                    height: 150,
                    padding: EdgeInsets.all(5),
                    width: double.infinity,
                    child: Image.network(
                      widget.productImage,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.productName,
                          style: TextStyle(
                            color: textColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${widget.productPrice}\$/250 g',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child:ProductUnit(
                                  onTap: (){
                                    showModalBottomSheet(
                                        context: context,
                                        builder: (context) {
                                          return Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children:widget.productUnit.productUnit.map<Widget>((data){
                                              return Column(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                                    child: InkWell(
                                                      onTap: ()async{
                                                        setState(() {
                                                          unitData = data;
                                                        });
                                                        Navigator.of(context).pop();
                                                      },
                                                      child: Text(
                                                        data,
                                                        style: TextStyle(
                                                          color: primaryColor,
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              );
                                            }).toList(),
                                            // children: <Widget>[
                                            //   ListTile(
                                            //     // leading: new Icon(Icons.photo),
                                            //     title: new Text('50 Gram'),
                                            //     onTap: () {
                                            //       Navigator.pop(context);
                                            //     },
                                            //   ),
                                            //   ListTile(
                                            //     // leading: new Icon(Icons.music_note),
                                            //     title: new Text('500 Gram'),
                                            //     onTap: () {
                                            //       Navigator.pop(context);
                                            //     },
                                            //   ),
                                            //   ListTile(
                                            //     //leading: new Icon(Icons.videocam),
                                            //     title: new Text('1 Kg'),
                                            //     onTap: () {
                                            //       Navigator.pop(context);
                                            //     },
                                            //   ),
                                            //   ListTile(
                                            //     //leading: new Icon(Icons.share),
                                            //     title: new Text('5 Kg'),
                                            //     onTap: () {
                                            //       Navigator.pop(context);
                                            //     },
                                            //   ),
                                            // ],
                                          );
                                        });
                                  },
                                  title: unitData == null ? firstValue:unitData,
                              ) ,
                              // child: InkWell(
                              //   onTap:(){
                              //     showModalBottomSheet(
                              //         context: context,
                              //         builder: (context) {
                              //           return Column(
                              //             mainAxisSize: MainAxisSize.min,
                              //             children: <Widget>[
                              //               ListTile(
                              //                // leading: new Icon(Icons.photo),
                              //                 title: new Text('50 Gram'),
                              //                 onTap: () {
                              //                   Navigator.pop(context);
                              //                 },
                              //               ),
                              //               ListTile(
                              //                // leading: new Icon(Icons.music_note),
                              //                 title: new Text('500 Gram'),
                              //                 onTap: () {
                              //                   Navigator.pop(context);
                              //                 },
                              //               ),
                              //               ListTile(
                              //                 //leading: new Icon(Icons.videocam),
                              //                 title: new Text('1 Kg'),
                              //                 onTap: () {
                              //                   Navigator.pop(context);
                              //                 },
                              //               ),
                              //               ListTile(
                              //                 //leading: new Icon(Icons.share),
                              //                 title: new Text('5 Kg'),
                              //                 onTap: () {
                              //                   Navigator.pop(context);
                              //                 },
                              //               ),
                              //             ],
                              //           );
                              //         });
                              //   },
                              //   child: Container(
                              //     padding: EdgeInsets.only(left: 5),
                              //     height: 25,
                              //     decoration: BoxDecoration(
                              //       border: Border.all(color: Colors.grey),
                              //       borderRadius: BorderRadius.circular(8),
                              //     ),
                              //     child: Row(
                              //       children: [
                              //         Expanded(
                              //             child: Text(
                              //               '50 Gram',
                              //               style: TextStyle(fontSize: 11),
                              //             )),
                              //         Center(
                              //           child: Icon(
                              //             Icons.arrow_drop_down,
                              //             size: 20,
                              //             color: primaryColor,
                              //           ),
                              //         )
                              //       ],
                              //     ),
                              //   ),
                              // ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Count(
                              productId: widget.productId,
                              productImage: widget.productImage,
                              productName: widget.productName,
                              productPrice: widget.productPrice,
                              productUnit: unitData == null ? firstValue:unitData,
                            //  productQuantity: "1",
                            ),
                            // Expanded(
                            //   child:
                            //   // Container(
                            //   //   height: 30,
                            //   //   width: 50,
                            //   //   decoration: BoxDecoration(
                            //   //     border: Border.all(
                            //   //       color: Colors.grey,
                            //   //     ),
                            //   //     //color: Colors.red,
                            //   //     borderRadius: BorderRadius.circular(10),
                            //   //   ),
                            //   //   child: Row(
                            //   //     mainAxisAlignment:
                            //   //     MainAxisAlignment.center,
                            //   //     children: [
                            //   //       Icon(
                            //   //         Icons.remove,
                            //   //         size: 15,
                            //   //         color: textColor,
                            //   //       ),
                            //   //       Text(
                            //   //         '1',
                            //   //         style: TextStyle(
                            //   //           color: textColor,
                            //   //           fontWeight: FontWeight.bold,
                            //   //         ),
                            //   //       ),
                            //   //       Icon(
                            //   //         Icons.add,
                            //   //         size: 15,
                            //   //         color: textColor,
                            //   //       )
                            //   //     ],
                            //   //   ),
                            //   // ),
                            // ),
                            //Count(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
