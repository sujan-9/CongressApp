import 'package:congressapp/data/network/dio_client.dart';
import 'package:congressapp/data/network/endpoints.dart';
import 'package:congressapp/domain/models/account.dart';
import 'package:dio/dio.dart';

abstract class RemoteDataSource {
  Future<AccountResponse> login(Map<String, dynamic> data);
}

class RemoteDataSourceImpl extends RemoteDataSource {
  @override
  Future<AccountResponse> login(Map<String, dynamic> data) async {
    Response response = await dioClient.post(Endpoints.stagingURL, data: data);
    // return AccountResponse.fromJson(response.data);
    return AccountResponse();
  }

  final DioClient dioClient;
  RemoteDataSourceImpl(this.dioClient);
}
