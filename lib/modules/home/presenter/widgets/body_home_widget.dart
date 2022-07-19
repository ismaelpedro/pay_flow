import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'ticket_card_widget.dart';
import '../../../../core/presenter/assets/app_images.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/domain/domain.dart';
import '../../../../core/presenter/app_controller.dart';
import '../../../../core/presenter/theme/app_text_styles.dart';
import 'custom_appbar_widget.dart';

class BodyHomeWidget extends StatefulWidget {
  const BodyHomeWidget({Key? key}) : super(key: key);

  @override
  State<BodyHomeWidget> createState() => _BodyHomeWidgetState();
}

class _BodyHomeWidgetState extends State<BodyHomeWidget> {
  @override
  Widget build(BuildContext context) {
    final mediquery = MediaQuery.of(context).size;
    final appController = GetIt.I.get<AppController>();

    return SizedBox(
      width: mediquery.width,
      height: mediquery.height,
      child: Column(
        children: [
          CustomAppBarWidget(user: appController.currentUser),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 32.h),
                  Text(
                    AppLocalizations.of(context)!.myTickets,
                    style: AppTextStyles.titleBoldHeading,
                  ),
                  SizedBox(height: 16.h),
                  const Divider(thickness: 2),
                  Expanded(
                    child: appController.tickets.isEmpty
                        ? Center(child: Image.asset(AppImages.noTickets))
                        : FutureBuilder<List<TicketEntity>>(
                            future: null,
                            // future: controller.getTickets(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                  child: CupertinoActivityIndicator(),
                                );
                              } else if (snapshot.hasError) {
                                return Center(
                                  child: Text('${snapshot.error}'),
                                );
                              }
                              return Scrollbar(
                                thumbVisibility: true,
                                child: ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  itemCount: appController.tickets.length,
                                  itemBuilder: (_, index) {
                                    final ticket = appController.tickets[index];
                                    return TicketCardWidget(ticket: ticket);
                                  },
                                ),
                              );
                            },
                          ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
