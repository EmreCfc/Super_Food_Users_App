import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:superfood_users_app/assistantMethods/address_changer.dart';
import 'package:superfood_users_app/assistantMethods/cart_Item_counter.dart';
import 'package:superfood_users_app/assistantMethods/total_amount.dart';
import 'package:superfood_users_app/global/global.dart';
import 'package:superfood_users_app/splashScreen/splash_screen.dart';


Future<void> main() async
{
  WidgetsFlutterBinding.ensureInitialized();

  sharedPreferences = await SharedPreferences.getInstance();
  await Firebase.initializeApp();


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (c)=> CartItemCounter()),
        ChangeNotifierProvider(create: (c)=> TotalAmount()),
        ChangeNotifierProvider(create: (c)=> AddressChanger()),
      ],
      child: MaterialApp(
        title: 'Users App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),
        home: const MySplashScreen(),
      ),
    );
  }
}

