import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ottprime/OTT/Prime%20Splash.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'OTT/Modeltheme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyCbR6FkrA4v9K272d1Dj1zi1OooBr4u0k8",
        appId: "1:416606115008:web:8960b3e8fbf237d2bb0925",
        messagingSenderId:"416606115008",
        projectId: "primeott-d8dd1",
      )
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ModelTheme(),
      child: Consumer<ModelTheme>(
          builder: (context, ModelTheme themeNotifier, child) {
            return MaterialApp(
              builder: (context, child) => ResponsiveWrapper.builder(child,
                  maxWidth: 1200,
                  minWidth: 480,
                  defaultScale: true,
                  breakpoints: [
                    ResponsiveBreakpoint.resize(480, name: MOBILE),
                    ResponsiveBreakpoint.autoScale(800, name: TABLET),
                    ResponsiveBreakpoint.resize(1000, name: DESKTOP),
                  ],
                  background: Container(color: Color(0xFFF5F5F5))),
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: themeNotifier.isDark
                  ? ThemeData(
                useMaterial3: true,
                colorScheme: ColorScheme.fromSeed(
                    brightness: Brightness.dark, seedColor: Colors.green),
                textTheme: GoogleFonts.montserratTextTheme(
                    Theme.of(context).textTheme),
                primaryTextTheme: GoogleFonts.montserratTextTheme(
                    Theme.of(context).textTheme),
              )
                  : ThemeData(
                useMaterial3: true,
                colorScheme: ColorScheme.fromSeed(
                    brightness: Brightness.light, seedColor: Colors.red),
                textTheme: GoogleFonts.montserratTextTheme(
                    Theme.of(context).textTheme)
                    .apply(bodyColor: Colors.black),
                primaryTextTheme: GoogleFonts.montserratTextTheme(
                    Theme.of(context).textTheme)
                    .apply(bodyColor: Colors.black),
              ),
              home: ott(),
            );
          }),
    );  }
}
