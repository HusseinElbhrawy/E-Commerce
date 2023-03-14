import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/app.dart';
import 'app/injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  var sharedPrefs = await SharedPreferences.getInstance();
  // await sharedPrefs.clear();

  runApp(MyApp());
}
