import 'package:skala_mobile/main_commons/main_constant_key.dart';
import 'package:skala_mobile/main_models/main_consultant_list_model.dart';
import 'package:skala_mobile/main_models/main_consultant_model.dart';
import 'package:skala_mobile/main_models/main_consultation_categories_model.dart';

abstract class ConsultationState {}

class ConsultationInitial extends ConsultationState {}

//User
class CategoriesFetch extends ConsultationState {
  final LoadStatus? load;
  final String? message;
  final ConsultationCategoriesModel? data;

  CategoriesFetch({this.load, this.message, this.data});

  CategoriesFetch.loading({
    String? msg,
  }) : this(
          load: LoadStatus.loading,
          message: msg,
        );

  CategoriesFetch.success({
    String? msg,
    ConsultationCategoriesModel? data,
  }) : this(load: LoadStatus.success, message: msg, data: data);

  CategoriesFetch.error({required String msg})
      : this(load: LoadStatus.error, message: msg);
}

class ConsultantListFetch extends ConsultationState {
  final LoadStatus? load;
  final String? message;
  final ConsultantListModel? data;

   ConsultantListFetch({this.load, this.message, this.data});

   ConsultantListFetch.loading({
    String? msg,
  }) : this(
          load: LoadStatus.loading,
          message: msg,
        );

   ConsultantListFetch.success({
    String? msg,
    ConsultantListModel? data,
  }) : this(load: LoadStatus.success, message: msg, data: data);

   ConsultantListFetch.error({required String msg})
      : this(load: LoadStatus.error, message: msg);
}

class ConsultantFetch extends ConsultationState {
  final LoadStatus? load;
  final String? message;
  final ConsultantModel? data;

   ConsultantFetch({this.load, this.message, this.data});

   ConsultantFetch.loading({
    String? msg,
  }) : this(
          load: LoadStatus.loading,
          message: msg,
        );

   ConsultantFetch.success({
    String? msg,
    ConsultantModel? data,
  }) : this(load: LoadStatus.success, message: msg, data: data);

   ConsultantFetch.error({required String msg})
      : this(load: LoadStatus.error, message: msg);
}

