import 'package:flutter/material.dart';


class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  final formKey = GlobalKey<FormState>();
  TextEditingController _teacheremail = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController _classID = TextEditingController();
  TextEditingController _password = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
