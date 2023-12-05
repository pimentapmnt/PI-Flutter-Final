// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:maua/constants.dart';
import 'package:maua/model.dart/product_model.dart';


import 'components/body2.dart';
import 'components/footer.dart';
import 'components/header.dart';
import 'components/header_container.dart';
import 'components/menu.dart';

class HomeScreen2 extends StatefulWidget {
  Product? product;
  HomeScreen2 ({Key? key}) : super(key: key);
  HomeScreen2.builder({Key? key, required Product this.product}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            DrawerHeader(
              child: Center(
                child: Text(
                  "Mauá E-Sports",
                  style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.w900,
                      color: Colors.black),
                ),
              ),
            ),
            MobMenu()
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              //header
              //body
              BodyContainer2(),
              //footer
              SizedBox(
                height: 30,
              ),
              Footer(),
              //now we make our website responsive
            ],
          ),
        ),
      ),
    );
  }
}
