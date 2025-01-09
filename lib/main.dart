import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:instrumen_hypoglyrisk/blocs/history/history_bloc.dart';
import 'package:instrumen_hypoglyrisk/blocs/screening/screening_bloc.dart';
import 'package:instrumen_hypoglyrisk/views/home/home_screen.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:permission_handler/permission_handler.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await requestStoragePermission();

  await Future.delayed(const Duration(seconds: 2));
  FlutterNativeSplash.remove();

  await initializeDateFormatting('id_ID', null).then(
    (_) => runApp(const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ScreeningBloc(),
        ),
        BlocProvider(
          create: (context) => HistoryBloc(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}

Future<void> requestStoragePermission() async {
  // Memeriksa status izin penyimpanan
  var status = await Permission.storage.status;

  if (status.isDenied) {
    // Jika izin ditolak, meminta izin
    status = await Permission.storage.request();
  }

  if (status.isGranted) {
    // print("Izin penyimpanan diberikan!");
  } else if (status.isPermanentlyDenied) {
    // print(
    // "Izin penyimpanan ditolak secara permanen. Buka pengaturan untuk mengubahnya.");
    // Membuka pengaturan aplikasi
    openAppSettings();
  }
}
