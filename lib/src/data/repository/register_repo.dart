import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_school/src/data/models/response_model.dart';
import 'package:fl_school/src/data/network/api_status_code.dart';

abstract class RegisterRepository {
  Future<ResponseModel> registerApi(Map<String, dynamic> body);
}

class RegisterRepositoryImp extends RegisterRepository {
  @override
  Future<ResponseModel> registerApi(Map<String, dynamic> body) async {
    var responseModel = await ResponseModel();
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection(body["role_type"])
        .where("email", isEqualTo: body["email"])
        .get();
    if (querySnapshot.docs.isEmpty) {
      var res = await FirebaseFirestore.instance
          .collection(body["role_type"])
          .add(body);
      responseModel.status = "${RepoResponseStatus.success}";
      responseModel.message =
          "Registration Successful! Your records have been successfully registered";
      responseModel.data = res;
    } else {
      responseModel.status = "${RepoResponseStatus.error}";
      responseModel.message =
          "Email Already Exists! Please use a different email address.";
      responseModel.data = {};
    }
    return responseModel;
  }
}
