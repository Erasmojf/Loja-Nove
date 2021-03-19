import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final primeryColor = Theme.of(context).primaryColor;
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
        actions: [
          FlatButton(
            onPressed: () {},
            child: Text(
              'CRIAR CONTA',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(18.0),
          children: [
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              validator: (text) {
                if (text.isEmpty || !text.contains("@"))
                  return 'E-mail invalido!';
              },
              decoration: InputDecoration(
                hintText: 'E-mail',
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              validator: (text) {
                if (text.isEmpty || text.length < 6) return 'Senha invalida!';
              },
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                hintText: 'Password',
              ),
            ),
            SizedBox(height: 10.0),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                'Esquece a minha senha',
                style: TextStyle(
                  fontSize: 16.0,
                ),
                textAlign: TextAlign.right,
              ),
            ),
            Padding(
              padding: EdgeInsets.zero,
            ),
            SizedBox(height: 16.0),
            SizedBox(
              height: 44.0,
              child: RaisedButton(
                  child: Text(
                    'Entrar',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                  ),
                  color: primeryColor,
                  onPressed: () {
                    if (_formKey.currentState.validate()) {}
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
