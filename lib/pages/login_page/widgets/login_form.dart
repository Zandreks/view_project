import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:provider/provider.dart';
import 'package:view_project/pages/login_page/providers/login_provider.dart';

import '../../../_utils/validator_form.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginProvider provider = context.watch<LoginProvider>();
    final formKey = GlobalKey<FormState>();
    Widget icon = provider.showPass ?  SvgPicture.asset(
      "assets/icons/eye-off.svg",
    ) :  SvgPicture.asset(
      "assets/icons/eye.svg",
    );
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.always,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 5),
            child: Text(
              tr("login_page_labelEmail"),
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: fromCssColor('#080A1C')),
            ),
          ),
          TextFormField(
            validator: (value) => ValidatorForm.validateEmail(value),
            inputFormatters: [
              FilteringTextInputFormatter.deny(RegExp(r'\s')),
            ],
            controller: provider.userNameController,
            style: const TextStyle(fontSize: 14),
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: tr("login_page_login"),
            ),
          ),
          const SizedBox(height: 32),
          Container(
            padding: const EdgeInsets.only(bottom: 5),
            child: Text(
              tr("login_page_labelPassword"),
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: fromCssColor('#080A1C')),
            ),
          ),
          TextField(
            controller: provider.passwordController,
            style: const TextStyle(fontSize: 14),
            obscureText: !provider.showPass,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: icon,
                onPressed: () => {provider.setShowPassword(!provider.showPass)},
              ),
              hintText: tr("login_page_password"),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Checkbox(
                value: provider.savePassword,
                onChanged: (bool? value) {
                  provider.setSavePassword(value);
                },
              ),
              Container(
                padding: const EdgeInsets.only(left: 5),
                child: Text(
                  tr("login_page_savePassword"),
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: fromCssColor('#080A1C')),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    provider.login(context);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.only(top: 17, bottom: 17),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: provider.loadingForm
                      ? Container(
                          width: 24,
                          height: 24,
                          padding: const EdgeInsets.all(2.0),
                          child: const CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 3,
                          ))
                      : Text(
                          tr("login_page_textButton").toUpperCase(),
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 16),
                        )),
            ),
          )
        ],
      ),
    );
  }
}
