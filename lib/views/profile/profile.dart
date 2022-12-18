import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:jnovel_eink/services/jnovel/jnovel.dart';
import 'package:jnovel_eink/views/profile/userinfo.dart';

class ProfileScreen extends StatelessWidget with GetItMixin {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            UserInfoCard(),
          ],
        ),
      ),
    );
  }
}
