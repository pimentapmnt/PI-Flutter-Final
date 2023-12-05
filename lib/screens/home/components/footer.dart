import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:maua/model.dart/responsive.dart';

import '../../../constants.dart';
import 'menu.dart';

class Footer extends StatelessWidget {
  var kSecondaryColor;

  Footer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: kPrimaryColor,
      child: Container(
        padding: EdgeInsets.all(kPadding),
        constraints: BoxConstraints(maxWidth: kMaxWidth),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Column(
                    children: [
                      Image.asset('assets/images/logobranco.png'),
                      SizedBox(
                        height: 10,
                      ),
                    
                    ],
                  ),
                ),
                if (Responsive.isDesktop(context))
                  Expanded(flex: 3, child: HeaderWebMenu()),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            if (!Responsive.isDesktop(context)) MobFooterMenu(),
          ],
        ),
      ),
    );
  }
}
