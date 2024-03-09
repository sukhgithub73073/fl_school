import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_school/src/data/models/response_model.dart';
import 'package:fl_school/src/data/network/api_status_code.dart';

abstract class LoginRepository {
  Future<ResponseModel> loginApi(Map<String, dynamic> map);
}

class LoginRepositoryImp extends LoginRepository {
  @override
  Future<ResponseModel> loginApi(Map<String, dynamic> map) async {

    var responseModel = await ResponseModel();
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection(map["role_type"])
        .where("email", isEqualTo: map["email"])
        .where("password", isEqualTo: map["password"])
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      responseModel.status = "${RepoResponseStatus.success}";
      responseModel.message =
      "Login Successful!";
      responseModel.data = querySnapshot.docs;
    } else {
      responseModel.status = "${RepoResponseStatus.error}";
      responseModel.message =
      "Invalid credentials. Please check your email or password and try again";
      responseModel.data = {};
    }
    return responseModel;

  }
}
