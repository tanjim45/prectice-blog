import 'package:flutter/material.dart';
import 'package:prectice_blog/provider/user_provider.dart';
import 'package:prectice_blog/provider/user_status.dart';
import 'package:provider/provider.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<UserProvider>();

return Scaffold(
  appBar: AppBar(
    title: const Text('Test User'),
  ),
  body: Center(
    child: provider.state.status == UserStatus.loading
        ? const CircularProgressIndicator()
        : provider.state.status == UserStatus.error
            ? Text(provider.state.errorMessage!)
            : provider.state.status == UserStatus.success
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'ID: ${provider.state.user!.id}',
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Name: ${provider.state.user!.name}',
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Email: ${provider.state.user!.email}',
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Age: ${provider.state.user!.age}',
                      ),
                    ],
                  )
                : ElevatedButton(
                    onPressed: () {
                      context
                          .read<UserProvider>()
                          .getUser('101');
                    },
                    child: const Text('Get User'),
                  ),
  ),
);
  }
}