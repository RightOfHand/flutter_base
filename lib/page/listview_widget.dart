
import 'package:flutter/material.dart';
import '../models/chat_model.dart';

class ListViewWidget extends StatefulWidget{
  @override
  _ListViewState createState() {
    // TODO: implement createState
    return new _ListViewState();
  }

}

class _ListViewState extends State<ListViewWidget>{

  //下划线widget预定义以供复用。
  Widget divider1=Divider(color: Colors.blue,);
  Widget divider2=Divider(color: Colors.green);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new ListView.builder(
        itemCount: dummyData.length,
        itemBuilder: (context,i)=> new Column(
          children: <Widget>[
            new Divider(
              height: 10.0,
            ),
            new ListTile(
              leading: new CircleAvatar(
                foregroundColor: Theme.of(context).primaryColor,
                backgroundColor: Colors.grey,
                backgroundImage: new NetworkImage(dummyData[i].avatarUrl),
              ),
              title: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Text(
                    dummyData[i].name,
                    style: new TextStyle(fontWeight: FontWeight.bold),
                  ),
                  new Text(
                    dummyData[i].time,
                    style: new TextStyle(color: Colors.grey, fontSize: 14.0),
                  ),
                ],
              ),
              subtitle: new Container(
                padding: const EdgeInsets.only(top: 5.0),
                child: new Text(
                  dummyData[i].message,
                  style: new TextStyle(color: Colors.grey, fontSize: 15.0),
                ),
              ),
            )
          ],
        ),

    );
  }

}