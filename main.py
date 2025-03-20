from fastapi import FastAPI
from pydantic import BaseModel
import joblib

# Load the saved model
# model = joblib.load("best_model.pkl")
model = joblib.load("C:/Users/Jolie/FastAPI/notebooks/best_model.pkl")

# Initialize FastAPI app
app = FastAPI()

# Define input data model
class InputData(BaseModel):
    study_hours: float
    past_scores: float

# Define prediction endpoint
@app.post("/predict")
def predict(data: InputData):
    # Prepare input for model
    input_values = [[data.study_hours, data.past_scores]]
    
    # Make prediction
    prediction = model.predict(input_values)
    
    return {"predicted_score": round(prediction[0], 2)}
