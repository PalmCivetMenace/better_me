import 'package:flutter/material.dart';

class GetUserInfo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _GetUserInfoState();
  }
}

class _GetUserInfoState extends State<GetUserInfo>{
  @override
  List<String> mainSubjects=["Mathematics","Science","Hand Crafting","Public Speaking","Programming","Management"];
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tell us about yourself"),
      ),
      body: Column(
        children: <Widget>[
          Card(
            child: ListTile(
              title: Text(
                  "Select three of the things that you believe that you are exceptionally good in"),
            ),
            
          ),
          Expanded(child: ListView.builder(

            itemBuilder: (context,index)=>checkBoxBuilder(context,index),
            itemCount: mainSubjects.length,
          ),),
          RaisedButton(child: Text("Done"),onPressed: (){},)
        ],
      ),
    
    );
  }
  checkBoxBuilder(BuildContext context,int index)
  {
    return Card(child: ListTile(title: Text(mainSubjects[index])));
  }
}
