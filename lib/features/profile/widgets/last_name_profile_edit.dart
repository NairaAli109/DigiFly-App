import 'package:digifly_task/core/widgets/custom_shimmer_text.dart';
import 'package:digifly_task/features/home/services/get_user_data_services.dart';
import 'package:digifly_task/features/profile/update_user_data_services.dart';
import 'package:digifly_task/features/profile/widgets/profile_editing_field.dart';
import 'package:flutter/material.dart';

class LastNameEditingField extends StatefulWidget {
  const LastNameEditingField({
    super.key,
    required this.nameController,
  });
  final TextEditingController nameController;

  @override
  State<LastNameEditingField> createState() => _LastNameEditingFieldState();
}

class _LastNameEditingFieldState extends State<LastNameEditingField> {
  late Future<String?> _nameFuture;

  @override
  void initState() {
    super.initState();
    _nameFuture = GetUserDataServices.getUserName();
  }

  Future<void> _updateName() async {
    String newName = widget.nameController.text;

    // تحديث البيانات في الملف
    await UpdateUserDataServices.updateUserLastName(newName);

    // تحديث الواجهة
    setState(() {
      _nameFuture = Future.value(newName);
    });
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = widget.nameController;

    return FutureBuilder<String?>(
      future: _nameFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CustomShimmerText(width: 100);
        } else if (snapshot.hasData && snapshot.data != null) {
          return ProfileEditingField(
            controller: nameController,
            hintText: snapshot.data!.split(RegExp(r'\s+')).length > 1
                ? snapshot.data!.split(RegExp(r'\s+'))[1] // إذا كان هناك اسم أخير
                : "Last Name", // إذا لم يكن هناك اسم أخير
            keyboardType: TextInputType.text,
            validator: (value) {
              return null;
            },
            onEditingComplete: _updateName,
          );

        } else {
          return ProfileEditingField(
              controller: nameController,
              hintText: "user",
              keyboardType: TextInputType.text,
              validator: (value) {
                return null;
              });
        }
      },
    );
  }
}
