import 'package:flutter/material.dart';
import 'package:login/screens/authenticate/authenticate.dart';
import 'package:login/screens/home/home.dart';
import 'package:provider/provider.dart';
import 'package:login/models/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final user = Provider.of<User>(context) ;
    // return either home or authenticate wigdet based on login values
    if (user != null) {
      return Authenticate() ;
    }
    else{
      return Home() ;
    } 
  }
}