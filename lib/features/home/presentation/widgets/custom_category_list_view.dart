import 'package:dalel/features/home/presentation/logic/cubit/historical_cubit.dart';
import 'package:dalel/features/home/presentation/widgets/custom_category_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_colors.dart';
import '../views/historical_periods_details_view.dart';

class CustomCategoryListView extends StatelessWidget {
  const CustomCategoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoricalCubit, HistoricalState>(
      builder: (context, state) {
        if (state is HistoricalCharacterLoading) {
          return Center(
            child: CircularProgressIndicator(
              color: AppColors.primaryColor,
            ),
          );
        } else if (state is HistoricalCharacterLoaded) {
          return SizedBox(
            height: 200,
            child: ListView.separated(
              clipBehavior: Clip.none,
              physics: const BouncingScrollPhysics(),
              separatorBuilder: (context, index) {
                return const SizedBox(width: 16);
              },
              scrollDirection: Axis.horizontal,
              itemCount: state.historicalCharacterList.length,
              itemBuilder: (_, index) {
                final item = state.historicalCharacterList[index];
                return GestureDetector(
                  onTap: () {
                      Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HistoricalDetailsView(
                description: item.content!,
                image: item.image!,
                name: item.kingName!,
              ),
            ));
            
                  },
                  child: CustomCategoryListViewItem(
                    image: item.image,
                    title: item.kingName,
                  ),
                );
              },
            ),
          );
        } else if (state is HistoricalCharacterError) {
          return const Center(
            child: Text(
              'Failed to load data. Please try again.',
              style: TextStyle(fontSize: 16, color: Colors.red),
            ),
          );
        } else {
          // Ignore other states like HistoricalPeriodsLoaded
          return const SizedBox();
        }
      },
      buildWhen: (previous, current) {
        // Rebuild only when relevant states change
        return current is HistoricalCharacterLoading ||
            current is HistoricalCharacterLoaded ||
            current is HistoricalCharacterError;
      },
    );
  }
}
