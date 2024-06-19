import 'package:dio/dio.dart';
import 'package:medical_app/core/networking/api_constants.dart';
import 'package:medical_app/features/login/data/models/login_request_body.dart';
import 'package:medical_app/features/login/data/models/login_response.dart';
import 'package:medical_app/features/sign_up/data/models/sign_up_request_body.dart';
import 'package:medical_app/features/sign_up/data/models/signup_response.dart';
import 'package:retrofit/retrofit.dart';
part 'api_service.g.dart';
@RestApi(baseUrl:"https://vcare.integration25.com/api/")
abstract class ApiService{
  factory ApiService(Dio dio,{String baseUrl})=_ApiService;
  @POST(ApiConstants.login)
  Future<LoginResponse>login(
        @Body()
        LoginRequestBody loginRequestBody,
  );

  @POST(ApiConstants.signUp)
  Future<SignupResponse>signUp(
      @Body()
      SignupRequestBody signupRequestBody,
      );
}