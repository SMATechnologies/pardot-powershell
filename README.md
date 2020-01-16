# Pardot API functions with Powershell
This script contains functions that will help you create scripts against the Pardot API.

# Prerequisites
* Powershell v5.1
* <a href url="http://developer.pardot.com/">Pardot API v3</a>

# Instructions
To use this module, you first need to import it into your script.

Example:
```
Import-Module "C:\Pardot_Module.psm1" -Force
```

Functions:
* <b>SMA_PardotAddProspect</b> - Creates a new prospect
* <b>SMA_PardotAddToList</b> - Adds a prospect to a list
* <b>SMA_PardotAuthenticate</b> - Authenticate to the Pardot API
* <b>SMA_PardotGetAllProspects</b> - Get all prospects
* <b>SMA_PardotGetCampaign</b> - Get a campaign
* <b>SMA_PardotGetCustomFields</b> - Get custom fields
* <b>SMA_PardotGetList</b> - Get information about a list
* <b>SMA_PardotGetListMembers</b> - Get members of a list
* <b>SMA_PardotGetOpportunity</b> - Get an opportunity
* <b>SMA_PardotGetProspect</b> - Get a prospect
* <b>SMA_PardotGetProspectAccount</b> - Get a prospect account
* <b>SMA_PardotRemoveFromList</b> - Removes a prospect from a list
* <b>SMA_PardotTag</b> - Returns information about a tag

# Disclaimer
No Support and No Warranty are provided by SMA Technologies for this project and related material. The use of this project's files is on your own risk.

SMA Technologies assumes no liability for damage caused by the usage of any of the files offered here via this Github repository.

# License
Copyright 2020 SMA Technologies

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at [apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0)

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

# Contributing
We love contributions, please read our [Contribution Guide](CONTRIBUTING.md) to get started!

# Code of Conduct
[![Contributor Covenant](https://img.shields.io/badge/Contributor%20Covenant-v2.0%20adopted-ff69b4.svg)](code-of-conduct.md)
SMA Technologies has adopted the [Contributor Covenant](CODE_OF_CONDUCT.md) as its Code of Conduct, and we expect project participants to adhere to it. Please read the [full text](CODE_OF_CONDUCT.md) so that you can understand what actions will and will not be tolerated.
