import 'package:flutter/material.dart';
import 'package:mahfazty/features/dashboard/ui/widgets/normal_head_bar.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: NormalHeadBar("Settings")),
      ],
    );
  }
}