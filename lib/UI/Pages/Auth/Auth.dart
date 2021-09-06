// import 'package:flutter/material.dart';
// import 'package:roa_help/Requests/Cities/Cities.dart';
// import 'package:roa_help/Utils/Routes/Routes.dart';
// import 'package:roa_help/Utils/Style/Style.dart';
// import 'package:provider/provider.dart';
// import 'package:roa_help/Controllers/AuthController.dart';
// import 'package:roa_help/Controllers/GeneralController.dart';
// import 'package:roa_help/generated/l10n.dart';

// class Auth extends StatefulWidget {
//   const Auth({Key key}) : super(key: key);

//   @override
//   _AuthState createState() => _AuthState();
// }

// class _AuthState extends State<Auth> {
//   bool registration = false;
//   TextEditingController usernameController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   TextEditingController confirmPasswordController = TextEditingController();
//   ScrollController scrollController = ScrollController();
//   double animatedContainerHeight = 136;
//   FocusNode focusUsername = FocusNode();
//   FocusNode focusPass = FocusNode();
//   FocusNode focusConfirmPass = FocusNode();
//   bool _passwordVisible;

//   @override
//   void initState() {
//     _passwordVisible = false;

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     var controller = Provider.of<GeneralController>(context);
//     AuthController authController = AuthController(controller: controller);
//     return MediaQuery.of(context).size.height > 795
//         ? GestureDetector(
//             behavior: HitTestBehavior.translucent,
//             onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
//             child: Scaffold(
//               resizeToAvoidBottomInset: false,
//               floatingActionButtonLocation:
//                   FloatingActionButtonLocation.centerFloat,
//               floatingActionButton: Container(
//                 margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                 height: 108,
//                 child: Column(
//                   children: [
//                     _authButton(
//                         context, Style.white, Colors.black, S.of(context).login,
//                         onTap: () {
//                       if (registration == false) {
//                         authController.authLogin(
//                             context: context,
//                             usernameController: usernameController,
//                             passwordController: passwordController);
//                       } else {
//                         usernameController.clear();
//                         passwordController.clear();
//                         registration = false;
//                       }

//                       setState(() {});
//                     }),
//                     SizedBox(
//                       height: 8,
//                     ),
//                     _authButton(context, Style.favoritesLightColor,
//                         Colors.white, S.of(context).signin, onTap: () async {
//                       if (registration == true) {
//                         authController.authRegistration(
//                             context: context,
//                             usernameController: usernameController,
//                             passwordController: passwordController,
//                             confirmPasswordController:
//                                 confirmPasswordController,
//                             chosenCity: chosenCity);
//                       } else {
//                         usernameController.clear();
//                         passwordController.clear();
//                         confirmPasswordController.clear();
//                         registration = true;
//                       }

//                       setState(() {});
//                     }),
//                   ],
//                 ),
//               ),
//               backgroundColor: Theme.of(context).backgroundColor,
//               body: SafeArea(
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: SingleChildScrollView(
//                     controller: scrollController,
//                     scrollDirection: Axis.vertical,
//                     physics: BouncingScrollPhysics(),
//                     child: Container(
//                       height: MediaQuery.of(context).size.height,
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Image.asset(
//                             'assets/images/welcomeNew.png',
//                             width: 300,
//                           ),
//                           Text(
//                             '${S.of(context).welcome}',
//                             style: Theme.of(context)
//                                 .primaryTextTheme
//                                 .headline1
//                                 .copyWith(fontSize: 30),
//                           ),
//                           SizedBox(
//                             height: 32,
//                           ),
//                           AnimatedContainer(
//                             curve: Curves.ease,
//                             duration: Duration(milliseconds: 600),
//                             child: Column(
//                               children: [
//                                 _inputTextContainer(
//                                     textcontroller: usernameController,
//                                     hintText: S.of(context).input_user_name,
//                                     textInputAction: TextInputAction.next,
//                                     focusnode: focusUsername,
//                                     onEnter: () => FocusScope.of(context)
//                                         .requestFocus(focusPass)),
//                                 SizedBox(
//                                   height: 16,
//                                 ),
//                                 _inputTextContainer(
//                                   textcontroller: passwordController,
//                                   hintText: S.of(context).input_pass,
//                                   isPass: true,
//                                   isIconShow: true,
//                                   focusnode: focusPass,
//                                   textInputAction: registration
//                                       ? TextInputAction.next
//                                       : TextInputAction.done,
//                                   onEnter: registration
//                                       ? () => FocusScope.of(context)
//                                           .requestFocus(focusConfirmPass)
//                                       : () => FocusScope.of(context).unfocus(),
//                                 ),
//                                 SizedBox(
//                                   height: 16,
//                                 ),
//                                 _confirmPassword(),
//                                 SizedBox(
//                                   height: 16,
//                                 ),
//                                 _chooseCity(),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           )
//         //  Second Scaffold for small screens
//         : GestureDetector(
//             behavior: HitTestBehavior.translucent,
//             onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
//             child: Scaffold(
//               backgroundColor: Color.fromRGBO(214, 148, 242, 1),
//               body: SafeArea(
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: SingleChildScrollView(
//                     scrollDirection: Axis.vertical,
//                     physics: BouncingScrollPhysics(),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         // Image.asset(
//                         //   'assets/images/welcomeNew.png',
//                         //   width: 255,
//                         // ),
//                         // Text(
//                         //   '${S.of(context).welcome}',
//                         //   style: Theme.of(context)
//                         //       .primaryTextTheme
//                         //       .headline1
//                         //       .copyWith(fontSize: 30),
//                         // ),
//                         // SizedBox(
//                         //   height: 32,
//                         // ),
//                         // _inputTextContainer(
//                         //   usernameController,
//                         //   S.of(context).input_user_name,
//                         //   onEnter: (_) => FocusScope.of(context).nextFocus(),
//                         // ),
//                         // SizedBox(
//                         //   height: 16,
//                         // ),
//                         // _inputTextContainer(
//                         //   passwordController,
//                         //   S.of(context).input_pass,
//                         //   onEnter: () {
//                         //     registration
//                         //         ? FocusScope.of(context).nextFocus()
//                         //         : FocusScope.of(context).unfocus();
//                         //   },
//                         // ),
//                         // registration
//                         //     ? Column(
//                         //         children: [
//                         //           SizedBox(
//                         //             height: 16,
//                         //           ),
//                         //           AnimatedOpacity(
//                         //             opacity: registration ? 1 : 0,
//                         //             duration: Duration(milliseconds: 400),
//                         //             child: FocusScope(
//                         //               child: Focus(
//                         //                 onFocusChange: (focus) {
//                         //                   if (focus) {
//                         //                     scrollController.jumpTo(100);
//                         //                   }
//                         //                 },
//                         //                 child: _inputTextContainer(
//                         //                   confirmPasswordController,
//                         //                   S.of(context).repeat_password,
//                         //                   isPass: true,
//                         //                 ),
//                         //               ),
//                         //             ),
//                         //           ),
//                         //           SizedBox(
//                         //             height: 16,
//                         //           ),
//                         //           _chooseCity(registration)
//                         //         ],
//                         //       )
//                         //     : SizedBox(),
//                         // SizedBox(
//                         //   height: 16,
//                         // ),
//                         // Container(
//                         //   margin:
//                         //       EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                         //   height: 108,
//                         //   child: Column(
//                         //     children: [
//                         //       _authButton(context, Style.white, Colors.black,
//                         //           S.of(context).login, onTap: () {
//                         //         print(registration);
//                         //         if (registration == false) {
//                         //           Navigator.pushNamed(context, '/login');
//                         //         } else {
//                         //           print(MediaQuery.of(context).size.height);
//                         //           registration = false;
//                         //         }

//                         //         setState(() {});
//                         //       }),
//                         //       SizedBox(
//                         //         height: 8,
//                         //       ),
//                         //       _authButton(context, Colors.black, Colors.white,
//                         //           S.of(context).signin, onTap: () {
//                         //         print(registration);
//                         //         if (registration == true) {
//                         //           Navigator.pushNamed(context, '/login');
//                         //         } else {
//                         //           registration = true;
//                         //         }

//                         //         setState(() {});
//                         //       }),
//                         //     ],
//                         //   ),
//                         // ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           );
//   }

//   Widget _inputTextContainer(
//       {@required TextEditingController textcontroller,
//       @required String hintText,
//       @required Function onEnter,
//       @required TextInputAction textInputAction,
//       @required focusnode,
//       bool isPass = false,
//       bool isIconShow = false}) {
//     return Container(
//       width: double.infinity,
//       height: 60,
//       decoration: BoxDecoration(
//           color: Style.inactiveColorDark.withOpacity(0.2),
//           borderRadius: BorderRadius.circular(14)),
//       child: Stack(children: [
//         Center(
//             child: TextField(
//           focusNode: focusnode,
//           onEditingComplete: () {
//             if (onEnter != null) {
//               onEnter();
//             }
//           },
//           textInputAction: textInputAction,
//           controller: textcontroller,
//           obscureText: isPass ? !_passwordVisible : false,
//           textAlign: TextAlign.center,
//           style: Theme.of(context)
//               .textTheme
//               .headline2
//               .copyWith(color: Style.white.withOpacity(0.55)),
//           decoration: InputDecoration(
//               hintText: '$hintText',
//               hintStyle: Theme.of(context)
//                   .textTheme
//                   .headline2
//                   .copyWith(color: Style.white.withOpacity(0.55)),
//               border: InputBorder.none),
//         )),
//         isIconShow
//             ? Align(
//                 alignment: Alignment.centerRight,
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 12.0),
//                   child: GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         _passwordVisible = !_passwordVisible;
//                       });
//                     },
//                     child: _passwordVisible
//                         ? Icon(
//                             Icons.visibility,
//                             color: Style.white.withOpacity(0.55),
//                           )
//                         : Icon(
//                             Icons.visibility_off,
//                             color: Style.white.withOpacity(0.55),
//                           ),
//                   ),
//                 ),
//               )
//             : SizedBox(),
//       ]),
//     );
//   }

//   Widget _confirmPassword() {
//     return AnimatedOpacity(
//       opacity: registration ? 1 : 0,
//       duration: Duration(milliseconds: 400),
//       child: FocusScope(
//         child: Focus(
//           onFocusChange: (focus) {
//             if (focus) {
//               FocusScope.of(context).nextFocus();

//               scrollController.jumpTo(100);
//             }
//           },
//           child: _inputTextContainer(
//               textcontroller: confirmPasswordController,
//               hintText: S.of(context).repeat_password,
//               textInputAction: TextInputAction.done,
//               focusnode: focusConfirmPass,
//               isPass: true,
//               isIconShow: true,
//               onEnter: () => FocusScope.of(context).unfocus()),
//         ),
//       ),
//     );
//   }

//   Widget _authButton(
//       BuildContext context, Color color, Color textColor, String text,
//       {Function onTap}) {
//     return GestureDetector(
//       onTap: () {
//         if (onTap != null) {
//           onTap();
//         }
//       },
//       child: Container(
//         width: double.infinity,
//         height: 50,
//         decoration: BoxDecoration(
//             color: color, borderRadius: BorderRadius.circular(30)),
//         child: Center(
//           child: Text(
//             '$text',
//             style: Theme.of(context)
//                 .textTheme
//                 .headline2
//                 .copyWith(color: textColor),
//           ),
//         ),
//       ),
//     );
//   }

//   String chosenCity;
//   Widget _chooseCity() {
//     return AnimatedOpacity(
//       opacity: registration ? 1 : 0,
//       duration: Duration(milliseconds: 400),
//       child: GestureDetector(
//         onTap: () async {
//           var cities = await getCities();
//           var result = await Navigator.pushNamed(context, Routes.chooseCity,
//               arguments: cities);
//           if (result != null) {
//             chosenCity = result;
//           }

//           setState(() {});
//         },
//         child: Container(
//           width: double.infinity,
//           height: 60,
//           decoration: BoxDecoration(
//               color: Style.inactiveColorDark.withOpacity(0.2),
//               borderRadius: BorderRadius.circular(14)),
//           child: Center(
//               child: Text(
//             chosenCity != null ? '$chosenCity' : '${S.of(context).choose_city}',
//             style: Theme.of(context)
//                 .textTheme
//                 .headline2
//                 .copyWith(color: Style.white.withOpacity(0.55)),
//           )),
//         ),
//       ),
//     );
//   }
// }
