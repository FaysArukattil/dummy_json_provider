import 'package:dummy_json_provider/controllers/quotescontroller.dart';
import 'package:dummy_json_provider/views/quotesscreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<Quotescontroller>(
          create: (_) => Quotescontroller()..fetchquotes(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Quotesscreen());
  }
}
