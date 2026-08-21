import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mahfazty/core/widgets/generic_button.dart';
import 'package:mahfazty/core/widgets/generic_text_field.dart';
import 'package:mahfazty/features/auth/data/models/auth_request_body.dart';
import 'package:mahfazty/features/auth/logic/cubit/auth_cubit.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  AuthRequestBody authData = AuthRequestBody(username: '', password: '');

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50.h),
      child: Column(
        spacing: 20.h,
        children: [
          GenericTextField(
            hint: "Username",
            preIcon: Icons.person_outline,
            onChanged: (inputUserName) =>
                setState(() => authData.username = inputUserName),
          ),
          GenericTextField(
            hint: "Password",
            preIcon: Icons.lock_outline,
            isObsecure: true,
            onChanged: (inputPassword) =>
                setState(() => authData.password = inputPassword),
          ),
          GenericButton(
            content: "Login",
            onPressed: () => context.read<AuthCubit>().login(authData),
          ),
        ],
      ),
    );
  }
}
