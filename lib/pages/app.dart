import 'package:flutter/material.dart';
import 'package:make_provider/pages/home/index.dart';
import 'package:make_provider/providers/home_provider.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeProvider()),
      ],
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
