import 'dart:convert';

import 'package:fl_school/src/data/models/pincode_model.dart';
import 'package:fl_school/src/data/models/response_model.dart';
import 'package:fl_school/src/data/network/http_service.dart';
import 'package:fl_school/src/utility/app_util.dart';

abstract class PincodeRepository {
  Future<ResponseModel> getPincodeInfoApi({required String pincode});
}

class PincodeRepositoryImp extends PincodeRepository {
  @override
  Future<ResponseModel> getPincodeInfoApi({required String pincode}) async {
    ResponseModel responseModel = ResponseModel() ;
    try {
      responseModel = await HttpService().request(
          fullUrl: ApisEndpoints.pincodeUrl + pincode,
          requestType: HttpServiceConst.get);
    } catch (e , t) {
      printLog("getPincodeInfoApi  Exception==> ${e.toString()}>>${t.toString()}");
    }


    return responseModel;
  }
}
