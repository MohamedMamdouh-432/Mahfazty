import 'package:flutter/material.dart';
import 'package:mahfazty/features/dashboard/ui/components/full_entries.dart';
import 'package:mahfazty/features/dashboard/ui/components/head_bar_with_back_button.dart';

class EnteriesScreen extends StatelessWidget {
  const EnteriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: HeadBarWithBackButton(title: "Entries"),
        ),
        SliverToBoxAdapter(child: FullEntries()),
      ],
    );
  }
}
