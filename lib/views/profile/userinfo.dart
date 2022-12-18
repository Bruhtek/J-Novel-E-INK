import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:jnovel_eink/services/extensions.dart';
import 'package:jnovel_eink/services/jnovel/jnovel.dart';
import 'package:jnovel_eink/services/jnovel/login.dart';

class UserInfoCard extends StatelessWidget with GetItMixin {
  UserInfoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profile = watchOnly((JNovelApi api) => api.profileInfo);

    if (profile == null) {
      return const Center(child: CircularProgressIndicator());
    }

    String emailGravatar = profile.email.trim().toLowerCase();
    String gravatarUrl = 'https://www.gravatar.com/avatar/${md5.convert(utf8.encode(emailGravatar))}';

    return Card(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 100,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(gravatarUrl),
                    ),
                  ),
                ),
                const Padding(padding: EdgeInsets.all(8.0)),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(profile.username, style: Theme.of(context).textTheme.headline5),
                    Text(profile.email),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 2),
                            ),
                            child: Flag.fromString(profile.country, height: 30, width: 45, fit: BoxFit.fill),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Padding(padding: EdgeInsets.all(8.0)),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(profile.level.toString().toProperCase(), style: Theme.of(context).textTheme.headline6),
                      MaterialButton(
                        onPressed: () => GetIt.instance.get<JNovelApi>().logout(),
                        padding: EdgeInsets.zero,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        child: const Text("Logout"),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
