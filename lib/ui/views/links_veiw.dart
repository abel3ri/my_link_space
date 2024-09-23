import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:my_link_space/ui/shared/components/fonts.dart';
import 'package:redacted/redacted.dart';

class Links extends StatefulWidget {
  const Links({super.key});

  @override
  _LinksState createState() => _LinksState();
}

class _LinksState extends State<Links> {
  String? userName;
  final FlutterSecureStorage storage = FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
    _loadUserName();
  }

  Future<void> _loadUserName() async {
    final name = await storage.read(key: 'userName');
    setState(() {
      userName = name ?? 'User';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Link Page')),
        body: Center(
          child: Text(
            'Welcome, $userName!',
            style: CustomTextStyles.B1,
          ),
        ));
  }
}
