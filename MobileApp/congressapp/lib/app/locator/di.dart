import 'package:congressapp/data/data_source/local.dart';
import 'package:congressapp/data/data_source/remote.dart';
import 'package:congressapp/data/network/dio_client.dart';
import 'package:congressapp/data/network/dio_factory.dart';
import 'package:congressapp/data/network/network_info.dart';
import 'package:congressapp/data/repository/repo_impl.dart';
import 'package:congressapp/domain/repository/repo.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/app_prefs.dart';

final instance = GetIt.instance;

Future<void> setupLocator() async {
  final sharedPrefs = await SharedPreferences.getInstance();
  //shared prefs instance
  instance.registerFactory<SharedPreferences>(() => sharedPrefs);
  // app prefs instance
  instance.registerFactory<AppPreference>(() => AppPreference(instance()));
  //network info
  instance.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());
  // dio factory
  instance.registerLazySingleton<DioFactory>(() => DioFactory());
  //api service client
  final dio = await instance<DioFactory>().getDio();
  instance.registerLazySingleton<DioClient>(() => DioClient(dio));
  //data sources
  instance.registerFactory<RemoteDataSource>(
      () => RemoteDataSourceImpl(instance()));
  instance.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl());
  //repository
  instance.registerLazySingleton<Repository>(
      () => RepositoryImpl(instance(), instance(), instance()));
  // blocs
  // instance.registerLazySingleton(() => LandingCubit());
  // instance.registerLazySingleton(() => HomeBloc(instance()));
  // await _initAccountModule();
}

// _initAccountModule() {
  // if (!GetIt.I.isRegistered<LoginUseCase>()) {
  //   instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance()));
  // }
  // if (!GetIt.I.isRegistered<GetUserProfileDetailsUseCase>()) {
  //   instance.registerFactory<GetUserProfileDetailsUseCase>(
  //       () => GetUserProfileDetailsUseCase(instance()));
  // }
  // if (!GetIt.I.isRegistered<UpdateProfileDetailsUseCase>()) {
  //   instance.registerFactory<UpdateProfileDetailsUseCase>(
  //       () => UpdateProfileDetailsUseCase(instance()));
  // }
  // instance
  //   ..registerFactory<LoginCubit>(() => LoginCubit(instance(), instance()))
  //   ..registerFactory<AccountBloc>(() => AccountBloc(instance(), instance()))
  //   ..registerFactory<UpdateInfoBloc>(() => UpdateInfoBloc(instance()))
  //   ..registerFactory<AddDocumentBloc>(() => AddDocumentBloc(instance()));
// }
