import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Conexion {
  Future<void> connect() async {
    debugPrint("Connecting...");

    try {
      await Supabase.initialize(
          url: "${dotenv.env['SUPABASE_URL']}",
          anonKey: "${dotenv.env['SUPABASE_ANNON_KEY']}");

      debugPrint("Connect!!!");
    } catch (e) {
      debugPrint("Connecting...");
    }
  }

  Conexion() {
    connect();
  }
}
