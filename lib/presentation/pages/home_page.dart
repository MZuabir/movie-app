import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/presentation/bloc/popular_movies_bloc/popular_movies_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movie app"),
        backgroundColor: Colors.deepPurple,
      ),
      body: BlocBuilder<PopularMoviesBloc, PopularMoviesState>(
          builder: (context, state) => Container(
                height: 40,
                color: Colors.orange,
              )),
    );
  }
}
