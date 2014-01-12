FILE='./data_bags/encrypted_data_bag_secret'
if [ -f $FILE ];
then
  echo "Data Bag Secret Exists. Not generating a new one."
else
  echo "No Data Bag Secret Exists. Generating one for you."
  ./generate_secret.sh
fi

knife solo data bag create winbind user --secret-file $FILE --json-file ./data_bags/binding_user.json
