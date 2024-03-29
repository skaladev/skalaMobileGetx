import 'package:dio/dio.dart';
import 'package:skala_mobile/main_helpers/main_dio_helper.dart';
import 'package:skala_mobile/main_models/main_kategori_model.dart';
import 'package:skala_mobile/main_models/main_konsultasi_detail_model.dart';
import 'package:skala_mobile/main_models/main_konsultasi_model.dart';

class KonsultasiServices {
  final _api = MainDioHelper().getDio();

  Future<KonsultasiModel> getList() async {
    final res = await _api.get('/feedbacks/mobile');
    return KonsultasiModel.fromJson(res.data);
  }

  Future<bool> delete(String id) async {
    final res = await _api.delete('/feedbacks/mobile/$id');
    return res.data?['message'] == 'Success';
  }

  Future<KategoriModel> getCategory() async {
    final res = await _api.get('/feedbacks/labels');
    return KategoriModel.fromJson(res.data);
  }

  Future<KonsultasiDetail> getDetail(String id) async {
    final res = await _api.get('/feedbacks/mobile/$id');
    return KonsultasiDetail.fromJson(res.data);
  }

  Future<bool> createKonsultasi({
    String? categoryId,
    String? title,
    String? description,
    String? image,
  }) async {
    final res = await _api.post(
      '/feedbacks',
      data: FormData.fromMap({
        'feedback_label_id': categoryId,
        'title': title,
        'description': description,
        if (image?.isNotEmpty ?? false)
          'image': await MultipartFile.fromFile(image!),
      }),
    );
    return res.data?['message'] == 'Success';
  }

  Future<bool> giveRating({
    int? consultationId,
    int? rating,
  }) async {
    final res = await _api.post(
      'feedbacks/mobile/rating/$consultationId',
      data: FormData.fromMap({
        'rating': rating,
      }),
    );
    return res.data?['message'] == 'Success';
  }
}
