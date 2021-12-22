import 'package:flutter/material.dart';
import 'package:practic_crud_api/model/userlist.dart';
import 'package:practic_crud_api/screen/DetailScreen.dart';
import 'package:practic_crud_api/screen/post_request.dart';
import 'package:practic_crud_api/services/db_services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<UserList> _list = [];
  final ApiService _apiService = ApiService();

  getAllTodo() async {
    final result = await _apiService.getAllTodo();

    _list.clear();

    _list.addAll(result);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    _apiService.getAllTodo().then((value) {
      _list.addAll(value);
      print(_list);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Api"),
        ),
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Row(
                    children: [
                      TextButton.icon(
                        style: TextButton.styleFrom(
                          textStyle: TextStyle(color: Colors.blue),
                          backgroundColor: Colors.white,
                          shape:RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24.0),
                          ),
                        ),
                        onPressed: () => {
                        Navigator.of(context).push(MaterialPageRoute( builder: (context) => PostRequest()))
                        },
                        icon: Icon(Icons.send_rounded,),
                        label: Text('Post Request',),
                      ),
                      TextButton.icon(
                        style: TextButton.styleFrom(
                          textStyle: TextStyle(color: Colors.blue),
                          backgroundColor: Colors.white,
                          shape:RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24.0),
                          ),
                        ),
                        onPressed: () => {},
                        icon: Icon(Icons.send_rounded,),
                        label: Text('Update Request',),
                      ),
                      TextButton.icon(
                        style: TextButton.styleFrom(
                          textStyle: TextStyle(color: Colors.blue),
                          backgroundColor: Colors.white,
                          shape:RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24.0),
                          ),
                        ),
                        onPressed: () => {},
                        icon: Icon(Icons.send_rounded,),
                        label: Text('Delete Request',),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 8,
              child: ListView.builder(
                itemCount: _list.length,
                reverse: true,
                padding: EdgeInsets.all(5),
                itemBuilder: (context, index) {
                  var list = _list[index];
                  return Card(
                    child: ListTile(
                      leading: Text("${list.id}"),
                      title: Text(list.title!),
                      trailing: const Image(
                        image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                        height: 45,
                        width: 45,
                        fit: BoxFit.cover,
                      ),
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailScreen(task: _list[index]),
                          ),
                        );
                      },

                    ),
                  );
                },
              ),
            )

          ],
        ));
  }
}
