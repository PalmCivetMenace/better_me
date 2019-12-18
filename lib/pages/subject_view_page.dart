import 'package:better_me/pages/job_description.dart';
import 'package:flutter/material.dart';

import './job_description.dart';

class SubjectView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SubjectViewState(null);
  }
}

class _SubjectViewState extends State<SubjectView> {
  String searchCriteria;
  _SubjectViewState(this.searchCriteria);
  Icon questionIcon = Icon(Icons.question_answer);
  Icon goIcon = Icon(Icons.play_arrow);
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
          appBar: AppBar(
            title: Text("Your Tree"),
          ),
          backgroundColor: Colors.blueGrey[900],
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Card(
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  color: Theme.of(context).accentColor,
                  child: ListTile(
                    title: Text("What do you want to become"),
                    onTap: () => showModal(),
                    leading: questionIcon,
                    subtitle: searchCriteria == null
                        ? Text("Search")
                        : Text(searchCriteria),
                  ),
                ),
                searchCriteria == null
                    ? Container(
                        height: 0,
                      )
                    : Card(
                        margin: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        color: Theme.of(context).accentColor,
                        child: ListTile(
                          title:
                              Text("Learn About becoming a " + searchCriteria),
                          leading: goIcon,
                          onTap: () => goToDescription(),
                        ),
                      ),
              ],
            ),
          ),
        );
  }

  showModal() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Center(
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: questionIcon,
                  title: Text("What do you want to become"),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 40.0),
                  child: TextField(
                    autofocus: true,
                    onSubmitted: (value) {
                      Navigator.pop(context, value);
                    },
                  ),
                )
              ],
            ),
          );
        }).then((value) {
      if (value != null) {
        setState(() {
          searchCriteria = value;
        });
      }
    });
  }

  void goToDescription() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => JobDescription(searchCriteria)));
  }
}
