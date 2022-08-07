import 'package:skala_mobile/main_commons/main_constant_key.dart';
import 'package:skala_mobile/main_models/main_consultation_categories_model.dart';

abstract class ConsultationState {}

class ConsultationInitial extends ConsultationState {}

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
