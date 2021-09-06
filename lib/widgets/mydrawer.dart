import 'package:flutter/material.dart';
import 'package:flutter_wordpress_api_get_post/screens/pageDetail.dart';
import 'package:flutter_wordpress_api_get_post/services/page.dart';

class MyDrawer extends StatefulWidget {
  MyDrawer({Key? key}) : super(key: key);

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  MyPage pageService = MyPage();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.pinkAccent[200],
        child: Column(
          children: [
            Expanded(
                child: Container(
              child: FutureBuilder<List>(
                future: pageService.getAllPage(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data?.length == 0) {
                      return Center(
                        child: Text("No Page"),
                      );
                    }
                    return ListView.builder(
                        itemCount: snapshot.data?.length,
                        itemBuilder: (context, i) {
                          return ListTile(
                            title: Center(
                              child: Text(
                                snapshot.data?[i]['title']['rendered'],
                                style: TextStyle(
                                    fontSize: 22, color: Colors.white),
                              ),
                            ),
                            onTap: () => {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      PageDetail(data: snapshot.data?[i]),
                                ),
                              )
                            },
                          );
                        });
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ))
          ],
        ),
      ),
    );
  }
}
