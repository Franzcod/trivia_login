import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:trivia50/src/screens/login.dart';
import 'package:trivia50/src/widgets/button-1.dart';


// fffffffffffffffff
// lllllllllllll
// ppppppppppppppp
// odjmklsdlfksdlkfjsd
// okdmlfskdmlskmd

class HomePage extends StatelessWidget {
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      appBar: AppBar(
        title: Text(
          'Trivia Cs50 Proyect',
          style: TextStyle(color: Theme.of(context).accentColor),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        automaticallyImplyLeading: false, //boton de volver atras automatico
        actions: [
          IconButton(
              icon: Icon(
                Icons.cancel_outlined,
                color: Colors.redAccent,
              ),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (_) => AssetGiffyDialog(
                          image: Image.network(
                            'https://i.gifer.com/origin/0a/0a835e5aafedeb12a88d2692a622401c_w200.webp',
                          ),
                          title: Text(
                            '¿Salir?',
                            style: TextStyle(
                                fontSize: 22.0, fontWeight: FontWeight.w600),
                          ),
                          description: Text(
                            'Esta seguro de querer salir?',
                            textAlign: TextAlign.center,
                            style: TextStyle(),
                          ),
                          // entryAnimation: EntryAnimation.BOTTOM_RIGHT,
                          onOkButtonPressed: () {
                            auth.signOut();
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()));
                          },
                        ));
              })
        ],
      ),
      floatingActionButton: _floatButton(),
      body: Column(
        children: [
          Container(
            color: Colors.transparent,
            width: MediaQuery.of(context).size.width,
            height: 160,
            child: Stack(
              children: [
                Center(
                  child: Image(image: AssetImage('assets/img/img1.png')),
                ),
                Positioned(
                  top: 65,
                  left: (MediaQuery.of(context).size.width / 2) - 50,
                  child: Image(
                    width: 100,
                    height: 100,
                    image: AssetImage('assets/img/img2.png'),
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.all(30),
            child: Column(
              children: [
                Button1(text: 'Play', onPress: () {}),
                SizedBox(height: 20),
                Button1(text: 'Challenge', onPress: () {}),
                SizedBox(height: 20),
                Button1(text: 'Options', onPress: () {}),
                SizedBox(height: 20),
                Button1(
                    text: 'About Trivia 50', onPress: () => _about(context)),
                    Button1(
                    text: 'About Trivia 50', onPress: () => _about(context)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _about(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => AssetGiffyDialog(
          // hola buenardo
              image: Image.network(
                'https://i.gifer.com/origin/f8/f8ffe5de155192cdf774140d6936938c_w200.webp',
              ),
              title: Text(
                'About Trivia 50',
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600),
              ),
              description: Text(
                'Version 0.1.0 \n contact:\n palacios.francisco@outlook.com',
                textAlign: TextAlign.center,
                style: TextStyle(),
              ),
              // entryAnimation: EntryAnimation.BOTTOM_RIGHT,
              onOkButtonPressed: () {
                auth.signOut();
                Navigator.of(context).pop();
              },
              onlyOkButton: true,
            ));
  }

  Widget _floatButton() {
    return SpeedDial(
      // animatedIcon: AnimatedIcons.menu_close,
      // animatedIconTheme: IconThemeData(size: 22.0),
      // / This is ignored if animatedIcon is non null
      // child: Text("open"),
      // activeChild: Text("close"),
      icon: Icons.add,
      activeIcon: Icons.close,
      openCloseDial: null,

      buttonSize: 40, // it's the SpeedDial size which defaults to 56 itself
      // iconTheme: IconThemeData(size: 22),
      // label: Text("Open"), // The label of the main button.
      /// The active label of the main button, Defaults to label if not specified.
      activeLabel: Text("Close"),

      overlayOpacity: 0.3,
      onOpen: () => print('OPENING DIAL'),
      onClose: () => print('DIAL CLOSED'),
      tooltip: 'Open Speed Dial',
      heroTag: 'speed-dial-hero-tag',
      foregroundColor: Colors.black,
      backgroundColor: Colors.amberAccent,
      // activeBackgroundColor: Colors.blue,
      elevation: 2.0,
      animationSpeed: 200,
      // shape: RoundedRectangleBorder(),
      // childMargin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      children: [
        SpeedDialChild(
          child: Icon(Icons.brush),
          backgroundColor: Colors.deepOrange,
          foregroundColor: Colors.white,
          // label: 'Second',
          onTap: () => print('SECOND CHILD'),
        ),
        SpeedDialChild(
          child: Icon(Icons.margin),
          backgroundColor: Colors.indigo,
          foregroundColor: Colors.white,
          // label: 'Show Snackbar',
          onTap: () {},
          onLongPress: () => print('THIRD CHILD LONG PRESS'),
        ),
      ],
    );
  }
}
