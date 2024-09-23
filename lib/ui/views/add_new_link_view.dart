import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:my_link_space/core/models/link_model.dart';
import 'package:my_link_space/core/view_models/add_new_link_view_model.dart';
import 'package:my_link_space/core/view_models/link_view_model.dart';
import 'package:my_link_space/ui/shared/components/colors.dart';
import 'package:my_link_space/ui/widgets/r_text_form_field.dart';
import 'package:my_link_space/utils/context_extension.dart';
import 'package:my_link_space/utils/form_validator.dart';
import 'package:provider/provider.dart';

class AddNewLinkView extends StatelessWidget {
  const AddNewLinkView({super.key});

  @override
  Widget build(BuildContext context) {
    final linkViewModel = Provider.of<LinkViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(context.localizations.addNewLink),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.1,
          horizontal: 12,
        ),
        child: ChangeNotifierProvider(
          create: (context) => AddNewLinkViewModel(),
          child: Consumer<AddNewLinkViewModel>(
            builder: (context, addNewLinkViewModel, child) => Form(
              key: addNewLinkViewModel.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.localizations.addNewLink,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  RTextField(
                    controller: addNewLinkViewModel.titleController,
                    hintText: "Title",
                    keyboardType: TextInputType.url,
                    textInputAction: TextInputAction.next,
                    validator: FormValidator.titleValidator,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Row(
                    children: [
                      Expanded(
                        child: RTextField(
                          controller: addNewLinkViewModel.urlController,
                          hintText: context.localizations.url,
                          keyboardType: TextInputType.url,
                          textInputAction: TextInputAction.done,
                          validator: FormValidator.urlValidator,
                        ),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                      RCircleButton(
                        onPressed: () async {
                          if (addNewLinkViewModel.formKey.currentState!
                              .validate()) {
                            final LinkModel link = LinkModel(
                              title: addNewLinkViewModel.titleController.text,
                              url: addNewLinkViewModel.urlController.text,
                              userId: 1,
                              clickCount: 0,
                              isActive: true,
                              createdAt: DateTime.now(),
                              updatedAt: DateTime.now(),
                            );

                            final res = await linkViewModel.createLink(
                              linkModel: link,
                            );
                            res.fold((l) {
                              l.showError(context);
                            }, (r) {
                              r.showSuccess(context);
                              GoRouter.of(context).pop();
                            });
                          }
                        },
                        icon: FontAwesomeIcons.arrowRight,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class RCircleButton extends StatelessWidget {
  const RCircleButton({
    super.key,
    required this.onPressed,
    required this.icon,
  });

  final Function()? onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: isDarkMode ? textFieldFillColorDark : textFieldFillColorLight,
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: FaIcon(icon),
      ),
    );
  }
}
