// ignore_for_file: unused_import
import 'package:flutter/material.dart';
import 'package:flutter_task_app/views/add_food_tracker_ui.dart';
import 'package:flutter_task_app/views/update_delete_food_tracker_ui.dart';

class ShowAllFoodTrackerUi extends StatefulWidget {
  const ShowAllFoodTrackerUi({super.key});

  @override
  State<ShowAllFoodTrackerUi> createState() => _ShowAllFoodTrackerUiState();
}

class _ShowAllFoodTrackerUiState extends State<ShowAllFoodTrackerUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text(
          'FOOD TRACKER',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      //Floating Action Button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddFoodTrackerUi(),
            ),
          );
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.redAccent,
      ),
      //ตำแหน่งของ Floating Action Button
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}