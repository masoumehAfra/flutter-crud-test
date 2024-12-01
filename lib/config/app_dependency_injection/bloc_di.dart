import '../../features/register/presentation/bloc/register/register_cubit.dart';
import 'main_dependency_injection.dart';

class BlocInjection {
  static setup() {

    /// Register
    locator.registerFactory(() => RegisterCubit(locator()));

  }
}