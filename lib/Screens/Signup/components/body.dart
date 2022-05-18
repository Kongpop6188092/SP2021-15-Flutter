import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:flutter_auth/Screens/Signup/components/background.dart';
import 'package:flutter_auth/components/already_have_an_account_acheck.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/components/rounded_input_field.dart';
import 'package:flutter_auth/components/rounded_password_field.dart';
import 'package:http/http.dart' as http;

class Body extends StatelessWidget {
  String fullname = "";
  String cid = "";
  String username = "";
  String password = "";
  String address = "";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "สมัครสมาชิก",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            Image.asset(
              "assets/icons/mudent.png",
              height: size.height * 0.2,
            ),
            RoundedInputField(
              hintText: "ชื่อ-นามสกุล",
              onChanged: (value) {
                fullname = value;
              },
              icon: Icons.account_circle_outlined,
            ),
            RoundedInputField(
              hintText: "เลขประจำตัวประชาชน",
              onChanged: (value) {
                cid = value;
              },
              icon: Icons.account_circle_outlined,
            ),
            RoundedInputField(
              hintText: "ที่อยู่",
              onChanged: (value) {
                address = value;
              },
              icon: Icons.add_business,
            ),
            RoundedInputField(
              hintText: "ชื่อผู้ใช้",
              onChanged: (value) {
                username = value;
              },
            ),
            RoundedPasswordField(
              onChanged: (value) {
                password = value;
              },
            ),
            RoundedButton(
              text: "สมัครสมาชิก",
              press: () async {
                var response = await http.post(Uri.parse('http://192.168.1.39/mudent-api/api/patient/register'), body: {
                  'name': fullname,
                  'cid': cid,
                  'username': username,
                  'password': password,
                  'address': address
                });
                var data = jsonDecode(response.body);
                if (data['success']) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                }
                else {
                  print(data['message']);
                }
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            // OrDivider(),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: <Widget>[
            //     SocalIcon(
            //       iconSrc: "assets/icons/facebook.svg",
            //       press: () {},
            //     ),
            //     SocalIcon(
            //       iconSrc: "assets/icons/twitter.svg",
            //       press: () {},
            //     ),
            //     SocalIcon(
            //       iconSrc: "assets/icons/google-plus.svg",
            //       press: () {},
            //     ),
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
