import 'package:flutter/material.dart';
import 'package:practic_crud_api/model/post.dart';
import 'package:practic_crud_api/services/db_services.dart';

class PostRequest extends StatefulWidget {
  const PostRequest({Key? key}) : super(key: key);
  @override
  _PostRequestState createState() => _PostRequestState();
}

class _PostRequestState extends State<PostRequest> {

  List<PostItem> items = [];

  final ApiService _apiService = ApiService();


  getAllItem() async {
    final result = await _apiService.getAllItem();
    items.clear();
    items.addAll(result);
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _apiService.getAllItem().then((value) {
      items.addAll(value);
      print(items);
      setState(() {});
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Post Reqest"),),
      body: ListView.builder(
        itemCount: items.length,
        padding: EdgeInsets.all(5),
        itemBuilder: (context, index) {
          var item = items[index];
          return Card(
            child: ListTile(
              leading: Text("${item.id}"),
              title: Text(item.name!),
              trailing: const Image(
                image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                height: 45,
                width: 45,
                fit: BoxFit.cover,
              ),
              onTap: (){

              },

            ),
          );
        },
      ),

    );
  }
}
