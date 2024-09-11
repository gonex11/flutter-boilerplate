import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/styles/app_fonts.dart';
import 'package:flutter_boilerplate/data/models/user_model.dart';
import 'package:get/get.dart';

class UserTile extends StatelessWidget {
  final Function()? onTap;
  final UserModel? user;

  const UserTile({
    super.key,
    required this.onTap,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.theme.colorScheme;
    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surfaceBright,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: colorScheme.onSurface.withOpacity(.1),
            blurRadius: 1,
          ),
        ],
      ),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        onTap: onTap,
        dense: true,
        title: Text(
          '${user?.firstName} ${user?.lastName}',
          style: AppFonts.lgSemiBold.copyWith(
            color: colorScheme.onSurface,
          ),
        ),
        subtitle: Text(
          user?.username ?? '-',
          style: AppFonts.mdRegular.copyWith(
            color: colorScheme.onSurface,
          ),
        ),
      ),
    );
  }
}
