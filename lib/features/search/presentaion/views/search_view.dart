import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../home/presentation/logic/cubit/historical_cubit.dart';
import '../../../home/presentation/views/historical_periods_details_view.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  prefixIcon: const Icon(Icons.search),
                ),
                onChanged: (query) {
                  context.read<HistoricalCubit>().search(query);
                },
              ),
            ),
            Expanded(
              child: BlocBuilder<HistoricalCubit, HistoricalState>(
                builder: (context, state) {
                  if (state is HistoricalSearchResults) {
                    return Directionality(
                      textDirection: TextDirection.rtl,
                      child: ListView(
                        children: [
                          ...state.periodsResults.map((item) => ListTile(
                                title: Text(
                                  item.title!,
                                  style: CustomTextStyles.poppins300style16
                                      .copyWith(
                                          fontFamily: 'Almarai',
                                          color: AppColors.deepBrown),
                                ),
                                subtitle: Text('Period',
                                    style: CustomTextStyles.poppins300style16
                                        .copyWith(
                                            color: AppColors.primaryColor)),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            HistoricalDetailsView(
                                          description: item.content!,
                                          image: item.image!,
                                          name: item.title!,
                                        ),
                                      ));
                                },
                              )),
                          ...state.charactersResults.map((item) => ListTile(
                                title: Text(
                                  item.kingName!,
                                  style: CustomTextStyles.poppins300style16
                                      .copyWith(
                                          fontFamily: 'Almarai',
                                          color: AppColors.deepBrown),
                                ),
                                subtitle: const Text('Character'),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            HistoricalDetailsView(
                                          description: item.content!,
                                          image: item.image!,
                                          name: item.kingName!,
                                        ),
                                      ));
                                },
                              )),
                          ...state.kingsResults.map((item) => ListTile(
                                title: Text(
                                  item.name!,
                                  style: CustomTextStyles.poppins300style16
                                      .copyWith(
                                          fontFamily: 'Almarai',
                                          color: AppColors.deepBrown),
                                ),
                                subtitle: const Text('King'),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            HistoricalDetailsView(
                                          description: item.content!,
                                          image: item.image!,
                                          name: item.name!,
                                        ),
                                      ));
                                },
                              )),
                        ],
                      ),
                    );
                  } else {
                    return const Center(
                      child: Text('No results found.'),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
