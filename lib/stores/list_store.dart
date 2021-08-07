import 'package:mobx/mobx.dart';
import 'package:mobx_project/stores/todo_store.dart';

part 'list_store.g.dart';

class ListStore = _ListSotre with _$ListStore;

abstract class _ListSotre with Store {
  @observable
  String newTodoTitle = "";

  @action
  void setNewTodoTitle(String value) => newTodoTitle = value;

  @computed
  bool get isFormValid => newTodoTitle.isNotEmpty;

  ObservableList<TodoStore> todoList = ObservableList<TodoStore>();

  @action
  void addTodo() {
    todoList.insert(0, TodoStore(newTodoTitle));
    newTodoTitle = "";
  }
}
