import 'package:congressapp/app/utils/error_handler.dart';
import 'package:congressapp/data/data_source/local.dart';
import 'package:congressapp/data/data_source/remote.dart';
import 'package:congressapp/data/models/failure.dart';
import 'package:congressapp/data/network/network_info.dart';
import 'package:congressapp/domain/models/account.dart';
import 'package:congressapp/domain/repository/repo.dart';
import 'package:dartz/dartz.dart';

class RepositoryImpl implements Repository {
  @override
  Future<Either<Failure, AccountResponse>> login(
      Map<String, dynamic> data) async {
    if (await networkInfo.isConnected()) {
      try {
        final response = await remoteDataSource.login({});
        return Right(response);
      } catch (e) {
        return Left(ErrorHandler.handle(e).failure as Failure);
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure() as Failure);
    }
  }

  /// [Importing_Dependencies]
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  RepositoryImpl(this.networkInfo, this.localDataSource, this.remoteDataSource);
}
