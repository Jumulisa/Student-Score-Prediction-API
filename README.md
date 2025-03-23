 # links
 The link to the youtube Video demo https://youtu.be/9IXcyCJj0do
 
 The link to the notebook https://colab.research.google.com/drive/1kMpJSw1vJ721KNxrDyHmgZ5TUBGzOdw3#scrollTo=mbPJ5z9M7RrG
 
 The link to the the Swagger UI https://student-score-prediction-api.onrender.com/docs#/

# Step-by-Step Guide: From Model to Running the Flutter App
This guide walks you through the entire process of building a Student Score Predictor, from training a Machine Learning model to running a Flutter app.

1. Train the Machine Learning Model
   
I used Linear Regression to predict student scores based on study hours and past scores.

Steps to Follow:
Install dependencies (numpy, pandas, scikit-learn, joblib).

Load and preprocess the dataset.

Split data into training and testing sets.

Train the Linear Regression model.

Evaluate the model using Mean Squared Error (MSE).

Save the trained model as a .pkl file using joblib.

2. Build the FastAPI Backend
   
FastAPI will be used to serve predictions.

Steps to Follow:
Installed FastAPI and Uvicorn.

Create a main.py file to:

# Load the trained model.

Define an API endpoint (/predict) that accepts study hours and past scores.

Return the predicted score as JSON.

Enable CORS to allow Flutter to access the API.

# Run the API locally with:
uvicorn main:app --reload
Tested the API using https://student-score-prediction-api.onrender.com/docs#/default/predict%20predict%20post.

3. Deploy the API to Render
   
Steps to Follow:
Created a requirements.txt file with all dependencies.

Pushed the project to GitHub.

Deploy on Render.com as a Web Service.

# Set the start command:
uvicorn main:app --host 0.0.0.0 --port 10000
Get the public API URL for use in Flutter.

4. Build the Flutter App
   
Steps to Follow:
# Create a Flutter Project:
flutter create student_score_predictor
cd student_score_predictor

# Install HTTP Package for API Requests:
flutter pub add http

Update pubspec.yaml to include http.

Create a UI with Input Fields for study_hours and past_scores.

Send API Requests to the /predict endpoint and display the result.

# Run the Flutter App:
flutter run

# Troubleshooting Commands (if needed):
flutter clean

flutter pub get

flutter run

# Conclusion
 Trained a Machine Learning model
 
 Built a FastAPI backend
 
 Deployed API on Render
 
 Built a Flutter app and connected to the API
 
 Runned the Flutter app successfully
