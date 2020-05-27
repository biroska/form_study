import 'package:flutter/material.dart';
import 'package:form_study/pages/PrimeiroAcesso.dart';
import 'package:form_study/validators/EmailValidator.dart';
import 'package:form_study/validators/CamposObrigatoriosValidator.dart';

import 'ResetPasswordPage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool _autoValidate = false;
  EmailValidator _emailValidator;
  CamposObrigatoriosValidator _camposObrigatoriosValidator;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _emailValidator = new EmailValidator();
    _camposObrigatoriosValidator = new CamposObrigatoriosValidator();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        padding: EdgeInsets.only(top: 60, left: 40, right: 40),
        color: Colors.white,
        child: new Form(
        key: _formKey,
        autovalidate: _autoValidate,
        child: new ListView(
          children: <Widget>[
            imagemLogo(),
            SizedBox(height: 20,),
            emailTextField(),
            SizedBox(height: 10,),
            senhaTextField(),
            recuperarSenhaFlatButton(context),
            SizedBox(height: 10,),
            loginFlatButton(),
            SizedBox(height: 10,),
            loginFacebookFlatButton(),
            SizedBox(height: 10,),
            primeiroAcessoFlatButton(context),
          ],
        ),
      ),
    ),
  );
  }

  SizedBox imagemLogo() {
    return SizedBox(
            width: 128,
            height: 128,
            child: Image.asset("assets/pumpkin-login.png"),
          );
  }

  Container primeiroAcessoFlatButton(BuildContext context) {
    return Container(
            height: 40,
            child: FlatButton(
              child: Text("Primeiro acesso",textAlign: TextAlign.center,),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute( builder: (context) => PrimeiroAcessoPage() )  );
              },
            ),
          );
  }

  Container loginFacebookFlatButton() {
    return Container(
            height: 60,
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: Color(0xFF3C5A99),
              borderRadius: BorderRadius.all( Radius.circular(5) ),
            ),
            child: SizedBox.expand(
              child: FlatButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Login com Facebook", style: TextStyle( fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20 ), textAlign: TextAlign.left, ),
                    Container(
                      child: SizedBox(
                        child: Image.asset("assets/facebook.png"),
                        height: 28,
                        width: 28,
                      ),
                    ),
                  ],
                ),
                onPressed: ()=>{},
              ),
            ),
          );
  }

  Container loginFlatButton() {
    return Container(
            height: 60,
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.3,1],
                  colors: [Colors.deepOrange, Colors.red ]
              ),
              borderRadius: BorderRadius.all( Radius.circular(5) ),
            ),
            child: SizedBox.expand(
              child: FlatButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Login", style: TextStyle( fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20 ), textAlign: TextAlign.left, ),
                    Container(
                      child: SizedBox(
                        child: Image.asset("assets/key.png"),
                        height: 28,
                        width: 28,
                      ),
                    ),
                  ],
                ),
                onPressed: _validateInputs,
              ),
            ),
          );
  }

  Container recuperarSenhaFlatButton(BuildContext context) {
    return Container(
            height: 40,
            alignment: Alignment.centerRight,
            child: FlatButton(
              child: Text("Recuperar a senha", textAlign: TextAlign.right  ),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute( builder: (context) => ResetPasswordPage() )  );
              },
            ),
          );
  }

  TextFormField senhaTextField() {
    return TextFormField(
            obscureText: true,
            keyboardType: TextInputType.text,
            validator: _camposObrigatoriosValidator.validate,
            decoration: InputDecoration(
              labelText: "Senha",
              labelStyle: TextStyle( color: Colors.black38, fontWeight: FontWeight.w400, fontSize: 20 ),
            ),
          );
  }

  TextFormField emailTextField() {
    return TextFormField(
            autofocus: true,
            keyboardType: TextInputType.emailAddress,
            validator: _emailValidator.validateEmail,
            decoration: InputDecoration(
              labelText: "E-mail",
              labelStyle: TextStyle( color: Colors.black38, fontWeight: FontWeight.w400, fontSize: 20 ),
            ),
          );
  }

  void _validateInputs() {

    final form = _formKey.currentState;

    if ( form.validate() ) {

      // Every of the data in the form are valid at this point
      form.save();
      showDialog(
          context: context,
          builder: (BuildContext context) => new AlertDialog(
            content: new Text("All inputs are valid"),
          ));
    } else {
      setState(() => _autoValidate = true);
    }
  }
}
