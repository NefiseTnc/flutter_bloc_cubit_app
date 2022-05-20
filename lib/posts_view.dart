import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit_app/post.dart';
import 'package:flutter_cubit_app/post_cubit.dart';

class PostView extends StatelessWidget {
  const PostView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Posts'),
        ),
        body: BlocBuilder<PostsCubit, List<Post>>(
          builder: (context, posts) {
            if (posts.isEmpty) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(posts[index].title),
                  ),
                );
              },
            );
          },
        ));
  }
}
