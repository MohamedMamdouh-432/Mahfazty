import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:mahfazty/core/widgets/generic_button.dart';
import 'package:mahfazty/core/widgets/generic_text_field.dart';
import 'package:mahfazty/features/auth/data/models/auth_request_body.dart';
import 'package:velocity_x/velocity_x.dart';

class AddExpenseForm extends StatefulWidget {
  const AddExpenseForm({super.key});

  @override
  State<AddExpenseForm> createState() => _AddExpenseFormState();
}

class _AddExpenseFormState extends State<AddExpenseForm> {
  AuthRequestBody authData = AuthRequestBody(username: '', password: '');

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        spacing: 20.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          "Expense Title".text.color(Colors.black45).size(16.sp).make(),
          GenericTextField(
            hint: "Expense Title",
            preIcon: null,
            onChanged: (inputTitle) => setState(() {}),
          ),
          "Amount".text.color(Colors.black45).size(16.sp).make(),
          GenericTextField(
            hint: "Amount",
            preIcon: null,
            isObsecure: true,
            onChanged: (inputAmount) => setState(() {}),
          ),
          Gap(30.h),
          GenericButton(content: "ADD EXPENSE", onPressed: () {}),
        ],
      ),
    );
  }
}



// GenericTextField(
//                     hint: 'Expense Title',
//                     preIcon: null,
//                     onChanged: (value) {},
//                   ),
//                   GenericTextField(
//                     hint: 'Amount',
//                     preIcon: null,
//                     onChanged: (value) {},
//                   ),
//                   // Expense Category
//                   GenericButton(content: 'ADD EXPENSE', onPressed: () {}),