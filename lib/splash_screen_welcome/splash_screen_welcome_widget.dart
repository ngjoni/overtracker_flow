import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/main_hero_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import '../splash_screen_login/splash_screen_login_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreenWelcomeWidget extends StatefulWidget {
  const SplashScreenWelcomeWidget({Key key}) : super(key: key);

  @override
  _SplashScreenWelcomeWidgetState createState() =>
      _SplashScreenWelcomeWidgetState();
}

class _SplashScreenWelcomeWidgetState extends State<SplashScreenWelcomeWidget>
    with TickerProviderStateMixin {
  TextEditingController emailTextController;
  TextEditingController passwordController;
  bool passwordVisibility;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      fadeIn: true,
    ),
    'rowOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      delay: 90,
      fadeIn: true,
      slideOffset: Offset(0, -39),
    ),
    'rowOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      delay: 210,
      fadeIn: true,
      slideOffset: Offset(0, -82),
    ),
    'buttonOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      delay: 350,
      fadeIn: true,
      slideOffset: Offset(0, -50),
      scale: 0.6,
    ),
  };

  @override
  void initState() {
    super.initState();
    startPageLoadAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
      this,
    );

    emailTextController = TextEditingController();
    passwordController = TextEditingController();
    passwordVisibility = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF5F5F5),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xFFEEEEEE),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: Image.asset(
              'assets/images/jazmin-quaynor-8ioenvmof-I-unsplash.jpg',
            ).image,
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16, 44, 16, 44),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                MainHeroWidget(),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Alexis & Jonathon',
                      style: FlutterFlowTheme.title1.override(
                        fontFamily: 'Winlove',
                        fontSize: 32,
                        useGoogleFonts: false,
                      ),
                    ),
                  ],
                ).animated([animationsMap['rowOnPageLoadAnimation1']]),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        'Welcome! Enter the code on our invitation in order to access the app.',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.subtitle1,
                      ),
                    ),
                  ],
                ).animated([animationsMap['rowOnPageLoadAnimation2']]),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                  child: TextFormField(
                    controller: emailTextController,
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: 'Your Email',
                      hintStyle: FlutterFlowTheme.title3.override(
                        fontFamily: 'Dancing Script',
                        color: FlutterFlowTheme.grayIcon,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.lightLines,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.lightLines,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      filled: true,
                      fillColor: FlutterFlowTheme.lightText,
                      contentPadding:
                          EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),
                    ),
                    style: FlutterFlowTheme.title3,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: !passwordVisibility,
                    decoration: InputDecoration(
                      hintText: 'Passcode',
                      hintStyle: FlutterFlowTheme.title3.override(
                        fontFamily: 'Dancing Script',
                        color: FlutterFlowTheme.grayIcon,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.lightLines,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.lightLines,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      filled: true,
                      fillColor: FlutterFlowTheme.lightText,
                      contentPadding:
                          EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),
                      suffixIcon: InkWell(
                        onTap: () => setState(
                          () => passwordVisibility = !passwordVisibility,
                        ),
                        child: Icon(
                          passwordVisibility
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: FlutterFlowTheme.grayIcon,
                          size: 24,
                        ),
                      ),
                    ),
                    style: FlutterFlowTheme.title3,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.visiblePassword,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                      child: FlutterFlowIconButton(
                        borderColor: FlutterFlowTheme.lightLines,
                        borderRadius: 30,
                        borderWidth: 2,
                        buttonSize: 44,
                        fillColor: FlutterFlowTheme.pageBackground,
                        icon: Icon(
                          Icons.person_outlined,
                          color: FlutterFlowTheme.primaryColor,
                          size: 24,
                        ),
                        onPressed: () async {
                          await Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.fade,
                              duration: Duration(milliseconds: 200),
                              reverseDuration: Duration(milliseconds: 200),
                              child: SplashScreenLoginWidget(),
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          final user = await createAccountWithEmail(
                            context,
                            emailTextController.text,
                            passwordController.text,
                          );
                          if (user == null) {
                            return;
                          }

                          final guestsCreateData = createGuestsRecordData(
                            rsvp: false,
                            email: emailTextController.text,
                          );
                          await GuestsRecord.collection
                              .doc(user.uid)
                              .update(guestsCreateData);

                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  NavBarPage(initialPage: 'homePage'),
                            ),
                          );
                        },
                        text: 'Enter App',
                        options: FFButtonOptions(
                          width: 230,
                          height: 50,
                          color: FlutterFlowTheme.primaryColor,
                          textStyle: FlutterFlowTheme.title3.override(
                            fontFamily: 'Dancing Script',
                            color: FlutterFlowTheme.lightText,
                          ),
                          elevation: 3,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: 8,
                        ),
                      ).animated([animationsMap['buttonOnPageLoadAnimation']]),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ).animated([animationsMap['containerOnPageLoadAnimation']]),
    );
  }
}
