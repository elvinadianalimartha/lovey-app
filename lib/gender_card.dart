// ignore_for_file: prefer_const_constructors
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:valentine_app/theme.dart';

class Gender {
  String name;
  IconData icon;
  bool isSelected;

  Gender(this.name, this.icon, this.isSelected);
}

class GenderCard extends StatelessWidget {
  Gender gender;
  GenderCard(this.gender, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: gender.isSelected ? blueColor : baseColor,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12)
        ),
        padding: EdgeInsets.symmetric(horizontal: 12),
        alignment: Alignment.center,
        margin: EdgeInsets.all(5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              gender.icon,
              color: gender.isSelected ? Colors.white : subtitleTextColor,
              size: 40,
            ),
            SizedBox(height: 10),
            Text(
              gender.name,
              style: GoogleFonts.poppins(
                color: gender.isSelected ? Colors.white : subtitleTextColor,
                fontSize: 16,
              ),
            )
          ],
        ),
      ),
    );
  }
}
