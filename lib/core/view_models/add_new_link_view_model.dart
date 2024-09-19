import 'package:flutter/material.dart';

class AddNewLinkViewModel with ChangeNotifier {
  final TextEditingController _addLinkController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController get addLinkController => _addLinkController;
  GlobalKey<FormState> get formKey => _formKey;

  @override
  void dispose() {
    super.dispose();
    _addLinkController.dispose();
  }
}
