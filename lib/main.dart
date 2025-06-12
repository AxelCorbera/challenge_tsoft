import 'package:challenge_tsoft/app.dart';
import 'package:challenge_tsoft/core/services/service_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Punto de entrada principal de la aplicación.
Future<void> main() async {
  // Asegura que Flutter esté correctamente inicializado antes de ejecutar código asíncrono.
  WidgetsFlutterBinding.ensureInitialized();
  // Carga las variables de entorno desde el archivo `.env`.
  await dotenv.load(fileName: ".env");
  // Inicializa los servicios globales como el acceso a la API.
  await ServiceManager().init();
  runApp(const MyApp());
}
