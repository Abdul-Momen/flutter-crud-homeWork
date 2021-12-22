import 'package:darq/darq.dart';
import 'package:get/get.dart';
import 'package:practic_crud_api/model/post.dart';
import 'package:practic_crud_api/model/userlist.dart';


class ApiService {
  /// API client is used to communicate with REMOTE HTTP API
  final client = GetConnect();

  ///URL of the remote address with endpoint
  final url = "https://flutterfly.prohelika.org/api/todoitems";

  Future<List<UserList>> getAllTodo() async {
    List<UserList> todos = [];

    ///Actual REST call for GET request
    ///You will usually get JSON data
    var response = await client.get("https://jsonplaceholder.typicode.com/albums");

    /// Parsing JSON to dart types (TodoItem)
    todos = UserList.userListFromMap(response.bodyString!);

    ///Sort by todo.id
    var sorted = todos.orderByDescending((element) => element.id!).toList();

    return sorted;
  }

  Future<List<PostItem>> getAllItem() async {
    List<PostItem> items = [];

    ///Actual REST call for GET request
    ///You will usually get JSON data
    var response = await client.get("https://flutterfly.prohelika.org/api/todoitems");

    /// Parsing JSON to dart types (TodoItem)
    items = PostItem.listFromMap(response.bodyString!);

    ///Sort by todo.id
    var sorted = items.orderByDescending((element) => element.id!).toList();

    return sorted;
  }

  Future<PostItem> createItem(PostItem todoItem) async {
    ///Actual REST call for POST request
    ///A POST request requires a body in JSON format (Dart Map)
    var response = await client.post(url, {"name": todoItem.name});

    return PostItem.fromJson(response.bodyString!);
  }

/*  Future<void> updateTodo(int id, TodoItem todoItem) async {
    ///Actual REST call for PUT request
    ///A POST request requires the id in path and the full body of the object in JSON format (Dart Map)
    var response = await client.put("$url/$id", todoItem.toMap());
  }

  Future<void> deleteTodo(int id) async {
    ///Actual REST call for DELETE request
    ///A DELETE request requires id in the path
    var response = await client.delete("$url/$id");
  }*/
}