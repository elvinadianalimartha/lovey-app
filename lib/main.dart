// ignore_for_file: prefer_const_constructors
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:valentine_app/express_love.dart';
import 'package:valentine_app/gender_card.dart';
import 'package:valentine_app/theme.dart';

void main() {
  runApp(const ValentineApp());
}

class ValentineApp extends StatefulWidget {
  const ValentineApp({Key? key}) : super(key: key);

  @override
  State<ValentineApp> createState() => _ValentineAppState();
}

class _ValentineAppState extends State<ValentineApp> {
  TextEditingController nameController = TextEditingController(text: '');
  TextEditingController messageController = TextEditingController(text: '');
  late List<Gender> genders = [];
  late String genderChosen = '';

  @override
  void initState() {
    super.initState();
    genders.add(Gender('Male', Icons.male, false));
    genders.add(Gender('Female', Icons.female, false));
  }

  Widget nameInput() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Crush Name',
            style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Container(
            height: 50,
            padding: EdgeInsets.symmetric(
                horizontal: 16
            ),
            decoration: BoxDecoration(
                color: baseColor,
                borderRadius: BorderRadius.circular(12)
            ),
            child: Center(
              child: Row(
                children: [
                  Icon(Icons.person, color: iconColor),
                  SizedBox(width: 16,),
                  Expanded( //expanded supaya dia lebarnya selebar ruang yg tersisa
                    child: TextFormField(
                      style: blackTextStyle,
                      controller: nameController,
                      decoration: InputDecoration.collapsed(
                          hintText: 'Your crush\'s name',
                          hintStyle: subtitleTextStyle
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget messageInput() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Message',
            style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Container(
            height: 50,
            padding: EdgeInsets.symmetric(
                horizontal: 16
            ),
            decoration: BoxDecoration(
                color: baseColor,
                borderRadius: BorderRadius.circular(12)
            ),
            child: Center(
              child: Row(
                children: [
                  Icon(Icons.message, color: iconColor),
                  SizedBox(width: 16,),
                  Expanded( //expanded supaya dia lebarnya selebar ruang yg tersisa
                    child: TextFormField(
                      style: blackTextStyle,
                      controller: messageController,
                      decoration: InputDecoration.collapsed(
                          hintText: 'What do you wanna say?',
                          hintStyle: subtitleTextStyle
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget selectGender() {
    return SizedBox(
      height: 70.0,
        child: ListView.separated(
          physics: ClampingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(width: 10,);
          },
          itemCount: genders.length,
          itemBuilder: (context, index) {
            return InkWell(
              splashColor: Color(0xFFffd8d8),
              onTap: () {
                setState(() {
                  genders.forEach(
                          (gender) => gender.isSelected = false
                  ); //spy kalo 1 diklik, yg lainnya false
                  genders[index].isSelected = true;
                  genderChosen = genders[index].name;
                  print(genderChosen);
                });
              },
              child: GenderCard(genders[index]),
            );
          },
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder: (context) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 20,),

                    //logo
                    Container(
                      width: 400,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFFffd8d8),
                        border: Border.all(color: Color(0xFFffeaea), width: 20),
                      ),
                      child: Column(
                        children: [
                          Image.asset('assets/love-birds.png', width: 120,),
                          Text(
                            'Lovey',
                            style: logoTextStyle.copyWith(
                              fontSize: 24,
                              fontWeight: bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    nameInput(),
                    messageInput(),
                    SizedBox(height: 20,),
                    Text(
                      'Choose your gender',
                      style: blackTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: medium
                      ),
                    ),
                    selectGender(),
                    SizedBox(height: 30,),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ExpressLove(nameController.text, messageController.text, genderChosen)));
                      },
                      child: Container(
                        width: 500,
                        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Done',
                              style: GoogleFonts.poppins(
                                color: primaryTextColor,
                                fontWeight: medium,
                                fontSize: 20,
                              ),
                            ),
                            Icon(Icons.chevron_right, color: Colors.white,),
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: alertColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}

