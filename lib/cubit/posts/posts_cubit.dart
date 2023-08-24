import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trauxit_task/models/post_model.dart';

import '../../core/services/dio_helper.dart';
import '../../res/res_api_names.dart';
import 'posts_states.dart';

class PostsCubit extends Cubit<PostsStates> {
  PostsCubit() : super(PostsInitState()) {
    getPosts();
  }

  static PostsCubit get(context) => BlocProvider.of(context);
  final _api = DioHelperPosts.instance;

  List<PostModel> posts = [];
  Future<void> getPosts() async {
    emit(GetPostsLoadingState());

    _api.getData(ApiNames.getPosts).then((value) {
      final data = value.data;

      if (value.statusCode == 200) {
        posts.clear();
        for (var item in data) {
          posts.add(PostModel.fromJson(item));
        }
        emit(GetPostsSucccessState());
      } else if (value.statusCode == 400) {
        emit(GetPostsErrorState());
      } else if (value.statusCode == 442) {
        emit(GetPostsErrorState());
      } else {
        emit(GetPostsErrorState());
      }
    }).catchError((e) {
      emit(GetPostsErrorState());
    });
  }
}
