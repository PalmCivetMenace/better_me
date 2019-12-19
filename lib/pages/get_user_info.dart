import 'package:flutter/material.dart';
import './subject_view_page.dart';
import '../services.dart';

class GetUserInfo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _GetUserInfoState();
  }
}

class _GetUserInfoState extends State<GetUserInfo> {
  @override

  final int maxOptions = 3;
  List<bool> checkbox = [];
  List<String> choosen = [];
  List<String> mainSubjects = [
    "Mathematics",
    "Science",
    "Hand Crafting",
    "Public Speaking",
    "Programming",
    "Management"
  ];
  void initState() {
    for (int i = 0; i < mainSubjects.length; i++) {
      setState(() {
        checkbox.add(false);
      });
    }
    super.initState();
  }

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
                  "Select three of the things that you believe that you are exceptionally good in.Dont worry we can add more or remove competencies later"),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => checkBoxBuilder(context, index),
              itemCount: mainSubjects.length,
            ),
          ),
          RaisedButton(
            child: Text("Done"),
            onPressed: () {
              choosen.length == maxOptions
                  ? goToMoreUserInfo()
                  : showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            title: Text("Incomplete"),
                            content: Text("Please tick 3 boxes"),
                          ));
            },
          )
        ],
      ),
    );
  }

  checkBoxBuilder(BuildContext context, int index) {
    return Card(
      child: CheckboxListTile(
        value: checkbox[index],
        title: Text(mainSubjects[index]),
        onChanged: (value) {
          if (value) {
            if (choosen.length < maxOptions) {
              setState(() {
                checkbox[index] = value;
                choosen.add(mainSubjects[index]);
              });
            } else {
              setState(() {
                checkbox[index] = false;
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text("You can select only 3"),
                ));
              });
            }
          } else {
            setState(() {
              choosen.remove(mainSubjects[index]);
              checkbox[index] = value;
            });
          }
        },
      ),
    );
  }

  void goToMoreUserInfo() {
//    Services.getInitialSubjects(choosen).then((subjects) {
//      print('Output:${subjects.length}');
//
//    });
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => SubjectView()));
  }
}
