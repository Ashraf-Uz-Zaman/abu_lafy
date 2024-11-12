// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:street_soccer/application/dependency_injection.dart';
// import 'package:street_soccer/domain/model/event_model.dart';
// import 'package:street_soccer/presentation/resources/color_manager.dart';
// import 'package:street_soccer/presentation/resources/font_manager.dart';
// import 'package:street_soccer/presentation/resources/strings_manager.dart';
// import 'package:street_soccer/presentation/resources/values_manager.dart';
// import 'package:street_soccer/presentation/ui/main/event/event_viewmodel.dart';
//
// class EventDetailsView extends StatefulWidget {
//   final EventModel model;
//
//   const EventDetailsView({Key? key, required this.model}) : super(key: key);
//
//   @override
//   _EventDetailsViewState createState() => _EventDetailsViewState();
// }
//
// class _EventDetailsViewState extends State<EventDetailsView> {
//   final EventViewModel _viewModel = instance<EventViewModel>();
//   final _formKey = GlobalKey<FormState>();
//
//   _bind() {
//     _viewModel.start();
//     _viewModel.split_string(widget.model.note ?? '');
//   }
//
//   @override
//   void initState() {
//     _bind();
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     _viewModel.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: ColorManager.white,
//       body: _getContentWidget(),
//       bottomNavigationBar: Container(
//         height: 70,
//         color: Colors.white,
//         padding: const EdgeInsets.all(10),
//         child: SizedBox(
//           width: double.infinity,
//           height: AppSize.s40,
//           child: ElevatedButton(
//               onPressed: () {
//                 _viewModel.postAttendanceApi();
//               }, child: const Text(AppStrings.login)),
//         ),
//       ),
//     );
//   }
//
//   Widget _getContentWidget() {
//     return SafeArea(
//         child: SingleChildScrollView(
//       child: Container(
//         height: MediaQuery.of(context).size.height,
//         padding: const EdgeInsets.only(top: 5, left: 5, right: 5, bottom: 0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             text_field(
//                 text: widget.model.name ?? '',
//                 maxLine: 1,
//                 color: Colors.black,
//                 fontSize: 22,
//                 fontWeight: FontWeightManager.bold,
//                 letterSpacing: 0.8),
//             const SizedBox(
//               height: 5,
//             ),
//             (widget.model.banner ?? '') != ''
//                 ? Image.memory(
//                     const Base64Decoder().convert(
//                       widget.model.banner ?? '',
//                     ),
//                     width: double.infinity,
//                     fit: BoxFit.cover,
//                   )
//                 : const SizedBox.shrink(),
//             const SizedBox(
//               height: 5,
//             ),
//             text_field(
//                 text: "Description",
//                 maxLine: 5,
//                 color: Colors.black,
//                 fontSize: 16.5,
//                 fontWeight: FontWeightManager.semiBold,
//                 letterSpacing: 0.4,
//                 textDecoration: TextDecoration.underline),
//             const SizedBox(
//               height: 3,
//             ),
//             text_field(
//                 text: widget.model.description ?? '',
//                 maxLine: 5,
//                 color: Colors.black,
//                 fontSize: 13,
//                 fontWeight: FontWeightManager.regular,
//                 letterSpacing: 0.4),
//             const SizedBox(
//               height: 5,
//             ),
//
//
//
//             text_field(
//                 text: "Note",
//                 maxLine: 5,
//                 color: Colors.black,
//                 fontSize: 16.5,
//                 fontWeight: FontWeightManager.semiBold,
//                 letterSpacing: 0.4,
//                 textDecoration: TextDecoration.underline),
//             const SizedBox(
//               height: 3,
//             ),
//          Flexible(child:    ListView.builder(
//              itemCount: _viewModel.note_list.length,
//              scrollDirection: Axis.vertical,
//              shrinkWrap: true,
//              physics: const NeverScrollableScrollPhysics(),
//              itemBuilder: (context, index) {
//                return Column(
//                  crossAxisAlignment: CrossAxisAlignment.start,
//                  children: [
//                    index > 0 ? const SizedBox(height: 5,) : const SizedBox.shrink(),
//                    Row(
//                      crossAxisAlignment: CrossAxisAlignment.start,
//                      children: [
//                        text_field(
//                          text: (index + 1).toString(),
//                          maxLine: 1,
//                          color: Colors.black,
//                          fontSize: 13,
//                          fontWeight: FontWeightManager.regular,
//                          letterSpacing: 0.4,
//                        ),
//                        const SizedBox(width: 5,),
//                        text_field(
//                          text: _viewModel.note_list[index],
//                          maxLine: 2,
//                          color: Colors.black,
//                          fontSize: 13,
//                          fontWeight: FontWeightManager.regular,
//                          letterSpacing: 0.4,
//                        )
//                      ],
//                    ),
//                  ],
//                );
//
//              }),),
//             const SizedBox(
//               height: 5,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     text_field(
//                         text: "Start Date",
//                         maxLine: 5,
//                         color: Colors.black,
//                         fontSize: 16.5,
//                         fontWeight: FontWeightManager.semiBold,
//                         letterSpacing: 0.4,
//                         textDecoration: TextDecoration.underline),
//                     const SizedBox(
//                       height: 3,
//                     ),
//                     text_field(
//                         text: widget.model.dateStart ?? '',
//                         maxLine: 5,
//                         color: Colors.black,
//                         fontSize: 13,
//                         fontWeight: FontWeightManager.regular,
//                         letterSpacing: 0.4),
//                     const SizedBox(
//                       height: 5,
//                     ),
//                     text_field(
//                         text: "End Date",
//                         maxLine: 5,
//                         color: Colors.black,
//                         fontSize: 16.5,
//                         fontWeight: FontWeightManager.semiBold,
//                         letterSpacing: 0.4,
//                         textDecoration: TextDecoration.underline),
//                     const SizedBox(
//                       height: 3,
//                     ),
//                     text_field(
//                         text: widget.model.dateEnd ?? '',
//                         maxLine: 5,
//                         color: Colors.black,
//                         fontSize: 13,
//                         fontWeight: FontWeightManager.regular,
//                         letterSpacing: 0.4),
//                   ],
//                 ),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     text_field(
//                         text: "Start Time",
//                         maxLine: 5,
//                         color: Colors.black,
//                         fontSize: 16.5,
//                         fontWeight: FontWeightManager.semiBold,
//                         letterSpacing: 0.4,
//                         textDecoration: TextDecoration.underline),
//                     const SizedBox(
//                       height: 3,
//                     ),
//                     text_field(
//                         text: widget.model.timeBegin ?? '',
//                         maxLine: 5,
//                         color: Colors.black,
//                         fontSize: 13,
//                         fontWeight: FontWeightManager.regular,
//                         letterSpacing: 0.4),
//                     const SizedBox(
//                       height: 5,
//                     ),
//                     text_field(
//                         text: "End Time",
//                         maxLine: 5,
//                         color: Colors.black,
//                         fontSize: 16.5,
//                         fontWeight: FontWeightManager.semiBold,
//                         letterSpacing: 0.4,
//                         textDecoration: TextDecoration.underline),
//                     const SizedBox(
//                       height: 3,
//                     ),
//                     text_field(
//                         text: widget.model.timeEnd ?? '',
//                         maxLine: 5,
//                         color: Colors.black,
//                         fontSize: 13,
//                         fontWeight: FontWeightManager.regular,
//                         letterSpacing: 0.4),
//                   ],
//                 ),
//               ],
//             ),
//             const SizedBox(
//               height: 5,
//             ),
//           ],
//         ),
//       ),
//     ));
//   }
//
//   Widget text_field(
//       {required String text,
//       required int maxLine,
//       required Color color,
//       required double fontSize,
//       required FontWeight fontWeight,
//       TextAlign? textAlign,
//       double? letterSpacing,
//       TextDecoration? textDecoration}) {
//     return Text(
//       text ?? '',
//       maxLines: maxLine,
//       textAlign: textAlign ?? TextAlign.start,
//       style: TextStyle(
//         fontFamily: FontConstants.fontFamily,
//         decoration: textDecoration ?? TextDecoration.none,
//         overflow: TextOverflow.ellipsis,
//         color: color,
//         fontSize: fontSize,
//         letterSpacing: letterSpacing ?? 0,
//         fontWeight: fontWeight ?? FontWeight.w400,
//       ),
//     );
//   }
//
//
// }
