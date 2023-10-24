# Déploiement de VM Automatisées

```
.
├── Déploiement de VM Automatisées.pdf        # Livrable
├── README.md                                 # You are here
├── packer                                    # Images build dir
│   ├── gitlab                                # Gitlab build dir
│   │   ├── gitlab.pkr.hcl                    # Gitlab template
│   │   └── variables.auto.pkr.hcl            # Gitlab template vars definition
│   └── jenkins                               
│       ├── jenkins.pkr.hcl                   
│       └── variables.auto.pkr.hcl            
└── terraform                                 # Deployment templates dir
    ├── gitlab                                # Gitlab deployment dir
    │   ├── main.tf                           # Gitlab deployment template
    │   └── basic_infra.auto.tfvars.example   # Gitlab .auto.tfvars example
    ├── jenkins
    │   ├── basic_infra.auto.tfvars.example
    │   └── main.tf
    └── modules                               # Deployment modules dir
        └── basic_infra
            ├── README.md                     # Module documentation
            ├── main.tf                       # Module template
            └── variables.tf                  # Module template vars definition
```

## Useful commands

build image Packer:
```
packer build -var="subscription_id=$SUBSCRIPTION" \
    -var="resource_group=$RESOURCE_GROUP" \
    -var="gallery_name=$GALLERY" \
    $WORKDIR
```
