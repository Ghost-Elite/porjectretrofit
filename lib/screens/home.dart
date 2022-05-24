import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:porjectretrofit/screens/pagsNext.dart';

import '../main.dart';
import '../model/api.dart';
import '../model/api_reponse.dart';
import '../services/apiService.dart';

class HomePage extends StatefulWidget {

  HomePage({Key key,}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isDark = darkNotifier.value;
  List<Api> allData = [];
  ApiResponse apiResponse;
  var index=0;
  var change=0;
  var logger=Logger();
  Future<void> getApi() async {
    logger.i("test");
    final dio = Dio();
    final client = RestClient(dio);
    client.getAppDetails().then((it) async {
      apiResponse = it;
      //navigationPage();
      logger.w('message',apiResponse.api[0].logo);
    }).catchError((Object obj) {
      switch (obj.runtimeType) {
        case DioError:
        // Here's the sample to get the failed response error code and message
          final res = (obj as DioError).response;
          /*if (res.statusCode == 500) {}*/
          logger.e("Got error : ${res.statusCode} -> ${res.statusMessage}");

          break;
        default:
      }
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getApi();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Light/Dark Theme'),
        actions: [

          IconButton(
            onPressed: (){
              isDark = !isDark;
              darkNotifier.value = isDark;
              change=index;
            },
            icon: Icon(isDark ? Icons.wb_sunny_outlined: Icons.bubble_chart,color: change==index?Colors.yellow:Colors.grey,),
          )
        ],
      ),
      body: Center(
        child: IconButton(
          icon: const Icon(
            Icons.arrow_forward,
            color: Colors.blue,
            size: 34,
          ),
          onPressed: (){
            Navigator.of(context).push(

              MaterialPageRoute(
                  builder: (context) => NextPage(
                    isDark: isDark,
                  )
              ),
            );
          },
        ),
      ),
    );
  }
}
