import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodtest0/auth/sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:foodtest0/config/color.dart';
import 'package:foodtest0/provider/proudct_provider.dart';
import 'package:foodtest0/provider/review_cart_provider.dart';
import 'package:foodtest0/provider/user_provider.dart';
import 'package:foodtest0/provider/wish_list_provider.dart';
import 'package:foodtest0/screens/home_screen/home.dart';
import 'package:provider/provider.dart';
//import 'package:provider/provider.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   // return ChangeNotifierProvider<ProductProvider>(
    return MultiProvider(providers:[

      ChangeNotifierProvider<ProductProvider>(
      create: (context)=>ProductProvider(),
      ),

      ChangeNotifierProvider<UserProvider>(
        create: (context)=>UserProvider(),
      ),

      ChangeNotifierProvider<ReviewCartProvider>(
        create: (context)=>ReviewCartProvider(),
      ),

      ChangeNotifierProvider<WishListProvider>(
        create: (context)=>WishListProvider(),
      ),
    ],
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: primaryColor,
          //scaffoldBackgroundColor: scaffoldBackgroundColor
        ),
        debugShowCheckedModeBanner: false,
        home:StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapShot){
            if(snapShot.hasData){
              return HomeScreen();
            }
            return SignIN();
          },
        ),
      ),
    );
  }
}

