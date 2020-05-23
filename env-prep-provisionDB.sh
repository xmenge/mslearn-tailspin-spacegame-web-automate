UNIQUE_ID=3008

az keyvault create \
  --name tailspin-vault-$UNIQUE_ID \
  --resource-group tsg-web-rg \
  --enabled-for-template-deployment true

az keyvault show --name tailspin-vault-$UNIQUE_ID --query id --output tsv

SQL_PASSWORD=$(openssl rand -base64 32)

az keyvault secret set \
  --vault-name tailspin-vault-$UNIQUE_ID \
  --name "adminPassword" \
  --value "$SQL_PASSWORD"

az keyvault secret set \
  --vault-name tailspin-vault-$UNIQUE_ID \
  --name "firstRun" \
  --value "true"

az keyvault list \
  --resource-group tsg-web-rg \
  --query [].id \
  --output tsv

  