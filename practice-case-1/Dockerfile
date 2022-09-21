FROM python:3.7

# Install the python dependencies
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Copy all the files into /usr/src/app
WORKDIR /usr/src/app
COPY . .

# Export google application credentials to have the necessary permission
ENV GOOGLE_APPLICATION_CREDENTIALS="/usr/src/app/service_account.json"

# Running the python file
CMD [ "python", "main.py" ]
