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
//   setState(() {
//     _predictionResult = "Failed to connect to API: $e";
//   });
//   print('Error: $e'); // To log the error in the console

//       };
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
      appBar: AppBar(title: Text("Student Score Predictor")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _studyHoursController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Study Hours"),
            ),
            SizedBox(height: 10), // Added spacing for better UI
            TextField(
              controller: _pastScoresController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Past Scores"),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: predictScore,
                child: Text("Predict"),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                _predictionResult,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
