from fastapi import FastAPI
from pydantic import BaseModel
import joblib
import os

# Get the absolute path to the model
model_path = os.path.join(os.path.dirname(__file__), "models", "best_model.pkl")

# Load the saved model
model = joblib.load(model_path)

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
