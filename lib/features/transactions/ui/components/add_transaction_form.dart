import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:mahfazty/core/data/enums/transaction_type.dart';
import 'package:mahfazty/core/helpers/dummy.dart';
import 'package:mahfazty/core/widgets/generic_button.dart';
import 'package:mahfazty/core/widgets/generic_text_field.dart';
import 'package:mahfazty/features/transactions/logic/transaction_form_cubit/transaction_form_cubit.dart';
import 'package:mahfazty/features/transactions/logic/transactions_cubit/transactions_cubit.dart';
import 'package:velocity_x/velocity_x.dart';

class AddExpenseForm extends StatelessWidget {
  const AddExpenseForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<TransactionFormCubit, TransactionFormState>(
      listener: (context, state) {
        if (state.addStatus == AddTransactionStatus.failure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMsg)));
        } else if (state.addStatus == AddTransactionStatus.success) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Transaction added successfully ✅')),
          );
          context.read<TransactionsCubit>().fetchLatestTransactions();
          context.pop();
        }
      },
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Column(
          spacing: 20.h,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            "Category".text.color(Colors.black45).size(16.sp).make(),
            DropdownMenu<String>(
              initialSelection: cats.first['id'] as String,
              label: const Text('Select option'),
              onSelected: (value) => context
                  .read<TransactionFormCubit>()
                  .setCategoryId(value ?? ''),
              dropdownMenuEntries: cats
                  .map(
                    (cat) => DropdownMenuEntry<String>(
                      value: cat['id'].toString(),
                      label: cat['name'].toString(),
                    ),
                  )
                  .toList(),
            ),
            "Type".text.color(Colors.black45).size(16.sp).make(),
            DropdownMenu<String>(
              initialSelection: 'income',
              label: const Text('Select option'),
              onSelected: (value) => context
                  .read<TransactionFormCubit>()
                  .setType(TransactionType.values.byName(value ?? 'income')),
              dropdownMenuEntries: const <DropdownMenuEntry<String>>[
                DropdownMenuEntry<String>(value: 'income', label: 'Income'),
                DropdownMenuEntry<String>(value: 'expense', label: 'Expense'),
                DropdownMenuEntry<String>(value: 'transfer', label: 'Transfer'),
              ],
            ),
            "Amount".text.color(Colors.black45).size(16.sp).make(),
            GenericTextField(
              hint: "Amount",
              preIcon: Icons.money,
              onChanged: (inputAmount) => context
                  .read<TransactionFormCubit>()
                  .setAmount(double.parse(inputAmount)),
            ),
            "Title".text.color(Colors.black45).size(16.sp).make(),
            GenericTextField(
              hint: "Title",
              preIcon: null,
              onChanged: (inputTitle) =>
                  context.read<TransactionFormCubit>().setTitle(inputTitle),
            ),
            "Description".text.color(Colors.black45).size(16.sp).make(),
            GenericTextField(
              hint: "Description",
              preIcon: null,
              onChanged: (inputDescription) => context
                  .read<TransactionFormCubit>()
                  .setDescription(inputDescription),
            ),
            "Notes".text.color(Colors.black45).size(16.sp).make(),
            GenericTextField(
              hint: "Note",
              preIcon: null,
              onChanged: (inputNote) =>
                  context.read<TransactionFormCubit>().setNote(inputNote),
            ),
            Gap(30.h),
            GenericButton(
              content: "ADD EXPENSE",
              onPressed: context.read<TransactionFormCubit>().addTransactions,
            ),
          ],
        ),
      ),
    );
  }
}
