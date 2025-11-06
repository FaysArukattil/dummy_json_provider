import 'package:dummy_json_provider/controllers/quotescontroller.dart';
import 'package:dummy_json_provider/services/networkservice.dart';
import 'package:dummy_json_provider/views/networkscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<Quotescontroller>(
          create: (_) => Quotescontroller()..fetchquotes(),
        ),
        ChangeNotifierProvider<NetworkService>(create: (_) => NetworkService()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: FlutterSmartDialog.init(),
      debugShowCheckedModeBanner: false,
      home: Networkscreen(),
      navigatorObservers: [FlutterSmartDialog.observer],
    );
  }
}
