import 'package:dachfest/domain/domain.dart';
import 'package:flutter/material.dart';

class TalkView extends StatelessWidget {
  final Talk talk;

  TalkView(
    this.talk,
  ) : assert(talk != null);

  @override
  Widget build(BuildContext context) {
    if (talk.id.isEmpty) {
      return Container();
    }
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(talk.title, style: TextStyle(fontSize: 20.0),),
          ],
        ),
      ),
    );
  }
}
