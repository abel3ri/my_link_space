import 'package:flutter/material.dart';

class AddNewLinkViewModel with ChangeNotifier {
  final TextEditingController _urlController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController get urlController => _urlController;
  TextEditingController get titleController => _titleController;
  GlobalKey<FormState> get formKey => _formKey;

  @override
  void dispose() {
    super.dispose();
    _urlController.dispose();
    _titleController.dispose();
  }
}
