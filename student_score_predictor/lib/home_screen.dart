// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   final TextEditingController _studyHoursController = TextEditingController();
//   final TextEditingController _pastScoresController = TextEditingController();
//   String _predictionResult = "";

//   @override
//   void dispose() {
//     _studyHoursController.dispose();
//     _pastScoresController.dispose();
//     super.dispose();
//   }

//   Future<void> predictScore() async {
//     final url = Uri.parse('https://student-score-prediction-api.onrender.com/predict');

//     try {
//       final response = await http.post(
//         url,
//         headers: {"Content-Type": "application/json"},
//         body: jsonEncode({
//           "study_hours": double.tryParse(_studyHoursController.text) ?? 0.0,
//           "past_scores": double.tryParse(_pastScoresController.text) ?? 0.0,
//         }),
//       );

//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         setState(() {
//           _predictionResult = "Predicted Score: ${data['predicted_score']}";
//         });
//       } else {
//         setState(() {
//           _predictionResult = "Error: ${response.body}";
//         });
//       }
//     } catch (e) {
//       setState(() {
//         _predictionResult = "Failed to connect to API";
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Student Score Predictor")),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             TextField(
//               controller: _studyHoursController,
//               keyboardType: TextInputType.number,
//               decoration: InputDecoration(labelText: "Study Hours"),
//             ),
//             SizedBox(height: 10), // Added spacing for better UI
//             TextField(
//               controller: _pastScoresController,
//               keyboardType: TextInputType.number,
//               decoration: InputDecoration(labelText: "Past Scores"),
//             ),
//             SizedBox(height: 20),
//             Center(
//               child: ElevatedButton(
//                 onPressed: predictScore,
//                 child: Text("Predict"),
//               ),
//             ),
//             SizedBox(height: 20),
//             Center(
//               child: Text(
//                 _predictionResult,
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 textAlign: TextAlign.center,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   final TextEditingController _studyHoursController = TextEditingController();
//   final TextEditingController _pastScoresController = TextEditingController();
//   String _predictionResult = "";

//   @override
//   void dispose() {
//     _studyHoursController.dispose();
//     _pastScoresController.dispose();
//     super.dispose();
//   }

//   Future<void> predictScore() async {
//     final url = Uri.parse('https://student-score-prediction-api.onrender.com/predict');

//     try {
//       final response = await http.post(
//         url,
//         headers: {"Content-Type": "application/json"},
//         body: jsonEncode({
//           "study_hours": double.tryParse(_studyHoursController.text) ?? 0.0,
//           "past_scores": double.tryParse(_pastScoresController.text) ?? 0.0,
//         }),
//       );

//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         setState(() {
//           _predictionResult = "Predicted Score: ${data['predicted_score']}";
//         });
//       } else {
//         setState(() {
//           _predictionResult = "Error: ${response.body}";
//         });
//       }
//     } catch (e) {
//       setState(() {
//         _predictionResult = "Failed to connect to API";
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blueGrey[50], // Light background color
//       appBar: AppBar(
//         title: Text("Student Score Predictor"),
//         backgroundColor: Colors.blueAccent,
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(height: 30), // Space before first input field
//             _buildTextField(_studyHoursController, "Study Hours", Icons.access_time),
//             SizedBox(height: 20), // Space between input fields
//             _buildTextField(_pastScoresController, "Past Scores", Icons.school),
//             SizedBox(height: 30), // Space before button
//             Center(
//               child: ElevatedButton(
//                 onPressed: predictScore,
//                 style: ElevatedButton.styleFrom(
//                   padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
//                   primary: Colors.blueAccent, // Button color
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(30), // Rounded corners
//                   ),
//                   shadowColor: Colors.blueGrey, // Button shadow
//                   elevation: 5,
//                 ),
//                 child: Text(
//                   "Predict Score",
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ),
//             SizedBox(height: 30),
//             Center(
//               child: Text(
//                 _predictionResult,
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.blueAccent,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildTextField(TextEditingController controller, String label, IconData icon) {
//     return TextField(
//       controller: controller,
//       keyboardType: TextInputType.number,
//       decoration: InputDecoration(
//         labelText: label,
//         labelStyle: TextStyle(color: Colors.blueAccent),
//         prefixIcon: Icon(icon, color: Colors.blueAccent),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//           borderSide: BorderSide(color: Colors.blueAccent, width: 1.5),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//           borderSide: BorderSide(color: Colors.blueAccent, width: 2),
//         ),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//         ),
//       ),
//       style: TextStyle(fontSize: 16, color: Colors.black),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _studyHoursController = TextEditingController();
  final TextEditingController _pastScoresController = TextEditingController();
  String _predictionResult = "";

  @override
  void dispose() {
    _studyHoursController.dispose();
    _pastScoresController.dispose();
    super.dispose();
  }

  Future<void> predictScore() async {
    final url = Uri.parse('https://student-score-prediction-api.onrender.com/predict');

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "study_hours": double.tryParse(_studyHoursController.text) ?? 0.0,
          "past_scores": double.tryParse(_pastScoresController.text) ?? 0.0,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          _predictionResult = "Predicted Score: ${data['predicted_score']}";
        });
      } else {
        setState(() {
          _predictionResult = "Error: ${response.body}";
        });
      }
    } catch (e) {
      setState(() {
        _predictionResult = "Failed to connect to API";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50], // Light background color
      appBar: AppBar(
        title: Text("Student Score Predictor"),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30), // Space before first input field
            _buildTextField(_studyHoursController, "Study Hours", Icons.access_time),
            SizedBox(height: 20), // Space between input fields
            _buildTextField(_pastScoresController, "Past Scores", Icons.school),
            SizedBox(height: 30), // Space before button
            Center(
              child: ElevatedButton(
                onPressed: predictScore,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  backgroundColor: Colors.blueAccent, // Button color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // Rounded corners
                  ),
                  shadowColor: Colors.blueGrey, // Button shadow
                  elevation: 5,
                ),
                child: Text(
                  "Predict Score",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 30),
            Center(
              child: Text(
                _predictionResult,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, IconData icon) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.blueAccent),
        prefixIcon: Icon(icon, color: Colors.blueAccent),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.blueAccent, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.blueAccent, width: 2),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      style: TextStyle(fontSize: 16, color: Colors.black),
    );
  }
}
