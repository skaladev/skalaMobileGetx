
import 'package:skala_mobile/main_helpers/main_dio_helper.dart';
import 'package:skala_mobile/main_models/main_consultation_categories_model.dart';

class ConsultationServices{
  final _api = MainDioHelper().getDio();

  Future<ConsultationCategoriesModel>getConsultationCategories() async{
    final res = await _api.get('/consultations/categories');
    print(res);
    return ConsultationCategoriesModel.fromJson(res.data);
  }
}