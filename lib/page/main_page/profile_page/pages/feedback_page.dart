import 'package:car_rental_app/constants/app_constants.dart';
import 'package:car_rental_app/healper/app_helper.dart';
import 'package:flutter/material.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({super.key});

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12)
            .copyWith(bottom: MediaQuery.of(context).viewInsets.bottom + 10),
        child: ElevatedButton(
          child: Text("Submit"),
          onPressed: () {
            AppHelper.openUrl(
                url:
                    "mailto:feedback@email.com?subject=subject&body=${controller.text}");
          },
        ),
      ),
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text("Feedback"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(
              height: 12,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: AppConstants.cardDecoration,
              child: TextField(
                controller: controller,
                maxLines: 5,
                autofocus: true,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter your feedback",
                    hintStyle: TextStyle(fontWeight: FontWeight.w400)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
