import 'package:flutter/material.dart';
import 'package:mahfazty/features/dashboard/ui/widgets/normal_head_bar.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: NormalHeadBar("Notifications")),
      ],
    );
  }
}