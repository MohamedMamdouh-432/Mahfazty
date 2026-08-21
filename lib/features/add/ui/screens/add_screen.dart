import 'package:flutter/material.dart';
import 'package:mahfazty/features/add/ui/components/add_transactions_area.dart';
import 'package:mahfazty/features/dashboard/ui/components/overview/latest_entries.dart';
import 'package:mahfazty/features/dashboard/ui/widgets/normal_head_bar.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: NormalHeadBar("Add")),
        SliverToBoxAdapter(child: AddTransactionsArea()),
        SliverToBoxAdapter(child: LatestEntries(0)),
      ],
    );
  }
}

