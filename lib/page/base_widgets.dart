
import 'package:flutter/material.dart';

import 'package:flutter_demo/eventbus/event_bus.dart';


//基础组件页面
class BaseWidgetsPage extends StatefulWidget{
  @override
  _BaseWidgetsState createState() => _BaseWidgetsState();

}

class _BaseWidgetsState extends State<BaseWidgetsPage>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("基础组件页面"),
      ),
      body: Column(
        children: <Widget>[
          //漂浮按钮 带阴影和灰色背景
          RaisedButton(
              child: Text('文本'),
              textColor: Colors.blue,
              onPressed: (){
                Navigator.pushNamed(context, 'text_widget');
              }
          ),

          RaisedButton(
              child: Text('按钮'),
              textColor: Colors.blue,

              onPressed: (){

                Navigator.pushNamed(context, 'button_widget');
              }
          ),

          RaisedButton(
              child: Text('图片'),
              textColor: Colors.blue,
              onPressed: (){
                Navigator.pushNamed(context,'image_widget');
              }
          ),
          RaisedButton(
              child: Text('单选框,多选框，输入框'),
              textColor: Colors.blue,
              onPressed: (){
                bus.emit('login','songy');
                Navigator.pushNamed(context,'checkbox_widget');
              }
          ),
          RaisedButton(
              child: Text('scaffold'),
              textColor: Colors.blue,
              onPressed: (){
                Navigator.pushNamed(context,'scaffold_widget');
              }
          ),
          RaisedButton(
            child: Text('sliver scroll'),
            textColor: Colors.blue,
            onPressed: (){
              Navigator.pushNamed(context, 'sliver_widget');
            },
          ),
          RaisedButton(
            child: Text('弹框'),
            textColor: Colors.blue,
            onPressed: (){
              Navigator.pushNamed(context, 'dialog_widget');
            },
          ),
          RaisedButton(
            child: Text('手势'),
            textColor: Colors.blue,
            onPressed: (){
              Navigator.pushNamed(context, 'gesture_widget');
            }
          ),
          RaisedButton(
            child: Text('http'),
            textColor: Colors.blue,
            onPressed: (){
              Navigator.pushNamed(context, 'http_route');
            },
          ),

          RaisedButton(
            child: Text('图片选择器'),
            textColor: Colors.blue,
            onPressed: (){
              Navigator.pushNamed(context, 'pick_image');
            },
          )

        ],
      ),
    );
  }


}