import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  static const defaultStyle = const TextStyle(
    fontFamily: 'Archivo',
  );


  @override
  Widget build(BuildContext context) {
    String icons="\uE914";
     icons+="\uE000";
     icons+="\uE90D";
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text('文本，字体样式'),
      ),
      body: Column(
        children: <Widget>[
          Text(
            'Hello Word!',
            textAlign: TextAlign.left,
          ),
          Text(
            'Hello Word! I am song' * 4,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            'Hello Word! I am song',
            textScaleFactor: 2.0,
          ),
          Text('Hello Word! I am song',
              style: new TextStyle(
                  color: Colors.blue,
                  backgroundColor: Colors.white,
                  fontFamily: '.SF UI Text',
                  fontSize: 14)),
          Text(
            'Hello Word! I am song' * 2,
            textAlign: TextAlign.center,
            style: new TextStyle(
                color: Colors.blue,
                fontSize: 18.0,
                height: 1.2,
                fontFamily: "Courier",
                background: new Paint()..color = Colors.yellow,
                decoration: TextDecoration.underline,
                decorationStyle: TextDecorationStyle.dashed),
          ),
          Text.rich(TextSpan(children: [
            TextSpan(text: "CSDN:"),
            TextSpan(
              text: "https://blog.csdn.net/qq_23575795",
              style: TextStyle(color: Colors.blue),
              //点击处理
//                recognizer: _

            ),

          ])),
          Text(
            'Hello Word! I am song' ,
            textAlign: TextAlign.center,
            style: defaultStyle,
          ),

          Text(icons,
            style: TextStyle(
              fontFamily: "MaterialIcons",
              fontSize: 24.0,
              color: Colors.green
            ),
          ),
        ],
      ),

    );
  }
}
