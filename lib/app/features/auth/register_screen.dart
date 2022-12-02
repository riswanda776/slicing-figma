import 'package:figma_test/style/style.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool? checkBoxValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:
            IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Create Personal Account",
                style: headling1,
              ),
            ),
            DefaultTabController(
              length: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: const TabBar(isScrollable: true, tabs: [
                      Tab(
                        text: "Email",
                      ),
                      Tab(
                        text: "Phone Number",
                      ),
                    ]),
                  ),
                  Container(
                    height: 700,
                    child: TabBarView(children: [
                      _phoneView(),
                      Center(child: Text("Page")),
                    ]),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Column _phoneView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomTextField(
          label: "Username",
        ),
        const CustomTextField(
          label: "Phone Number",
        ),
        const CustomTextField(
          label: "Password",
        ),
        const SizedBox(
          height: 12,
        ),
        SizedBox(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: const [
                Text("Referral ID (Optional)"),
                Icon(Icons.arrow_drop_down)
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        Row(
          children: [
            Checkbox(
                value: checkBoxValue,
                onChanged: (v) {
                  setState(() {
                    checkBoxValue = v;
                  });
                }),
            Text(
              "I have read and agree to Digicoins ",
              style: TextStyle(fontSize: 10),
            ),
            Text(
              "Terms of Service ",
              style: TextStyle(fontSize: 10, color: primaryColor),
            ),
            Text(
              "and ",
              style: TextStyle(fontSize: 10),
            ),
            Text(
              "Privacy Policy ",
              style: TextStyle(fontSize: 10, color: primaryColor),
            ),
          ],
        ),
        ButtonRegister(),
        SizedBox(
          height: 12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Already have an Account? "),
            Text(
              "Login",
              style:
                  TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
            ),
          ],
        )
      ],
    );
  }
}

class ButtonRegister extends StatelessWidget {
  const ButtonRegister({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12),
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [primaryColor, secondaryColor])),
      child: Center(child: Text("Create Account")),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String? label;

  const CustomTextField({Key? key, this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, right: 12, left: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label ?? "Label"),
          SizedBox(
            height: 12,
          ),
          TextField(
            decoration: InputDecoration(
              hintText: label ?? "Label",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            ),
          )
        ],
      ),
    );
  }
}
