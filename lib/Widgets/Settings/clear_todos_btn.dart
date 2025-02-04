import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/todos_provider.dart';

class ClearTodosBtn extends StatelessWidget {
  const ClearTodosBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(top : 10.0 ,left : 10.0),
      child: ElevatedButton(
        onPressed:
          () {
          if(Provider.of<TodosProvider>(context,listen: false).checkAllTodos() == true) {
            Fluttertoast.showToast(
                msg: "Todo List is Empty",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0
            );
          } else {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    backgroundColor: HexColor('#f9f6e8'),
                    title: Text('Are you sure?'),
                    content: Text('You do realize that incomplete todos will also be deleted, right?'),
                    actions: [
                      ElevatedButton(onPressed: () {
                        Provider.of<TodosProvider>(context,listen: false).removeAllTodos();
                        Navigator.of(context).pop();
                        Fluttertoast.showToast(
                            msg: "Deleted!",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.greenAccent,
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                      }, child: Text('Delete all todos!')),
                      TextButton(onPressed: () {
                        Navigator.of(context).pop();
                        Fluttertoast.showToast(
                            msg: "Canceled!",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.orange,
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                      }, child: Text('Cancel')),
                    ],
                  );
                }
            );

          }
      }
        , child: const Text('Clear All Todos',style: TextStyle(fontSize: 10),),
        style: ElevatedButton.styleFrom(primary : Colors.red,shape: const StadiumBorder()),
      ),
    );
  }
}
