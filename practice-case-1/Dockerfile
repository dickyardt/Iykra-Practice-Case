FROM python:3.9

COPY requirements.txt ./

RUN pip install --no-cache-dir -r requirements.txt

WORKDIR /usr/src/app

COPY . .

ENV GOOGLE_APPLICATION_CREDENTIALS="/usr/src/app/service_account.json"

# Running the python file
CMD [ "python", "/usr/src/app/main.py" ]