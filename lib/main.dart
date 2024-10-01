import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocProviders.dart';
import 'injection_container.dart';
import 'src/presentation/pages/home/homePage.dart';
import 'src/presentation/theme/AppTheme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: blocProviders,
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Practica BLOC',
          theme: AppTheme.lightTheme(context),
          themeMode: ThemeMode.light,
          initialRoute: 'inicio',
          routes: {
            'inicio': (context) => const HomePage(),
          }),
    );
  }
}
