

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class  ImagePickerWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ImagePickerWidgetState();
  }

}

class _ImagePickerWidgetState extends State<ImagePickerWidget>{

  File _image;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker 使用'),
      ),

      body: Center(
        child: _image==null ? Text('还没选择'):Image.file(_image),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: '图片选择',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }

  Future getImage() async{
    var image=await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image=image;
    });
  }




}