import 'package:dio/dio.dart';
import 'package:skala_mobile/main_helpers/main_dio_helper.dart';
import 'package:skala_mobile/main_models/main_consultant_list_model.dart';
import 'package:skala_mobile/main_models/main_consultant_model.dart';
import 'package:skala_mobile/main_models/main_consultation_categories_model.dart';
import 'package:skala_mobile/main_models/main_consultation_model.dart';

class ConsultationServices {
  final _api = MainDioHelper().getDio();

  //User
  Future<ConsultationCategoriesModel> getConsultationCategories() async {
    final res = await _api.get('/consultations/categories');
    return ConsultationCategoriesModel.fromJson(res.data);
  }

  Future<ConsultantListModel> getConsultantList() async {
    final res = await _api.get('/consultations/consultants');
    print(res);
    return ConsultantListModel.fromJson(res.data);
  }

  Future<ConsultantModel> getConsultant(String id) async {
    final res = await _api.get('/consultations/consultants/$id');
    return ConsultantModel.fromJson(res.data);
  }

  Future<bool> createConsultation(
      {
      String? cosultationCategoryId,
      String? title,
      String? description,
      String? image,
      String? toUserId}) async {
    final res = await _api.post(
      '/consultations',
      data: FormData.fromMap(
        {
          'consultation_category_id': cosultationCategoryId,
          'title': title,
          'to_user_id': toUserId,
          'description': description,
          if (image?.isNotEmpty ?? false)
            'image': await MultipartFile.fromFile(image!),
        },
      ),
    );
    return res.data?['message'] == 'Success';
  }

  Future<ConsultationModel>getConsultationList() async{
    final res = await  _api.get('/consultations');
    return ConsultationModel.fromJson(res.data);
  }

  Future<bool> delete(String id)async{
    final res= await _api.delete('/consultations/$id');
    return res.data?['message'] == 'Success';
  }
}
