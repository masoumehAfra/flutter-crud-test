import '../../features/register/data/data_source/local/register_ds.dart';
import '../../features/register/data/repo/register_repository_impl.dart';
import '../../features/register/domain/repo/register_repository.dart';
import '../app_datasource/local/database_helper.dart';
import 'main_dependency_injection.dart';

class DataSourceInjection {
  static setup() {

    /// Register local database
    locator.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper.instance);


    /// Register repository
    locator.registerLazySingleton<RegisterRepository>(
            () => RegisterRepositoryImpl(locator()));

    /// Register datasource
    locator.registerLazySingleton<RegisterLocalDS>(
            () => RegisterLocalDSImpl(locator()));

  }
}