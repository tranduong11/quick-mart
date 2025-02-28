import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:quick_mart/consts/app_dimensions.dart';
import 'package:quick_mart/consts/app_paths.dart';
import 'package:quick_mart/permission_app/permission_android/permission_app_android.dart';

class WishlistsHome extends StatefulWidget {
  const WishlistsHome({super.key});

  @override
  State<WishlistsHome> createState() => _WishlistsHomeState();
}

class _WishlistsHomeState extends State<WishlistsHome> with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 10));
    super.initState();
  }

  Future<void> statusPermission() async {
    var status = await Permission.camera.request();
    if (status.isDenied) {
      await Permission.camera.request();
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail page'),
      ),
      body: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blue.shade400,
              child: Icon(
                Icons.mic,
                color: Colors.white,
              ),
            ),
            title: Text('Location permission'),
            subtitle: Text('onClick to give location access'),
            onTap: () {
              PermissionAppAndroid().requestPermission(
                permission: Permission.microphone,
              );
            },
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blue.shade400,
              child: Icon(
                Icons.camera,
                color: Colors.white,
              ),
            ),
            title: Text('Location permission'),
            subtitle: Text('onClick to give location access'),
            onTap: () async {
              await statusPermission();
              // PermissionAppAndroid().requestPermission(
              //   permission: Permission.camera,
              // );
            },
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blue.shade400,
              child: Icon(
                Icons.location_on,
                color: Colors.white,
              ),
            ),
            title: Text('Location permission'),
            subtitle: Text('onClick to give location access'),
            onTap: () {
              PermissionAppAndroid().requestPermission(
                permission: Permission.locationWhenInUse,
              );
            },
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blue.shade400,
              child: Icon(
                Icons.photo,
                color: Colors.white,
              ),
            ),
            title: Text('Photo permission'),
            subtitle: Text('onClick to give location access'),
            onTap: () {
              PermissionAppAndroid().requestPermission(
                permission: Platform.isAndroid ? Permission.storage : Permission.photos,
              );
            },
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blue.shade400,
              child: Icon(
                Icons.settings,
                color: Colors.white,
              ),
            ),
            title: Text('Open app setting'),
            subtitle: Text('onClick to give location access'),
            onTap: () {
              PermissionAppAndroid().requestPermissionWithSetting();
            },
          ),
          Container(
            width: getWidth(context) * 0.8,
            height: getHeight(context) * 0.32,
            child: Lottie.asset(
              AppPath.img_animation_2,
              controller: _controller,
              onLoaded: (composition) {
                _controller
                  ..duration = composition.duration
                  ..forward();
              },
            ),
          )
        ],
      ),
    );
  }
}
