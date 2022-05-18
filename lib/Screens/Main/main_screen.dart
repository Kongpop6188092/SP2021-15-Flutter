import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Main/components/body.dart';

class MainScreen extends StatelessWidget {
  dynamic patient;
  MainScreen(dynamic patient) {
    this.patient = patient;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(this.patient),
    );
  }
}