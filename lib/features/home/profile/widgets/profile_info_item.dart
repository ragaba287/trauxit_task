import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class ProfileInfoItem extends StatelessWidget {
  const ProfileInfoItem(
      {super.key, this.icon = BoxIcons.bxs_phone_call, required this.onTap});
  final IconData icon;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration:
            const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        child: Icon(icon),
      ),
    );
  }
}
