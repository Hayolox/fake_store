import 'package:fake_store_app/bloc/bloc/store_bloc.dart';
import 'package:fake_store_app/pages/detail_page.dart';
import 'package:fake_store_app/pages/home_page.dart';
import 'package:fake_store_app/splass_screen.dart';
import 'package:fake_store_app/widget/bottom_navigation_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => StoreBloc(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SplashScreen(),
        '/navigationBar': (context) => const BottomNavigationBarWidget(),
        '/homePage': (context) => const HomePage(),
        '/DetailPage': (context) => const DetailPage(),
      },
    );
  }
}
