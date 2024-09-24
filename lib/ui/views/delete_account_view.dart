import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:my_link_space/ui/widgets/r_button.dart';
import 'package:my_link_space/ui/widgets/r_text_form_field.dart';
import 'package:my_link_space/utils/context_extension.dart';

class DeleteAccountView extends StatelessWidget {
  const DeleteAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.localizations.deleteAccount),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Theme.of(context).colorScheme.errorContainer,
              ),
              child: Row(
                children: [
                  const FaIcon(
                    FontAwesomeIcons.circleExclamation,
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                  Text(
                    "Deleting your account is irreversible.\nPlease proceed with caution",
                    style: Theme.of(context).textTheme.bodyLarge,
                  )
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Text.rich(
              style: Theme.of(context).textTheme.bodyLarge,
              TextSpan(
                text: "By Selecting ",
                children: [
                  TextSpan(
                    text: "YES, DELETE MY ACCOUNT ",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const TextSpan(
                    text:
                        "below, your primary tree (@uiland) will be immediately terminated and your data will be lost. Visitors will no longer be able to access your URL",
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            Text(
              context.localizations.pleaseEnterDeleteMyAccount,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            RTextField(
              controller: TextEditingController(),
              hintText: context.localizations.confirmation,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              validator: (value) => null,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.06),
            RButton(
              label: context.localizations.yesDeleteMyAccountBtn,
              onPressed: () {},
              fillColor: Theme.of(context).colorScheme.error,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            RButton(
              label: context.localizations.cancel,
              onPressed: () {
                GoRouter.of(context).pop();
              },
              borderColor: Colors.grey,
              filled: false,
            ),
          ],
        ),
      ),
    );
  }
}
