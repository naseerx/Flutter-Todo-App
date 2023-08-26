// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:haztech_task/Core/Constants/colors.dart';
//
// class MovieDetailsScreen extends StatefulWidget {
//   const MovieDetailsScreen({super.key});
//
//   @override
//   State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
// }
//
// class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//
//     return Scaffold(
//       body: Column(
//         children: [
//           Container(
//             height: size.height * 0.55,
//             width: size.width,
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                   image: AssetImage(imgMovie), fit: BoxFit.fitWidth),
//             ),
//             child: Column(
//               children: [
//                 kHeight(20),
//                 Row(
//                   children: [
//                     IconButton(
//                         onPressed: () {
//                           /// pop
//                         },
//                         icon: const Icon(
//                           Icons.arrow_back_ios,
//                           color: Colors.white,
//                         )),
//                     kWidth(10),
//                     const Text(
//                       'Watch',
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ],
//                 ),
//                 const Spacer(),
//                 Image.asset(imgMovieName),
//                 const Text(
//                   'In theaters december 22, 2021',
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 17),
//                 ),
//                 kHeight(10),
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.of(context).push(MaterialPageRoute(
//                         builder: (context) => const BookingScreen()));
//                   },
//                   child: Container(
//                     height: size.height * 0.07,
//                     width: size.width * 0.6,
//                     decoration: BoxDecoration(
//                       color: const Color(0xff61C3F2),
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                     child: const Center(
//                       child: Text(
//                         'Get Ticket',
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 18),
//                       ),
//                     ),
//                   ),
//                 ),
//                 kHeight(10),
//                 Container(
//                   height: size.height * 0.07,
//                   width: size.width * 0.6,
//                   decoration: BoxDecoration(
//                     border: Border.all(
//                       color: const Color(0xff61C3F2),
//                     ),
//                     borderRadius: BorderRadius.circular(15),
//                   ),
//                   child: const Center(
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(
//                           Icons.play_arrow,
//                           color: Colors.white,
//                         ),
//                         Text(
//                           'Watch Tailor',
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 18),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 kHeight(20),
//               ],
//             ),
//           ),
//           SizedBox(
//             height: size.height * 0.45,
//             width: size.width,
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   kHeight(20),
//                   const Text(
//                     'Genres',
//                     style: TextStyle(color: Colors.black, fontSize: 17),
//                   ),
//                   kHeight(12),
//                   SizedBox(
//                     height: size.height * 0.045,
//                     child: ListView.builder(
//                       scrollDirection: Axis.horizontal,
//                       itemCount: 4,
//                       itemBuilder: (BuildContext context, int index) {
//                         return Container(
//                           margin: const EdgeInsets.symmetric(horizontal: 5),
//                           width: size.width * 0.18,
//                           decoration: BoxDecoration(
//                             color: colors[index],
//                             borderRadius: BorderRadius.circular(20),
//                           ),
//                           child: Center(
//                             child: Text(
//                               options[index],
//                               style: const TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 12,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                   kHeight(12),
//                   const Divider(
//                     color: Colors.black,
//                     thickness: 0.2,
//                   ),
//                   const Text(
//                     'As a collection of history\'s worst tyrants and criminal masterminds '
//                     'gather to plot a war to wipe out millions, one man must race against '
//                     'time to stop them. Discover the origins of the very first independent '
//                     'intelligence agency in The King\'s Man. The Comic Book “The Secret '
//                     'Service” by Mark Millar and Dave Gibbons.',
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 14,
//                       letterSpacing: 1.4,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class BookingScreen extends StatefulWidget {
//   const BookingScreen({super.key});
//
//   @override
//   State<BookingScreen> createState() => _BookingScreenState();
// }
//
// class _BookingScreenState extends State<BookingScreen> {
//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Column(
//           children: [
//             Text(
//               'The Kings Play',
//               style: TextStyle(color: Colors.black, fontSize: 17),
//             ),
//             Text(
//               'In theaters december 22, 2021',
//               style: TextStyle(color: Color(0xff61C3F2), fontSize: 15),
//             ),
//           ],
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           children: [
//             kHeight(100),
//             const Text(
//               'Dates',
//               style: TextStyle(color: Colors.black, fontSize: 17),
//             ),
//             kHeight(12),
//             SizedBox(
//               height: size.height * 0.045,
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: dates.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   return Container(
//                     margin: const EdgeInsets.symmetric(horizontal: 5),
//                     width: size.width * 0.18,
//                     decoration: BoxDecoration(
//                       color: const Color(0xff61C3F2),
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     child: Center(
//                       child: Text(
//                         dates[index],
//                         style: const TextStyle(
//                             color: Colors.white,
//                             fontSize: 12,
//                             fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//             kHeight(30),
//             SizedBox(
//               height: size.height * 0.3,
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: 3,
//                 itemBuilder: (BuildContext context, int index) {
//                   return Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 6.0),
//                     child: SizedBox(
//                       width: size.width * 0.8,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const Row(
//                             children: [
//                               Text(
//                                 '  12:50',
//                                 style: TextStyle(
//                                     color: Colors.black, fontSize: 15),
//                               ),
//                               Text(
//                                 '  Cinetech + hall 1',
//                                 style: TextStyle(
//                                     color: Colors.black, fontSize: 14),
//                               ),
//                             ],
//                           ),
//                           kHeight(4),
//                           Center(
//                             child: Container(
//                               height: size.height * 0.2,
//                               width: size.width * 0.8,
//                               margin: const EdgeInsets.symmetric(horizontal: 5),
//                               decoration: BoxDecoration(
//                                 // image: DecorationImage(
//                                 //   image: AssetImage(imgSeats),
//                                 // ),
//                                 borderRadius: BorderRadius.circular(15),
//                                 border: Border.all(
//                                   color: const Color(0xff61C3F2),
//                                 ),
//                               ),
//                               child: Image.asset(
//                                 height: size.height * 0.12,
//                                 width: size.width * 0.6,
//                                 imgSeats,
//                                 fit: BoxFit.fitHeight,
//                               ),
//                             ),
//                           ),
//                           kHeight(8),
//                           const Text('  From 50\$ or 2500 bonus')
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//             const Spacer(),
//             GestureDetector(
//               onTap: () {
//                 Navigator.of(context).push(MaterialPageRoute(
//                     builder: (context) => const PaymentScreen()));
//               },
//               child: Container(
//                 height: size.height * 0.07,
//                 width: size.width * 0.8,
//                 margin: const EdgeInsets.symmetric(horizontal: 5),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(15),
//                   color: const Color(0xff61C3F2),
//                 ),
//                 child: const Center(
//                   child: Text(
//                     'Select Seat',
//                     style: TextStyle(color: Colors.white, fontSize: 18),
//                   ),
//                 ),
//               ),
//             ),
//             kHeight(8),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class PaymentScreen extends StatefulWidget {
//   const PaymentScreen({super.key});
//
//   @override
//   State<PaymentScreen> createState() => _PaymentScreenState();
// }
//
// class _PaymentScreenState extends State<PaymentScreen> {
//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Column(
//           children: [
//             Text(
//               'The Kings Play',
//               style: TextStyle(color: Colors.black, fontSize: 17),
//             ),
//             Text(
//               'In theaters december 22, 2021',
//               style: TextStyle(color: Color(0xff61C3F2), fontSize: 15),
//             ),
//           ],
//         ),
//       ),
//       body: Column(
//         children: [
//           SizedBox(
//             height: size.height * 0.5,
//             width: size.width,
//             child: Column(
//               children: [
//                 const Spacer(),
//                 Image.asset(
//                   imgSeats,
//                   width: size.width * 0.7,
//                   fit: BoxFit.cover,
//                 ),
//                 kHeight(10),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     const CircleAvatar(child: Icon(Icons.add)),
//                     kWidth(10),
//                     const CircleAvatar(child: Icon(Icons.remove)),
//                     kWidth(10),
//                   ],
//                 ),
//                 kHeight(10),
//                 Container(
//                   height: 5,
//                   width: size.width * 0.9,
//                   decoration: BoxDecoration(
//                       color: Colors.grey,
//                       borderRadius: BorderRadius.circular(10)),
//                 ),
//                 kHeight(10),
//               ],
//             ),
//           ),
//           Expanded(
//             child: Container(
//               width: size.width,
//               decoration: const BoxDecoration(
//                 color: Colors.white,
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(15.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Row(
//                         children: [
//                           Row(
//                             children: [
//                               const Icon(
//                                 Icons.bookmarks,
//                                 color: Colors.amber,
//                               ),
//                               kWidth(10),
//                               const Text('Selected')
//                             ],
//                           ),
//                           kWidth(50),
//                           Row(
//                             children: [
//                               const Icon(
//                                 Icons.bookmarks,
//                                 color: Colors.grey,
//                               ),
//                               kWidth(10),
//                               const Text('Not regular')
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Row(
//                         children: [
//                           Row(
//                             children: [
//                               const Icon(
//                                 Icons.bookmarks,
//                                 color: Colors.deepPurple,
//                               ),
//                               kWidth(10),
//                               const Text('VIP (150)')
//                             ],
//                           ),
//                           kWidth(50),
//                           Row(
//                             children: [
//                               const Icon(
//                                 Icons.bookmarks,
//                                 color: Color(0xff61C3F2),
//                               ),
//                               kWidth(10),
//                               const Text('Selected')
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                     kHeight(30),
//                     Container(
//                       height: size.height * 0.05,
//                       width: size.width * 0.3,
//                       decoration: BoxDecoration(
//                           color: Colors.grey.withOpacity(0.1),
//                           borderRadius: BorderRadius.circular(10)),
//                       child: const Padding(
//                         padding: EdgeInsets.all(8.0),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text('4 / 3 Row'),
//                             Icon(
//                               Icons.highlight_remove_sharp,
//                               color: Colors.black,
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                     kHeight(30),
//                     Row(
//                       children: [
//                         Container(
//                           height: size.height * 0.08,
//                           decoration: BoxDecoration(
//                               color: Colors.grey.withOpacity(0.1),
//                               borderRadius: BorderRadius.circular(10)),
//                           child: const Padding(
//                             padding: EdgeInsets.all(8.0),
//                             child: Padding(
//                               padding: EdgeInsets.symmetric(horizontal: 8.0),
//                               child: Column(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text('Total Price'),
//                                   Text(
//                                     '\$ 50',
//                                     style: TextStyle(
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                         kWidth(10),
//                         Expanded(
//                           child: Container(
//                             height: size.height * 0.08,
//                             decoration: BoxDecoration(
//                                 color: const Color(0xff61C3F2),
//                                 borderRadius: BorderRadius.circular(10)),
//                             child: const Padding(
//                               padding: EdgeInsets.all(8.0),
//                               child: Center(
//                                   child: Text(
//                                 'Proceed to pay',
//                                 style: TextStyle(
//                                     fontSize: 17,
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.bold),
//                               )),
//                             ),
//                           ),
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// List colors = [
//   const Color(0xff15D2BC),
//   const Color(0xffE26CA5),
//   const Color(0xff564CA3),
//   const Color(0xffCD9D0F)
// ];
// List options = ['Action', 'Thriller', 'Science', 'Fiction'];
// List dates = [
//   '5 March',
//   '6 March',
//   '7 March',
//   '8 March',
//   '9 March',
//   '10 March'
// ];
// String imgMovie = 'assets/movie.png';
// String imgMovieName = 'assets/name.png';
// String imgSeats = 'assets/seats.png';
// Widget kWidth(double w) => SizedBox(width: w);
// Widget kHeight(double h) => SizedBox(height: h);
