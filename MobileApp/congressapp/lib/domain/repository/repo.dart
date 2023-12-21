import 'package:congressapp/data/models/failure.dart';
import 'package:congressapp/domain/models/account.dart';
import 'package:dartz/dartz.dart';

abstract class Repository {
  Future<Either<Failure, AccountResponse>> login(Map<String, dynamic> data);
}
