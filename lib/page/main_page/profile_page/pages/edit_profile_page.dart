import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../common/widget/app_text_field.dart';


class EditProfilePage extends StatefulWidget {
  static const routeName = "edit-profile-page";

  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  ImagePicker picker = ImagePicker();
  XFile? selectedImage;

  @override
  void initState() {
    firstNameController = TextEditingController(text: "Nikita Verma");
    emailController = TextEditingController(text: "akashlilhare14gmail.com");
    phoneController = TextEditingController(text: "9669395879");

    super.initState();
  }

  bool isValid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text("Edit profile"),
      ),
      bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: ElevatedButton(
            onPressed: () {
              if (isValid) {}
            },
            child: Text("Save"),
          )),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Stack(
              children: [
                Center(
                  child: Container(
                    height: 120,
                    width: 120,
                    padding: EdgeInsets.all(.1),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 1,
                            color: Colors.black.withOpacity(.1),
                            spreadRadius: .3)
                      ],
                      border: Border.all(color: Colors.white.withOpacity(.8)),
                    ),
                    child: selectedImage == null
                        ? ClipOval(
                            child: Image.network(
                            "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fHww",
                            fit: BoxFit.cover,
                          ))
                        : ClipOval(
                            child: Image.memory(
                              File(selectedImage!.path).readAsBytesSync(),
                              fit: BoxFit.cover,
                              // width: 150,
                              // height: 150,
                            ),
                          ),
                  ),
                ),
                Positioned(
                    bottom: 0,
                    right: MediaQuery.of(context).size.width * .30,
                    child: InkWell(
                      onTap: () async {
                        final XFile? image =
                            await picker.pickImage(source: ImageSource.gallery);
                        if (image != null) {
                          setState(() {
                            selectedImage = image;
                            isValid = true;
                          });
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.all(.4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey.shade900,
                          ),
                          padding: const EdgeInsets.all(10),
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ))
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            AppTextField(
              controller: firstNameController,
              hintText: "Enter name",
              title: "Name",
            ),
            const SizedBox(
              height: 12,
            ),
            AppTextField(
              controller: emailController,
              hintText: "email",
              title: "Email",
            ),
            const SizedBox(
              height: 12,
            ),
            AppTextField(
              controller: phoneController,
              hintText: "Enter phone",
              title: "Phone",
            ),
            const SizedBox(
              height: 12,
            ),
          ],
        ),
      ),
    );
  }
}
