import 'package:get/route_manager.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:country_state_city_picker/country_state_city_picker.dart';

class Showdata extends StatefulWidget {


  @override
  _ShowState createState() => _ShowState();
}

class _ShowState extends State<Showdata> {
  String countryValue;
  String stateValue;
  String cityValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ข้อมูลของโปรไฟล์"),
        backgroundColor: Colors.pinkAccent,
      ),
      body: ListView(
          children: [
            Column(
              children: [
                ListTile(
                  leading: Text('โปรไฟล์',style: TextStyle(color: Colors.pinkAccent)),
                  hoverColor: Colors.grey,
                ),
                ListTile(
                  leading: Text('คำอธิบาย'),
                  trailing: Text(Get.arguments[6]),
                ),
                ListTile(
                  leading: Text('อาชีพ'),
                  trailing: Text(Get.arguments[7]),
                ),
                ListTile(
                  leading: Text('สถานศึกษา'),
                  trailing: Text(Get.arguments[8]),
                ),
                ListTile(
                  leading: Text('เพศ',style: TextStyle(color: Colors.pinkAccent)),
                  hoverColor: Colors.grey,
                ),
                ListTile(
                  leading: Text('เพศกำเนิด'),
                  trailing: Text(Get.arguments[4]),
                ),
                ListTile(
                  leading: Text('เพศของฉัน'),
                  trailing: Text(Get.arguments[5]),
                ),
                ListTile(
                  title: Text('เมืองเกิด',style: TextStyle(color: Colors.pinkAccent)),
                  hoverColor: Colors.grey,

                ),
                /*
                ListTile(
                  leading: Text('ประเทศ'),
                  trailing: Text('Thai'),
                ),
                ListTile(
                  leading: Text('เมือง'),
                  trailing: Text("Phuket"),
                ),

                 */
                SelectState(

                  onCountryChanged: (value) {
                    setState(() {
                      countryValue = value;
                    });
                  },
                  onStateChanged:(value) {
                    setState(() {
                      stateValue = value;
                    });
                  },
                  onCityChanged:(value) {
                    setState(() {
                      cityValue = value;
                    });
                  },

                ),
                ListTile(
                  leading: Text('ข้อมูลทั่วไป',style: TextStyle(color: Colors.pinkAccent)),
                  hoverColor: Colors.grey,
                ),
                ListTile(
                  leading: Text('ชื่อของฉัน'),
                  trailing: Text(Get.arguments[0]),
                ),
                ListTile(
                  leading: Text('ANJO ID'),

                  trailing: Text(Get.arguments[1]),
                ),
                ListTile(
                  leading: Text('อนุญาติ'),
                  trailing: Text('True'),
                ),
                SizedBox(height: 10,),
                ListTile(
                  leading: Text('วันเกิดของฉัน',style: TextStyle(color: Colors.pinkAccent),),
                  trailing: Text(Get.arguments[2].toString().substring(0, 4)+'/'+Get.arguments[2].toString().substring(5, 7)+'/'+Get.arguments[2].toString().substring(8, 10)),
                ),

              ],
            ),
          ],
      )
    );


/*
            Text(Get.arguments[0]),
            Text(Get.arguments[1]),
            Text(Get.arguments[2].toString().substring(0, 4)+'/'+Get.arguments[2].toString().substring(5, 7)+'/'+Get.arguments[2].toString().substring(8, 10)),
            Text((){
              if(Get.arguments[3]==true){
                return 'True';
              }
              else{
                return 'False';
              }
            }()),
            Text(Get.arguments[4]),
            Text(Get.arguments[5]),
            Text(Get.arguments[6]),
            Text(Get.arguments[7]),
            Text(Get.arguments[8]),
*/



  }
}
