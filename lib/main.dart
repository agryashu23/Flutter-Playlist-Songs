import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gym/Days.dart';
import 'package:gym/Pages/FavPlans.dart';
import 'package:gym/Pages/HomePage.dart';
import 'package:gym/Pages/Progress.dart';
import 'package:gym/ScreenPage.dart';
import 'package:gym/WorkFav.dart';
 import 'package:gym/provider.dart';
import 'package:gym/schedule.dart';
import 'package:gym/search.dart';
import 'package:gym/table.dart';
import 'package:gym/yess.dart';
import 'package:provider/provider.dart';

import 'Actions/cjik.dart';
import 'Diet.dart';
import 'Pages/Plans.dart';
import 'Plans.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
      ChangeNotifierProvider(
        create: (context) => FormModel(),
        child: const MyApp(),
  )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:TExist(),
      debugShowCheckedModeBanner: false,
    );
  }
}



