import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nin__page/features/user_auth/presentation/widgets/form_container_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _ninController = TextEditingController();
  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _ninController.addListener(_handleInputChange);
  }

  void _handleInputChange() {
    final text = _ninController.text.trim();

    final hasCorrectLength = RegExp(r'^\d{11}$').hasMatch(text);
    final containsZero = text.contains('0');
    final startWith1or2 = text.startsWith('1') || text.startsWith('2');
    final contains123 =text.contains('123');
    setState(() {
      _isButtonEnabled =
          hasCorrectLength && !containsZero && !startWith1or2 && !contains123;

    });
  }

  void _verifyAndGoNext() {
    Navigator.pushNamed(context, "/next"); // change this route as needed
  }

  @override
  void dispose() {
    _ninController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text("Welcome"),
            const SizedBox(width: 75),
            IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.pushNamed(context, "/login");
              },
              icon: const Icon(Icons.logout_outlined),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 30, right: 20),
            child: Text(
              "Welcome to NIMC page",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.green[900],
              ),
            ),
          ),
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: FormContainerWidget(
              controller: _ninController, // <-- make sure your widget accepts this
              hintText: "Enter your NIN",
              isPasswordField: false,
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: _isButtonEnabled ? _verifyAndGoNext : null,
            child: const Text("Verify"),
          ),
          if(!_isButtonEnabled && _ninController.text.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                'NIN must:\n-Be 11 digits\n- Not contain 0\n- Not start with 1 or 2\n-Not contain the pattern "123"',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 14,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
