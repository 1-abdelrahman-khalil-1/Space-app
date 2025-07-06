import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_app/Core/helper%20function/dialogloading.dart';
import 'package:space_app/Core/utils/apptextstyles.dart';
import 'package:space_app/Features/News%20Screen/data/models/news_model.dart';
import 'package:space_app/Features/News%20Screen/presentation/cubit/news_cubit.dart';
import 'package:space_app/Features/News%20Screen/presentation/cubit/news_cubit_state.dart';
import 'package:space_app/Features/News%20Screen/presentation/view/widgets/news_card.dart';
import 'package:space_app/Features/News%20Screen/presentation/view/widgets/news_carousel.dart';
import 'package:space_app/Features/News%20Screen/presentation/view/widgets/news_list.dart';
import 'package:space_app/Features/News%20Screen/presentation/view/widgets/news_screen_body.dart';

class NewsScreenBodyBlocBuilder extends StatefulWidget {
  const NewsScreenBodyBlocBuilder({super.key});
  
  @override
  State<NewsScreenBodyBlocBuilder> createState() => _NewsScreenBodyBlocBuilderState();
}

class _NewsScreenBodyBlocBuilderState extends State<NewsScreenBodyBlocBuilder> {
  @override
  void initState() {
    super.initState();
    context.read<NewsCubit>().getNasaNews();
  }

  // Helper method to distribute news items across categories for sections


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsCubitState>(
      builder: (context, state) {
        if (state is NewsLoading) {
          return DialogLoading(context);
        } else if (state is NewsLoaded) {
         
          return RefreshIndicator(
            onRefresh: () async {
              await context.read<NewsCubit>().getNasaNews();
            },
            child: NewsScreenBody(featuredNews: state.news.take(5).toList(), allNews: state.news),
          );
        } else  {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Failed to load news',
                  style: Apptextstyles.medium16.copyWith(color: Colors.white),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    context.read<NewsCubit>().getNasaNews();
                  },
                  child: Text(
                    'Try Again',
                    style: Apptextstyles.medium14.copyWith(color: Colors.black),
                  ),
                ),
              ],
            ),
          );
        }
        
        
      },
    );
  }
}