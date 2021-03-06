import 'package:flutter/material.dart';
import 'package:flutter_get_example/models/todo.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class TodoController extends GetxController {
  var todos = <Todo>[].obs;
  final textController = new TextEditingController(text: "").obs;

  @override
  void onInit() {
    List storage = GetStorage().read("todos");
    if (storage != null) {
      todos = storage
          .map((json) => Todo.fromJson(json))
          .toList()
          .reversed
          .toList()
          .obs;
    }

    ever(todos, (_) {
      GetStorage().write("todos", todos.toList());
    });
    super.onInit();
  }

  void onPressed(bool add, int index) {
    if (add) {
      todos.add(Todo(
          text: textController.value.text, date: DateTime.now().toString()));
    } else {
      var todo = todos[index];
      todo.text = textController.value.text.trim();
      todo.date = DateTime.now().toString();
      todos[index] = todo;
    }
    textController.value = TextEditingController(text: "");
    Get.back();
  }

  void checkOnChanged(int index, bool value) {
    var todo = todos[index];
    todo.done = value;
    todos[index] = todo;
  }

  @override
  void onClose() {
    textController?.close();

    super.onClose();
  }
}
