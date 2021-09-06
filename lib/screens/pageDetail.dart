import 'package:flutter/material.dart';

class PageDetail extends StatelessWidget {
  final data;
  const PageDetail({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(data['title']['rendered']),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              data['content']['rendered']
                  .toString()
                  .replaceAll("<p>", "")
                  .replaceAll("</p>", ""),
              style: TextStyle(fontSize: 20.0),
            ),
          ),
        ],
      ),
    );
  }
}
