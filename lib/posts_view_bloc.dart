import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit_app/post_bloc.dart';

class PostViewBloc extends StatelessWidget {
  const PostViewBloc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Posts'),
        ),
        body: BlocBuilder<PostsBloc, PostState>(
          builder: (context, state) {
            if (state is LoadingPostsState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is LoadedPostsState) {
              return RefreshIndicator(
                onRefresh: () async {
                  BlocProvider.of<PostsBloc>(context).add(PullToRefreshEvent());
                },
                child: ListView.builder(
                  itemCount: state.posts.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(state.posts[index].title),
                      ),
                    );
                  },
                ),
              );
            } else if (state is FailedToLoadPostsState) {
              return Center(
                child: Text('Error occured: ${state.error}'),
              );
            } else {
              return Container();
            }
          },
        ));
  }
}
