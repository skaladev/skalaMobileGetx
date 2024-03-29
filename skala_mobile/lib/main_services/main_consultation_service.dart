import 'package:dio/dio.dart';
import 'package:skala_mobile/main_helpers/main_dio_helper.dart';
import 'package:skala_mobile/main_models/main_consultant_list_model.dart';
import 'package:skala_mobile/main_models/main_consultant_model.dart';
import 'package:skala_mobile/main_models/main_consultation_categories_model.dart';
import 'package:skala_mobile/main_models/main_consultation_count_model.dart';
import 'package:skala_mobile/main_models/main_consultation_detail.dart';
import 'package:skala_mobile/main_models/main_consultation_detail_praktisi_model.dart';
import 'package:skala_mobile/main_models/main_consultation_list_user.dart';
import 'package:skala_mobile/main_models/main_consultation_model.dart';

class ConsultationServices {
  final _api = MainDioHelper().getDio();

  //User
  Future<ConsultationCategoriesModel> getConsultationCategories() async {
    final res = await _api.get('/consultations/categories');
    return ConsultationCategoriesModel.fromJson(res.data);
  }

  Future<ConsultantListModel> getConsultantList({int? categoryId}) async {
    final url = categoryId != null
        ? '/consultations/consultants?consultation_category_id=$categoryId'
        : '/consultations/consultants';
    print(url);
    final res = await _api.get(url);
    print(res);
    return ConsultantListModel.fromJson(res.data);
  }

  Future<ConsultantModel> getConsultant({int? id}) async {
    final res = await _api.get('/consultations/consultants/$id');
    print(res);
    return ConsultantModel.fromJson(res.data);
  }

  Future<bool> createConsultation({
    String? title,
    String? description,
    String? toUserId,
    String? image,
  }) async {
    final res = await _api.post(
      '/consultations',
      data: FormData.fromMap({
        'title': title,
        'description': description,
        'to_user_id': toUserId,
        if (image?.isNotEmpty ?? false)
          'image': await MultipartFile.fromFile(image!),
      }),
    );
    return res.data?['message'] == 'Success';
  }

  Future<ConsultationModel> getConsultationList(
      {int? categoryId, int? statusId}) async {
    if (categoryId != null) {
      final res = await _api.get('/consultations?category_id=$categoryId');
      return ConsultationModel.fromJson(res.data);
    } else if (statusId != null) {
      final res = await _api.get('/consultations?status=$statusId');
      return ConsultationModel.fromJson(res.data);
    }
    final res = await _api.get('/consultations');
    return ConsultationModel.fromJson(res.data);
  }

  Future<bool> delete(String id) async {
    final res = await _api.delete('/consultations/$id');
    return res.data?['message'] == 'Success';
  }

  Future<ConsultationDetailModel> getConsultationDetail(String id) async {
    final res = await _api.get('/consultations/$id');
    return ConsultationDetailModel.fromJson(res.data);
  }

  //praktisi
  Future<ConsultationListUserModel> getConsultationListUser(
      {int? status}) async {
    final url = status != null
        ? '/consultations/consultant?status=$status'
        : '/consultations/consultant';
    final res = await _api.get(url);
    return ConsultationListUserModel.fromJson(res.data);
  }

  Future<ConsultationCountModel> getConsultationCount() async {
    final res = await _api.get('/consultations/count');
    return ConsultationCountModel.fromJson(res.data);
  }

  Future<ConsultationDetailPraktisi> getConsultationDetailPraktisi(
      {int? id}) async {
    final url = '/consultations/$id';
    print(url);
    final res = await _api.get(url);
    print(res);
    return ConsultationDetailPraktisi.fromJson(res.data);
  }

  Future<bool> answeredConsultations({
    String? consultation_id,
    String? title,
    String? description,
    String? image,
  }) async {
    final url = '/consultations/answer';
    final res = await _api.post(
      url,
      data: FormData.fromMap({
        'title': title,
        'description': description,
        'consultation_id': consultation_id,
        if (image?.isNotEmpty ?? false)
          'image': await MultipartFile.fromFile(image!),
      }),
    );
    print(res);
    return res.data?['message'] == 'Success';
  }
}
