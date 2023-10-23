# Déploiement de VM Automatisées

build image gitlab:
```
packer build -var="subscription_id=$SUBSCRIPTION" -var="resource_group=$RESOURCE_GROUP" -var="gallery_name=$GALLERY" -var="root_password=$PASSWORD" .
```