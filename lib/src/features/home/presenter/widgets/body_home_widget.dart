import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/core.dart';
import '../../../../core/infrastructure/service_locator/service_locator.dart';
import 'custom_appbar_widget.dart';
import 'ticket_card_widget.dart';

class BodyHomeWidget extends StatefulWidget {
  const BodyHomeWidget({super.key});

  @override
  State<BodyHomeWidget> createState() => _BodyHomeWidgetState();
}

class _BodyHomeWidgetState extends State<BodyHomeWidget> {
  late AppStore _appStore;

  @override
  void initState() {
    _appStore = serviceLocator.get<AppStore>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = context.mediaQuery;

    return SizedBox(
      width: mediaQuery.width,
      height: mediaQuery.height,
      child: Column(
        children: <Widget>[
          const CustomAppBarWidget(),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 32.h),
                  Text(
                    context.i18n.myTickets,
                    style: AppTextStyles.titleBoldHeading,
                  ),
                  SizedBox(height: 16.h),
                  const Divider(thickness: 2),
                  SizedBox(height: 16.h),
                  Observer(
                    builder: (_) {
                      if (_appStore.tickets.isNotEmpty) {
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: _appStore.tickets.length,
                          itemBuilder: (_, int index) {
                            final TicketEntity ticket = _appStore.tickets[index];
                            return TicketCardWidget(ticket: ticket);
                          },
                        );
                      }
                      return Center(
                        child: Lottie.asset(AppImages.empty, height: 250.h),
                      );
                    },
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
