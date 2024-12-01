import 'package:dartz/dartz.dart';
import 'package:mc_crud_test/features/register/domain/params/cosumer_param.dart';
import '../../../../config/app_type/usecase/use_case.dart';
import '../repo/register_repository.dart';



class RegisterUC extends UseCase<
    Future<Either<bool, String>>, CustomerParams> {
  final RegisterRepository _repo;

  RegisterUC(this._repo);

  @override
  Future<Either<bool, String>> call(CustomerParams param) async {
    return _repo.register(param);
  }
}
