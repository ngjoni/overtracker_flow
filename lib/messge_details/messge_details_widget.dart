import '../backend/backend.dart';
import '../flutter_flow/chat/index.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class MessgeDetailsWidget extends StatefulWidget {
  const MessgeDetailsWidget({
    Key key,
    this.chatUser,
  }) : super(key: key);

  final GuestsRecord chatUser;

  @override
  _MessgeDetailsWidgetState createState() => _MessgeDetailsWidgetState();
}

class _MessgeDetailsWidgetState extends State<MessgeDetailsWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: FlutterFlowTheme.grayIcon,
            size: 30,
          ),
          onPressed: () async {
            Navigator.pop(context);
          },
        ),
        title: Text(
          widget.chatUser.displayName,
          style: FlutterFlowTheme.title2.override(
            fontFamily: 'Winlove',
            fontSize: 18,
            useGoogleFonts: false,
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      body: SafeArea(
        child: FutureBuilder<FFChatInfo>(
          future: FFChatManager.instance.getChatInfo(
            currentUserReference,
            widget.chatUser.reference,
            ChatUser(
              uid: widget.chatUser.reference.id,
              name: widget.chatUser.displayName,
              avatar: widget.chatUser.photoUrl,
            ),
          ),
          builder: (context, snapshot) => snapshot.hasData
              ? FFChatPage(
                  chatInfo: snapshot.data,
                  allowImages: true,
                  backgroundColor: FlutterFlowTheme.pageBackground,
                  timeDisplaySetting: TimeDisplaySetting.visibleOnTap,
                  currentUserBoxDecoration: BoxDecoration(
                    color: FlutterFlowTheme.lightLines,
                    border: Border.all(
                      color: Colors.transparent,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  otherUserBoxDecoration: BoxDecoration(
                    color: FlutterFlowTheme.primaryColor,
                    border: Border.all(
                      color: Colors.transparent,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  currentUserTextStyle: GoogleFonts.getFont(
                    'Cormorant Garamond',
                    color: Color(0xFF1E2429),
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    fontStyle: FontStyle.normal,
                  ),
                  otherUserTextStyle: GoogleFonts.getFont(
                    'Cormorant Garamond',
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                  inputHintTextStyle: GoogleFonts.getFont(
                    'Cormorant Garamond',
                    color: Color(0xFF95A1AC),
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                  ),
                  inputTextStyle: GoogleFonts.getFont(
                    'Cormorant Garamond',
                    color: FlutterFlowTheme.tertiaryColor,
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                  ),
                )
              : const Center(
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: SpinKitPumpingHeart(
                      color: FlutterFlowTheme.primaryColor,
                      size: 50,
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
