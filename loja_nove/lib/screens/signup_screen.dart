import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final primeryColor = Theme.of(context).primaryColor;
    return Scaffold(
      appBar: AppBar(
        title: Text('Criar conta'),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(18.0),
          children: [
            TextFormField(
              keyboardType: TextInputType.name,
              validator: (text) {
                if (text.isEmpty) return 'Informe nome completo';
              },
              decoration: InputDecoration(
                hintText: 'Nome completo',
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              validator: (text) {
                if (text.isEmpty || text.contains("@"))
                  return 'E-mail invalido!';
              },
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: 'E-mail',
              ),
            ),
            TextFormField(
              controller: passwordController,
              validator: (text) {
                if (text.isEmpty || text.length < 6) return 'Senha curto!';
              },
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Password',
              ),
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              validator: (text) {
                if (text.isEmpty) return 'Endereco invalido!';
              },
              decoration: InputDecoration(
                hintText: 'Endereco',
              ),
            ),
            SizedBox(height: 16.0),
            SizedBox(
              height: 44.0,
              child: RaisedButton(
                child: Text(
                  'Criar conta',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                  ),
                ),
                color: primeryColor,
                onPressed: () {
                  if (_formKey.currentState.validate()) {}
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
