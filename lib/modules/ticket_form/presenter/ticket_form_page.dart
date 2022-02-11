import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/presenter/config/app_colors.dart';
import '../../../core/presenter/config/app_images.dart';
import '../../../core/presenter/config/app_text_styles.dart';
import '../../../core/presenter/config/app_translations.dart';
import 'ticket_form_controller.dart';
import 'widgets/bottom_button_widget.dart';
import 'widgets/tile_form_widget.dart';

class TicketFormPage extends GetView<TicketFormController> {
  const TicketFormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.background,
          elevation: 0,
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.grey,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Text(
                  AppTranslationStrings.fillTickets.tr,
                  style: AppTextStyles.titleBoldHeading,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Form(
                  child: Column(
                    children: [
                      TileFormWidget(
                        imagePrefix: AppImages.ticket,
                        hintText: AppTranslationStrings.ticket.tr,
                        controller: controller.nameEC,
                      ),
                      TileFormWidget(
                        imagePrefix: AppImages.close,
                        hintText: AppTranslationStrings.expiration.tr,
                        controller: controller.expirationEC,
                      ),
                      TileFormWidget(
                        imagePrefix: AppImages.wallet,
                        hintText: AppTranslationStrings.value.tr,
                        controller: controller.valueEC,
                      ),
                      TileFormWidget(
                        imagePrefix: AppImages.barcode,
                        hintText: AppTranslationStrings.code.tr,
                        controller: controller.codeEC,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Row(
          children: [
            BottomButtonWidget(
              label: AppTranslationStrings.cancel.tr,
              style: AppTextStyles.buttonGray,
              onPressed: () => Get.back(),
            ),
            BottomButtonWidget(
              label: AppTranslationStrings.register.tr,
              style: AppTextStyles.buttonPrimary,
            ),
          ],
        ),
      ),
    );
  }
}
