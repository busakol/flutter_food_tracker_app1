import 'package:flutter/material.dart';
import 'package:flutter_task_app/views/splash_screen_ui.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  //-------------------การกำหนดค่าการติดต่อกับ project บน Supervase ที่จพทำงานด้วย------------------------
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://buygusvsmvajhphowlmh.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJ1eWd1c3ZzbXZhamhwaG93bG1oIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzUyMDkyMzMsImV4cCI6MjA5MDc4NTIzM30.dV9IluBbG4Efqvt9WE-G1_zPHf3lPwLJ6W39vvkf5ps',
  );

  //-------------------------------------------------------------------------------------------------
  runApp(
    FlutterTaskApp(),
  );
}

class FlutterTaskApp extends StatefulWidget {
  const FlutterTaskApp({super.key});

  @override
  State<FlutterTaskApp> createState() => _FlutterTaskAppState();
}

class _FlutterTaskAppState extends State<FlutterTaskApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreenUi(),
      theme: ThemeData(
        textTheme: GoogleFonts.promptTextTheme(Theme.of(context).textTheme),
      ),
    );
  }
}
