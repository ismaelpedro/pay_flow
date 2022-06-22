import 'package:flutter/material.dart';

import '../../../../core/presenter/config/app_text_styles.dart';

class BodyHomeWidget extends StatelessWidget {
  const BodyHomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediquery = MediaQuery.of(context).size;

    return SizedBox(
      width: mediquery.width,
      height: mediquery.height,
      child: Column(
        children: [
          // CustomAppBarWidget(user: appController.currentUser),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 32),
                  Text(
                    'AppTranslationStrings.myTickets.tr',
                    style: AppTextStyles.titleBoldHeading,
                  ),
                  const SizedBox(height: 16),
                  const Divider(thickness: 2),
                  // Expanded(
                  //   child: appController.tickets.isEmpty
                  //       ? Center(child: Image.asset(AppImages.noTickets))
                  //       : FutureBuilder<List<TicketEntity>>(
                  //           // future: controller.getTickets(),
                  //           builder: (context, snapshot) {
                  //           if (snapshot.connectionState ==
                  //               ConnectionState.waiting) {
                  //             return const Center(
                  //                 child: CupertinoActivityIndicator());
                  //           } else if (snapshot.hasError) {
                  //             return Center(
                  //               child: Text('${snapshot.error}'),
                  //             );
                  //           }
                  //           return Scrollbar(
                  //             thumbVisibility: true,
                  //             child: ListView.builder(
                  //               physics: const BouncingScrollPhysics(),
                  //               itemCount: appController.tickets.length,
                  //               itemBuilder: (_, index) {
                  //                 return Container();
                  //                 // final ticket =
                  //                 //     Get.find<AppController>().tickets[index];

                  //                 // return TicketCardWidget(ticket: ticket);
                  //               },
                  //             ),
                  //           );
                  //         }),
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
