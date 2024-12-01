import '../../features/register/domain/use_cases/register.dart';
import 'main_dependency_injection.dart';

class UseCaseInjection {
  static setup() {
    locator.registerLazySingleton(() => RegisterUC(locator()));
  }
}