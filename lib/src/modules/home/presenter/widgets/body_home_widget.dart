import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/core.dart';
import '../../../core/infrastructure/service_locator/service_locator.dart';
import 'custom_appbar_widget.dart';
import 'ticket_card_widget.dart';

class BodyHomeWidget extends StatefulWidget {
  const BodyHomeWidget({Key? key}) : super(key: key);

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
    Size mediquery = context.mediaQuery;

    return SizedBox(
      width: mediquery.width,
      height: mediquery.height,
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
                  Expanded(
                    child: FutureBuilder<List<TicketEntity>>(
                      future: null,
                      // future: controller.getTickets(),
                      builder: (
                        BuildContext context,
                        AsyncSnapshot<List<TicketEntity>> snapshot,
                      ) {
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
                            itemCount: _appStore.tickets.value?.length,
                            itemBuilder: (_, int index) {
                              final TicketEntity? ticket =
                                  _appStore.tickets.value?[index];
                              return TicketCardWidget(ticket: ticket!);
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
