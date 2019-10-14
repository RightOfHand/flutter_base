
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecondRoute extends StatelessWidget{
  final String title;
  SecondRoute ({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    
    var args=ModalRoute.of(context).settings.arguments;
    print(args);


    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('second page '),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child:Center(
          child: Column(
            children: <Widget>[
              Text('$title'),
              RaisedButton(
                //点及返回按钮   带参数返回
                onPressed: ()=>Navigator.pop(context,"router back value"),
                child: Text('back'),
              )
            ],
          ),
        )

      ),
    );
  }

}