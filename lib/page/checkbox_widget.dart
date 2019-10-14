import 'package:flutter/material.dart';
import 'package:flutter_demo/eventbus/event_bus.dart';

class CheckBoxWidget extends StatefulWidget {
  @override
  _CheckBoxWidgetState createState() => new _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  //定义一个controller
  TextEditingController _unameController = TextEditingController();
  TextEditingController _pwdController = new TextEditingController();

  GlobalKey _formKey=new GlobalKey<FormState>();

  String eventInfo='';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    bus.on('login', (arg){
      print('login'+arg);
    });
    _unameController.addListener((){
      print(_unameController.text);
    });
  }
  @override
  Widget build(BuildContext context) {
    bool _switchSelected = true; //单选开关
    bool _checkboxSelected = true; //复选开关
    // TODO: implement build
    return new Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Switch(
            value: _switchSelected,
            onChanged: (bool value) {
              setState(() {
                _switchSelected = value;
              });
            },

          ),
          Checkbox(
            value: _checkboxSelected,
            activeColor: Colors.red, //选中时的颜色
            onChanged: (bool value) {
              setState(() {
                _checkboxSelected = value;
              });
            },
          ),

          TextField(
            controller: _unameController,
            autofocus: true,
            decoration: InputDecoration(
                labelText: "用户名",
                hintText: "用户名或邮箱",
                prefixIcon: Icon(Icons.person)
            ),
            textInputAction: TextInputAction.next,

          ),
          TextField(
            decoration: InputDecoration(
                labelText: "密码",
                hintText: "您的登录密码",
                prefixIcon: Icon(Icons.lock)
            ),
            obscureText: true, //是否隐藏编辑的文本
            textInputAction: TextInputAction.done,
            onChanged: (v){
              print("TextField: $v");
            },
          ),

          Form(
            key: _formKey,  //设置globalKey,用于后面获取FormState
            autovalidate: true, //开启校验
            child: Column(
              children: <Widget>[
                TextFormField(
                    autofocus: true,
                    controller: _unameController,
                    decoration: InputDecoration(
                        labelText: "用户名",
                        hintText: "用户名或邮箱",
                        icon: Icon(Icons.person)
                    ),
                    // 校验用户名
                    validator: (v) {
                      return v
                          .trim()
                          .length > 0 ? null : "用户名不能为空";
                    }

                ),
                TextFormField(
                    controller: _pwdController,
                    decoration: InputDecoration(
                        labelText: "密码",
                        hintText: "您的登录密码",
                        icon: Icon(Icons.lock)
                    ),
                    obscureText: true,
                    //校验密码
                    validator: (v) {
                      return v
                          .trim()
                          .length > 5 ? null : "密码不能少于6位";
                    }
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 28.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: RaisedButton(
                          padding: EdgeInsets.all(15.0),
                          child: Text("登录}"),
                          color: Theme
                              .of(context)
                              .primaryColor,
                          textColor: Colors.white,
                          onPressed: () {
                            //在这里不能通过此方式获取FormState，context不对
                            //print(Form.of(context));

                            // 通过_formKey.currentState 获取FormState后，
                            // 调用validate()方法校验用户名密码是否合法，校验
                            // 通过后再提交数据。
                            if((_formKey.currentState as FormState).validate()){
                              //验证通过提交数据
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),


          )



        ],
      ),
    );
  }
}
