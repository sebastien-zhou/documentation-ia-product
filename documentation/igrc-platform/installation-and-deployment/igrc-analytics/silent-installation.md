---
layout: page
title: "Silent installation"
parent: "iGRC Analytics"
grand_parent: "Installation and deployment"
nav_order: 1
permalink: /docs/igrc-platform/installation-and-deployment/igrc-analytics/silent-installation/
---

# Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

# Context

In some cases, it could be useful to install iGRC platform silently.  

# Prerequisites

## Compatibility matrix

| 2015 | 2016 |    |       | >= 2017 |
| --- | --- | --- | --- | --- |
|      | R1   | R2 | R3 SP5|  |
|  No  | No   | No | Yes   | Yes |

## Dependencies

N/A

# Procedure

Once the executable is downloaded, open a command prompt (as an **administrator**) then navigate to the folder where the `exe` is located.  

The command to run is:  
`<executable-file> /S /D=<installation-folder>`  

Where:    

 * `<executable-file>`: name of the downloaded file (for example: `iGRCAnalyticsSetup_win32_x64_2016-R3-SP5_2017-04-12.exe`)  
 * `/S`: Silent installation option  
 * `/D=`: Directory where to install iGRC Analytics  

# Example

![Example]({{site.baseurl}}/docs/igrc-platform/installation-and-deployment/igrc-analytics/images/silent_install_command.PNG "Example")

# Scripting recommendation

By default, the silent procedure executes the iGRC Analytics installation in background mode.

If needed, the script can be executed in background mode, using a PowerShell console. Here is the way to manage that:

```powershell  
$INSTALL = "iGRCAnalyticsSetup_win32_x64_2016-R3-SP5_2017-04-12.exe"
$INSTALLDIR = "C:/igrc/"
$expression = "Start-Process -Wait -FilePath $INSTALL -ArgumentList `"/S /D=$INSTALLDIR`""
Invoke-Expression $expression
```

Where:  

 * `$INSTALL`: path to the iGCR Analytics binary  
 * `/S`: Silent installation option  
 * `/D`: Installation folder option  
 * `$INSTALLDIR`: Directory where to install iGRC Analytics  

# Known limitations

N/A

# See also  

[Installation guide](https://download.brainwavegrc.com/index.php/s/QffWbYEzYi4pHbw) for regular installation  
