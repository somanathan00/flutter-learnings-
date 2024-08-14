import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:block/features/posts/models/post_model.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc() : super(PostsInitial()) {
    on<PostInitialFetchEvent>(postInitialFetchEvent);
  }

  FutureOr<void> postInitialFetchEvent(
      PostInitialFetchEvent event, Emitter<PostsState> emit) async {
    var client = http.Client();
    List<PostModel> posts = [];
    try {
      var response = await client.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts/'),
      );
      if (response.statusCode == 200) {
        List result = jsonDecode(response.body);
        for (int i = 0; i < result.length; i++) {
          PostModel post = PostModel.fromMap(result[i] as Map<String, dynamic>);
          posts.add(post);
        }
        emit(PostFetchingSuccessfulState(posts: posts));
      } else {
        emit(PostFetchingFailedState(
            error: 'Failed to fetch posts with status code: ${response.statusCode}'));
      }
    } catch (e) {
      emit(PostFetchingFailedState(error: e.toString()));
      log(e.toString());
    } finally {
      client.close();
    }
  }
}
