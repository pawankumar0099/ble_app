
// import 'package:flutter/material.dart';


// class HomePageWidget extends StatefulWidget {
//   const HomePageWidget({
//     Key? key,
   
//   }) : super(key: key);


//   @override
//   _HomePageWidgetState createState() => _HomePageWidgetState();
// }


//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<UsersRecord>(
//       stream: UsersRecord.getDocument(currentUserReference!),
//       builder: (context, snapshot) {
//         // Customize what your widget looks like when it's loading.
//         if (!snapshot.hasData) {
//           return Scaffold(
//             backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
//             body: Center(
//               child: SizedBox(
//                 width: 40,
//                 height: 40,
//                 child: SpinKitPumpingHeart(
//                   color: FlutterFlowTheme.of(context).primary,
//                   size: 40,
//                 ),
//               ),
//             ),
//           );
//         }
//         final homePageUsersRecord = snapshot.data!;
//         return Scaffold(
//           key: scaffoldKey,
//           backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
//           body: SafeArea(
//             top: true,
//             child: SingleChildScrollView(
//               child: Column(
//                 mainAxisSize: MainAxisSize.max,
//                 children: [
//                   Padding(
//                     padding: EdgeInsetsDirectional.fromSTEB(20, 0, 16, 0),
//                     child: Row(
//                       mainAxisSize: MainAxisSize.max,
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Card(
//                           clipBehavior: Clip.antiAliasWithSaveLayer,
//                           color: FlutterFlowTheme.of(context).primary,
//                           elevation: 2,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(40),
//                           ),
//                           child: Padding(
//                             padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
//                             child: Container(
//                               width: 60,
//                               height: 60,
//                               clipBehavior: Clip.antiAlias,
//                               decoration: BoxDecoration(
//                                 shape: BoxShape.circle,
//                               ),
//                               child: Image.asset(
//                                 'assets/images/UI_avatar_2@3x.png',
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
//                     child: Row(
//                       mainAxisSize: MainAxisSize.max,
//                       children: [
//                         Padding(
//                           padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
//                           child: Text(
//                             'Good Morning',
//                             style: FlutterFlowTheme.of(context).displaySmall,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
//                     child: Row(
//                       mainAxisSize: MainAxisSize.max,
//                       children: [
//                         Padding(
//                           padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
//                           child: Text(
//                             'Pawan',
//                             style: FlutterFlowTheme.of(context)
//                                 .headlineMedium
//                                 .override(
//                                   fontFamily: 'Outfit',
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
//                           child: Image.asset(
//                             'assets/images/waving-hand-sign_emoji-modifier-fitzpatrick-type-5_1f44b_1f3fe.png',
//                             width: 36,
//                             height: 36,
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
//                     child: StreamBuilder<List<AppointmentsRecord>>(
//                       stream: queryAppointmentsRecord(
//                         queryBuilder: (appointmentsRecord) => appointmentsRecord
//                             .where('appointmentPerson',
//                                 isEqualTo: currentUserReference)
//                             .orderBy('appointmentTime'),
//                         limit: 1,
//                       ),
//                       builder: (context, snapshot) {
//                         // Customize what your widget looks like when it's loading.
//                         if (!snapshot.hasData) {
//                           return Center(
//                             child: SizedBox(
//                               width: 40,
//                               height: 40,
//                               child: SpinKitPumpingHeart(
//                                 color: FlutterFlowTheme.of(context).primary,
//                                 size: 40,
//                               ),
//                             ),
//                           );
//                         }
//                         List<AppointmentsRecord>
//                             nextAppointmentSectionAppointmentsRecordList =
//                             snapshot.data!;
//                         if (nextAppointmentSectionAppointmentsRecordList
//                             .isEmpty) {
//                           return Center(
//                             child: Image.asset(
//                               'assets/images/noUpcomingAppointments.png',
//                               width: MediaQuery.sizeOf(context).width * 0.8,
//                             ),
//                           );
//                         }
//                         return Row(
//                           mainAxisSize: MainAxisSize.max,
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: List.generate(
//                               nextAppointmentSectionAppointmentsRecordList
//                                   .length, (nextAppointmentSectionIndex) {
//                             final nextAppointmentSectionAppointmentsRecord =
//                                 nextAppointmentSectionAppointmentsRecordList[
//                                     nextAppointmentSectionIndex];
//                             return Padding(
//                               padding:
//                                   EdgeInsetsDirectional.fromSTEB(0, 20, 0, 12),
//                               child: StreamBuilder<AppointmentsRecord>(
//                                 stream: AppointmentsRecord.getDocument(
//                                     nextAppointmentSectionAppointmentsRecord
//                                         .reference),
//                                 builder: (context, snapshot) {
//                                   // Customize what your widget looks like when it's loading.
//                                   if (!snapshot.hasData) {
//                                     return Center(
//                                       child: SizedBox(
//                                         width: 40,
//                                         height: 40,
//                                         child: SpinKitPumpingHeart(
//                                           color: FlutterFlowTheme.of(context)
//                                               .primary,
//                                           size: 40,
//                                         ),
//                                       ),
//                                     );
//                                   }
//                                   final appointmentCardAppointmentsRecord =
//                                       snapshot.data!;
//                                   return Container(
//                                     width: MediaQuery.sizeOf(context).width *
//                                         1.003,
//                                     decoration: BoxDecoration(
//                                       color: FlutterFlowTheme.of(context)
//                                           .secondaryBackground,
//                                       boxShadow: [
//                                         BoxShadow(
//                                           blurRadius: 4,
//                                           color: Color(0x230E151B),
//                                           offset: Offset(0, 2),
//                                         )
//                                       ],
//                                       borderRadius: BorderRadius.circular(8),
//                                     ),
//                                     child: Padding(
//                                       padding: EdgeInsetsDirectional.fromSTEB(
//                                           12, 12, 12, 12),
//                                       child: Column(
//                                         mainAxisSize: MainAxisSize.max,
//                                         children: [
//                                           Row(
//                                             mainAxisSize: MainAxisSize.max,
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.spaceBetween,
//                                             children: [
//                                               Expanded(
//                                                 child: Padding(
//                                                   padding: EdgeInsetsDirectional
//                                                       .fromSTEB(4, 0, 0, 0),
//                                                   child: Text(
//                                                     'Scan Bluetooth Devices',
//                                                     style: FlutterFlowTheme.of(
//                                                             context)
//                                                         .headlineSmall,
//                                                   ),
//                                                 ),
//                                               ),
//                                               Icon(
//                                                 Icons.chevron_right_rounded,
//                                                 color:
//                                                     FlutterFlowTheme.of(context)
//                                                         .grayLight,
//                                                 size: 24,
//                                               ),
//                                             ],
//                                           ),
//                                           Row(
//                                             mainAxisSize: MainAxisSize.max,
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.spaceBetween,
//                                             children: [
//                                               Expanded(
//                                                 child: Padding(
//                                                   padding: EdgeInsetsDirectional
//                                                       .fromSTEB(4, 4, 0, 0),
//                                                   child: AutoSizeText(
//                                                     'Turn bluetooth on/off',
//                                                     style: FlutterFlowTheme.of(
//                                                             context)
//                                                         .bodyMedium
//                                                         .override(
//                                                           fontFamily: 'Outfit',
//                                                           fontSize: 15,
//                                                         ),
//                                                   ),
//                                                 ),
//                                               ),
//                                               BluetoothWidget(
//                                                 key: Key(
//                                                     'Keyiae_${nextAppointmentSectionIndex}of${nextAppointmentSectionAppointmentsRecordList.length}'),
//                                               ),
//                                             ],
//                                           ),
//                                           Padding(
//                                             padding:
//                                                 EdgeInsetsDirectional.fromSTEB(
//                                                     0, 8, 0, 0),
//                                             child: Row(
//                                               mainAxisSize: MainAxisSize.max,
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.center,
//                                               children: [
//                                                 Card(
//                                                   clipBehavior: Clip
//                                                       .antiAliasWithSaveLayer,
//                                                   color: FlutterFlowTheme.of(
//                                                           context)
//                                                       .primaryBackground,
//                                                   shape: RoundedRectangleBorder(
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             20),
//                                                   ),
//                                                   child: Padding(
//                                                     padding:
//                                                         EdgeInsetsDirectional
//                                                             .fromSTEB(
//                                                                 25, 4, 25, 4),
//                                                     child: Row(
//                                                       mainAxisSize:
//                                                           MainAxisSize.max,
//                                                       children: [
//                                                         Padding(
//                                                           padding:
//                                                               EdgeInsetsDirectional
//                                                                   .fromSTEB(16,
//                                                                       4, 16, 4),
//                                                           child: Text(
//                                                             'Scan',
//                                                             style: FlutterFlowTheme
//                                                                     .of(context)
//                                                                 .bodyMedium,
//                                                           ),
//                                                         ),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   );
//                                 },
//                               ),
//                             );
//                           }),
//                         );
//                       },
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
//                     child: Row(
//                       mainAxisSize: MainAxisSize.max,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Padding(
//                           padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
//                           child: Column(
//                             mainAxisSize: MainAxisSize.max,
//                             children: [
//                               Material(
//                                 color: Colors.transparent,
//                                 elevation: 3,
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(8),
//                                 ),
//                                 child: Container(
//                                   width:
//                                       MediaQuery.sizeOf(context).width * 0.86,
//                                   height: 100,
//                                   decoration: BoxDecoration(
//                                     color:
//                                         FlutterFlowTheme.of(context).tertiary,
//                                     borderRadius: BorderRadius.circular(8),
//                                   ),
//                                   child: Row(
//                                     mainAxisSize: MainAxisSize.max,
//                                     children: [
//                                       Padding(
//                                         padding: EdgeInsetsDirectional.fromSTEB(
//                                             16, 0, 0, 0),
//                                         child: Icon(
//                                           Icons.bluetooth_connected,
//                                           color: Colors.white,
//                                           size: 55,
//                                         ),
//                                       ),
//                                       Expanded(
//                                         child: Padding(
//                                           padding:
//                                               EdgeInsetsDirectional.fromSTEB(
//                                                   10, 15, 10, 0),
//                                           child: Column(
//                                             mainAxisSize: MainAxisSize.max,
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.center,
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.start,
//                                             children: [
//                                               Text(
//                                                 'Connected Device',
//                                                 textAlign: TextAlign.start,
//                                                 style:
//                                                     FlutterFlowTheme.of(context)
//                                                         .headlineSmall
//                                                         .override(
//                                                           fontFamily: 'Outfit',
//                                                           color: FlutterFlowTheme
//                                                                   .of(context)
//                                                               .alternate,
//                                                           fontSize: 19,
//                                                         ),
//                                               ),
//                                               Expanded(
//                                                 child: Padding(
//                                                   padding: EdgeInsetsDirectional
//                                                       .fromSTEB(0, 0, 0, 8),
//                                                   child: AutoSizeText(
//                                                     'THB_12345678',
//                                                     style: FlutterFlowTheme.of(
//                                                             context)
//                                                         .bodySmall
//                                                         .override(
//                                                           fontFamily: 'Outfit',
//                                                           color:
//                                                               Color(0xB4FFFFFF),
//                                                         ),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                               Padding(
//                                 padding:
//                                     EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
//                                 child: InkWell(
//                                   splashColor: Colors.transparent,
//                                   focusColor: Colors.transparent,
//                                   hoverColor: Colors.transparent,
//                                   highlightColor: Colors.transparent,
//                                   onTap: () async {
//                                     await launchURL('tel:1234567890');
//                                   },
//                                   child: Material(
//                                     color: Colors.transparent,
//                                     elevation: 3,
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(8),
//                                     ),
//                                     child: Container(
//                                       width: MediaQuery.sizeOf(context).width *
//                                           0.86,
//                                       height: 100,
//                                       decoration: BoxDecoration(
//                                         color: FlutterFlowTheme.of(context)
//                                             .primary,
//                                         borderRadius: BorderRadius.circular(8),
//                                       ),
//                                       child: Row(
//                                         mainAxisSize: MainAxisSize.max,
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceEvenly,
//                                         children: [
//                                           Align(
//                                             alignment:
//                                                 AlignmentDirectional(0, 0),
//                                             child: Column(
//                                               mainAxisSize: MainAxisSize.max,
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.center,
//                                               children: [
//                                                 FlutterFlowIconButton(
//                                                   borderColor:
//                                                       FlutterFlowTheme.of(
//                                                               context)
//                                                           .primary,
//                                                   borderRadius: 20,
//                                                   borderWidth: 1,
//                                                   buttonSize: 40,
//                                                   fillColor: Color(0x00FFFFFF),
//                                                   icon: FaIcon(
//                                                     FontAwesomeIcons.readme,
//                                                     color: FlutterFlowTheme.of(
//                                                             context)
//                                                         .textColor,
//                                                     size: 24,
//                                                   ),
//                                                   onPressed: () {
//                                                     print(
//                                                         'IconButton pressed ...');
//                                                   },
//                                                 ),
//                                                 Text(
//                                                   'Read Batch Code',
//                                                   style: FlutterFlowTheme.of(
//                                                           context)
//                                                       .bodyMedium
//                                                       .override(
//                                                         fontFamily: 'Outfit',
//                                                         color:
//                                                             FlutterFlowTheme.of(
//                                                                     context)
//                                                                 .alternate,
//                                                       ),
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                           Column(
//                                             mainAxisSize: MainAxisSize.max,
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.center,
//                                             children: [
//                                               FlutterFlowIconButton(
//                                                 borderColor:
//                                                     FlutterFlowTheme.of(context)
//                                                         .primary,
//                                                 borderRadius: 20,
//                                                 borderWidth: 1,
//                                                 buttonSize: 40,
//                                                 fillColor: Color(0x00616161),
//                                                 icon: Icon(
//                                                   Icons.mode_edit,
//                                                   color: FlutterFlowTheme.of(
//                                                           context)
//                                                       .alternate,
//                                                   size: 24,
//                                                 ),
//                                                 onPressed: () {
//                                                   print(
//                                                       'IconButton pressed ...');
//                                                 },
//                                               ),
//                                               Text(
//                                                 'Set Batch Code',
//                                                 style:
//                                                     FlutterFlowTheme.of(context)
//                                                         .bodyMedium
//                                                         .override(
//                                                           fontFamily: 'Outfit',
//                                                           color: FlutterFlowTheme
//                                                                   .of(context)
//                                                               .alternate,
//                                                         ),
//                                               ),
//                                             ],
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               Padding(
//                                 padding:
//                                     EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
//                                 child: InkWell(
//                                   splashColor: Colors.transparent,
//                                   focusColor: Colors.transparent,
//                                   hoverColor: Colors.transparent,
//                                   highlightColor: Colors.transparent,
//                                   onTap: () async {
//                                     await launchURL(
//                                         'mailto:contact@health.ai.demo');
//                                   },
//                                   child: Material(
//                                     color: Colors.transparent,
//                                     elevation: 3,
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(8),
//                                     ),
//                                     child: Container(
//                                       width: MediaQuery.sizeOf(context).width *
//                                           0.86,
//                                       height: 100,
//                                       decoration: BoxDecoration(
//                                         color: FlutterFlowTheme.of(context)
//                                             .secondary,
//                                         borderRadius: BorderRadius.circular(8),
//                                       ),
//                                       child: Row(
//                                         mainAxisSize: MainAxisSize.max,
//                                         children: [
//                                           Padding(
//                                             padding:
//                                                 EdgeInsetsDirectional.fromSTEB(
//                                                     15, 0, 0, 0),
//                                             child: Image.asset(
//                                               'assets/images/iconEmail.png',
//                                               width: 60,
//                                               height: 60,
//                                               fit: BoxFit.cover,
//                                             ),
//                                           ),
//                                           Expanded(
//                                             child: Align(
//                                               alignment:
//                                                   AlignmentDirectional(0, 0),
//                                               child: Padding(
//                                                 padding: EdgeInsetsDirectional
//                                                     .fromSTEB(10, 10, 10, 10),
//                                                 child: Column(
//                                                   mainAxisSize:
//                                                       MainAxisSize.max,
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment.center,
//                                                   crossAxisAlignment:
//                                                       CrossAxisAlignment.center,
//                                                   children: [
//                                                     Align(
//                                                       alignment:
//                                                           AlignmentDirectional(
//                                                               -1, 0),
//                                                       child: Text(
//                                                         'Start Test',
//                                                         textAlign:
//                                                             TextAlign.center,
//                                                         style:
//                                                             FlutterFlowTheme.of(
//                                                                     context)
//                                                                 .headlineSmall
//                                                                 .override(
//                                                                   fontFamily:
//                                                                       'Outfit',
//                                                                   color: FlutterFlowTheme.of(
//                                                                           context)
//                                                                       .alternate,
//                                                                   fontSize: 22,
//                                                                   fontWeight:
//                                                                       FontWeight
//                                                                           .w500,
//                                                                 ),
//                                                       ),
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }