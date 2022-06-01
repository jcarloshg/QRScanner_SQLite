import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sec_9_qrreader/services/scan_list_provider.dart';
import 'package:sec_9_qrreader/services/ui_provider.dart';
import 'package:sec_9_qrreader/src/pages/pages.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UIProvider()),
        ChangeNotifierProvider(create: (context) => ScanListProvider()),
      ],
      child: MaterialApp(
        title: 'QR Reader',
        debugShowCheckedModeBanner: false,
        initialRoute: 'Home',
        routes: {
          'Home': (_) => const Home(),
          'Map': (_) => const Map(),
        },
        theme: ThemeData(
          primaryColor: Colors.red,
          appBarTheme: const AppBarTheme(
            color: Colors.deepPurple,
          ),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Colors.deepOrangeAccent,
          ),
        ),
      ),
    );
  }
}
