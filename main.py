# from fastapi import FastAPI, HTTPException
# from pydantic import BaseModel
# import joblib
# import os
# import numpy as np
# import logging

# # Configure logging
# logging.basicConfig(level=logging.INFO)

# # Get the absolute path to the model
# model_path = os.path.join(os.path.dirname(__file__), "models", "best_model.pkl")

# # Check if model file exists
# if not os.path.exists(model_path):
#     raise RuntimeError(f"Model file not found at {model_path}")

# # Load the saved model
# model = joblib.load(model_path)

# # Initialize FastAPI app
# app = FastAPI()

# # Define input data model
# class InputData(BaseModel):
#     study_hours: float
#     past_scores: float

# # Define prediction endpoint
# @app.post("/predict")
# def predict(data: InputData):
#     try:
#         # Prepare input for model
#         input_values = np.array([[data.study_hours, data.past_scores]])

#         # Log input values
#         logging.info(f"Received input: {input_values.tolist()}")

#         # Check input shape
#         expected_features = model.n_features_in_
#         if input_values.shape[1] != expected_features:
#             raise ValueError(f"Expected {expected_features} features, but got {input_values.shape[1]}.")

#         # Make prediction
#         prediction = model.predict(input_values)

#         # Return response
#         return {"predicted_score": round(float(prediction[0]), 2)}

#     except ValueError as e:
#         logging.error(f"Input error: {e}")
#         raise HTTPException(status_code=400, detail=str(e))

#     except Exception as e:
#         logging.error(f"Prediction error: {e}")
#         raise HTTPException(status_code=500, detail="Internal Server Error")
from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
import joblib
import os
import logging

# Setup logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

# Get the absolute path to the model
model_path = os.path.join(os.path.dirname(__file__), "models", "best_model.pkl")

# Load the saved model
try:
    model = joblib.load(model_path)
    logger.info(f"Model loaded successfully. It expects {model.n_features_in_} feature(s).")
except Exception as e:
    logger.error(f"Error loading model: {e}")
    raise

# Initialize FastAPI app
app = FastAPI()

# Define input data model
class InputData(BaseModel):
    study_hours: float
    past_scores: float = None  # Make it optional if your model only uses study_hours

# Define prediction endpoint
@app.post("/predict")
def predict(data: InputData):
    # Prepare input for model
    if model.n_features_in_ == 1:
        input_values = [[data.study_hours]]  # Only use study_hours
    else:
        input_values = [[data.study_hours, data.past_scores]]  # Use both if needed

    logger.info(f"Received input: {input_values}")

    try:
        prediction = model.predict(input_values)
        return {"predicted_score": round(prediction[0], 2)}
    except Exception as e:
        logger.error(f"Prediction error: {e}")
        raise HTTPException(status_code=400, detail="Model prediction failed.")
