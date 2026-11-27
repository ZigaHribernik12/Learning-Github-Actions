# Base image: official slim Python, same version as in the workflow
FROM python:3.13-slim

# Don't write .pyc files and print logs immediately
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1
#enviroment variables for flask    
ENV FLASK_ENV=production
    PYTHONPATH=/app
# Set working directory
WORKDIR /app

# Install dependencies first (better layer caching)
COPY requirements.txt .
RUN pip install --no-cache-dir --only-binary :all: --require-hashes -r requirements.txt

# Copy only the application code
COPY app.py test_app.py ./

# Run as a non-root user
RUN useradd --create-home appuser
USER appuser

#Expose flask port
EXPOSE 8000

# Run the tests by default
CMD ["python", "-m", "pytest", "-v"]
