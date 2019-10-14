
import 'package:flutter/material.dart';

class GestureDetectorRoute extends StatefulWidget{
  @override
  _GestureDetectorState createState() {
    // TODO: implement createState
    return new _GestureDetectorState();
  }

}

class _GestureDetectorState extends State<GestureDetectorRoute>{

  String _operation= 'No gesture detected';  //保存事件名
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: GestureDetector(
        child: Container(
          alignment: Alignment.center,
          color: Colors.blue,
          width: 200.0,
          height: 100.0,
          child: Text(_operation,
            style: TextStyle(color: Colors.white),
          ),
        ),
        onTap: () => updateText("Tap"),//点击
        onDoubleTap: () => updateText("DoubleTap"), //双击
        onLongPress: () => updateText("LongPress"), //长按
      ),
    );
  }
  void updateText(String text) {
    //更新显示的事件名
    setState(() {
      _operation = text;
    });
  }

}