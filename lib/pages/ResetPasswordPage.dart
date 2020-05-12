import 'package:flutter/material.dart';

class ResetPasswordPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.only( top: 60, left: 40, right: 40),
        child: ListView( children: <Widget>[
          mudarSenhaImagem(),
          SizedBox( height: 20, ),
          esqueceuSenhaText(),
          SizedBox( height: 20, ),
          detalheEsqueceuSenhaText(),
          SizedBox( height: 20, ),
          emailTextField(),
          SizedBox( height: 20, ),
          enviarFlatButton(context),
          SizedBox( height: 20, ),

        ], ),
      ),
    );
  }

  SizedBox mudarSenhaImagem() {
    return SizedBox(
          width: 150,
          height: 150,
          child: Image.asset("assets/change-password.png")
        );
  }

  AppBar customAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        color: Colors.black38,
        onPressed: () => Navigator.pop(context, false),
      ),
    );
  }

  Container enviarFlatButton(BuildContext context) {
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
                  Text("Enviar", style: TextStyle( fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20 ), textAlign: TextAlign.left, ),
                  Container(
                    child: SizedBox(
                      child: Image.asset("assets/key.png"),
                      height: 28,
                      width: 28,
                    ),
                  ),
                ],
              ),
              onPressed: () => Navigator.pop(context, false),
            ),
          ),
        );
  }

  TextFormField emailTextField() {
    return TextFormField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: "E-mail",
            labelStyle: TextStyle( color: Colors.black38, fontWeight: FontWeight.w400, fontSize: 20 ),
          ),
          style: TextStyle(fontSize: 20),
        );
  }

  Text detalheEsqueceuSenhaText() {
    return Text("Por favor, informe o e-mail associado a sua conta que enviaremos um link para o mesmo com as instruções de sua senha.",
          style: TextStyle( fontSize: 16,fontWeight: FontWeight.w400 ),
          textAlign: TextAlign.center,);
  }

  Text esqueceuSenhaText() {
    return Text("Esqueceu sua senha?",
          style: TextStyle( fontSize: 29,fontWeight: FontWeight.w500 ),
          textAlign: TextAlign.center,
        );
  }
}
