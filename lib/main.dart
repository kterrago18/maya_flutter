import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';

import 'app.dart';
import 'core/configs/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const App());
}
