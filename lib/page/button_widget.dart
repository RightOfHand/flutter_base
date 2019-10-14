import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  static const defaultStyle = const TextStyle(
    fontFamily: 'Archivo',
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text('按钮'),
      ),
      body: Column(
        children: <Widget>[
          RaisedButton(
            child: Text("RaisedButton"),
            onPressed: () {},
          ),
          FlatButton(
            child: Text("FlatButton"),
            onPressed: () {},
          ),
          OutlineButton(
            child: Text("OutlineButton"),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.thumb_up),
            onPressed: () {},
          ),
          // FlatButton  OutlineButton 也是如此
          RaisedButton.icon(
            icon: Image.network('https://www.usanetwork.com/sites/usanetwork/files/styles/629x720/public/suits_cast_harvey.jpg?itok=fpTOeeBb'),
            label: Text("发送"),
            onPressed: () {},
          ),

          FlatButton(
            color: Colors.blue,
            highlightColor: Colors.blue[700],
            colorBrightness: Brightness.dark,
            splashColor: Colors.grey,
            child: Text("Submit"),
            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
            onPressed: () {},
          ),

          RaisedButton(
            child: Text("RaisedButton"),
            disabledElevation: 0.0, //禁用阴影
            onPressed: () {},
          ),

        ],
      ),
    );
  }
}
