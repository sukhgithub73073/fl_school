import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_school/src/data/models/response_model.dart';
import 'package:fl_school/src/data/network/api_status_code.dart';
import 'package:fl_school/src/utility/firestore_table.dart';

abstract class GroupsRepository {
  Future<ResponseModel> groupsApi(Map<String, dynamic> map);
  Future<ResponseModel> addGroupsApi(Map<String, dynamic> map);
}

class GroupsRepositoryImp extends GroupsRepository {
  @override
  Future<ResponseModel> groupsApi(Map<String, dynamic> map) async {
    var responseModel = await ResponseModel();
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection(tblGroup)
        .where("school_code", isEqualTo: map["school_code"])

        .get();
    if (querySnapshot.docs.isNotEmpty) {
      responseModel.status = "${RepoResponseStatus.success}";
      responseModel.message = "Groups Successful!";
      responseModel.data = querySnapshot.docs;
    } else {
      responseModel.status = "${RepoResponseStatus.error}";
      responseModel.message = "No Group available in this school";
      responseModel.data = {};
    }
    return responseModel;
  }

  @override
  Future<ResponseModel> addGroupsApi(Map<String, dynamic> map) async {
    var responseModel = await ResponseModel();
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection(tblGroup)
        .where("school_code", isEqualTo: map["school_code"])
        .where("group_name", isEqualTo: map["group_name"])
        .get();
    if (querySnapshot.docs.isEmpty) {
      var res = await FirebaseFirestore.instance.collection(tblGroup).add(map);
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection(tblGroup)
          .where("school_code", isEqualTo: map["school_code"])
          .get();
      responseModel.status = "${RepoResponseStatus.success}";
      responseModel.message = "Groups Created Successful!";
      responseModel.data = querySnapshot.docs;
    }else{

      responseModel.status = "${RepoResponseStatus.error}";
      responseModel.message =
      "Group name already exists! Please use a different name.";
      responseModel.data = {};

    }




    return responseModel;
  }
}
