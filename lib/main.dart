import 'package:flutter/material.dart';
import 'package:sv_app_create_school/pdf_test.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: PdfTest(),
    );
  }
}
