// ignore_for_file: prefer_const_constructors
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:valentine_app/theme.dart';

class ExpressLove extends StatefulWidget {
  String name, message, gender;
  ExpressLove(this.name, this.message, this.gender, {Key? key}) : super(key: key);

  @override
  _ExpressLoveState createState() => _ExpressLoveState();
}

class _ExpressLoveState extends State<ExpressLove> {

  Widget love() {
    return AvatarGlow(
      glowColor: Colors.red,
      child: Icon(
        Icons.favorite,
        size: widget.gender == 'Male' ? 55 : 65,
        color: Colors.red,
      ),
      endRadius: 50,
      duration: Duration(milliseconds: 1500),
    );
  }

  //LoveyApp
  //Built by @pinulusuran
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: const [
              Color(0xFFFBC4BF),
              Color(0xFFFFFFFF),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            SizedBox(height: 90,),
            Text(
              'Dear, ${widget.name}',
              style: primaryTextStyle.copyWith(
                fontWeight: bold,
                fontSize: 30,
              ),
            ),
            SizedBox(height: 10,),
            Text(
              '" ${widget.message} "',
              style: primaryTextStyle.copyWith(
                fontWeight: semiBold,
                fontSize: 24,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30,),
            widget.message.contains('?') ?
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {  },
                    child: Text(
                      'Yash!',
                      style: GoogleFonts.poppins(
                        color: primaryTextColor,
                        fontWeight: medium,
                        fontSize: 24,
                      ),
                    ),
                    style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                        backgroundColor: secondaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 4.0
                    ),
                  ),
                  SizedBox(width: 50),
                  TextButton(
                    onPressed: () {  },
                    child: Text(
                      'Nope!',
                      style: GoogleFonts.poppins(
                        color: primaryTextColor,
                        fontWeight: medium,
                        fontSize: 24,
                      ),
                    ),
                    style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                        backgroundColor: alertColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 4.0
                    ),
                  ),
                ],
              )
              :
              SizedBox.shrink(),
            Spacer(),
            Stack(
              children: [
                Image.asset(widget.gender == 'Male' ? 'assets/delivery-boy.png' : 'assets/girl.png'),
                Container(
                  margin: EdgeInsets.only(top: widget.gender == 'Male' ? 145 : 120),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      love(),
                      SizedBox(width: 20,),
                      love(),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
