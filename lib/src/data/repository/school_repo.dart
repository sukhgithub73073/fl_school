
import 'package:fl_school/src/data/models/response_model.dart';

abstract class SchoolRepository {
  Future<ResponseModel> getSchoolDetail({required Map<String ,dynamic> map});
}
class SchoolRepositoryImp extends SchoolRepository{
  @override
  Future<ResponseModel> getSchoolDetail({required Map<String, dynamic> map}) async {
    ResponseModel model = await ResponseModel();
    Future.delayed(Duration(seconds: 5)) ;
    return model;
  }
}

