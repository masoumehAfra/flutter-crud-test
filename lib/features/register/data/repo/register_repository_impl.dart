import 'package:dartz/dartz.dart';
import 'package:mc_crud_test/features/register/domain/params/cosumer_param.dart';
import 'package:mc_crud_test/features/register/domain/repo/register_repository.dart';

import '../data_source/local/register_ds.dart';

class RegisterRepositoryImpl extends RegisterRepository{
  final RegisterLocalDS _registerLocalDS;

  RegisterRepositoryImpl(this._registerLocalDS);

  @override
  Future<Either<bool, String>> register(CustomerParams param)async {
    try {
      final bool response = await _registerLocalDS.register(param);
      return Left(response);
    } on Exception catch (error) {
      return Right(error.toString());
    }
  }


}