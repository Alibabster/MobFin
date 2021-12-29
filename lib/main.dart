import 'package:CWCFlutter/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:CWCFlutter/api/api.dart';
import 'package:provider/provider.dart';

void main() => runApp(
  MultiProvider(
    providers: [
      StreamProvider(
        create: (_) => getSessionTime(), 
        initialData: 0,
      )
    ],
    child: MyApp(),
  )
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Color(0xFF2F5233)),
        primaryColor: Color(0xFF2F5233),
        backgroundColor: Color(0xFFDCDCDC),
      ),
      home: Home(),
    );
  }
}
