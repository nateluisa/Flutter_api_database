import 'package:flutter/material.dart';
import 'package:flutter_api/pages/home.dart';
import 'package:flutter_api/pages/login.dart';
import 'package:flutter_api/widgets/dashboard.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';



void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(MyApp());
  FlutterNativeSplash.remove();
}



class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => LoginPage(
      loginContext: context,
    ),
    HomePage.tag: (context) => HomePage(
      context, homeContext: context,
    ),

  };

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: MaterialApp(
        title: 'Albatros mobile',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          fontFamily: 'Nunito',
        ),
        home: LoginPage(loginContext: context),
        routes: routes,
      ),
    );
  }



}


