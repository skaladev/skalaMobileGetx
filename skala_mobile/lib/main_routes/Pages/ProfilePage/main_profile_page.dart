import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/route_manager.dart';
import 'package:skala_mobile/main_bloc/profile/profile_cubit.dart';
import 'package:skala_mobile/main_commons/main_color_data.dart';
import 'package:skala_mobile/main_commons/main_constant_route.dart';
import 'package:skala_mobile/main_commons/main_size_data.dart';
import 'package:skala_mobile/main_helpers/main_bloc_helper.dart';
import 'package:skala_mobile/main_prefs/prefs.dart';
import 'package:skala_mobile/main_routes/Pages/ProfilePage/widgets/main_profile_photo_widget.dart';
import 'package:skala_mobile/main_widgets/main_custom_appbar_title_widget.dart';
import 'package:skala_mobile/main_widgets/main_custom_confirm_dialog.dart';

class MainProfilePage extends StatefulWidget {
  MainProfilePage({Key? key}) : super(key: key);

  @override
  State<MainProfilePage> createState() => _MainProfilePageState();
}

class _MainProfilePageState extends State<MainProfilePage> {
  final _prefs = Prefs();

  @override
  void initState() {
    context.read<ProfileCubit>().getProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MainColorData.white,
      appBar: MainCustomAppBarTitle(
        title: 'Profile',
        isIconEnabled: false,
        titleStyle: const TextStyle(
            color: MainColorData.black,
            fontSize: MainSizeData.fontSize16,
            fontWeight: FontWeight.bold),
        action: IconButton(
          icon: SvgPicture.asset(
            'assets/icons/ic_signout.svg',
            height: MainSizeData.SIZE_14,
            width: MainSizeData.SIZE_16,
          ),
          onPressed: () async {
            final res = await showDialog(
              context: context,
              builder: (ctx) => const ConfirmDialogWidget(title: 'Logout ?'),
            );
            if (res == true) {
              await _prefs.clear();
              _prefs.isWelcome = true;
              Get.offAllNamed(MainConstantRoute.mainLogin);
            }
          },
        ),
      ),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        buildWhen: (previous, current) => current is ProfileFetch,
        builder: (context, state) {
          if (state is ProfileFetch) {
            return loadData(
              state.load,
              errorMessage: state.message,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: MainSizeData.SIZE_20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: MainSizeData.SIZE_16,
                      ),
                      Center(child: MainProfilePhotoWidget(size: size)),
                      const SizedBox(
                        height: MainSizeData.SIZE_16,
                      ),
                      Center(
                        child: Text(
                          state.data?.data?.name ?? '-',
                          style: TextStyle(
                              fontSize: MainSizeData.fontSize18,
                              fontWeight: FontWeight.bold,
                              color: MainColorData.grey75),
                        ),
                      ),
                      const SizedBox(height: MainSizeData.SIZE_16),
                      const Divider(
                        color: MainColorData.green_dop,
                        height: MainSizeData.SIZE_10,
                        thickness: MainSizeData.SIZE_4,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Data Akun",
                            style: TextStyle(
                                fontSize: MainSizeData.fontSize18,
                                fontWeight: FontWeight.bold,
                                color: MainColorData.green_dop),
                          ),
                          SizedBox(
                            width: MainSizeData.SIZE_80,
                          ),
                          IconButton(
                              onPressed: () async{
                                final res = await Get.toNamed(
                                  MainConstantRoute.mainEditProfile,
                                  arguments: {
                                    'id': state.data?.data?.id?.toString(),
                                    'nama' :state.data?.data?.name,
                                    'jenisKelamin':state.data?.data?.gender,
                                    'tanggalLahir': state.data?.data?.dateOfBirth,
                                    'pekerjaan':state.data?.data?.profession,
                                  }
                                );
                                if(res ==true){
                                  if(!mounted) return;
                                  context.read<ProfileCubit>().getProfile();
                                }
                              },
                              icon: Icon(
                                Icons.edit,
                                size: MainSizeData.SIZE_25,
                                color: MainColorData.green_dop,
                              ))
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "NAMA LENGKAP",
                            style: TextStyle(
                                fontSize: MainSizeData.fontSize12,
                                fontWeight: FontWeight.bold,
                                color: MainColorData.green_dop),
                          ),
                          SizedBox(height: MainSizeData.SIZE_10),
                          Text(
                            state.data?.data?.name ?? '-',
                            style: TextStyle(
                                fontSize: MainSizeData.fontSize12,
                                fontWeight: FontWeight.bold,
                                color: MainColorData.grey75),
                          ),
                          SizedBox(height: MainSizeData.SIZE_12),
                          Text(
                            "NIK",
                            style: TextStyle(
                                fontSize: MainSizeData.fontSize12,
                                fontWeight: FontWeight.bold,
                                color: MainColorData.green_dop),
                          ),
                          SizedBox(height: MainSizeData.SIZE_10),
                          Text(
                            state.data?.data?.nik ?? '-',
                            style: TextStyle(
                                fontSize: MainSizeData.fontSize12,
                                fontWeight: FontWeight.bold,
                                color: MainColorData.grey75),
                          ),
                          SizedBox(height: MainSizeData.SIZE_12),
                          Text(
                            "JENIS KELAMIN",
                            style: TextStyle(
                                fontSize: MainSizeData.fontSize12,
                                fontWeight: FontWeight.bold,
                                color: MainColorData.green_dop),
                          ),
                          SizedBox(height: MainSizeData.SIZE_10),
                          Text(
                            state.data?.data?.gender ?? '-',
                            style: TextStyle(
                                fontSize: MainSizeData.fontSize12,
                                fontWeight: FontWeight.bold,
                                color: MainColorData.grey75),
                          ),
                          SizedBox(height: MainSizeData.SIZE_12),
                          Text(
                            "TANGGAL LAHIR",
                            style: TextStyle(
                                fontSize: MainSizeData.fontSize12,
                                fontWeight: FontWeight.bold,
                                color: MainColorData.green_dop),
                          ),
                          SizedBox(height: MainSizeData.SIZE_10),
                          Text(
                            state.data?.data?.dateOfBirth ?? '-',
                            style: TextStyle(
                                fontSize: MainSizeData.fontSize12,
                                fontWeight: FontWeight.bold,
                                color: MainColorData.grey75),
                          ),
                          SizedBox(height: MainSizeData.SIZE_12),
                          Text(
                            "NOMOR TELEPON/WA",
                            style: TextStyle(
                                fontSize: MainSizeData.fontSize12,
                                fontWeight: FontWeight.bold,
                                color: MainColorData.green_dop),
                          ),
                          SizedBox(height: MainSizeData.SIZE_10),
                          Text(
                            state.data?.data?.phone ?? '-',
                            style: TextStyle(
                                fontSize: MainSizeData.fontSize12,
                                fontWeight: FontWeight.bold,
                                color: MainColorData.grey75),
                          ),
                          SizedBox(height: MainSizeData.SIZE_12),
                          Text(
                            "ALAMAT",
                            style: TextStyle(
                                fontSize: MainSizeData.fontSize12,
                                fontWeight: FontWeight.bold,
                                color: MainColorData.green_dop),
                          ),
                          SizedBox(height: MainSizeData.SIZE_10),
                          Text(
                            '${state.data?.data?.district ?? ''} , ${state.data?.data?.regency ?? ''}',
                            // state.data?.data?.district ?? '-',
                            style: TextStyle(
                                fontSize: MainSizeData.fontSize12,
                                fontWeight: FontWeight.bold,
                                color: MainColorData.grey75),
                          ),
                          SizedBox(height: MainSizeData.SIZE_12),
                          Text(
                            "PEKERJAAN",
                            style: TextStyle(
                                fontSize: MainSizeData.fontSize12,
                                fontWeight: FontWeight.bold,
                                color: MainColorData.green_dop),
                          ),
                          SizedBox(height: MainSizeData.SIZE_10),
                          Text(
                            state.data?.data?.profession ?? '-',
                            style: TextStyle(
                                fontSize: MainSizeData.fontSize12,
                                fontWeight: FontWeight.bold,
                                color: MainColorData.grey75),
                          ),
                          SizedBox(height: MainSizeData.SIZE_12),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }}