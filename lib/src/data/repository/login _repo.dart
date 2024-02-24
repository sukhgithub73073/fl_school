import 'package:fl_school/src/data/models/response_model.dart';

abstract class LoginRepository {
  Future<ResponseModel> loginApi(Map<String, dynamic> map);
}

class LoginRepositoryImp extends LoginRepository {
  @override
  Future<ResponseModel> loginApi(Map<String, dynamic> map) async {
    return await ResponseModel();
  }
}
