import 'package:flutter/material.dart';

class SubjectDescription extends StatelessWidget {
  final String subject;
  final List<Map<String, List<String>>> subjectDetails;
  SubjectDescription(this.subject, this.subjectDetails);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(subject)),
        body: Column(
          children: <Widget>[
            Card(
              child: ListTile(
                title: Text(
                    "These are some of the best resources for you to learn" +
                        subject),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: subjectDetails.length,
                itemBuilder: (context, index) =>
                    makeExpansionTiles(context, index),
              ),
            )
          ],
        ));
  }

  Widget makeExpansionTiles(BuildContext context, int index) {
    String type = subjectDetails[index].keys.toList()[0];
    return ExpansionTile(
        title: Text(type),
        children: subjectDetails[index][type]
            .map((element) => Text(element))
            .toList());
  }
}
