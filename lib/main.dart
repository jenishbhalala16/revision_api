import 'package:flutter/material.dart';
import 'package:revision_api/helper/helper_class.dart';
import 'package:revision_api/model/model_class.dart';

void main() {
  runApp(
    const MaterialApp(
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
        title: const Text("API"),
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
            return ListView.builder(
                itemCount: allDetails.length,
                itemBuilder: (BuildContext context, int i) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(allDetails[i].id.toString()),
                        Text(allDetails[i].email),
                        Text(allDetails[i].firstName),
                        Text(allDetails[i].lastName),
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    allDetails[i].image,
                                  ))),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  );
                });
          }
          return const Center(
            child: const CircularProgressIndicator(),
            //jghjghjghjghjgjughjuujghjgjjhgju
          );
        },
      ),
    );
  }
}
