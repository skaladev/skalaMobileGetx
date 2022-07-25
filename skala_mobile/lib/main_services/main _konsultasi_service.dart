import 'package:dio/dio.dart';
import 'package:skala_mobile/main_helpers/main_dio_helper.dart';
import 'package:skala_mobile/main_models/main_kategori_model.dart';
import 'package:skala_mobile/main_models/main_konsultasi_model.dart';

class KonsultasiServices {
  final _api = MainDioHelper().getDio();

  Future<KonsultasiModel> getList() async {
    final res = await _api.get('/feedbacks/mobile');
    return KonsultasiModel.fromJson(res.data);
  }

  Future<KategoriModel> getCategory() async {
    final res = await _api.get('/feedbacks/labels');
    return KategoriModel.fromJson(res.data);
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
}
