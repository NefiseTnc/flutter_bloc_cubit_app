import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit_app/post_bloc.dart';
import 'package:flutter_cubit_app/posts_view_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider<PostsBloc>(
          create: (BuildContext context) => PostsBloc()
            ..add(
              LoadPostsEvent(),
            ),
          child: const PostViewBloc()),
    );
  }
}
