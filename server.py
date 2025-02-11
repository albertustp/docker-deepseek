from fastapi import FastAPI
import ollama

app = FastAPI()

@app.get("/")
def home():
    return {"message": "DeepSeek API is running!"}

@app.post("/generate")
def generate_text(prompt: str):
    response = ollama.chat(model="deepseek", messages=[{"role": "user", "content": prompt}])
    return {"response": response["message"]["content"]}

# Run with: uvicorn server:app --host 0.0.0.0 --port 8000