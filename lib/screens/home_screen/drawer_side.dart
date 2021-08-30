import 'package:flutter/material.dart';
import 'package:foodtest0/auth/sign_in.dart';
import 'package:foodtest0/config/color.dart';
import 'package:foodtest0/provider/user_provider.dart';
import 'package:foodtest0/screens/home_screen/home.dart';
import 'package:foodtest0/screens/profile/my_profile.dart';
import 'package:foodtest0/screens/review_cart/review_cart.dart';
import 'package:foodtest0/screens/wish_list_product/wish_list_product.dart';

class DrwerSide extends StatefulWidget {

  UserProvider userProvider;
  DrwerSide({required this.userProvider});

  @override
  _DrwerSideState createState() => _DrwerSideState();
}

class _DrwerSideState extends State<DrwerSide> {
  Widget listTile({required IconData icon, required String title, required VoidCallback? onTap}){
    return ListTile(
      onTap: onTap,
      leading: Icon(
        icon,
        size: 32,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: textColor,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var userData = widget.userProvider.currentUserData;
    return Drawer(
      child: Container(
        color: Colors.white60,
        child: ListView(
          children: [
            Container(
              color: primaryColor,
              child: DrawerHeader(
                child:SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white54,
                        radius: 43,
                        child: CircleAvatar(
                          radius: 40,
                          backgroundImage: NetworkImage(
                              userData.userImage ??
                              'https://cdn.dribbble.com/users/1141243/screenshots/5837877/panda.png?compress=1&resize=400x300'
                          ),
                          backgroundColor: primaryColor,
                        ),
                      ),
                      SizedBox(width: 20,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(userData.userName),
                          Text(userData.userEmail),
                        ],
                      ),
                      // Column(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     Text(
                      //         'Welcome Guest',
                      //       // style: TextStyle(
                      //       //   color: Colors.white,
                      //       // ),
                      //     ),
                      //     SizedBox(height: 7,),
                      //     Container(
                      //       //color: Colors.white,
                      //       height: 30,
                      //       child: MaterialButton(
                      //         onPressed: (){},
                      //         color: Colors.white,
                      //         child: Text('Login'),
                      //         shape: RoundedRectangleBorder(
                      //           borderRadius: BorderRadius.circular(15),
                      //           side: BorderSide(
                      //             width: 1,
                      //             color: Colors.white,
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ),
              ),
            ),
            listTile(
              icon: Icons.home_outlined,
              title: "Home",
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ),
                );
              },
            ),
            listTile(
              icon: Icons.person_outline,title: "My Profile",
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Myprofile(userProvider:widget.userProvider),
                  ),
                );
              },
            ),
            listTile(
              icon: Icons.shop_outlined,
              title: "Review Cart",
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ReviewCart(),
                  ),
                );
              },
            ),
            listTile(
              icon: Icons.notifications_outlined,
              title: "Notification",
              onTap: () {
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (context) => SignIN(),
                //   ),
                // );
              },
            ),
            listTile(
              icon: Icons.star_outline,
              title: "Rating & Review",
              onTap: () {
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (context) => SignIN(),
                //   ),
                // );
              },
            ),
            listTile(
              icon: Icons.favorite_outline,
              title: "Wishlist",
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => WishList(),
                  ),
                );
              },
            ),
            listTile(
              icon: Icons.copy_outlined,
              title: "Raise a Complaint",
              onTap: () {
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (context) => SignIN(),
                //   ),
                // );
              },
            ),
            listTile(
              icon: Icons.format_quote_outlined,
              title: "FAQs",
              onTap: () {
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (context) => SignIN(),
                //   ),
                // );
              },
            ),
            // listTile(icon: Icons.home_outlined,title: "Home",),
            // listTile(icon: Icons.shop_outlined,title: "Review Cart",),
            // listTile(icon: Icons.person_outline,title: "My Profile",),
            // listTile(icon: Icons.notifications_outlined,title: "Notification",),
            // listTile(icon: Icons.star_outline,title: "Rating & Review",),
            // listTile(icon: Icons.favorite_outline,title: "Wishlist",),
            // listTile(icon: Icons.copy_outlined,title: "Raise a Complaint",),
            // listTile(icon: Icons.format_quote_outlined,title: "FAQs",),

            Divider(height: 2,),

            Container(
              color: Colors.white10,
              height: 100,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Contact Support',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text('Call us:'),
                      SizedBox(width: 10,),
                      Text('+8801732107202'),
                    ],
                  ),
                  SizedBox(height: 5,),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Text('Mail us:'),
                        SizedBox(width: 10,),
                        Text('sohanur.vu5.cse5@gmail.com'),
                      ],
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
