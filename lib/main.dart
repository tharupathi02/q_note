import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:q_note/src/features/authentication/screens/splash_screen/splash_screen.dart';
import 'package:q_note/src/utils/theme/theme.dart';

void main() {
  runApp(const QNote());
}

class QNote extends StatefulWidget {
  const QNote({super.key});

  @override
  State<QNote> createState() => _QNoteState();
}

class _QNoteState extends State<QNote> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Q Note',
      theme: QNoteTheme.lightTheme,
      darkTheme: QNoteTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
