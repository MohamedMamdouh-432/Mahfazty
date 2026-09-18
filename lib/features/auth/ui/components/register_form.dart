import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mahfazty/core/widgets/generic_button.dart';
import 'package:mahfazty/core/widgets/generic_text_field.dart';
import 'package:mahfazty/features/auth/logic/cubit/auth_cubit.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});
  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  String? name, identifier, password;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50.h),
      child: Column(
        spacing: 20.h,
        children: [
          GenericTextField(
            hint: "Name",
            preIcon: Icons.person_outline,
            onChanged: (inputName) => setState(() => name = inputName),
          ),
          GenericTextField(
            hint: "Username or Email",
            preIcon: Icons.person_outline,
            onChanged: (inputIdentifier) =>
                setState(() => identifier = inputIdentifier),
          ),
          GenericTextField(
            hint: "Password",
            preIcon: Icons.lock_outline,
            isObsecure: true,
            onChanged: (inputPassword) =>
                setState(() => password = inputPassword),
          ),
          GenericButton(
            content: "Register",
            onPressed: () => context.read<AuthCubit>().register({
              "name": name ?? '',
              "identifier" : identifier ?? '',
              "password": password ?? '',
            }),
          ),
        ],
      ),
    );
  }
}
