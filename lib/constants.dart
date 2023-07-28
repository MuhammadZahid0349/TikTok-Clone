import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/views/screens/Home/SearchScreen.dart';
import 'package:tiktok_clone/views/screens/VideoScreen.dart';
import 'package:tiktok_clone/views/screens/auth/auth_controller.dart';
import 'package:tiktok_clone/views/screens/add_video_screen.dart';

List pages = [
  VideoScreen(),
  SearchScreen(),
  AddVideoScreen(),
  Text('Messages Screen'),
  Text('Profile Screen'),
];

// COLORS
const backgroundColor = Colors.black;
var buttonColor = Colors.red[400];
const borderColor = Colors.grey;

// FIREBASE
var firebaseAuth = FirebaseAuth.instance;
var firebaseStorage = FirebaseStorage.instance;
var firestore = FirebaseFirestore.instance;

// CONTROLLER
var authController = AuthController.instanceAuth;
