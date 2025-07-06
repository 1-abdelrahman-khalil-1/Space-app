import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_app/Core/Services/get_it.dart';
import 'package:space_app/Core/utils/apptextstyles.dart';
import 'package:space_app/Core/utils/widgets/mybottom_navigation_bar.dart';
import 'package:space_app/Features/News%20Screen/presentation/cubit/news_cubit.dart';
import 'package:space_app/Features/News%20Screen/presentation/view/widgets/news_screen_body_blocbuilder.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NewsCubit>(
      create: (context) => get_it<NewsCubit>(),
      child: SafeArea(
        child: Scaffold(
          bottomNavigationBar: MybottomNavigationBar(selectedindex: 1),
          body: const NewsScreenBodyBlocBuilder(),
        ),
      ),
    );
  }
}
