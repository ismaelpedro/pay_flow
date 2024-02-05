import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/domain/entities/ticket_entity.dart';
import '../../../../core/infrastructure/auth/auth_service.dart';
import '../../../../core/infrastructure/service_locator/service_locator.dart';
import '../../../../core/presenter/assets/assets.dart';
import '../../../../core/presenter/extensions/extensions.dart';
import '../../../../core/presenter/ui/theme/app_text_styles.dart';
import 'custom_app_bar.dart';
import 'ticket_card.dart';

class BodyHome extends StatefulWidget {
  const BodyHome({super.key});

  @override
  State<BodyHome> createState() => _BodyHomeState();
}

class _BodyHomeState extends State<BodyHome> {
  late AuthService authService;

  @override
  void initState() {
    authService = locator.get<AuthService>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: <Widget>[
          const CustomAppBar(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 32),
                  Text(
                    context.localizations.myTickets,
                    style: AppTextStyles.titleBoldHeading,
                  ),
                  const SizedBox(height: 16),
                  const Divider(thickness: 2),
                  const SizedBox(height: 16),
                  [].isNotEmpty
                      ? ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: 0,
                          itemBuilder: (_, int index) {
                            final TicketEntity ticket = [][index];
                            return TicketCardWidget(ticket: ticket);
                          },
                        )
                      : Center(child: Lottie.asset(AppImages.empty, height: 250)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
