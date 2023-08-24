import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/posts/posts_cubit.dart';
import '../../cubit/posts/posts_states.dart';
import 'widgets/post_item.dart';
import 'widgets/post_shimmer.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostsCubit, PostsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        PostsCubit cubit = PostsCubit.get(context);

        return ListView.separated(
          itemBuilder: (context, index) => state is GetPostsLoadingState
              ? const PostShimmer()
              : PostItem(postModel: cubit.posts[index]),
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          itemCount: state is GetPostsLoadingState ? 5 : cubit.posts.length,
        );
      },
    );
  }
}
