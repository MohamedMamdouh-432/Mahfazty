import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:mahfazty/features/dashboard/ui/widgets/latest_entry.dart';
import 'package:mahfazty/features/transactions/logic/transactions_cubit/transactions_cubit.dart';

class FullEntries extends StatelessWidget {
  const FullEntries({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionsCubit, TransactionsState>(
      buildWhen: (p, c) => p.latestEnteries != c.latestEnteries,
      builder: (context, state) {
        return ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          itemCount: state.latestEnteries.length,
          itemBuilder: (c, i) => LatestEntry(state.latestEnteries[i]),
          separatorBuilder: (c, i) => Gap(20.h),
        );
      },
    );
  }
}
