// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  final String taskname;
  final bool taskcompleted;
  final Function(bool?)? onChanged;
  Function(BuildContext)? deletefnction;

  TodoTile({
    Key? key,
    required this.taskname,
    required this.taskcompleted,
    required this.onChanged,
    required this.deletefnction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deletefnction,
              icon: Icons.delete,
              backgroundColor: const Color.fromARGB(255, 255, 159, 130),
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.deepOrange,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Checkbox(
                value: taskcompleted,
                onChanged: onChanged,
                checkColor:  Colors.black,
                activeColor: Colors.white,
                
              ),
              const SizedBox(width: 20), // Adjust as needed for spacing
              Expanded(
                child: Text(
                  taskname,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    decoration: taskcompleted ? TextDecoration.lineThrough : TextDecoration.none,
                    decorationColor: Colors.white
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
