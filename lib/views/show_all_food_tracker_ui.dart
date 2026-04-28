// ignore_for_file: sort_child_properties_last, unused_import
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_task_app/models/task.dart';
import 'package:flutter_task_app/services/supabase_service.dart';
import 'package:flutter_task_app/views/add_food_tracker_ui.dart';

class ShowAllFoodTrackerUi extends StatefulWidget {
  const ShowAllFoodTrackerUi({super.key});

  @override
  State<ShowAllFoodTrackerUi> createState() => _ShowAllFoodTrackerUiState();
}

class _ShowAllFoodTrackerUiState extends State<ShowAllFoodTrackerUi> {
  // สร้าง instance/object/ตัวแทนของ SupabaseService เพื่อเรียกใช้ฟังก์ชันการทำงานต่างๆ กับ Supabase
  final service = SupabaseService();

  // สร้างตัวแปรเพื่อเก็บข้อมูลที่จะดึงมาจาก Supabase เพื่อไปแสดงใน ListView
  List<Task> tasks = [];

  // สร้างเมธอดเพื่อดึงข้อมูล แล้วเอาข้อมูลที่ดึงมากำหนดให้กับตัวแปร
  void loadTasks() async {
    //ดึงข้อมูลจาก Supabase
    final data = await service.getAllTask();

    //เอาข้อมูลที่ดึงมา กำหนดให้กับตัวแปร
    setState(() {
      tasks = data;
    });
  }

  @override
  void initState() {
    super.initState();

    //เรียกใช้เมธอด loadTasks() ให้ทำงานตอนหน้าจอถูกเปิด
    loadTasks();
  }

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
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 15.0),
        child: FloatingActionButton(
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
        //ตำแหน่งของ FloatingActionButton
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // ส่วนของ Body
      body: Center(
        child: Column(
          children: [
            //ส่วนแสดงรูปโลโก้
            SizedBox(height: 50),
            Image.asset(
              'assets/icon/icon.png',
              width: 120,
              height: 120,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 50),
            //ส่วนของ ListView แสดงรายการข้อมูลงานที่ดึงมาจาก Supabase
            Expanded(
              child: ListView.builder(
                // จำนวนรายการใน ListView
                itemCount: tasks.length,
                // สร้างหน้าตาของแต่ละรายการใน ListView
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      left: 40,
                      right: 40,
                      top: 5,
                      bottom: 5,
                    ),
                    child: ListTile(
                      title: Text(
                        'กิน: ${tasks[index].foodName}',
                      ),
                      subtitle: Text(
                        // ternary operator ____ ? ____ : ______
                        'มื้อ: ${tasks[index].foodMeal}',
                      ),
                      trailing: Icon(
                        Icons.info,
                        color: Colors.green,
                      ),
                      leading: tasks[index].foodPrice == ''
                          ? Image.asset(
                              'assets/icon/icon.png',
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            )
                          : Image.network(
                              tasks[index].foodImagesUrl!,
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                      tileColor:
                          index % 2 == 0 ? Colors.blue[200] : Colors.grey,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
