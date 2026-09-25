import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mahfazty/core/routing/routes.dart';
import 'package:mahfazty/features/dashboard/ui/components/overview/latest_entries.dart';
import 'package:mahfazty/features/dashboard/ui/widgets/normal_head_bar.dart';
import 'package:mahfazty/features/transactions/ui/widgets/add_transaction_item.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: NormalHeadBar("Add")),
        SliverToBoxAdapter(
          child: AddTransactionItem(
            title: "Add Transaction",
            onTap: () => context.push(Routes.addTransactionScreen),
          ),
        ),
        SliverToBoxAdapter(child: LatestEntries(0)),
      ],
    );
  }
}
