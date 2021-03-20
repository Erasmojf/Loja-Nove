import 'package:flutter/material.dart';
import 'package:loja_nove/models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final _nameController = TextEditingController();
    final _emailController = TextEditingController();
    final _passController = TextEditingController();
    final _addressController = TextEditingController();

    final primeryColor = Theme.of(context).primaryColor;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Criar conta'),
        centerTitle: true,
      ),
      body: ScopedModelDescendant<UserModel>(builder: (context, child, model) {
        if (model.isLoading)
          return Center(
            child: CircularProgressIndicator(),
          );
        return Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.all(18.0),
            children: [
              TextFormField(
                controller: _nameController,
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
                controller: _emailController,
                validator: (text) {
                  if (text.isEmpty || !text.contains("@"))
                    return 'E-mail invalido!';
                },
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'E-mail',
                ),
              ),
              TextFormField(
                controller: _passController,
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
                controller: _addressController,
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
                    if (_formKey.currentState.validate()) {
                      Map<String, dynamic> userData = {
                        "name": _nameController.text,
                        "email": _emailController.text,
                        "address": _addressController.text,
                      };

                      model.signUp(
                        userData: userData,
                        pass: _passController.text,
                        onSucess: _onSucess,
                        onFail: _onFail,
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  void _onSucess() {
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text('Usuario cadastrado com sucesso!'),
        backgroundColor: Theme.of(context).primaryColor,
        duration: Duration(seconds: 2),
      ),
    );
    Future.delayed(Duration(seconds: 2)).then((_) {
      Navigator.of(context).pop();
    });
  }

  void _onFail() {
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text('Falha ao criar usuario!'),
        backgroundColor: Colors.redAccent,
        duration: Duration(seconds: 2),
      ),
    );
    Future.delayed(Duration(seconds: 2)).then((_) {
      Navigator.of(context).pop();
    });
  }
}
