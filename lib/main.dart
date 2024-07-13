import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:movie_app/injection_container.dart';
import 'package:movie_app/presentation/bloc/popular_movies_bloc/popular_movies_bloc.dart';
import 'package:movie_app/presentation/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie App',
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(),
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        appBarTheme: const AppBarTheme(
          color: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      home: BlocProvider(
          create: (context) =>
              getIt<PopularMoviesBloc>()..add(FetchPopularMoviesEvent()),
          child: const FirstPage()),
    );
  }
}

class FirstPage extends StatefulWidget {
  const FirstPage({
    super.key,
  });

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  late bool hasInternet;
  late Future<void> future;

  @override
  void initState() {
    super.initState();
    hasInternet = true;
    future = init();
  }

  Future<void> init() async {
    await checkInternet();
    if (mounted) {
      setState(() {});
    }
    method();
  }

  Future<void> checkInternet() async {
    try {
      var url = Uri.https('www.example.com', '');
      await http.get(url);
      hasInternet = true;
    } catch (e) {
      hasInternet = false;
    }
  }

  Future<void> method() async {
    await Future.delayed(const Duration(seconds: 20));
    await checkInternet();
    if (mounted) {
      setState(() {});
    }
    method();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        if (!hasInternet) {
          return Scaffold(
            appBar: AppBar(
              systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarColor: Colors.transparent,
                statusBarIconBrightness: Brightness.dark,
              ),
            ),
            backgroundColor: Colors.white,
            body: Center(
              child: LottieBuilder.asset('assets/lottie/no_internet.json'),
            ),
          );
        }

        return const HomePage();
      },
    );
  }
}
