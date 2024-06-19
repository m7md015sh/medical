import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_app/features/sign_up/data/models/sign_up_request_body.dart';
import 'package:medical_app/features/sign_up/data/repos/signup_repo.dart';

import 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final SignupRepo _signupRepo;
  SignupCubit(this._signupRepo) : super(const SignupState.initial());

  void emitSignupStates() async {
    emit(const SignupState.loading());
    final response = await _signupRepo.signup(SignupRequestBody(
        name: nameController.text,
        email: emailController.text,
        phone: phoneController.text,
        password: passwordController.text,
        passwordConfirmation: passwordConfirmationController.text));
    response.when(success: (signupResponse) {
      emit(SignupState.success(signupResponse));
    }, failure: (error) {
      emit(SignupState.error(error: error.apiErrorModel.message ?? ''));
    });
  }
}
