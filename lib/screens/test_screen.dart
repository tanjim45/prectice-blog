import 'package:flutter/material.dart';
import 'package:prectice_blog/di/injection.dart';
import 'package:prectice_blog/domain/entetis/user_entity.dart';



class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  UserEntity? user;
  bool isLoading = false;

  Future<void> getUser() async {
    setState(() {
      isLoading = true;
    });
final getUser = Injection.getUser();

final result = await getUser('101');
    setState(() {
      user = result;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test User'),
      ),
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : user == null
                ? ElevatedButton(
                    onPressed: getUser,
                    child: const Text('Get User'),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'ID: ${user!.id}',
                        style: const TextStyle(fontSize: 20),
                      ),
                      const SizedBox(height: 10),

                      Text(
                        'Name: ${user!.name}',
                        style: const TextStyle(fontSize: 20),
                      ),
                      const SizedBox(height: 10),

                      Text(
                        'Email: ${user!.email}',
                        style: const TextStyle(fontSize: 20),
                      ),
                      const SizedBox(height: 10),

                      Text(
                        'Age: ${user!.age}',
                        style: const TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
      ),
    );
  }
}

