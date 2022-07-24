import 'package:skala_mobile/main_helpers/main_dio_helper.dart';
import 'package:skala_mobile/main_models/main_konsultasi_model.dart';

class KonsultasiServices {
  final _api = MainDioHelper().getDio();

  Future<KonsultasiModel> getList() async {
    final res = await _api.get('/feedbacks/mobile');
    return KonsultasiModel.fromJson(res.data);
  }
}