import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/get.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'showdata.dart';



class Info extends StatefulWidget {
  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {



  List<String> man = ['man1', 'man2', 'man3'];
  List<String> wm = ['wm1', 'wm2', 'wm3'];
  List<String> non = ['non1', 'non2', 'non3'];
  List<String> choice = ['ชาย', 'หญิง', 'นอน-ไบนารี่'];

  String choose = '';
  _showBottomSheet() {
    List<String> _checked = [];
    Get.bottomSheet(
      DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.pink[50],
            bottom: TabBar(
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.pink),
              tabs: [
                Tab(
                  child: Text(choice[0]),
                ),
                Tab(
                  child: Text(choice[1]),
                ),
                Tab(
                  child: Text(choice[2]),
                ),
              ],
            ),
            title: const Text('เพศของคุณ'),
          ),
          body: TabBarView(
            children: [
              ListView(children: [
                CheckboxGroup(
                  labels: man,
                  checked: _checked,
                  onChange: (bool isChecked, String label, int index) => {
                    print(
                        "isChecked: $isChecked   label: $label  index: $index choice:" +
                            choice[0]),
                    choose = choice[0] + '-' + label
                  },
                  onSelected: (selected) => setState(() {
                    if (selected.length > 1) {
                      selected.removeAt(0);
                      print('selected length  ${selected.length}');
                    } else {
                      print("only one");
                    }
                    _checked = selected;
                  }),
                ),
              ]),
              ListView(children: [
                CheckboxGroup(
                  labels: wm,
                  checked: _checked,
                  onChange: (bool isChecked, String label, int index) => {
                    print(
                        "isChecked: $isChecked   label: $label  index: $index choice:" +
                            choice[0]),
                    choose = choice[1] + '-' + label
                  },
                  onSelected: (selected) => setState(() {
                    if (selected.length > 1) {
                      selected.removeAt(0);
                      print('selected length  ${selected.length}');
                    } else {
                      print("only one");
                    }
                    _checked = selected;
                  }),
                ),
              ]),
              ListView(children: [
                CheckboxGroup(
                  labels: non,
                  checked: _checked,
                  onChange: (bool isChecked, String label, int index) => {
                    print(
                        "isChecked: $isChecked   label: $label  index: $index choice:" +
                            choice[0]),
                    choose = choice[2] + '-' + label
                  },
                  onSelected: (selected) => setState(() {
                    if (selected.length > 1) {
                      selected.removeAt(0);
                      print('selected length  ${selected.length}');
                    } else {
                      print("only one");
                    }
                    _checked = selected;
                  }),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
  bool selected = false;
  String sex='';
  List<String> gender = ['ชาย','หญิง'];
  String Des = '';
  String Job ='';
  String place = '';
  RxString des =''.obs;




  final GlobalKey<FormState> _form2Key = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        title: Text("ข้อมูลของฉัน"),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Container(
        child: Form(
          key: _form2Key,
          child: Column(

            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[


                  Card(
                      color: Colors.white,
                      margin: EdgeInsets.all(1),
                      child: Column(
                        children: <Widget>[
                          Text("เพศกำเนิด"),

                          Center(
                            child: Row(
                              children: [
                                IconButton(onPressed: (){
                                  setState(() {
                                    sex = 'ชาย';
                                    selected = false;
                                  });
                                }, icon: Icon(Icons.male,color: selected == false ? Colors.pink:Colors.pink[50],size: 30,)),
                                IconButton(onPressed: (){

                                  setState(() {
                                    sex ='หญิง';
                                    selected = true;
                                  });
                                }, icon: Icon(Icons.female,color: selected == false ? Colors.pink[50]:Colors.pink,size: 30,),
                                ),
/*
                                GestureDetector(
                                  behavior: HitTestBehavior.translucent,
                                    onTap: (){
                                      setState(() {
                                        selected = false; //false = male
                                      });
                                    },

                                    child: Container(
                                      child: Icon(Icons.male),
                                      margin: EdgeInsets.all(15.0),
                                      decoration: BoxDecoration(
                                        color: selected == false ? Colors.pink:Colors.pink[50],
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                    )
                                ),
                                GestureDetector(
                                  behavior: HitTestBehavior.translucent,
                                    onTap: (){
                                      setState(() {
                                        selected = true; //false = male
                                      });
                                    },
                                    child: Container(
                                      child: Icon(Icons.female),
                                      margin: EdgeInsets.all(15.0),
                                      decoration: BoxDecoration(
                                        color: selected == false ? Colors.pink[50]:Colors.pink,
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                    )
                                )
*/
                              ],
                            ),
                          ),
                          SizedBox(height: 10,),
                          Text((){
                            if(sex == 'ชาย'){
                              return gender[0];
                            }
                            else if(sex ==''){
                              return 'โปรดเลือกเพศตามกำเนิด';
                            }
                            else{
                              return gender[1];
                            }
                          }(),style: TextStyle(fontSize: 20),),
                          SizedBox(height: 10,),
                          Text('โปรดเลือกเพศตามกำเนิดของคุณ เพื่อความแม่นยำและถูกต้องในการคำนวณข้อมูลความสัมพันธ์',style: TextStyle(fontSize: 15, color: Colors.grey)),
                          SizedBox(height: 12,)


                        ],
                      )),
                  SizedBox(height: 10,),
                  Card(
                    child: ListTile(

                      title:
                      Text('เพศของฉัน'),
                      trailing:
                      TextButton(
                        child: Text((){
                          if(choose ==''){
                            return " เลือก ";
                          }
                          else{
                            return choose;
                          }
                        }(),style: TextStyle(color: Colors.pink),),
                        onPressed: (){
                          setState(() {
                            _showBottomSheet();
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Card(
                    child: Column(
                      children: [
                        ListTile(title: Text('คำอธิบายเกี่ยวกับตัวฉัน'),

                          trailing: Obx(()=>Text((){
                            return des.toString().length.toString()+'/500';
                          }())),
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            counterText: '',
                            fillColor: Colors.deepOrange,
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey, width: 2.0),
                                borderRadius: BorderRadius.circular(25.0)),
                          ),
                          onSaved: (value){
                            setState(() {
                              Des = value;
                              des = Des.obs;

                            });
                          },
                          validator: (value){
                            if(value.isEmpty){
                              return null;
                            }
                          },
                          maxLength: 500,
                          maxLengthEnforced: true,

                        ),
                        SizedBox(height: 10,),
                        Text('เพิ่มคำอธิบายเพิ่มเติมเกี่ยวกับตัวคุณเพื่อแนะนำตัวกับคนอื่น ๆ ใน ANJO เพื่อเพิ่มโอกาสในการแมตซ์',style: TextStyle(fontSize: 15, color: Colors.grey)),
                        SizedBox(height: 10,),
                        Text('อาชีพ'),
                        TextFormField(

                          decoration: InputDecoration(
                            fillColor: Colors.deepOrange,
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey, width: 2.0),
                                borderRadius: BorderRadius.circular(25.0)),
                          ),
                          onSaved: (value){
                            setState(() {
                              Job = value;
                            });
                          },
                          validator: (value){
                            if(value.isEmpty){
                              return 'required';
                            }
                            else{
                              return null;
                            }
                          },
                        ),

                        Text('สถานศึกษา'),
                        TextFormField(
                          decoration: InputDecoration(

                            fillColor: Colors.deepOrange,
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey, width: 2.0),
                                borderRadius: BorderRadius.circular(25.0)),
                          ),
                          onSaved: (value){
                            setState(() {
                              place = value;
                            });
                          },
                          validator: (value){
                            if(value.isEmpty){
                              return 'required';
                            }
                          },
                        ),


                      ],
                    ),
                  ),

                  SizedBox(
                    height: 8,
                  ),
                  RaisedButton(
                    color: Colors.pink,
                      child: Text("ดำเนินการต่อ",style: TextStyle(color: Colors.white),),

                      onPressed: () {
                        if (!_form2Key.currentState.validate()) {
                          return;
                        }

                        _form2Key.currentState.save();
                        var a =Get.arguments[0];
                        var b =Get.arguments[1];
                        var c =Get.arguments[2];
                        var d =Get.arguments[3];
                        //print(a+'  '+b+'   '+c+'   ');

                        Get.to(()=>Showdata(),arguments: [a,b,c,d,sex,choose,Des,Job,place]);
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


