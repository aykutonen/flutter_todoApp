import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/todos_provider.dart';

class ChangeNameText extends StatelessWidget {
  const ChangeNameText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top : 20.0),
      child: Consumer<TodosProvider>(
        builder: (context, state,child) => Text('Change Name',style: TextStyle(fontSize: 20),
    ),
      ),
    );
  }
}
