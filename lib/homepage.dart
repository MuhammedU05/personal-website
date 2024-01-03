import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:personal_website/App%20Bar/appbar.dart';
import 'package:personal_website/Body/body.dart';

class Homepage extends StatefulWidget {
  // BuildContext context;

  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final remoteConfig = FirebaseRemoteConfig.instance;
  @override
  void initState() {
    super.initState();
    fetchRemoteConfig();
    // await remoteConfig.setConfigSettings(RemoteConfigSettings(
    //   fetchTimeout: const Duration(minutes: 1),
    //   minimumFetchInterval: const Duration(minutes: 5),
    // ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: body(context),
      extendBody: true,
      extendBodyBehindAppBar: true,
    );
  }
}

String? name;
Future<void> fetchRemoteConfig() async {
  try {
    final FirebaseRemoteConfig remoteConfig =
         FirebaseRemoteConfig.instance;

    // Setting default values (fallback)
    // remoteConfig.setDefaults(<String, dynamic>{
    //   'welcome_message': 'Hello, Welcome!',
    //   // Add other default values as needed
    // });

    // Fetching and activating remote configuration
    await remoteConfig.fetchAndActivate();

    // Use the fetched configuration values in your app
    name = remoteConfig.getString('Name');
    print('Fetched remote config: $name');
  } catch (e) {
    print('Error fetching remote config: $e');
    // Handle errors and implement a fallback mechanism
  }
}
