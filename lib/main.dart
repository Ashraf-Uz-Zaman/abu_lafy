import 'package:abu_lafy/application/dependency_injection.dart';
import 'package:flutter/material.dart';

import 'application/app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized(); //widget binding for dependency injection
  await initAppModule();
  runApp(MyApp());
}

