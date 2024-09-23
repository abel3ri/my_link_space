import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:my_link_space/ui/shared/components/fonts.dart';

class Links extends StatelessWidget {
  const Links({super.key});

  Future<String> _loadUserName() async {
    final FlutterSecureStorage storage = FlutterSecureStorage();
    final name = await storage.read(key: 'userName');
    return name ?? 'User';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Link Page')),
      body: Center(
        child: FutureBuilder<String>(
          future: _loadUserName(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return Text(
                'Welcome, ${snapshot.data}!',
                style: CustomTextStyles.B1,
              );
            }
          },
        ),
      ),
    );
  }
}
