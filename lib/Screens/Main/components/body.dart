import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Appointment/edit_profile.dart';
import 'package:flutter_auth/Screens/DentalInfo/dental_info_screen.dart';
import 'package:flutter_auth/Screens/History/history_screen.dart';
import 'package:flutter_auth/Screens/Main/components/background.dart';
import 'package:flutter_auth/Screens/News/news_screen.dart';
import 'package:flutter_auth/Screens/Welcome/welcome_screen.dart';

class Body extends StatelessWidget {
  /* PRIMARY KEY DATA */
  dynamic patient;

  /* CONSTRUCTOR METHOD */
  Body(dynamic patient) {
    this.patient = patient;
  }

  /* USER INTERFACE */
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Center(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 35, bottom: 15, left: 15, right: 15),
              child: Row(
                children: [

                  Image.asset(
                    'assets/images/mudent.png',
                    height: 70,
                  ),
                  /*Image.asset(
                    'assets/images/user.png',
                    height: 60,
                  )*/
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(
                    bottom: 20,
                  ),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/title.jpg'),
                        fit: BoxFit.fitWidth,
                        colorFilter: ColorFilter.mode(
                            Colors.white.withOpacity(0.3), BlendMode.dstATop)),
                  ),
                  height: 80,
                  width: 300,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'ยินดีต้อนรับสู่ MUDENT',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            /* THE FIRST ROW OF MENUS */
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              /* HISTORY SCREEN */
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return HistoryScreen(this.patient);
                  }));
                },
                child: Column(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/5.jpg'),
                              fit: BoxFit.cover),
                        ),
                        height: 120,
                        width: 150),
                    Container(
                        margin: EdgeInsets.only(bottom: 20),
                        width: 150,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(226, 183, 255, 1)),
                        alignment: Alignment.center,
                        child: Text(
                          'ประวัติการรักษา',
                          style: TextStyle(
                            fontSize: 20
                          ),
                        ))
                  ],
                ),
              ),

              /* APPOINTMENT SCREEN */
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return EditProfilePage(this.patient);
                  }));
                },
                child: Column(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/3.png'),
                              fit: BoxFit.cover),
                        ),
                        height: 120,
                        width: 150),
                    Container(
                        margin: EdgeInsets.only(bottom: 20),
                        width: 150,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(226, 183, 255, 1)),
                        alignment: Alignment.center,
                        child: Text(
                          'ทำนัดหมาย',
                          style: TextStyle(
                            fontSize: 20
                          ),
                        ))
                  ],
                ),
              ),
            ]),
            /* THE SECOND ROW OF MENUS */
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              /* NEWS SCREEN */
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return NewsScreen();
                  }));
                },
                child: Column(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/6.jpg'),
                              fit: BoxFit.cover),
                        ),
                        height: 120,
                        width: 150),
                    Container(
                        margin: EdgeInsets.only(bottom: 20),
                        width: 150,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(226, 183, 255, 1)),
                        alignment: Alignment.center,
                        child: Text(
                          'ข่าวสาร',
                          style: TextStyle(
                            fontSize: 20
                          ),
                        ))
                  ],
                ),
              ),

              /* DENTAL INFORMATION SCREEN */
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return DentalInfoScreen();
                  }));
                },
                child: Column(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/4.png'),
                              fit: BoxFit.cover),
                        ),
                        height: 120,
                        width: 150),
                    Container(
                        margin: EdgeInsets.only(bottom: 20),
                        width: 150,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(226, 183, 255, 1)),
                        alignment: Alignment.center,
                        child: Text(
                          'ข้อมูลทันตกรรม',
                          style: TextStyle(
                            fontSize: 20
                          ),
                        ))
                  ],
                ),
              ),
            ]),

            // TODO: SIGN OUT
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.green),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return WelcomeScreen();
                }));
              },
              child: Text('ออกจากระบบ'),
            ),
          ],
        ),
      ),
    );
  }
}
