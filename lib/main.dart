import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_demo/page/button_widget.dart';
import 'package:flutter_demo/page/checkbox_widget.dart';
import 'package:flutter_demo/page/image_picker_widget.dart';
import 'package:flutter_demo/page/image_widget.dart';
import 'package:flutter_demo/page/scafford_widget.dart';
import 'package:flutter_demo/page/sliver_scroll_widget.dart';
import 'package:flutter_demo/page/text_widget.dart';
import 'package:flutter_demo/page/dialog_widget.dart';
import 'package:flutter_demo/page/getsture_detector_widget.dart';
import 'package:flutter_demo/page/http_test.dart';

import 'second.dart';
import 'page/base_widgets.dart';


//收集日志
void collectLog(String line) {}

//上报错误和日志
void reportErrorAndLog(FlutterErrorDetails details) {}

//构建错误信息
FlutterErrorDetails makeDetails(Object obj, StackTrace stackTrace) {
  return null;
}

void main() {
  FlutterError.onError = (FlutterErrorDetails details) {
    reportErrorAndLog(details);
  };
  runZoned(
    () => runApp(MyApp()),
    zoneSpecification: ZoneSpecification(
      print: (Zone self, ZoneDelegate parent, Zone zone, String line) {
        collectLog(line); // 收集日志
      },
    ),
    onError: (Object obj, StackTrace stack) {
      var details = makeDetails(obj, stack);
      reportErrorAndLog(details);
    },
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        //去掉右上角debug标签
        debugShowCheckedModeBanner: false,
        //"/"的路由为应用的home
        initialRoute: "/",
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),

        //注册命名路由
        routes: {
          "/": (context) => MyHomePage(title: 'Home'),
          // "/"的路由为应用的home
          //注册初始化/传参
          "second_page": (context) => new SecondRoute(title: 'router pager'),
          //跳转时 传参数
//        "second_page": (context) =>new SecondRoute(title: ModalRoute.of(context).settings.arguments,)

          "widgets_page": (context)=> new BaseWidgetsPage(),
          "text_widget" : (context)=> new TextWidget(),
          "button_widget" : (context)=> new ButtonWidget(),
          "image_widget" : (context)=> new ImageWidget(),
          "checkbox_widget" : (context)=> new CheckBoxWidget(),
          "scaffold_widget" : (context)=> new ScaffoldWidget(),
          "sliver_widget" : (context)=> new SliverScrollWidget(),
          "dialog_widget" : (context)=> new DialogWidget(),
          "gesture_widget" : (context)=> new GestureDetectorRoute(),
          "http_route" : (context)=> new HttpTestRoute(),
          "pick_image": (context) =>new ImagePickerWidget(),
        },

        //不一定调用  已注册路由表中 不存在某一路由 才会调用该方法 生成路由
        onGenerateRoute: (RouteSettings settings) {
          return MaterialPageRoute(builder: (context) {
            String routeName = settings.name;
            // 如果访问的路由页需要登录，但当前未登录，则直接返回登录页路由，
            // 引导用户登录；其它情况则正常打开路由。
          });
        });
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  var result;

  DateTime _lastPressedAt;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("initState");
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            FlatButton(
              child: Text('路由带参数跳转，及带返回值$result'),
              textColor: Colors.blue,
              onPressed: () async {
                result = await Navigator.pushNamed(context, 'second_page',
                    arguments: <String, String>{'title': 'update title'});
                print('页面返回值：$result');
              },
            ),
            FlatButton(
              child: Text('基础组件页'),
              textColor: Colors.blue,
              onPressed: ()=> Navigator.pushNamed(context, 'widgets_page'),
            ),


          ],
        ));
  }

  @override
  void didUpdateWidget(MyHomePage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget');
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print('deactivate');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print('dispose');
  }

  @override
  void reassemble() {
    // TODO: implement reassemble
    super.reassemble();
    print('reassemble');
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print('didChangeDependencies');
  }
}
