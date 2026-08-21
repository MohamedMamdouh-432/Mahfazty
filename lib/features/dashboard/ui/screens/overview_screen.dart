import 'package:flutter/material.dart';
import 'package:mahfazty/features/dashboard/ui/components/overview/head_bar.dart';
import 'package:mahfazty/features/dashboard/ui/components/overview/latest_entries.dart';
import 'package:mahfazty/features/dashboard/ui/components/overview/summary_section.dart';

class OverviewScreen extends StatelessWidget {
  const OverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: HeadBar()),
        SliverToBoxAdapter(child: SummarySection()),
        SliverToBoxAdapter(child: LatestEntries(0)),
      ],
    );
  }
}
