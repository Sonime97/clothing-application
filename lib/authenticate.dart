import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sonime_app/home_page.dart';
import 'package:sonime_app/signIn.dart';
import 'data_provider_class.dart';
import 'data_provider_class.dart';
import 'signIn.dart';
class Authenticate extends StatefulWidget {
  const Authenticate({ Key? key }) : super(key: key);

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<DataModel>(context);
   if (data.token != null) {
      // Token is present, user is authenticated, show the home page
      return HomePage();
    } else {
      // Token is null, user is not authenticated, show the sign-in page
      return SignIn();
    }
    
  }
}
