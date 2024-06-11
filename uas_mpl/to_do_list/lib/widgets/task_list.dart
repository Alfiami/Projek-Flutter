import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String taskTitle;
  final bool isChecked;
  final void Function(bool?) checkboxCallback;
  final void Function()? onLongPressCallback;
  final void Function()? onEditCallback;
  final void Function()? onDeleteCallback;

  TaskTile({
    required this.taskTitle,
    required this.isChecked,
    required this.checkboxCallback,
    this.onLongPressCallback,
    this.onEditCallback,
    this.onDeleteCallback,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: onLongPressCallback,
      title: Row(
        children: [
          Icon(
            Icons.star,
            color: isChecked ? Colors.yellow : Colors.grey,
          ),
          SizedBox(width: 10.0),
          Text(
            taskTitle,
            style: TextStyle(
              decoration: isChecked ? TextDecoration.lineThrough : null,
            ),
          ),
        ],
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: onEditCallback,
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: onDeleteCallback,
          ),
          Checkbox(
            value: isChecked,
            activeColor: Colors.lightBlueAccent,
            onChanged: checkboxCallback,
          ),
        ],
      ),
    );
  }
}
