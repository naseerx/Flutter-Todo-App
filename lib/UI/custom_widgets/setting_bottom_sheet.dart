import 'package:flutter/material.dart';
import 'package:haztech_task/UI/custom_widgets/custom_buttons.dart';
import 'package:haztech_task/UI/custom_widgets/custom_textfield.dart';

class SettingsBottomSheet extends StatelessWidget {
  final String username;
  final Function(String) onUsernameChanged;
  final Function() onUpdatePressed;
  final Function() onLogoutPressed;

  const SettingsBottomSheet({
    super.key,
    required this.username,
    required this.onUsernameChanged,
    required this.onUpdatePressed,
    required this.onLogoutPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'User Settings',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            const SizedBox(height: 16.0),
            CustomTextField(
              controller: TextEditingController(text: username),
              hintText: username,
              prefixIcon: const Icon(Icons.person),
              onChanged: (value) {
                onUsernameChanged(value);
              },
            ),
            const SizedBox(height: 16.0),
            MyButtonLong(name: 'Update Profile', onTap: onUpdatePressed),
            const SizedBox(height: 16.0),
            MyButtonLong(name: 'Logout', onTap: onLogoutPressed,color: Colors.red,),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}
