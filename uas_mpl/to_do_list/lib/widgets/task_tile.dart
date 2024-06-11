import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String taskTitle;
  final bool isChecked;
  final bool isFavorite;
  final void Function(bool?) checkboxCallback;
  final void Function()? onLongPressCallback;
  final void Function()? onEditCallback;
  final void Function()? onDeleteCallback;
  final void Function()? onFavoriteCallback; // Tambahkan parameter onFavoriteCallback

  TaskTile({
    required this.taskTitle,
    required this.isChecked,
    required this.isFavorite, // Tambahkan parameter isFavorite
    required this.checkboxCallback,
    this.onLongPressCallback,
    this.onEditCallback,
    this.onDeleteCallback,
    this.onFavoriteCallback, // Tambahkan parameter onFavoriteCallback
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: onLongPressCallback,
      title: Row(
        children: [
          IconButton(
            icon: Icon(
              Icons.star,
              color: isFavorite ? Colors.yellow : Colors.grey,
            ),
            onPressed: onFavoriteCallback, // Tambahkan callback onPressed
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
