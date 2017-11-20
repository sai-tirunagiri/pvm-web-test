# Cookbook for pvm-web server

### Description
pvm-web hosts all legacy Private Markets web applications. This is a static server, here you have the code to create, update and keep the server with the basic configuration of the server to work. We will have all the bellow items configured on the server:
* **Time Zone:** Configured to use the Central Standard Time
* **Windows Groups:** Manage the windows groups, creating and adding members - see [files/configuration/permissions/windows_groups.json](files/configuration/permissions/windows_groups.json)
* **Intall Healthcheck:** Install and configure the server health check accessed at [http://localhost:8080](http://localhost:8080) - see [files/configuration/healthcheck_config.json](files/configuration/healthcheck_config.json)
* **Install Dependencies:**
    * **Dependencies from Chocolatey:** Install .Net 4.6 and others - see [files/dependencies/choco_packages_to_install.json](files/dependencies/choco_packages_to_install.json)
    * **Windows Features:** Enabling some windows features, primarily for IIS - see [files/dependencies/features_to_enable.json](files/dependencies/features_to_enable.json)
    * **(optional) Install New Relic client:** Optionally installs New Relic client (if environment variable `New-Relic-Install` is set to `true` and license provided in environment variable `New-Relic-License`)
    * **Install Barcode font:** Installs the Code 39 barcode font
* **Configure IIS:**
    * **Event Log permissions:** Grants access for IIS users to Windows Event Logs (Application+Security)
    * **Application Pools:** Creates and configures application pools as specified in [files/configuration/iis/iis_app_pool.json](files/configuration/iis/iis_app_pool.json). Starts the pools unless Maintenance Mode is on
    * **IIS Windows Groups:** Manage IIS app pool users in windows groups - see [files/configuration/iis/iis_windows_groups.json](files/configuration/iis/iis_windows_groups.json)
    * **Local folders:** Create and configure folders in the machine for iis applications - see [files/configuration/permissions/local_folders.json](files/configuration/permissions/local_folders.json)
    * **Shared folders:** Configure the share and permission for IIS application folders - see [files/configuration/permissions/shared_folders.json](files/configuration/permissions/shared_folders.json)
    * **IIS Websites:** Create and configure IIS websites - see [files/configuration/iis/iis_site.json](files/configuration/iis/iis_site.json)
    * **IIS Applications:** Create and configure IIS applications - see [files/configuration/iis/iis_web_app.json](files/configuration/iis/iis_web_app.json)
    * **IIS Virtual Directories:** Create and configure IIS virtual directories - see [files/configuration/iis/iis_virtual_directory.json](files/configuration/iis/iis_virtual_directory.json)
    * **Deploy Applications with config file content replace:** Deploy IIS applications - see [files/deploy/applications.json](files/deploy/applications.json)
        - will replace config file contents based on file [files/deploy/file_contents_to_replace.json](files/deploy/file_contents_to_replace.json)
    * **Deploy Applications without config file content replace:** Deploy IIS applications - see [files/deploy/applications_avoid_replace.json](files/deploy/applications_avoid_replace.json)
    * **Deploy add-ins:** Deploy add-ins (ACM add-in) - see [files/deploy/addins.json](files/deploy/addins.json)
    * **IIS Authentication:** Configure IIS Authentication - see [files/configuration/iis/iis_authentication.json](files/configuration/iis/iis_authentication.json)
    * **IIS Remove Kerberos:** Set windows authentication site-wize to NTLM only
    * **Additional IIS Configurations:**
        - Disable output caching
        - Add IE=5 custom header for the IFC application
        - Add PDI Managed Handler for the PDI application
* **Configure DNS:** (non-prod only), install local DNS server and configure DNS forwarding based on [files/configuration/dns_from_prod.json](files/configuration/dns_from_prod.json) and [files/configuration/dns_from_clone_environment.json](files/configuration/dns_from_clone_environment.json)
* **CNAME:** Will update the cname pvm-web-{env}/(pvm-web in prod) and pvm-web-{env}-instance/(pvm-web-prd-instance in prod) referring to machine name
* **Netwrix:** Configure dependencies for installation of Netwrix monitor for GCC compliance

## Requirements

## Additional Information
### Platforms

- Windows Server 2012

### Chef

- Chef 12.0 or later

### Cookbooks
 - gcm-chef