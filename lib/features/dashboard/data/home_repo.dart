

import 'package:salam_hack/core/models/clsuser.dart';
import 'package:salam_hack/core/networking/api_error_handler.dart';
import 'package:salam_hack/core/networking/api_result.dart';
import 'package:salam_hack/core/networking/api_service.dart';

class HomeRepo {

  
   final ApiService _apiService;

  HomeRepo(this._apiService);

  Future<ApiResult<ClsUser>> currentUser() async {
    try {
      final response = await _apiService.getCurrentUser();
      return ApiResult.success(response);
    } catch (errro) {
      return ApiResult.failure(ApiErrorHandler.handle(errro));
    }
  }

  Future<ApiResult<String>> getSafetyCheck(String safetyCheck)async{
     try {
      final response = await _apiService.checkSafetyStatus(safetyCheck);
      return ApiResult.success(response);
    } catch (errro) {
      return ApiResult.failure(ApiErrorHandler.handle(errro));
    }
  }
  

}