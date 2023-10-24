# Déploiement de VM Automatisées

```
.
├── Déploiement de VM Automatisées.pdf # Livrable
├── README.md
├── packer                                    # Images build dir
│   ├── gitlab                                # Gitlab build dir
│   │   ├── gitlab.pkr.hcl                    # Gitlab template
│   │   └── variables.auto.pkr.hcl            # Gitlab template vars definition
│   └── jenkins                               # Jenkins build dir
│       ├── jenkins.pkr.hcl                   # Jenkins template
│       └── variables.auto.pkr.hcl            # Jenkins template vars definition
└── terraform                                 # Deployment dir
    ├── gitlab                                # Gitlab deployment dir
    │   └── main.tf                           # Gitlab deployment template
    ├── jenkins
    │   ├── basic_infra.auto.tfvars.example
    │   └── main.tf
    └── modules
        └── basic_infra
            ├── README.md
            ├── main.tf
            └── variables.tf
```

## Useful commands

build image Packer:
```
packer build -var="subscription_id=$SUBSCRIPTION" \
    -var="resource_group=$RESOURCE_GROUP" \
    -var="gallery_name=$GALLERY" \
    $WORKDIR
```
