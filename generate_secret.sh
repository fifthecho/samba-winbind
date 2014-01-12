openssl rand -base64 512 | tr -d '\r\n' > ./data_bags/encrypted_data_bag_secret
