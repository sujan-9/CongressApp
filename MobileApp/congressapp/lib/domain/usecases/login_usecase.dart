import 'package:congressapp/data/models/failure.dart';
import 'package:congressapp/domain/models/account.dart';
import 'package:congressapp/domain/repository/repo.dart';
import 'package:congressapp/domain/usecases/base_usecase.dart';
import 'package:dartz/dartz.dart';

class LoginUseCase
    implements BaseUseCase<Map<String, dynamic>, AccountResponse> {
  final Repository _repository;
  LoginUseCase(this._repository);

  @override
  Future<Either<Failure, AccountResponse>> execute(
      Map<String, dynamic> input) async {
    return await _repository.login(input);
  }
}
