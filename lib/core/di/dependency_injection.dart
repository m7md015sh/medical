
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:medical_app/core/networking/api_service.dart';
import 'package:medical_app/core/networking/dio_factory.dart';
import 'package:medical_app/features/login/data/repos/login_repo.dart';
import 'package:medical_app/features/login/logic/cubit/login_cubit.dart';
import 'package:medical_app/features/sign_up/data/repos/signup_repo.dart';
import 'package:medical_app/features/sign_up/logic/signup_cubit/signup_cubit.dart';

final getIt=GetIt.instance;

Future<void> setUpGetIt()async{
Dio dio= DioFactory.getDio();
getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

//login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
//signup
  getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt()));

}