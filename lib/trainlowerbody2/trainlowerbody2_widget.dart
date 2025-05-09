import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'trainlowerbody2_model.dart';
export 'trainlowerbody2_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '/main.dart';
import '../vision_detector_views/pose_transform.dart';
import '../vision_detector_views/pose_video.dart';

class Trainlowerbody2Widget extends StatefulWidget {
  const Trainlowerbody2Widget({Key? key}) : super(key: key);

  @override
  _Trainlowerbody2WidgetState createState() => _Trainlowerbody2WidgetState();
}

class _Trainlowerbody2WidgetState extends State<Trainlowerbody2Widget> {
  late Trainlowerbody2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();


  var  gettime= DateTime.now();  //獲取按下去的時間
  var  gettime1;  //轉換輸出型態月日年轉年月日
  /*inputtime()async{                                                           //此函式是鎖一天只能做一個動作並傳遞後端
    var url = Uri.parse(ip+"inputtimeDOWN.php");
    final responce = await http.post(url,body: {
      "account" : FFAppState().accountnumber,
      "degree":"進階",
      "parts":"下肢",
      "time": gettime1.toString(),
      "action": FFAppState().traindown,//動作
    });
    if (responce.statusCode == 200) {
      var data = json.decode(responce.body); //將json解碼為陣列形式
      print(data["action"]);
      print(data["time"]);
      print(gettime1=dateTimeFormat('yyyy-M-d', gettime));//轉換輸出型態月日年轉年月日
      if("沒時間"==data["time"]){
        if("有訓練"==data["action"]||"有時間"==data["time"]){

        }
        else{
          Navigator.push(context,
            MaterialPageRoute(builder: (context)=>VideoApp()),
          );
        }
      }
      else if(data["times"]=="1次"&&"有時間"==data["time"]){
        if(data["timeaction"]=="對"){
          Navigator.push(context,
            MaterialPageRoute(builder: (context)=>VideoApp()),
          );
        }
      }
      else if(data["times"]=="2次"){

      }
    }
  }*/

  inputtime()async{         //此函式為代替方案，不限制一天動作，可以一職測試 測試完請刪掉
    Navigator.push(context,
      MaterialPageRoute(builder: (context)=>VideoApp()),
    );
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Trainlowerbody2Model());
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    gettime1=dateTimeFormat('yyyy-M-d', gettime);
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
              Container(
              width: double.infinity,
              constraints: BoxConstraints(
                minHeight: screenHeight * 0.9,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 1.0,
                    constraints: BoxConstraints(
                      minHeight: screenHeight * 0.75,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xFF90BDF9),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    15.0, 0.0, 0.0, 0.0),
                                child: Image.asset(
                                  'assets/images/14.png',
                                  width: screenSize.width * 0.15,
                                  height: screenSize.width * 0.15,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  '進階訓練',
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .displaySmall
                                      .override(
                                    fontFamily: 'Poppins',
                                    fontSize: screenSize.width * 0.08,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if(FFAppState().affectedside == null)
                                            return;
                                          else if(FFAppState().affectedside == "右側")
                                            global.posenumber = 18;
                                          else
                                            global.posenumber = 42;

                                          setState(() {
                                            FFAppState().traindown = '側抬腳式';
                                          });
                                          inputtime();
                                        },
                                        child: Image.asset(
                                          'assets/images/34.png',
                                          width: screenSize.width * 0.35,
                                          height: screenSize.width * 0.35,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      Text(
                                        '側抬腳式',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              fontSize: screenSize.width * 0.08,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if(FFAppState().affectedside == null)
                                            return;
                                          else if(FFAppState().affectedside == "右側")
                                            global.posenumber = 19;
                                          else
                                            global.posenumber = 43;

                                          setState(() {
                                            FFAppState().traindown = '站姿抬腳';
                                          });
                                          inputtime();
                                        },
                                        child: Image.asset(
                                          'assets/images/40.png',
                                          width: screenSize.width * 0.35,
                                          height: screenSize.width * 0.35,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      Text(
                                        '站姿抬腳',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                          fontSize: screenSize.width * 0.08,
                                          fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if(FFAppState().affectedside == null)
                                            return;
                                          else if(FFAppState().affectedside == "右側")
                                            global.posenumber = 20;
                                          else
                                            global.posenumber = 44;

                                          setState(() {
                                            FFAppState().traindown = '跨步動作';
                                          });
                                          inputtime();
                                        },
                                        child: Image.asset(
                                          'assets/images/41.png',
                                          width: screenSize.width * 0.35,
                                          height: screenSize.width * 0.35,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      Text(
                                        '跨步動作',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                          fontSize: screenSize.width * 0.08,
                                          fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if(FFAppState().affectedside == null)
                                            return;
                                          else if(FFAppState().affectedside == "右側")
                                            global.posenumber = 21;
                                          else
                                            global.posenumber = 45;

                                          setState(() {
                                            FFAppState().traindown = '站姿膝彎曲';
                                          });
                                          inputtime();
                                        },
                                        child: Image.asset(
                                          'assets/images/37.png',
                                          width: screenSize.width * 0.35,
                                          height: screenSize.width * 0.35,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      Text(
                                        '站姿膝彎曲',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                          fontSize: screenSize.width * 0.08,
                                          fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if(FFAppState().affectedside == null)
                                            return;
                                          else if(FFAppState().affectedside == "右側")
                                            global.posenumber = 22;
                                          else
                                            global.posenumber = 46;

                                          setState(() {
                                            FFAppState().traindown = '坐姿動態';
                                          });
                                          inputtime();
                                        },
                                        child: Image.asset(
                                          'assets/images/42.png',
                                          width: screenSize.width * 0.35,
                                          height: screenSize.width * 0.35,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      Text(
                                        '坐姿動態',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                          fontSize: screenSize.width * 0.08,
                                          fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if(FFAppState().affectedside == null)
                                            return;
                                          else if(FFAppState().affectedside == "右側")
                                            global.posenumber = 23;
                                          else
                                            global.posenumber = 47;

                                          setState(() {
                                            FFAppState().traindown = '坐姿平衡';
                                          });
                                          inputtime();
                                        },
                                        child: Image.asset(
                                          'assets/images/52.png',
                                          width: screenSize.width * 0.35,
                                          height: screenSize.width * 0.35,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      Text(
                                        '坐姿平衡',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                          fontSize: screenSize.width * 0.08,
                                          fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 18),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildBottomNavItem(
                              context,
                              'assets/images/17.jpg',
                              '返回',
                              screenSize*1.5,
                              onTap: () {
                                Navigator.pop(context);
                              }
                          ),
                          _buildBottomNavItem(
                              context,
                              'assets/images/18.jpg',
                              '使用紀錄',
                              screenSize*1.5,
                              onTap: () {
                                context.pushNamed('documental');
                              }
                          ),
                          _buildBottomNavItem(
                              context,
                              'assets/images/19.jpg',
                              '新通知',
                              screenSize*1.5,
                              onTap: () {
                                context.pushNamed('notice');
                              }
                          ),
                          _buildBottomNavItem(
                              context,
                              'assets/images/20.jpg',
                              '關於',
                              screenSize*1.5,
                              onTap: () {
                                context.pushNamed('about');
                              }
                          ),
                        ],
                      ),
                    ),
                  ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
      ),
    );
  }
}
Widget _buildBottomNavItem(
    BuildContext context,
    String imagePath,
    String label,
    Size screenSize,
    {VoidCallback? onTap}
    ) {
  return Padding(
    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
    child: InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            imagePath,
            width: screenSize.width * 0.17,
            height: screenSize.width * 0.15,
            fit: BoxFit.contain,
          ),
          SizedBox(height: 4),
          Text(
            label,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
              fontFamily: 'Poppins',
              fontSize: screenSize.width * 0.04,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
  );
}

