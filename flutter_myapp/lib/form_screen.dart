

import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import 'info.dart';

class CustomPicker extends CommonPickerModel {
  String digits(int value, int length) {
    return '$value'.padLeft(length, "0");
  }

  CustomPicker({DateTime currentTime, LocaleType locale})
      : super(locale: locale) {
    this.currentTime = currentTime ?? DateTime.now();
    this.setLeftIndex(this.currentTime.hour);
    this.setMiddleIndex(this.currentTime.minute);
    this.setRightIndex(this.currentTime.second);
  }

  @override
  String leftStringAtIndex(int index) {
    if (index >= 0 && index < 24) {
      return this.digits(index, 2);
    } else {
      return null;
    }
  }

  @override
  String middleStringAtIndex(int index) {
    if (index >= 0 && index < 60) {
      return this.digits(index, 2);
    } else {
      return null;
    }
  }

  @override
  String rightStringAtIndex(int index) {
    if (index >= 0 && index < 60) {
      return this.digits(index, 2);
    } else {
      return null;
    }
  }

  @override
  String leftDivider() {
    return "|";
  }

  @override
  String rightDivider() {
    return "|";
  }

  @override
  List<int> layoutProportions() {
    return [1, 2, 1];
  }

  @override
  DateTime finalTime() {
    return currentTime.isUtc
        ? DateTime.utc(
        currentTime.year,
        currentTime.month,
        currentTime.day,
        this.currentLeftIndex(),
        this.currentMiddleIndex(),
        this.currentRightIndex())
        : DateTime(
        currentTime.year,
        currentTime.month,
        currentTime.day,
        this.currentLeftIndex(),
        this.currentMiddleIndex(),
        this.currentRightIndex());
  }
}

class FormScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormScreenState();
  }
}


class controller extends GetxController{
  var a =''.obs;
  String change(DateTime s){
    if(s != null){
      var formater = new DateFormat('yyyy-MM-dd');

      String format = formater.format(s);

      a.value = format;
      a = format.obs;

      update();
      return a.value;
    }
  }

}

class FormScreenState extends State<FormScreen> {
  bool isSwitched = false;
  bool _allow;
  String _name;
  String _anjoID;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();



  Widget _buildname() {

    return TextFormField(
      decoration: InputDecoration(
        //labelText: 'กรอกชื่อตรงนี้',
        fillColor: Colors.deepOrange,
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 2.0),
            borderRadius: BorderRadius.circular(25.0)),
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Name is required';
        }
      },
      onSaved: (value) {
        _name = value;
      },
    );
  }

  Widget _buildAnjoId() {
    return TextFormField(
      decoration: InputDecoration(
        //labelText: 'AnJo ID'
        fillColor: Colors.deepOrange,
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 2.0),
            borderRadius: BorderRadius.circular(25.0)),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'AnJo Id is required';
        }
      },
      onSaved: (String value) {
        _anjoID = value;
      },
    );
  }

  DateTime selectedDateTime;

  bool pressed = false;
  bool invaliddate = false;



  Widget _displayDateTime(selectedDateTime) {
    DateTime now = DateTime.now();

    if(selectedDateTime != null) {
      if(selectedDateTime.compareTo(now)>0){

          RxString format = controller().change(selectedDateTime).obs;
            invaliddate = true;
            //print(true);
            return Center(
              child: Obx(()=>Text('กรุณาตรวจสอบวันเกิดให้ถูกต้อง'+format.string,
                style: TextStyle(fontSize: 15, color: Colors.red),),
              //Obx(()=> Text('${controller().change(selectedDateTime)}'))
            ));

          //}
        //}
      }
      else{
        RxString format = controller().change(selectedDateTime).obs;

        return Center(
            child: Obx(()=>Text(format.string, style: TextStyle(fontSize: 15),)),
        );
      }


    }
    else{
      return Center(
          child: Text(' ', style: TextStyle(fontSize: 15),),
    );
    }
  }







  @override
  Widget build(BuildContext context) {
    controller a = controller();
    controller b = Get.put(controller());

    return Scaffold(
      appBar: AppBar(
        title: Text('สร้างบัญชี'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Card(
                      color: Colors.white,
                      margin: EdgeInsets.all(1),
                      child: Column(
                        children: [
                          Text(
                            "ชื่อของฉัน",
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                          _buildname(),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "นี่คือชือที่จะปรากฎในหน้าโปรไฟล์ของคุณ และคุณจะไม่สามารถเปลี่ยนได้ในภายหลัง",
                            style: TextStyle(fontSize: 15, color: Colors.grey),
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      )),
                  SizedBox(
                    height: 15,
                  ),
                  Card(
                      color: Colors.white,
                      margin: EdgeInsets.all(1),
                      child: Column(
                        children: [
                          Text(
                            "ANJO ID",
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                          _buildAnjoId(),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "คุณสามารถใช้ ANJO ID สำหรับระบุตัวตนและยังสามารถให้เพื่อนของคุณนำไปใช้ในการเพิ่มเพื่อนได้",
                            style: TextStyle(fontSize: 15, color: Colors.grey),
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      )),
                  SizedBox(
                    height: 5,
                  ),
                  Card(
                      color: Colors.white,
                      margin: EdgeInsets.all(1),
                      child: Row(
                        children: <Widget>[
                          Text("อนุญาติให้เพื่มเพื่อนด้วย ID"),
                          SizedBox(
                            width: 20,
                          ),
                          Switch(
                            value: isSwitched,
                            onChanged: (value) {
                              setState(() {
                                isSwitched = value;
                                print(isSwitched);
                                _allow = value;
                              });
                            },
                            activeTrackColor: Colors.lightGreen,
                            activeColor: Colors.green,
                          )
                        ],
                      )),
                  Card(
                      color: Colors.white,
                      child: Column(
                        children: [
                          Text(
                            "วันเกิดของฉัน",
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                          TextButton(
                              onPressed: () {
                                setState(() {


                                pressed = true;

                                DatePicker.showDatePicker(context,
                                    showTitleActions: true,
                                    minTime: DateTime(1900, 12, 31),
                                    maxTime: DateTime(2025, 12, 31),
                                    theme: DatePickerTheme(
                                        headerColor: Colors.pink,
                                        backgroundColor: Colors.white,
                                        itemStyle: TextStyle(
                                            color: Colors.pinkAccent,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                        doneStyle:
                                        TextStyle(color: Colors.white, fontSize: 16)),
                                    onChanged: (date) {
                                      print('change $date in time zone ' +
                                          date.timeZoneOffset.inHours.toString());
                                    }, onConfirm: (date) {
                                      print('confirm $date');
                                      selectedDateTime = date;







                                    }, currentTime: DateTime.now(), locale: LocaleType.en);
                                });
                              },
                              child: Text(
                                'เลือกวันเกิดของคุณ',
                                style: TextStyle(color: Colors.red),
                              )),

                          pressed ? _displayDateTime(selectedDateTime): Text(''),

                          SizedBox(height: 10,),

                          Text('หลังจากลงทะเบียนไปแล้ว คุณจะไม่สามารถแก้ไขวันเกิดคุณได้ กรุณาตรวจสอบวันเกิดของคุณให้ถูกต้อง',
                              style: TextStyle(fontSize: 15, color: Colors.grey),
                          ),


                          SizedBox(
                            height: 10,
                          ),
                          RaisedButton(
                            color: Colors.pink,
                              child: Text(
                                'ดำเนินการต่อ',
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () {
                                if (!_formKey.currentState.validate()) {
                                  return;
                                }

                                _formKey.currentState.save();



                                print(_name);
                                print(_anjoID);
                                if(invaliddate ==false) {
                                  Get.to(()=>Info(), arguments: [
                                    _name,
                                    _anjoID,
                                    selectedDateTime.toString(),
                                    _allow
                                  ]);
                                }
                                else{
                                }
                              }),
                        ],
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
