import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'viewmodel/task_viewmodel.dart';
import 'view/task_list_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // ❗ BẮT BUỘC CHO SQLITE

  runApp(
    ChangeNotifierProvider(
      create: (_) => TaskViewModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TaskListScreen(),
    );
  }
}
