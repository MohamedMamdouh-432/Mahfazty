import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahfazty/features/transactions/logic/transaction_form_cubit/transaction_form_cubit.dart';
import 'package:mahfazty/features/transactions/logic/transactions_cubit/transactions_cubit.dart';
import 'package:table_calendar/table_calendar.dart';

class ExpenseDatePicker extends StatelessWidget {
  const ExpenseDatePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: BlocBuilder<TransactionFormCubit, TransactionFormState>(
          builder: (c, state) => TableCalendar(
            firstDay: DateTime.utc(2000, 1, 1),
            lastDay: DateTime.now(),
            focusedDay: state.transaction.date,
            currentDay: state.transaction.date,
            calendarFormat: CalendarFormat.week,
            startingDayOfWeek: StartingDayOfWeek.monday,
            headerStyle: HeaderStyle(formatButtonVisible: false),
            onDaySelected: (selectedDate, focusedDay) {
              context.read<TransactionFormCubit>().setDate(selectedDate);
              context.read<TransactionsCubit>().fetchDetailedTransactions(selectedDate);
            },
      )),
    );
  }
}
