import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:view_project/common/progress_bar.dart';
import 'package:view_project/pages/login_page/providers/login_provider.dart';
import 'package:view_project/pages/login_page/widgets/login_form.dart';
import 'package:view_project/pages/login_page/widgets/logo.dart';
import 'package:view_project/pages/login_page/widgets/tetle_head.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    LoginProvider provider = context.read<LoginProvider>();
    provider.getProfile(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    LoginProvider provider = context.watch<LoginProvider>();
    if(provider.loadingProfile == true || provider.userProfile != null ){
      return const ProgressBar();
    }
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(right: 24, left: 24),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Logo(),
                        TitleHead(),
                        LoginForm()
                      ]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
