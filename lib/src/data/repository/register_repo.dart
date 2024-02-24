import 'package:fl_school/src/data/models/response_model.dart';

abstract class RegisterRepository{
  Future<ResponseModel> registerApi(Map<String, dynamic> body);
}

class RegisterRepositoryImp extends RegisterRepository{
  @override
  Future<ResponseModel> registerApi(Map<String, dynamic> body) async {
    var loginUser = await ResponseModel() ;
    return  loginUser ;
    
  }

}