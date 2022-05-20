import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit_app/data_service.dart';
import 'package:flutter_cubit_app/post.dart';

abstract class PostEvent {}

class LoadPostsEvent extends PostEvent {}

class PullToRefreshEvent extends PostEvent {}

abstract class PostState {}

class LoadingPostsState extends PostState {}

class LoadedPostsState extends PostState {
  List<Post> posts;
  LoadedPostsState({
    required this.posts,
  });
}

class FailedToLoadPostsState extends PostState {
  String error;
  FailedToLoadPostsState({
    required this.error,
  });
}

class PostsBloc extends Bloc<PostEvent, PostState> {
  final _dataService = DataService();

  PostsBloc() : super(LoadingPostsState()) {
    on((event, emit) async {
      if (event is LoadPostsEvent || event is PullToRefreshEvent) {
        emit(LoadingPostsState());
        try {
          final posts = await _dataService.getPosts();
          emit(LoadedPostsState(posts: posts));
        } catch (e) {
          emit(FailedToLoadPostsState(error: e.toString()));
        }
      }
    });
  }
}
