import 'package:skala_mobile/main_commons/main_constant_key.dart';
import 'package:skala_mobile/main_models/main_consultant_list_model.dart';
import 'package:skala_mobile/main_models/main_consultant_model.dart';
import 'package:skala_mobile/main_models/main_consultation_categories_model.dart';
import 'package:skala_mobile/main_models/main_consultation_count_model.dart';
import 'package:skala_mobile/main_models/main_consultation_detail.dart';
import 'package:skala_mobile/main_models/main_consultation_list_user.dart';
import 'package:skala_mobile/main_models/main_consultation_model.dart';

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

class ConsultationCreate extends ConsultationState {
  final LoadStatus? load;
  final String? message;

  ConsultationCreate({
    this.load,
    this.message,
  });

  ConsultationCreate.loading({
    String? msg,
  }) : this(
          load: LoadStatus.loading,
          message: msg,
        );

  ConsultationCreate.success({
    String? msg,
    ConsultationCategoriesModel? data,
  }) : this(
          load: LoadStatus.success,
          message: msg,
        );

  ConsultationCreate.error({required String msg})
      : this(load: LoadStatus.error, message: msg);
}

class ConsultationFetch extends ConsultationState {
  final LoadStatus? load;
  final String? message;
  final ConsultationModel? data;

  ConsultationFetch({
    this.load,
    this.message,
    this.data,
  });

  ConsultationFetch.loading({
    String? msg,
  }) : this(
          load: LoadStatus.loading,
          message: msg,
        );

  ConsultationFetch.success({
    String? msg,
    ConsultationModel? data,
  }) : this(
          load: LoadStatus.success,
          message: msg,
          data: data,
        );

  ConsultationFetch.error({required String msg})
      : this(
          load: LoadStatus.error,
          message: msg,
        );
}

class ConsultationDelete extends ConsultationState {
  final LoadStatus? load;
  final String? message;

  ConsultationDelete({
    this.load,
    this.message,
  });

  ConsultationDelete.loading({
    String? msg,
  }) : this(
          load: LoadStatus.loading,
          message: msg,
        );

  ConsultationDelete.success({
    String? msg,
    ConsultationModel? data,
  }) : this(
          load: LoadStatus.success,
          message: msg,
        );

  ConsultationDelete.error({required String msg})
      : this(
          load: LoadStatus.error,
          message: msg,
        );
}

class ConsultationDetailFetch extends ConsultationState {
  final LoadStatus? load;
  final String? message;
  final ConsultationDetailModel? data;

  ConsultationDetailFetch({
    this.load,
    this.message,
    this.data,
  });

  ConsultationDetailFetch.loading({
    String? msg,
  }) : this(
          load: LoadStatus.loading,
          message: msg,
        );

  ConsultationDetailFetch.success({
    String? msg,
    ConsultationDetailModel? data,
  }) : this(
          load: LoadStatus.success,
          message: msg,
          data: data,
        );

  ConsultationDetailFetch.error({required String msg})
      : this(load: LoadStatus.error, message: msg);
}


//role:praktisi
class ConsultationUserFetch extends ConsultationState {
  final LoadStatus? load;
  final String? message;
  final ConsultationListUserModel? data;

  ConsultationUserFetch({
    this.load,
    this.message,
    this.data,
  });

  ConsultationUserFetch.loading({
    String? msg,
  }) : this(
          load: LoadStatus.loading,
          message: msg,
        );

  ConsultationUserFetch.success({
    String? msg,
    ConsultationListUserModel? data,
  }) : this(
          load: LoadStatus.success,
          message: msg,
          data: data,
        );

  ConsultationUserFetch.error({required String msg})
      : this(
          load: LoadStatus.error,
          message: msg,
        );
}

class ConsultationCountFetch  extends ConsultationState{
  final LoadStatus? load;
  final String? message;
  final ConsultationCountModel? data;

  ConsultationCountFetch({
    this.load,
    this.message,
    this.data
  });

  ConsultationCountFetch.loading({
    String? msg,
  }): this(
    load: LoadStatus.loading,
    message: msg
  );

  ConsultationCountFetch.success({
    String? msg,
    ConsultationCountModel? data,
  }): this(
    load: LoadStatus.success,
    message: msg,
    data: data,
  );

  ConsultationCountFetch.error({required String msg}) : this(
    load: LoadStatus.error,
    message: msg,
  );
}