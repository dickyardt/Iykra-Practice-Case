from google.cloud import storage
#pip install --upgrade google-cloud-storage. 
def upload_to_bucket(blob_name, path_to_file, bucket_name):
    """ Mengupload data ke bucket """
     
    # Menggunakan kredensial akun layanan dengan menentukan kunci privat
    storage_client = storage.Client.from_service_account_json(
        'creds.json')

    #print(buckets = list(storage_client.list_buckets())

    bucket = storage_client.get_bucket(bucket_name)
    blob = bucket.blob(blob_name)
    blob.upload_from_filename(path_to_file)
    
    #Me-return public url
    return blob.public_url

upload_to_bucket('download.jpg', 'D:\IYKRA\download.jpg' , 'fellowship-iykra')
