import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_project/stores/list_store.dart';
import 'package:mobx_project/widgets/custom_icon_button.dart';
import 'package:mobx_project/widgets/custom_text_field.dart';

import 'login_screen.dart';

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  final ListStore listStore = ListStore();

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          margin: const EdgeInsets.fromLTRB(32, 0, 32, 32),
          child: Column(
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Tarefas',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 32),
                    ),
                    IconButton(
                      icon: Icon(Icons.exit_to_app),
                      color: Colors.white,
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => LoginScreen()));
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 16,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: <Widget>[
                        // Observer(
                        //   builder: (_) {
                        //     return CustomTextField(
                        //       controller: controller,
                        //       hint: 'Tarefa',
                        //       onChanged: listStore.setNewTodoTitle,
                        //       suffix: listStore.isFormValid
                        //           ? CustomIconButton(
                        //               radius: 32,
                        //               iconData: Icons.add,
                        //               onTap: () {
                        //                 listStore.addTodo();
                        //                 controller.clear();
                        //               },
                        //             )
                        //           : Container(), prefix:Icon(Icons.account_circle), textInputType: TextInputType.text, enabled: true,
                        //     );
                        //   },
                        // ),
                        const SizedBox(
                          height: 8,
                        ),
                        Expanded(
                          child: Text("Test"),
                          // child: Observer(
                          //   builder: (_) {
                          //     return ListView.separated(
                          //       itemCount: listStore.todoList.length,
                          //       itemBuilder: (_, index) {
                          //         final todo = listStore.todoList[index];
                          //         return Observer(
                          //           builder: (_) {
                          //             return ListTile(
                          //               title: Text(
                          //                 todo.title,
                          //                 style: TextStyle(
                          //                   decoration: todo.done
                          //                       ? TextDecoration.lineThrough
                          //                       : null,
                          //                   color: todo.done
                          //                       ? Colors.grey
                          //                       : Colors.black38,
                          //                 ),
                          //               ),
                          //               onTap: todo.toggleDone,
                          //             );
                          //           },
                          //         );
                          //       },
                          //       separatorBuilder: (_, __) {
                          //         return Divider();
                          //       },
                          //     );
                          //   },
                          // ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
