import 'package:challenge_tsoft/app.dart';
import 'package:challenge_tsoft/core/services/service_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await ServiceManager().init();
  runApp(const MyApp());
}
