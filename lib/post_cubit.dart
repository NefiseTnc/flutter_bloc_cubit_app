import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit_app/data_service.dart';
import 'package:flutter_cubit_app/post.dart';

class PostsCubit extends Cubit<List<Post>> {
  final _dataService = DataService();

  PostsCubit() : super([]);

  Future<void> getPosts() async => emit(await _dataService.getPosts());
}
