part of 'ref_cubit.dart';

abstract class RefState {}

class RefInitial extends RefState{}

class ProvinceFetch extends RefState{
  final LoadStatus? load;
  final String? message;
  final RefModel? data;
  
  ProvinceFetch({
    this.load,
    this.message,
    this.data,
  });


  ProvinceFetch.loading({
    String?msg,
    }) : this(
      load: LoadStatus.loading,
      message: msg
    );
  
  ProvinceFetch.success({
    String?msg,
    RefModel? data,
  }) : this(
    load: LoadStatus.success,
    message: msg,
    data: data,
  );

  ProvinceFetch.error({
    required String msg
  }) : this(
    load: LoadStatus.error,
    message: msg
  );
}

class RegencyFetch extends RefState{
  final LoadStatus? load;
  final String? message;
  final RefModel? data;
  
  RegencyFetch({
    this.load,
    this.message,
    this.data,
  });


  RegencyFetch.loading({
    String?msg,
    }) : this(
      load: LoadStatus.loading,
      message: msg
    );
  
  RegencyFetch.success({
    String?msg,
    RefModel? data,
  }) : this(
    load: LoadStatus.success,
    message: msg,
    data: data,
  );

  RegencyFetch.error({
    required String msg
  }) : this(
    load: LoadStatus.error,
    message: msg
  );
}

class DistrictFetch extends RefState{
  final LoadStatus? load;
  final String? message;
  final RefModel? data;
  
  DistrictFetch({
    this.load,
    this.message,
    this.data,
  });


  DistrictFetch.loading({
    String?msg,
    }) : this(
      load: LoadStatus.loading,
      message: msg
    );
  
  DistrictFetch.success({
    String?msg,
    RefModel? data,
  }) : this(
    load: LoadStatus.success,
    message: msg,
    data: data,
  );

  DistrictFetch.error({
    required String msg
  }) : this(
    load: LoadStatus.error,
    message: msg
  );
}

class SubDistrictFetch extends RefState{
  final LoadStatus? load;
  final String? message;
  final RefModel? data;
  
  SubDistrictFetch({
    this.load,
    this.message,
    this.data,
  });


  SubDistrictFetch.loading({
    String?msg,
    }) : this(
      load: LoadStatus.loading,
      message: msg
    );
  
  SubDistrictFetch.success({
    String?msg,
    RefModel? data,
  }) : this(
    load: LoadStatus.success,
    message: msg,
    data: data,
  );

  SubDistrictFetch.error({
    required String msg
  }) : this(
    load: LoadStatus.error,
    message: msg
  );
}