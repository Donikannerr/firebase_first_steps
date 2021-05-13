import 'package:firebase_first_steps/screens/authenticate/authenticate.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    //soll entscheiden, ob User die Auth-Page oder Home-Page sieht
    return new Authenticate();
  }
}
