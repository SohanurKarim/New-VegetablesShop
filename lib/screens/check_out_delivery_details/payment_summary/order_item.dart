import 'package:flutter/material.dart';

class OrderItem extends StatelessWidget {
  //bool isTrue;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        "assets/logo.png",
        width: 60,
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Food Name",
              style: TextStyle(color: Colors.grey[600],),
            ),
            Text(
              "250 Gram",
              style: TextStyle(color: Colors.grey[600],),
            ),
            Text(
              "\$45",
              style: TextStyle(color: Colors.grey[600],),
            )
          ],
          ),
      subtitle: Text("5"),
    );
  }
}
