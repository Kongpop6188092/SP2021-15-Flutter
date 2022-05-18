import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/DentalInfo/components/background.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 10),
            margin: EdgeInsets.only(top: 35, left: 10, right: 10),
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  // A fixed-height child.
                    height: 60.0,
                    alignment: Alignment.centerLeft,
                    child: const Text('1. ฟันคืออะไร?',style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontFamily: 'TH Sarabun psk',
                        fontSize: 24))
                ),
                Container(margin: const EdgeInsets.only(top:30),
                    // Another fixed-height child.
                    child: new Image.asset('assets/images/dental_info.jpg')
                ),
                Container(
                  // A fixed-height child.
                    height: 1000,
                    alignment: Alignment.centerLeft,
                    child: const Text('-  มีชั้นเคลือบฟัน  (Enamel)  เป็นส่วนที่อยู่นอกสุดและมีความแข็งที่สุดของฟัน  ทำหน้าที่รับน้ำหนักในการบดเคี้ยว\n\nมีโครงสร้างเป็นผลึก ไม่มีเส้นเลือดและเส้นประสาท จึงเป็นส่วนที่ไม่ได้รับความรู้สึก เวลาที่ฟันเริ่มผุจึงไม่มีอาการเจ็บปวดใดๆ\n\n- ชั้นเนื้อฟัน (Dentine) เป็นส่วนที่อยู่ถัดจากเข้ามา ประกอบด้วยท่อเล็ก ๆ จำนวนมาก ซึ่งเป็นที่รวมของเส้นประสาทรับความรู้สึก ดังนั้นเวลาฟันผุถึงชั้นนี้ ผู้ป่วยจะเริ่มมีอาการเสียวฟั\n\n- โพรงประสาทฟัน   (Pulp) คือ โพรงช่องว่างภายในฟัน เป็นที่อยู่ของเส้นประสาท และเส้นเลือดที่มาหล่อเลี้ยงตัวฟัน ทำหน้าที่ในการรับความรู้สึกร้อน เย็น ปวด เจ็บ กรณีที่ฟันผุมาถึงชั้นนี้ จะไม่สามารถอุดฟันได้\n\n- ชั้นร่องเหงือก (Gingival crevice) คือ ร่องระหว่างตัวฟันกับขอบเหงือก ปกติจะมีขอบบาง มีความลึกประมาณ 2 มิลลิเมตร แต่ถ้ามีโรคเหงือกอักเสบ หรือเป็นรำมะนาด อาจมีอาการบวม ทำให้ร่องนี้ลึกขึ้น และเกิดการอักเสบมากขึ้นได้\n\n- เหงือก (Gingiva) คือ ส่วนเนื้อเยื่อที่หุ้มตัวฟัน และกระดูกขากรรไกรไว้\n\n- เคลือบรากฟัน (Cementum) เป็นชั้นบาง ๆ คลุมเนื้อฟันบริเวณรากฟันไว้ แตกต่างจากเคลือบฟันตรงที่มีความแข็งแรงน้อยกว่า ปกติจะฝังตัวอยู่ในกระดูก แต่ถ้ามีเหงือกร่น หรือเกิดโรครำมะนาด อาจทำให้ส่วนนี้สัมผัสกับน้ำและอากาศ เกิดอาการเสียวฟันได้ กระดูกเบ้ารากฟัน (Alveolar bone) คือส่วนของกระดูกที่รองรับรากฟัน',style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontFamily: 'TH Sarabun psk',
                        fontSize: 24))
                ),
              ],
            ),
            /*child: Text(
              '1. ฟันคืออะไร?\n\n\n\nฟันเป็นอวัยวะพิเศษที่เจริญมาจากเนื้อเยื่อชั้นนอก (Ectoderm) เช่นเดียวกับผิวหนังหรือเกร็ดของปลา ฟันมี 2 ชุด คือฟันแท้และฟันน้ำนม ซึ่งมีโครงสร้างคล้าย ๆ กันดังนี้ -  มีชั้นเคลือบฟัน  (Enamel)  เป็นส่วนที่อยู่นอกสุดและมีความแข็งที่สุดของฟัน  ทำหน้าที่รับน้ำหนักในการบดเคี้ยว\n\nมีโครงสร้างเป็นผลึก ไม่มีเส้นเลือดและเส้นประสาท จึงเป็นส่วนที่ไม่ได้รับความรู้สึก เวลาที่ฟันเริ่มผุจึงไม่มีอาการเจ็บปวดใดๆ\n\n- ชั้นเนื้อฟัน (Dentine) เป็นส่วนที่อยู่ถัดจากเข้ามา ประกอบด้วยท่อเล็ก ๆ จำนวนมาก ซึ่งเป็นที่รวมของเส้นประสาทรับความรู้สึก ดังนั้นเวลาฟันผุถึงชั้นนี้ ผู้ป่วยจะเริ่มมีอาการเสียวฟัน\n\n- โพรงประสาทฟัน   (Pulp) คือ โพรงช่องว่างภายในฟัน เป็นที่อยู่ของเส้นประสาท และเส้นเลือดที่มาหล่อเลี้ยงตัวฟัน ทำหน้าที่ในการรับความรู้สึกร้อน เย็น ปวด เจ็บ กรณีที่ฟันผุมาถึงชั้นนี้ จะไม่สามารถอุดฟันได้\n\n- ชั้นร่องเหงือก (Gingival crevice) คือ ร่องระหว่างตัวฟันกับขอบเหงือก ปกติจะมีขอบบาง มีความลึกประมาณ 2 มิลลิเมตร แต่ถ้ามีโรคเหงือกอักเสบ หรือเป็นรำมะนาด อาจมีอาการบวม ทำให้ร่องนี้ลึกขึ้น และเกิดการอักเสบมากขึ้นได้\n\n- เหงือก (Gingiva) คือ ส่วนเนื้อเยื่อที่หุ้มตัวฟัน และกระดูกขากรรไกรไว้- เคลือบรากฟัน (Cementum) เป็นชั้นบาง ๆ คลุมเนื้อฟันบริเวณรากฟันไว้ แตกต่างจากเคลือบฟันตรงที่มีความแข็งแรงน้อยกว่า ปกติจะฝังตัวอยู่ในกระดูก แต่ถ้ามีเหงือกร่น หรือเกิดโรครำมะนาด อาจทำให้ส่วนนี้สัมผัสกับน้ำและอากาศ เกิดอาการเสียวฟันได้ กระดูกเบ้ารากฟัน (Alveolar bone) คือส่วนของกระดูกที่รองรับรากฟัน',
            style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
              fontFamily: 'TH Sarabun psk',
            fontSize: 24,
          ),),*/


          ),
        )
    );
  }
}