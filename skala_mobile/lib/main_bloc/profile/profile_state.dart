part of 'profile_cubit.dart';

abstract class ProfileState{}

class ProfileInitial extends ProfileState{}

class ProfileFetch extends ProfileState{
  final LoadStatus? load;
  final String? message;
  final ProfileModel? data;

  ProfileFetch({
    this.load,
    this.message,
    this.data
  });

  ProfileFetch.loading({
    String?msg,
  }) : this(
    load: LoadStatus.loading,
    message: msg,
  );

  ProfileFetch.success({
    String? msg,
    ProfileModel? data,
  }) : this(
    load: LoadStatus.success,
    message: msg,
    data:data,
  );

  ProfileFetch.error({
    required String msg
  }): this(
    load: LoadStatus.error,
    message: msg
  );
}