import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/UsersProvider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //appBar: AppBar(title: Text("Login"), ),
        body: SingleChildScrollView(
      padding: EdgeInsets.only(top: 100),
      scrollDirection: Axis.vertical,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 150,
            width: 150,
            child: Image.network(
                "https://icons.veryicon.com/png/o/healthcate-medical/medical-icon/male-doctor.png"),
          ),
          Container(
            padding: EdgeInsetsDirectional.all(20),
            child: Form(
              child: Column(
                children: [
                  TextFormField(
                    controller: name,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        hintText: "User Name",
                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: 1))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: password,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        hintText: "Password",
                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: 1))),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      children: const [
                        Text("If you have not account "),
                        InkWell(
                          child: Text(
                            "Click Here",
                            style: TextStyle(color: Colors.blue),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                      margin: const EdgeInsetsDirectional.all(20),
                      child: Consumer<UsersDbProvider>(
                          builder: (context, model, child) {
                        return ElevatedButton(
                          onPressed: () async {
                            var response = await model.selectUser('''
                              SELECT * FROM Users
                              WHERE name = "${name.text}" AND password = "${password.text}"
                              ''');
                            if (response == false) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text('Not Authentication')));
                              //
                            } else if (response) {
                              Navigator.of(context).pushNamed('services');
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 12, 80, 135),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 50, vertical: 10),
                            textStyle: const TextStyle(fontSize: 18),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          child: const Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.none,
                                fontFamily: 'Custom Fonts'),
                          ),
                        );
                      }))
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
