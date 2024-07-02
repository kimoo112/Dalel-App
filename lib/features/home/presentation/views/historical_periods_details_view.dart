import 'package:dalel/features/home/presentation/widgets/home_sections/home_app_bar_section.dart';
import 'package:dalel/features/home/presentation/widgets/period_details_section.dart';
import 'package:flutter/material.dart';

class HistoricalDetailsView extends StatelessWidget {
  const HistoricalDetailsView({
    super.key,
    required this.name,
    required this.description,
    required this.image,
  });
  final String name;
  final String description;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: HomeAppBarSection()),
          const SliverToBoxAdapter(child: SizedBox(height: 7)),
          SliverToBoxAdapter(
              child: PeriodDetailsSection(
            periodName: name,
            description: description,
            imageUrl: image,
          )),
          const SliverToBoxAdapter(child: SizedBox(height: 22)),
          // SliverToBoxAdapter(
          //     child: PeriodWarsSection(
          //   warsList: model.wars,
          // )),
          //  SliverToBoxAdapter(child: RecommendationsSection(name: model.name,)),
          // const SliverToBoxAdapter(child: TrendingSection()),
        ],
      ),
    ));
  }
}
