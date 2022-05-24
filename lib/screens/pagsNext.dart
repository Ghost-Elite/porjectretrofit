import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class NextPage extends StatefulWidget {
  bool isDark = darkNotifier.value;
   NextPage({Key key,this.isDark}) : super(key: key);

  @override
  _NextPageState createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: widget.isDark ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData(primaryColor: Colors.blue),
      darkTheme: ThemeData.dark(),
      home: Scaffold(
            appBar: AppBar(
              title: Text('test'),
            ),
      ),
    );
  }
}
