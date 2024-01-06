import 'package:car_rental_app/common/widget/address_box.dart';
import 'package:car_rental_app/common/widget/app_title.dart';
import 'package:car_rental_app/page/main_page/profile_page/pages/address_page.dart';
import 'package:car_rental_app/page/main_page/profile_page/pages/edit_profile_page.dart';
import 'package:car_rental_app/page/main_page/profile_page/pages/faq_page.dart';
import 'package:car_rental_app/page/main_page/profile_page/pages/favourite_page.dart';
import 'package:car_rental_app/page/main_page/profile_page/pages/feedback_page.dart';
import 'package:car_rental_app/page/main_page/profile_page/pages/notification_settings_page.dart';
import 'package:car_rental_app/page/main_page/profile_page/pages/offer_page.dart';
import 'package:car_rental_app/page/main_page/profile_page/pages/privacy_policy_page.dart';
import 'package:car_rental_app/service/navigation_service.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../../common/app_dialog/logout_confirmation_dialog.dart';
import '../../../constants/app_constants.dart';
import '../../../healper/app_helper.dart';
import '../../auth/login_page.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../common/app_dialog/delete_account_confirmation_dialog.dart';
import '/../provider/auth_provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark =
        Theme.of(context).textTheme.labelMedium!.color == Colors.white;

    buildArrow() {
      return Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.blueGrey.withOpacity(.0)),
        child: Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: Colors.black.withOpacity(.6),
        ),
      );
    }

    buildProfileCard() {
      return InkWell(
        onTap: () => NavigationService.push(page: EditProfilePage()),
        child: Container(
          decoration: AppConstants.cardDecoration,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Row(
            children: [
              CircleAvatar(
                radius: 26,
                backgroundColor: Colors.blue.shade800.withOpacity(.99),
                child: Text(
                  "A",
                  style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hi Nikita",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                  Text(
                    "View your profile",
                    style: TextStyle(),
                  )
                ],
              ),
              Spacer(),
              buildArrow()
            ],
          ),
        ),
      );
    }

    buildActionTile(
        {required String title,
        required IconData icon,
        required VoidCallback onTap,
        required Color color}) {
      return Padding(
        padding: EdgeInsets.only(bottom: 8),
        child: InkWell(
          onTap: onTap,
          child: Container(
            decoration: AppConstants.cardDecoration,
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 12, right: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white),
                  child: Icon(
                    icon,
                    size: 22,
                    color: color,
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Spacer(),
                buildArrow(),
                SizedBox(
                  width: 4,
                )
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 18,
                    ),
                    buildProfileCard(),
                    SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    const AppTitle(
                      title: "Personalized",
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    buildActionTile(
                        title: "Offer",
                        icon: Icons.bookmark_outline,
                        color: Colors.blue.shade700,
                        onTap: () {
                          NavigationService.push(page: OfferPage());
                        }),
                    buildActionTile(
                        title: "Favourite",
                        icon: Icons.favorite_border,
                        color: Colors.red.shade400,
                        onTap: () {
                          NavigationService.push(page: FavouritePage());
                        }),
                    SizedBox(
                      height: 18,
                    ),
                    AppTitle(
                      title: "Settings",
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    buildActionTile(
                        title: "Address",
                        icon: Icons.location_on_outlined,
                        color: Colors.orangeAccent.shade700,
                        onTap: () {
                          NavigationService.push(page: AddressPage());
                        }),
                    buildActionTile(
                        title: "Notification",
                        icon: Icons.notifications_outlined,
                        color: Colors.pink,
                        onTap: () {
                          NavigationService.push(
                              page: NotificationSettingsPage());
                        }),
                    buildActionTile(
                        title: "Change theme",
                        icon: Icons.light_mode_outlined,
                        color: Colors.purple,
                        onTap: () {}),
                    SizedBox(
                      height: 18,
                    ),
                    AppTitle(
                      title: "Support us",
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    buildActionTile(
                        title: "Share with friends",
                        icon: CupertinoIcons.share,
                        color: Colors.brown.shade700,
                        onTap: () async {
                          const String text = "\n\nDownload the app : applink";
                          await Share.share(text);
                        }),
                    buildActionTile(
                        title: "Rate our app",
                        icon: Icons.star_outline,
                        color: Colors.purple,
                        onTap: () {
                          AppHelper.openUrl(url: AppConstants.playStoreUrl);
                        }),
                    buildActionTile(
                        title: "Feedback",
                        icon: CupertinoIcons.arrow_up_arrow_down_square,
                        color: Colors.red.shade700,
                        onTap: () {
                          NavigationService.push(page: const FeedbackPage());
                        }),
                    SizedBox(
                      height: 18,
                    ),
                    AppTitle(
                      title: "About us",
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    buildActionTile(
                        title: "Contact us",
                        icon: Icons.email_outlined,
                        color: Colors.brown.shade700,
                        onTap: () {
                          AppHelper.openUrl(url: "mailto:contactus@email.com");
                        }),
                    buildActionTile(
                        title: "FAQ",
                        icon: Icons.question_mark,
                        color: Colors.indigo.shade700,
                        onTap: () {
                          NavigationService.push(page: FAQPage());
                        }),
                    buildActionTile(
                        title: "Privacy policy",
                        icon: Icons.local_police_outlined,
                        color: Colors.pink.shade700,
                        onTap: () {
                          NavigationService.push(page: PrivacyPolicyPage());
                        }),
                    SizedBox(
                      height: 18,
                    ),
                    AppTitle(
                      title: "Account",
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Consumer<AuthProvider>(builder: (context, provider, _) {
                      return buildActionTile(
                          title: "Logout",
                          icon: Icons.logout,
                          color: Colors.redAccent.shade700,
                          onTap: () async {
                            bool? res = await showDialog(
                                context: context,
                                builder: (context) {
                                  return LogoutConfirmationDialog();
                                });

                            if (res == true) {
                              provider.logout(context: context);
                            }
                          });
                    }),
                    Consumer<AuthProvider>(builder: (context, provider, _) {
                      return buildActionTile(
                          title: "Delete account",
                          icon: Icons.delete_outline,
                          color: Colors.red.shade700,
                          onTap: () async {
                            bool? res = await showDialog(
                                context: context,
                                builder: (builder) {
                                  return DeleteAccountDialog();
                                });

                            if (res == true) {
                              provider.deleteAccount(context: context);
                            }
                          });
                    }),
                    SizedBox(
                      height: 60,
                    ),
                    Center(
                        child: Text(
                      "Version 1.0.0",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black.withOpacity(.6)),
                    )),
                    SizedBox(height: 20),
                  ],
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
