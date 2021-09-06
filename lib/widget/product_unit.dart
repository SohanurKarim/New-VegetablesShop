import 'package:flutter/material.dart';
import 'package:foodtest0/config/color.dart';

class ProductUnit extends StatelessWidget {
  //const ProductUnit({Key? key}) : super(key: key);

  final VoidCallback? onTap;
  final String title;

  ProductUnit({
    required this.onTap,
    required this.title,
   });


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      // onTap: () {
      //   // showModalBottomSheet(
      //   //     context: context,
      //   //     builder: (context) {
      //   //       return Column(
      //   //         mainAxisSize: MainAxisSize.min,
      //   //         children: <Widget>[
      //   //           ListTile(
      //   //             // leading: new Icon(Icons.photo),
      //   //             title: new Text('50 Gram'),
      //   //             onTap: () {
      //   //               Navigator.pop(context);
      //   //             },
      //   //           ),
      //   //           ListTile(
      //   //             // leading: new Icon(Icons.music_note),
      //   //             title: new Text('500 Gram'),
      //   //             onTap: () {
      //   //               Navigator.pop(context);
      //   //             },
      //   //           ),
      //   //           ListTile(
      //   //             //leading: new Icon(Icons.videocam),
      //   //             title: new Text('1 Kg'),
      //   //             onTap: () {
      //   //               Navigator.pop(context);
      //   //             },
      //   //           ),
      //   //           ListTile(
      //   //             //leading: new Icon(Icons.share),
      //   //             title: new Text('5 Kg'),
      //   //             onTap: () {
      //   //               Navigator.pop(context);
      //   //             },
      //   //           ),
      //   //         ],
      //   //       );
      //   //     });
      // },
      child: Container(
        padding: EdgeInsets.only(left: 5),
        height: 25,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Expanded(
                child: Text(
                  //'50 Gram',
                  '$title',
                  style: TextStyle(fontSize: 11),
                )),
            Center(
              child: Icon(
                Icons.arrow_drop_down,
                size: 20,
                color: primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}