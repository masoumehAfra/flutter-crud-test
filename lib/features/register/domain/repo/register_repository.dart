import 'package:dartz/dartz.dart';
import '../params/param.dart';

abstract class RegisterRepository {

  Future<Either<bool, String>> register(CustomerParams param);

}