import 'package:digifly_task/core/widgets/custom_shimmer_text.dart';
import 'package:digifly_task/features/home/services/get_user_data_services.dart';
import 'package:digifly_task/features/profile/update_user_data_services.dart';
import 'package:digifly_task/features/profile/widgets/profile_editing_field.dart';
import 'package:flutter/material.dart';

class EmailEditingField extends StatefulWidget {
  const EmailEditingField({super.key, required this.emailController});

  final TextEditingController emailController;

  @override
  State<EmailEditingField> createState() => _EmailEditingFieldState();
}

class _EmailEditingFieldState extends State<EmailEditingField> {
  late Future<String?> _emailFuture;

  @override
  void initState() {
    super.initState();
    _emailFuture = GetUserDataServices.getUserEmail();
  }

  Future<void> _updateEmail() async {
    String newEmail = widget.emailController.text;

    await UpdateUserDataServices.updateUserEmail(newEmail);

    setState(() {
      _emailFuture = Future.value(newEmail);
    });
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = widget.emailController;

    return FutureBuilder<String?>(
      future: _emailFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CustomShimmerText(width: 200);
        } else if (snapshot.hasData && snapshot.data != null) {
          emailController.text = snapshot.data!;
          return ProfileEditingField(
            controller: emailController,
            hintText: snapshot.data!,
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              return null;
            },
            onEditingComplete:
                _updateEmail, // تحديث البيانات عند انتهاء التعديل
          );
        } else {
          return ProfileEditingField(
            controller: emailController,
            hintText: "user",
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              return null;
            },
            onEditingComplete: _updateEmail,
          );
        }
      },
    );
  }
}
