# Déploiement de VM Automatisées
![gitlab updater](https://github.com/totor59/simplon_Deploiement-de-VM-Automatisees/actions/workflows/gitlab_updater.yaml/badge.svg)

```
.
├── Déploiement de VM Automatisées.pdf        # Livrable
├── README.md                                 # You are here
├── .github                                   
│   └── workflows                             # Github Actions workflow dir            
│       └── variables.auto.pkr.hcl            # Workflow file
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
    │   ├── main.tf
    │   └── basic_infra.auto.tfvars.example
    └── modules                               # Deployment modules dir
        └── basic_infra                       # Module dir
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
