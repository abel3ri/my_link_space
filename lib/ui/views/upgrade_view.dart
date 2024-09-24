import 'package:chapa_unofficial/chapa_unofficial.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:my_link_space/core/models/error_model.dart';
import 'package:my_link_space/ui/widgets/r_button.dart';
import 'package:my_link_space/utils/context_extension.dart';

class UpgradeView extends StatelessWidget {
  const UpgradeView({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void> pay() async {
      try {
        Chapa.configure(
            privateKey: "CHASECK_TEST-pxglKFxPWvXXWXGDF5isQMt4v4lhPOsK");

        String txRef = TxRefRandomGenerator.generate(prefix: 'test');

        await Chapa.getInstance.startPayment(
          context: context,
          onInAppPaymentSuccess: (successMsg) {},
          onInAppPaymentError: (errorMsg) {
            print(errorMsg);
          },
          amount: '300',
          currency: 'ETB',
          txRef: txRef,
          firstName: "Kuraz",
          lastName: "Tech",
          phoneNumber: "0900000000",
        );
      } catch (e) {
        print(e.toString());
      }
    }

    final List<String> adItems = [
      context.localizations.getAccessToPowerful,
      context.localizations.customizeYourMy,
      context.localizations.playVideos,
      context.localizations.plusMuchMuchMore,
    ];
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.3),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  scale: .5,
                  image: AssetImage(
                    "assets/asset_2.png",
                  ),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.06,
              left: 5,
              child: IconButton(
                onPressed: () {
                  GoRouter.of(context).pop();
                },
                icon: FaIcon(
                  FontAwesomeIcons.arrowLeft,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Column(
          children: [
            Text(
              context.localizations.joinPros,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FaIcon(
                      FontAwesomeIcons.check,
                      size: 22,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.02,
                    ),
                    Expanded(
                      child: Text(
                        adItems[index],
                        maxLines: 2,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    )
                  ],
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01);
              },
              itemCount: 4,
            ),
            Spacer(),
            RButton(
              label: context.localizations.upgrade,
              onPressed: () async {
                try {
                  await pay();
                } catch (e) {
                  ErrorModel(body: e.toString()).showError(context);
                }
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            RButton(
              label: context.localizations.noThanks,
              onPressed: () {
                GoRouter.of(context).pop();
              },
              filled: false,
            ),
          ],
        ),
      ),
    );
  }
}
