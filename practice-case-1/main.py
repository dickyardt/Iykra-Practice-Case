# import package
try:
    from google.cloud import storage
    import urllib.request
except Exception as e:
    print('This module is not available{}'.format(e))


#key
storage_client = storage.Client.from_service_account_json('service_account.json')

# Define the bucket and filename info
PROJECT_ID = 'abstract-stream-362901'
BUCKET_NAME = 'fellowship-iykra'
DESTINATION_FILENAME = 'iykra.jpg'

# Define sourcefile
SOURCE_FILENAME = 'https://www.techinasia.com/companies/iykra'

# Create a function to upload file to GCP
def upload_blob(BUCKET_NAME, SOURCE_FILENAME, DESTINATION_FILENAME):   
    # Request the file from sourcefile
    file = urllib.request.urlopen(SOURCE_FILENAME)

    # Create a bucket object
    bucket = storage_client.get_bucket(BUCKET_NAME)

    # Defining the destination filename
    blob = bucket.blob(DESTINATION_FILENAME)

    # Uploading to GCP
    blob.upload_from_string(file.read(), content_type='image/jpg')

upload_blob(BUCKET_NAME, SOURCE_FILENAME, DESTINATION_FILENAME)

print('Upload Complete')