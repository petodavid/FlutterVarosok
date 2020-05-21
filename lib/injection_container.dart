import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:jpt_app/features/app/data/datasources/item_data_list_local_data_source.dart';
import 'package:jpt_app/features/app/data/repositories/user_repository_impl.dart';
import 'package:jpt_app/features/app/domain/repositories/user_respository.dart';
import 'package:jpt_app/features/app/domain/usecases/get_item_data_by_id.dart';
import 'package:jpt_app/features/app/domain/usecases/get_item_list_data.dart';
import 'package:jpt_app/features/app/domain/usecases/map.dart';
import 'package:jpt_app/features/app/domain/usecases/user.dart';
import 'package:jpt_app/features/app/presentation/bloc/auth_bloc/bloc.dart';
import 'package:jpt_app/features/app/presentation/bloc/data_list_bloc/app_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/network/network_info.dart';
import 'core/util/input_validation.dart';
import 'features/app/data/datasources/item_data_list_remote_data_source.dart';
import 'features/app/data/repositories/item_data_list_repository_impl.dart';
import 'features/app/data/repositories/map_repository_impl.dart';
import 'features/app/domain/repositories/item_data_list_repository.dart';
import 'features/app/domain/repositories/map_repository.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Bloc
  sl.registerFactory(
    () => AppBloc(
      getItemDataList: sl(),
      getItemDataById: sl(),
    ),
  );

  sl.registerFactory(
    () => LogInBloc(
      user: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => GetItemDataList(sl()));
  sl.registerLazySingleton(() => GetItemDataById(sl()));
  sl.registerLazySingleton(() => User(sl()));
  sl.registerLazySingleton(() => LatLongForMap(sl()));

  // Repository
  sl.registerLazySingleton<ItemListDataRepository>(
    () => ItemListDataRepositoryImpl(
      localDataSource: sl(),
      networkInfo: sl(),
      remoteDataSource: sl(),
    ),
  );
  sl.registerLazySingleton<LatLongForMapRepository>(
    () => LatLongForMapImpl(),
  );

  sl.registerLazySingleton<UserRepository>(() => UserRepositoryImpl());
  // Data sources
  sl.registerLazySingleton<ItemDataListRemoteDataSource>(
    () => ItemDataListRemoteDataSourceImpl(client: sl()),
  );

  sl.registerLazySingleton<ItemDataListLocalDataSource>(
    () => ItemDataListLocalDataSourceImpl(sharedPreferences: sl()),
  );
  // Core
  sl.registerLazySingleton(() => InputValidation());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => DataConnectionChecker());
}
