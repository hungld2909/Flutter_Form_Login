import 'package:flutter/material.dart';
import 'homePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: MyAppState(),
    );
  }
}


class MyAppState extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyAppState>{

  bool _showPass = false;
  TextEditingController _userController = new TextEditingController();
  TextEditingController _passController = new TextEditingController(); // thông qua Controller có thể lấy được dữ liệu nhập từ ô text Box
  var _userNameErr = "Tài khoản không hợp lệ";
  var _passWordErr = "Mật khẩu phải trên 6 thứ tự.";
  var _userInvalid = false;
  var _passInvalid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          padding: EdgeInsets.fromLTRB(30,0,30,0),
          constraints: BoxConstraints.expand(),
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end, // căn từ dưới màn hình đi lên
            crossAxisAlignment: CrossAxisAlignment.start, // căn logo sẽ nằm bên trái của thằng column
            children: <Widget>[
           Padding(
             padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: Container(
                width: 50,
                height: 50,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xffd8d8d8) // BoxDecoration
                ), 
                child: FlutterLogo(),
              ),),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
            child: Text("Hello \n Wellcome Back",style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),
              ),
          ),
          Padding(
           padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
            child: TextField(
              controller: _userController, // lấy được dữ liệu từ widget và set Text cho nó.
              style: TextStyle(fontSize: 18,color: Colors.black),
              decoration: InputDecoration(
                errorText: _userInvalid ? _userNameErr : null ,
                labelText: "USERNAME",
                labelStyle: TextStyle(
                  color: Color(0xff888888),fontSize: 15
                ), // inputDecoration
              ),
            ),
          ),
                   Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
            child: Stack(
         alignment: AlignmentDirectional.centerEnd,
         children: <Widget>[
           TextField(
             controller: _passController,
                style: TextStyle(fontSize: 18,color: Colors.black),
                obscureText: !_showPass,
              decoration: InputDecoration(
                errorText: _passInvalid ? _passWordErr : null,
                labelText: "PASSWORD",
                labelStyle: TextStyle(
                  color: Color(0xff888888),fontSize: 15
                ), // inputDecoration
              ),
            ),
        
        GestureDetector(
           onTap: onToggleShowPass ,
           child: Text(_showPass? "Hide" : "Show",style: TextStyle(fontSize: 13,color: Colors.blue),
          ),
        )
         ],
       )
        ),
          Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
          child: SizedBox(
            width: double.infinity, // giups nút button được full screen
            height: 56,
            child: RaisedButton(
            color: Colors.blue,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
            child: Text("Login",style: TextStyle(color: Colors.white,fontSize: 18.0),),
            onPressed: onSignInClicked,
          ),
          )
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
            child: Container(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("New User? Sign Up", style: TextStyle(color: Colors.blue,fontSize: 13,fontStyle: FontStyle.italic),),
                   Text("Forgot PassWord", style: TextStyle(color: Colors.blue,fontSize: 13,fontStyle: FontStyle.italic),),
                ],
              ),
            ),
            )
            ],
          ),
        ),
    );
  }
  void onToggleShowPass(){
  setState(() {
    _showPass = !_showPass;
  });
}
void onSignInClicked(){
// sử dụng  hàm setState có thể update lại được UI
setState(() {
  if(_userController.text.length < 6 || !_userController.text.contains("@")){
    _userInvalid = true;
  }else{
    _userInvalid = false;
  }

  if(_passController.text.length < 6){
    _passInvalid = true;
  }else{
    _passInvalid = false;
  }

    if(!_userInvalid && !_passInvalid){
      // Navigator.push(context, MaterialPageRoute(builder: gotoHome)); // cách 1:
      // cách 2:
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage() ));
    }
});
}
    Widget gotoHome(BuildContext context){
      return HomePage();
    }
}

