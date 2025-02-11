# Use a lightweight Ubuntu base image
FROM ubuntu:22.04

# Set environment variables (optional)
ENV OLLAMA_MODELS=/root/.ollama

# Install dependencies and Ollama
RUN apt update && apt install -y \
    curl python3 python3-pip && \
    curl -fsSL https://ollama.com/install.sh | sh

# Install FastAPI for serving the DeepSeek model
RUN pip install fastapi uvicorn ollama

# Set working directory
WORKDIR /app

# Copy the FastAPI server file
COPY server.py /app

# Expose API port
EXPOSE 8000

# Run FastAPI when the container starts
CMD ["uvicorn", "server:app", "--host", "0.0.0.0", "--port", "8000"]