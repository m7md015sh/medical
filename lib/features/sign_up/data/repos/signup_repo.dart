import 'package:medical_app/core/networking/api_error_handler.dart';
import 'package:medical_app/core/networking/api_result.dart';
import 'package:medical_app/core/networking/api_service.dart';
import 'package:medical_app/features/sign_up/data/models/sign_up_request_body.dart';
import 'package:medical_app/features/sign_up/data/models/signup_response.dart';

class SignupRepo{
  final ApiService _apiService;

  SignupRepo(this._apiService);

  Future<ApiResult<SignupResponse>> signup(SignupRequestBody signupRequestBody)async{
    try{
      final response=await _apiService.signUp(signupRequestBody);
      return ApiResult.success(response);
    }catch(e){
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}