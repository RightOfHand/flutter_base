
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text("弹框"),
      ),
      body: Column(
        children: <Widget>[
          RaisedButton(
            child: Text('对话框'),
            textColor: Colors.blue,
            onPressed: () async {
              bool delte=  await showCancelAndConfirmDialog(context) ;
              if(delte==null){
                print("弹框取消按钮");
              }else{
                print("弹框确认按钮");
              }
            },
          ),
          RaisedButton(
            child: Text('列表框1'),
            textColor: Colors.blue,
            onPressed: () {
              changeLanguage(context);
            },
          ),
          RaisedButton(
            child: Text('列表框2'),
            textColor: Colors.blue,
            onPressed: () {
              showListDialog(context);
            },
          ),
          RaisedButton(
            child: Text('底部弹框'),
            textColor: Colors.blue,
            onPressed: () {
              _showModalBottomSheet(context);
            },
          ),

          RaisedButton(
            child: Text('ios 时间选择器'),
            textColor: Colors.blue,
            onPressed: () {
              _showDatePicker2(context);
            },
          ),
        ],
      ),
    );
  }

  //常规弹框
  Future<bool>  showCancelAndConfirmDialog(BuildContext context){
    return showDialog<bool>(
        context: context,
        //点击遮罩  不关闭
        barrierDismissible: false,
        builder: (context){
          return AlertDialog(
            title: Text("使用dialog"),
            content: Text("对话框内容"),
            actions: <Widget>[
              FlatButton(
                child: Text("取消"),
                onPressed: () => Navigator.of(context).pop(), //关闭对话框
              ),
              FlatButton(
                child: Text("确认"),
                onPressed: () {
                  // ... 执行删除操作
                  Navigator.of(context).pop(true); //关闭对话框
                },
              ),
            ],
          );
        }
    );
  }

  //列表弹框1
  Future<void> changeLanguage(BuildContext context) async {
    int i = await showDialog<int>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text('请选择语言'),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  // 返回1
                  Navigator.pop(context, 1);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: const Text('中文简体'),
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  // 返回2
                  Navigator.pop(context, 2);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: const Text('美国英语'),
                ),
              ),
            ],
          );
        });

    if (i != null) {
      print("选择了：${i == 1 ? "中文简体" : "美国英语"}");
    }
  }

  Future<void> showListDialog(BuildContext context) async {
    int index = await showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        var child = Column(
          children: <Widget>[
            ListTile(title: Text("请选择")),
            Expanded(
                child: ListView.builder(
                  itemCount: 30,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text("$index"),
                      onTap: () => Navigator.of(context).pop(index),
                    );
                  },
                )),
          ],
        );
        //使用AlertDialog会报错
        //return AlertDialog(content: child);
        return Dialog(child: child);
      },
    );
    if (index != null) {
      print("点击了：$index");
    }
  }

  // 弹出底部菜单列表模态对话框
  Future<int> _showModalBottomSheet(BuildContext context) {
    return showModalBottomSheet<int>(
      context: context,
      builder: (BuildContext context) {
        return ListView.builder(
          itemCount: 30,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text("$index"),
              onTap: () => Navigator.of(context).pop(index),
            );
          },
        );
      },
    );
  }

  Future<DateTime> _showDatePicker2(BuildContext context) {
    var date = DateTime.now();
    return showCupertinoModalPopup(
      context: context,
      builder: (ctx) {
        return SizedBox(
          height: 200,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.dateAndTime,
            minimumDate: date,
            maximumDate: date.add(
              Duration(days: 30),
            ),
            maximumYear: date.year + 1,
            onDateTimeChanged: (DateTime value) {
              print(value);
            },
          ),
        );
      },
    );
  }
}