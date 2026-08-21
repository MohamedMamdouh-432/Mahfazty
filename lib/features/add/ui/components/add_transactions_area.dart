import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mahfazty/core/helpers/logger.dart';
import 'package:mahfazty/core/routing/routes.dart';
import 'package:mahfazty/features/add/ui/widgets/add_transaction_item.dart';

class AddTransactionsArea extends StatelessWidget {
  const AddTransactionsArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          AddTransactionItem(
            title: "Add Income",
            onTap: () => context.push(Routes.addIncomeScreen),
          ),
          AddTransactionItem(
            title: "Add Expense",
            onTap: () {
              Logger.info("Navigate to Add Expense Screen");
              context.push(Routes.addExpenseScreen);
            },
            isExpense: true,
          ),
        ],
      ),
    );
  }
}
