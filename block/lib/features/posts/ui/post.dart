import 'package:block/features/posts/bloc/posts_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  late final PostsBloc postsBloc;

  @override
  void initState() {
    postsBloc = PostsBloc();
    postsBloc.add(PostInitialFetchEvent());
    super.initState();
  }

  @override
  void dispose() {
    postsBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Post Page")),
      ),
      body: BlocProvider(
        create: (_) => postsBloc,
        child: BlocConsumer<PostsBloc, PostsState>(
          listenWhen: (previous, current) => current is PostActionState,
          buildWhen: (previous, current) => current is! PostActionState,
          listener: (context, state) {
            if (state is PostFetchingFailedState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error)),
              );
            }
          },
          builder: (context, state) {
            if (state is PostsInitial) {
              return Center(child: CircularProgressIndicator());
            } else if (state is PostFetchingSuccessfulState) {
              final successState = state;

              return ListView.builder(
                padding: EdgeInsets.all(16),
                itemCount: successState.posts.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(16),
                    margin: EdgeInsets.only(bottom: 16),
                    color: Colors.grey.shade200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          successState.posts[index].title,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          successState.posts[index].body,
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            } else if (state is PostFetchingFailedState) {
              return Center(child: Text('Failed to fetch posts: ${state.error}'));
            } else {
              return SizedBox();
            }
          },
        ),
      ),
    );
  }
}
