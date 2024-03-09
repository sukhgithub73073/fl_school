import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_school/src/data/models/response_model.dart';
import 'package:fl_school/src/data/network/api_status_code.dart';
import 'package:fl_school/src/utility/app_util.dart';
import 'package:fl_school/src/utility/firestore_table.dart';

abstract class ClassesRepository {
  Future<ResponseModel> getClassesApi(Map<String, dynamic> map);

  Future<ResponseModel> createClassApi(Map<String, dynamic> map);
}

class ClassesRepositoryImp extends ClassesRepository {
  @override
  Future<ResponseModel> getClassesApi(Map<String, dynamic> map) async {
    var responseModel = await ResponseModel();
    CollectionReference collectionRef = FirebaseFirestore.instance.collection(tblClass);

    Query query = collectionRef.where("school_code", isEqualTo: map["school_code"]);
    if (map.containsKey("group_id")) {
      query = query.where("group_id", isEqualTo: map["group_id"]);
    }


    QuerySnapshot querySnapshot = await query.get();


    // if (map.containsKey("group_id")) {
    //   query.where("group_id", isEqualTo: map["group_id"]);
    // } else {
    //   query.where("school_code", isEqualTo: map["school_code"]);
    // }





    printLog("getClassesApi>>>>>>>>${querySnapshot.docs.length}") ;
    responseModel.status = "${RepoResponseStatus.success}";
    responseModel.message = "Class Successful!";
    responseModel.data = querySnapshot.docs;
    return responseModel;
  }

  @override
  Future<ResponseModel> createClassApi(Map<String, dynamic> map) async {
    var responseModel = await ResponseModel();
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection(tblClass)
        .where("school_code", isEqualTo: map["school_code"])
        .where("class_name", isEqualTo: map["class_name"])
        .get();
    if (querySnapshot.docs.isEmpty) {
      var res = await FirebaseFirestore.instance.collection(tblClass).add(map);
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection(tblClass)
          .where("school_code", isEqualTo: map["school_code"])
          .get();
      responseModel.status = "${RepoResponseStatus.success}";
      responseModel.message = "Class Created Successful!";
      responseModel.data = querySnapshot.docs;
    } else {
      responseModel.status = "${RepoResponseStatus.error}";
      responseModel.message =
          "Class name already exists! Please use a different name.";
      responseModel.data = {};
    }

    return responseModel;
  }
}
