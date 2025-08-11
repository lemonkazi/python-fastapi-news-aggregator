FROM python:3.10-slim

# Install system dependencies
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip \
    git \
    curl \
    unzip

WORKDIR /var/www

# Copy requirements.txt first (for better caching)
COPY requirements.txt ./

# Install dependencies
RUN pip install -r requirements.txt

# Upgrade pip (optional, to address the notice about pip 23.0.1 -> 25.2)
RUN pip install --upgrade pip

# CMD ["python", "app.py"]

COPY . .

# Set permissions for the application directory
RUN chown -R www-data:www-data /var/www

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "5001", "--reload"]
