import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:dalel/core/widgets/custom_data_list_view.dart';
import 'package:dalel/core/widgets/custom_shimmer_category.dart';
import 'package:dalel/features/home/presentation/logic/cubit/historical_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoricalPeriods extends StatelessWidget {
  const HistoricalPeriods({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoricalCubit, HistoricalState>(
      builder: (context, state) {
        if (state is HistoricalPeriodsLoading) {
          return const CustomShimmerCategory();
        } else if (state is HistoricalPeriodsLoaded) {
          return CustomDataListView(
            dataList: state.historicalList,
            routePath: "/historicalPeriodsDetailsView",
          );
        } else if (state is HistoricalPeriodsError) {
          return Center(
            child: TextButton(
                onPressed: () {
                  context.read<HistoricalCubit>().getHistoricalPeriods();
                },
                child: Text(
                  "Please Check the internet, and try again later",
                  style: CustomTextStyles.poppins500style24Black
                      .copyWith(fontSize: 16),
                )),
          );
        } else {
          // Handle unexpected states gracefully
          return const SizedBox();
        }
      },
      buildWhen: (previous, current) {
        // Rebuild only when relevant states change
        return current is HistoricalPeriodsLoading ||
            current is HistoricalPeriodsLoaded ||
            current is HistoricalPeriodsError;
      },
    );
  }
}
