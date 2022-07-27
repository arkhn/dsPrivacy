# dsPrivacy

## Introduction

`dsPrivacy` is a package for running differentially private statistical analysis for DataSHIELD (a platform for federated analysis of private data).

DataSHIELD is a platform in R for federated analysis of private data. DataSHIELD has a client-server architecture and this package has a client side and server side component.

* The client side package is called `dsPrivacyClient`

    * https://github.com/arkhn/dsPrivacyClient

* The server side package is called `dsPrivacy`

    * https://github.com/arkhn/dsPrivacy

## Installation

You can install this library on your Opal Server with the following command:
```R
# Connect with an administrator credential
opal = opal.login(url = "", user = "", password = "")
# If needed, remove the previous version of the package (for a fresh reinstall)
# dsadmin.remove_package(opal, pkg = "dsDarah", profile = "default")
# You can use `ref` to provide a custom branch
dsadmin.install_github_package(opal, pkg = "dsDarah", username = "arkhn", ref = "main", profile = "default")
```

On your client side, run the following:
```R
library(devtools)
devtools::install_github('arkhn/dsPrivacyClient', ref = "main")
```

If you're enthusiastic about our project, ⭐ it to show your support! ❤️