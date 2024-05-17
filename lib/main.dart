import 'package:flutter/material.dart';
import 'package:cano_disenosvarios/sliver_tab_bar.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Barrios rosales josue gustavo",
      home: Scaffold(body: SliverTabBar()),
    );
  }
}
