import 'package:mc_crud_test/features/register/domain/params/cosumer_param.dart';

import '../../../../../config/app_datasource/local/database_helper.dart';
import '../../../../../config/app_dependency_injection/main_dependency_injection.dart';

abstract class RegisterLocalDS {
  Future<bool> register(CustomerParams param);
}

class RegisterLocalDSImpl extends RegisterLocalDS {
 // final dbHelper = locator<DatabaseHelper>();

  final DatabaseHelper dbHelper;
  RegisterLocalDSImpl(this.dbHelper);

  @override
  Future<bool> register(CustomerParams param) async {
    int result = await dbHelper.saveCustomer(param);
    if (result != -1) {
      print('Customer saved successfully!');
      return true;
    } else {
      print('Failed to save customer: Email must be unique.');
      return false;
    }
  }
}
