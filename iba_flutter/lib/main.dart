import 'package:flutter/material.dart';

void main() => runApp(const AppBarApp());

class AppBarApp extends StatelessWidget {
  const AppBarApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 84, 103, 103)),
        useMaterial3: false,
      ),
      home: AppBarExample(),
    );
  }
}

class AppBarExample extends StatefulWidget {
  const AppBarExample({Key? key}) : super(key: key);

  @override
  _AppBarExampleState createState() => _AppBarExampleState();
}

class _AppBarExampleState extends State<AppBarExample> {
  bool _isPasswordVisible = false;

  Widget _getLogoImage() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        height: 200,
        width: 200,
        child: Image.network(
            'https://img.icons8.com/?size=96&id=7I3BjCqe9rjG&format=png'),
      ),
    );
  }

  Widget _getEmailTextField() {
    return const Padding(
      padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Email',
          hintText: 'Enter Email',
        ),
      ),
    );
  }

  Widget _getPasswordTextField() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
      child: TextField(
        obscureText: !_isPasswordVisible,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Password',
          hintText: 'Enter secure password',
          suffixIcon: IconButton(
            icon: Icon(
              _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: () {
              setState(() {
                _isPasswordVisible = !_isPasswordVisible;
              });
            },
          ),
        ),
      ),
    );
  }

  Widget _getNewUserText() {
    return const Padding(
      padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
      child: Text(
        'New User? Create Account',
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _getForgetPasswordButton() {
    return TextButton(
      onPressed: () {},
      child: const Text(
        'Forget Password',
        textAlign: TextAlign.center,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _getLogoImage(),
            _getEmailTextField(),
            _getPasswordTextField(),
            _getNewUserText(),
            _getForgetPasswordButton(),
            SizedBox(height: MediaQuery.of(context).viewInsets.bottom), // Add this to handle keyboard overlay
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Align(
          alignment: Alignment.bottomRight,
          child: FloatingActionButton.extended(
            onPressed: () {},
            label: const Text('Login'),
            backgroundColor: const Color.fromARGB(255, 84, 103, 103),
          ),
        ),
      ),
    );
  }

}
