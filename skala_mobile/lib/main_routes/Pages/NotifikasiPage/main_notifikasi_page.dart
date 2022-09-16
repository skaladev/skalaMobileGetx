import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:skala_mobile/main_bloc/consultations/consultation_cubit.dart';
import 'package:skala_mobile/main_bloc/notifications/notification_cubit.dart';
import 'package:skala_mobile/main_bloc/notifications/notification_state.dart';
import 'package:skala_mobile/main_commons/main_color_data.dart';
import 'package:skala_mobile/main_commons/main_size_data.dart';
import 'package:skala_mobile/main_helpers/main_bloc_helper.dart';
import 'package:skala_mobile/main_models/main_notification_model.dart';
import 'package:skala_mobile/main_widgets/main_custom_appbar_title_widget.dart';
import 'package:skala_mobile/main_widgets/main_notification_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skala_mobile/main_helpers/main_extensions_helper.dart';

class MainNotifikasiPage extends StatefulWidget {
  const MainNotifikasiPage({Key? key}) : super(key: key);

  @override
  State<MainNotifikasiPage> createState() => _MainNotifikasiPageState();
}

class _MainNotifikasiPageState extends State<MainNotifikasiPage> {
  void _fetch() {
    context.read<NotificationCubit>().getListNotification();
  }

  void initState() {
    _fetch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainCustomAppBarTitle(
        appBar: AppBar(),
        title: "Notifikasi",
        titleStyle: const TextStyle(
            color: MainColorData.black,
            fontSize: MainSizeData.SIZE_16,
            fontWeight: FontWeight.w700),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<NotificationCubit, NotificationState>(
              buildWhen: (previous, current) => current is NotificationFetch,
              builder: (context, state) {
                if (state is NotificationFetch) {
                  return loadData(state.load,
                      errorMessage: state.message,
                      child: (state.data?.data?.isEmpty ?? true)
                          ? const Center(
                              child: Text("Kosong"),
                            )
                          : Container(
                              height: MainSizeData.SIZE_900,
                              child: ListView.builder(
                                itemCount: state.data?.data?.length,
                                itemBuilder: (context, index) {
                                  return _buildNotificationList(
                                      context, state.data?.data?[index]);
                                },
                              ),
                            ));
                }
                return const SizedBox();
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationList(
      BuildContext context, NotificationModelData? notificationList) {
    return MainNotificationCard(
        title: notificationList?.title, 
        message: notificationList?.message,
        time: notificationList?.time,
        date: notificationList?.date?.ddMMMMyyyy(), 
        );
  }
}
