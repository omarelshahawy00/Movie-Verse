import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/helpers/get_it.dart';
import 'package:movie_app/features/search/data/repo/search_repo_impl.dart';
import 'package:movie_app/features/search/manager/cubit/search_cubit.dart';
import 'package:movie_app/features/search/ui/widgets/search_screen_body.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(getIt.get<SearchRepoImpl>()),
      child: const SearchScreenBody(),
    );
  }
}
