
import 'package:abu_lafy/application/app_preferences.dart';
import 'package:abu_lafy/data/data_source/remote_data_source.dart';
import 'package:abu_lafy/data/data_source/remote_data_source_imp.dart';
import 'package:abu_lafy/data/network/app_api.dart';
import 'package:abu_lafy/data/network/dio_factory.dart';
import 'package:abu_lafy/data/network/network_info.dart';
import 'package:abu_lafy/data/repository/repository_impl.dart';
import 'package:abu_lafy/domain/repository/repository.dart';
import 'package:abu_lafy/domain/usecase/forget_usecase.dart';
import 'package:abu_lafy/domain/usecase/home_usecase.dart';
import 'package:abu_lafy/domain/usecase/login_usecase.dart';
import 'package:abu_lafy/domain/usecase/registration_usecase.dart';
import 'package:abu_lafy/presentation/ui/forget_password/forget_password_viewmodel.dart';
import 'package:abu_lafy/presentation/ui/login/login_viewmodel.dart';
import 'package:abu_lafy/presentation/ui/main/home/home_viewmodel.dart';
import 'package:abu_lafy/presentation/ui/registration/registration.dart';
import 'package:abu_lafy/presentation/ui/registration/registration_viewmodel.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {

  final sharedPrefs = await SharedPreferences.getInstance();

  // shared prefs instance
  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

  // app prefs instance
  instance
      .registerLazySingleton<AppPreferences>(() => AppPreferences(instance()));

  // network info
  instance.registerLazySingleton<NetworkInfo>(
          () => NetworkInfoImpl(InternetConnectionChecker()));

  // dio factory
  instance.registerLazySingleton<DioFactory>(() => DioFactory(instance()));

  // app  service client
  final dio = await instance<DioFactory>().getDio();
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

  // remote data source
  instance.registerLazySingleton<RemoteDataSource>(
          () => RemoteDataSourceImplementer(instance()));

  // local data source
  // instance.registerLazySingleton<LocalDataSource>(
  //         () => LocalDataSourceImplementer());

  // repository
  instance.registerLazySingleton<Repository>(() => RepositoryImpl(instance(), instance()));
}

initLoginModule() {
  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance()));
    instance.registerFactory<LoginViewModel>(() => LoginViewModel(instance()));

  }
}

initRegistrationModule() {
  if (!GetIt.I.isRegistered<RegistrationUseCase>()) {
    instance.registerFactory<RegistrationUseCase>(() => RegistrationUseCase(instance()));
    instance.registerFactory<RegistrationViewModel>(() => RegistrationViewModel(instance()));

  }
}

initForgetPasswordModule() {
  if (!GetIt.I.isRegistered<ForgetUseCase>()) {
    instance.registerFactory<ForgetUseCase>(() => ForgetUseCase(instance()));
    instance.registerFactory<ForgetViewModel>(() => ForgetViewModel(instance()));

  }
}


initHomeModule() {
  if (!GetIt.I.isRegistered<HomeUseCase>()) {
    instance.registerFactory<HomeUseCase>(() => HomeUseCase(instance()));
    instance.registerFactory<HomeViewModel>(() => HomeViewModel(instance()));

  }
}

resetModules() {
  instance.reset(dispose: false);
  initAppModule();
  initLoginModule();
  initRegistrationModule();
}