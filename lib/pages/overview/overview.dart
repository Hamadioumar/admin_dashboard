import 'package:admin_dashboard/pages/overview/widgets/overview_cards_large.dart';
import 'package:admin_dashboard/pages/overview/widgets/overview_cards_medium.dart';
import 'package:admin_dashboard/pages/overview/widgets/overview_cards_small.dart';
import 'package:admin_dashboard/pages/overview/widgets/revenue_section_lagre.dart';
import 'package:admin_dashboard/pages/overview/widgets/revenue_section_small.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/controllers.dart';
import '../../helpers/responsiveness.dart';
import '../../widgets/custom.text.dart';

class OverviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Obx(
            () => Row(
              children: [
                Container(
                    margin: EdgeInsets.only(
                        top: ResponsiveWidget.isSmallScreen(context) ? 56 : 6),
                    child: CustomText(
                      text: menuController.activeItem.value,
                      size: 24,
                      color: Colors.black,
                      key: null,
                      weight: FontWeight.bold,
                    )),
              ],
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              if (ResponsiveWidget.isLargeScreen(context) ||
                  ResponsiveWidget.isMediumScreen(context))
                if (ResponsiveWidget.isCustomSize(context))
                  OverviewCardsMediumScreen()
                else
                  OverviewCardsLargeScreen()
              else
                OverviewCardsSmallScreen(),
              if (!ResponsiveWidget.isSmallScreen(context))
                RevenueSectionLarge()
              else
                RevenueSectionSmall(),
            ],
          ))
        ],
      ),
    );
  }
}
