import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MainAppBar extends StatelessWidget with PreferredSizeWidget {
  const MainAppBar({
    Key? key,
    required this.title,
    required this.onLogin,
    required this.loggedIn,
  }) : super(key: key);

  final String title;
  final bool loggedIn;
  final Function onLogin;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: InkWell(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.login),
                loggedIn
                    ? const Text(
                        "Logout",
                        style: TextStyle(fontSize: 10),
                      )
                    : const Text(
                        "Login",
                        style: TextStyle(fontSize: 10),
                      ),
              ],
            ),
            onTap: () => onLogin(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () async {
                  if (!await launch("https://quellenreiter.app/Impressum/")) {
                    throw 'could not launch';
                  }
                },
                child: const Text("Impressum"),
              ),
              InkWell(
                onTap: () async {
                  if (!await launch("https://quellenreiter.app/Datenschutz/")) {
                    throw 'could not launch';
                  }
                },
                child: const Text("Datenschutz"),
              ),
            ],
          ),
        ),
      ],
      title: Text(title),
    );
  }
}
