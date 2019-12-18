import 'package:flutter/material.dart';

import './subject_description.dart';

import 'package:http/http.dart' as http;

class JobDescription extends StatelessWidget {
  @override
  
  final String job;
  http.Response x;
  final List<Map<String, List<Map<String, List<String>>>>> req = [
    {
      "chemistry": [
        {
          "videos": ["cas", "asd", "asd"]
        },
        {
          "boooks": ["asd", "asd", "asd"]
        },
        {
          "certifications": ["asd", "asd", "asd"]
        }
      ]
    },
    {
      "calculus": [
        {
          "videos": ["cas", "asd", "asd"]
        },
        {
          "boooks": ["asdsd", "sasasd", "ssasd"]
        },
        {
          "certifications": ["ssasd", "ssasd", "ssasd"]
        }
      ]
    }
  ];
  JobDescription(this.job);

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(job)),
        body: Center(
          child: req == null
              ? Text("Sorry We dont have anything regarding" +
                  job +
                  " in our data bases")
              : showSubjects(),
        ));
  }

  Widget showSubjects() {
    return Column(
      children: <Widget>[
        Card(
          child: ListTile(
            title: Text(
                "You will need to learn the following. Click on one to begin"),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: req.length,
            itemBuilder: (context, index) => makeCard(context, index),
          ),
        ),

      ],
    );
  }

  //fetchPost().then((value)=>print(value.toString()));
  //Future <http.Response> fetchPost()
  //{
  //  return http.get('https://jsonplaceholder.typicode.com/posts/1');
  //}

  Widget makeCard(BuildContext context, int index) {
    var currentSub = req[index];
    String subjectName = currentSub.keys.toList()[0];
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
      child: ListTile(
          title: Text(subjectName),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    SubjectDescription(subjectName, req[index][subjectName]),
              ),
            );
          }),
    );
  }
}
