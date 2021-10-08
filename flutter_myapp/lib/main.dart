import 'package:get/get.dart';

import 'form_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(

      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Color(0xFFe67e00)),
      ),
      home: FormScreen(),
    );
  }
}
