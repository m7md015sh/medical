import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/core/widgets/app_text_button.dart';
import 'package:medical_app/features/login/data/models/login_request_body.dart';
import 'package:medical_app/features/login/logic/cubit/login_cubit.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/theming/styles.dart';
import 'widgets/dont_have_account_text.dart';
import 'widgets/email_and_password.dart';
import 'widgets/login_bloc_listener.dart';
import 'widgets/terms_and_conditions_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome Back',
                    style: TextStyles.font24BlueBold,
                  ),
                  verticalSpace(8),
                  Text(
                    'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
                    style: TextStyles.font14GrayRegular,
                  ),
                  verticalSpace(36),
                  Column(
                    children: [
                      const EmailAndPassword(),
                      verticalSpace(24),
                      Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: Text(
                          'Forgot Password?',
                          style: TextStyles.font13BlueRegular,
                        ),
                      ),
                      verticalSpace(40),
                      AppTextButton(
                        buttonText: "Login",
                        textStyle: TextStyles.font16WhiteSemiBold,
                        onPressed: () {
                          validateThenDoLogin(context);
                        },
                      ),
                      verticalSpace(40),
                      const TermsAndConditionsText(),
                      verticalSpace(14),
                      const DontHaveAccountText(),
                        const LoginBlocListener(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}
  void validateThenDoLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginStates();
    }
  }

