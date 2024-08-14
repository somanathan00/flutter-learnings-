part of 'posts_bloc.dart';

@immutable
sealed class PostsState {}

abstract class PostActionState extends PostsState {}

final class PostsInitial extends PostsState {}

final class PostFetchingLoadingState extends PostsState {}

final class PostFetchingSuccessfulState extends PostsState {
  final List<PostModel> posts;

  PostFetchingSuccessfulState({
    required this.posts,
  });
}

final class PostFetchingFailedState extends PostsState {
  final String error;

  PostFetchingFailedState({
    required this.error,
  });
}
