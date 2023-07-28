import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok_clone/constants.dart';
import 'package:tiktok_clone/models/user.dart';
import 'package:tiktok_clone/views/screens/auth/login_screen.dart';
import 'package:tiktok_clone/views/screens/home_screen.dart';

class AuthController extends GetxController {
  static AuthController instanceAuth = Get.find();

  var isProfilePicPathset = false.obs;
  var profilePicPath = ''.obs;

  void setprofileImagePath(String path) {
    profilePicPath.value = path;
    isProfilePicPathset.value = true;
  }

  File? pickedFile;
///////////////////////////
  File? get profilePhoto => pickedFile;
  /////////////////// pick image /////////////////////
  void pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      Get.snackbar('Profile Picture',
          'You have successfully selected your profile picture!');
      pickedFile = (File(pickedImage.path));
      authController.setprofileImagePath(pickedFile!.path);
    } else {
      Get.snackbar('Profile Picture', 'No image selected');
    }
  }

  ///////////////////////
  late Rx<User?> _user;
  User get user => _user.value!;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(firebaseAuth.currentUser);
    _user.bindStream(firebaseAuth.authStateChanges());
    ever(_user, _setInitialScreen);
  }

////////////////////// CHeck user have account or not
  _setInitialScreen(User? currentuser) {
    if (currentuser == null) {
      Get.offAll(() => LoginScreen());
    } else {
      Get.offAll(() => const HomeScreen());
    }
  }

  // registering the user
  void signUpUser(
      String username, String email, String password, File? image) async {
    try {
      if (username.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty &&
          image != null) {
        // Create user in the firebase authentication
        UserCredential cred = await firebaseAuth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        // save the user profile image to firebase storage
        String downloadUrl = await _uploadToStorage(image);

        //save user to the firestore database
        UserModel user = UserModel(
          name: username,
          email: email,
          uid: cred.user!.uid,
          profilePhoto: downloadUrl,
        );
        await firestore
            .collection('users')
            .doc(cred.user!.uid)
            .set(user.toJson());
        Get.snackbar(
          'Your Account has been created',
          '',
        );
        Get.to(() => const HomeScreen());
      } else {
        Get.snackbar(
          'Error Creating Account',
          'Please enter all the fields',
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error Creating Account',
        e.toString(),
      );
    }
  }

  void loginUser(String email, String password) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password);
        Get.snackbar(
          'Login Successfully',
          '',
        );
        Get.to(() => const HomeScreen());
      } else {
        Get.snackbar(
          'Error Logging in',
          'Please enter all the fields',
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error Login',
        e.toString(),
      );
    }
  }

  /////// upload to firebase storage ///////
  Future<String> _uploadToStorage(File image) async {
    Reference ref = firebaseStorage
        .ref()
        .child('profilePics')
        .child(firebaseAuth.currentUser!.uid);

    UploadTask uploadTask = ref.putFile(image);
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  ///////////// Sign Out ////////////////
  void signOut() async {
    await firebaseAuth.signOut();
  }
}
