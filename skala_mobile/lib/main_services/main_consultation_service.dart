
import 'package:skala_mobile/main_helpers/main_dio_helper.dart';
import 'package:skala_mobile/main_models/main_consultant_list_model.dart';
import 'package:skala_mobile/main_models/main_consultant_model.dart';
import 'package:skala_mobile/main_models/main_consultation_categories_model.dart';

class ConsultationServices{
  final _api = MainDioHelper().getDio();

  //User
  Future<ConsultationCategoriesModel>getConsultationCategories() async{
    final res = await _api.get('/consultations/categories');
    return ConsultationCategoriesModel.fromJson(res.data);
  }

  Future<ConsultantListModel>getConsultantList()async{
    final res = await _api.get('/consultations/consultants');
    print(res);
    return ConsultantListModel.fromJson(res.data);
  }

  Future<ConsultantModel>getConsultant(String id)async{
    final res = await _api.get('/consultations/consultants/$id');
    return ConsultantModel.fromJson(res.data);
  }
}