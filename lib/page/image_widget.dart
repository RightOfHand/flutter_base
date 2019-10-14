
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget{

  Widget avatar=Image.asset("images/head.png",
    width: 150.0,
    height: 150.0,
  );
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text('图片'),
      ),
      body: Column(
        children: <Widget>[
          Image.asset("images/head.png",
            width: 150.0,
            height: 150.0,
          ),
          Image(
            image: NetworkImage('https://www.usanetwork.com/sites/usanetwork/files/styles/629x720/public/suits_cast_harvey.jpg?itok=fpTOeeBb'),
            width: 100.0),
          ClipOval(child: avatar), //剪裁为圆形
          ClipRRect( //剪裁为圆角矩形
            borderRadius: BorderRadius.circular(5.0),
            child: avatar,
          ),
          ClipRect(//将溢出部分剪裁
            child: Align(
              alignment: Alignment.topLeft,
              widthFactor: .5,//宽度设为原来宽度一半
              child: avatar,
            ),
          ),
          ClipRect(//将溢出部分剪裁
            child: Align(
              alignment: Alignment.topLeft,
              heightFactor: .5,//宽度设为原来宽度一半
              child: avatar,
            ),
          ),
          ClipRect(//将溢出部分剪裁
            child: Align(
              alignment: Alignment.topLeft,
              widthFactor: .5,
              heightFactor: .5,//宽度设为原来宽度一半
              child: avatar,
            ),
          ),
        ],
      ),
    );
  }

}