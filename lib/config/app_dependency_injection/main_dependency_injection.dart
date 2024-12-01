import 'package:get_it/get_it.dart';
import 'app_dependency_injection.dart';


final locator = GetIt.instance;


class MainDependencyInjection {
  static setup(){
    DataSourceInjection.setup();
    UseCaseInjection.setup();
    BlocInjection.setup();
  }

}
