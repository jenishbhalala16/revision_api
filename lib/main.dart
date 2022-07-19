import 'package:flutter/material.dart';
import 'package:revision_api/helper/helper_class.dart';
import 'package:revision_api/model/model_class.dart';

void main() {
  runApp(
    MaterialApp(
      home: RevisionApi(),
    ),
  );
}

class RevisionApi extends StatefulWidget {
  const RevisionApi({Key? key}) : super(key: key);

  @override
  State<RevisionApi> createState() => _RevisionApiState();
}

class _RevisionApiState extends State<RevisionApi> {
  @override
  void initState() {
    // TODO: implement initState
    APIHelper.apiHelper.fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("API"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: APIHelper.apiHelper.fetchData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else if (snapshot.hasData) {
            List<Public> allDetails = snapshot.data;
            return ListView.builder(itemBuilder: (BuildContext context, int i) {
              return Column(
                children: [
                  Text(allDetails[i].name),
                  Text(allDetails[i].Descriptions),
                  SizedBox(
                    height: 15,
                  ),
                ],
              );
            });
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
