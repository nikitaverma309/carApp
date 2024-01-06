import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppOptionTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  final Color color;

  const AppOptionTile(
      {super.key,
      required this.title,
      required this.icon,
      required this.onTap,
      required this.color});

  @override
  Widget build(BuildContext context) {
    buildArrow() {
      return Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.blueGrey.withOpacity(.0)),
        child: Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: Colors.grey.shade700.withOpacity(.99),
        ),
      );
    }

    return InkWell(
        onTap: onTap,
        child: Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: color.withOpacity(.2)),
                  child: Icon(
                    icon,
                    size: 22,
                    color: color.withOpacity(.99),
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white.withOpacity(.8),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Spacer(),
                buildArrow()
              ],
            )));
  }
}
