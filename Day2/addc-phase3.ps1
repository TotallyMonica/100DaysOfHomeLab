$config = ".\configs\ADCS.xml"

# Install AD DC
Install-WindowsFeature -ConfigurationFilePath $config
Install-AdcsCertificationAUthority -CAType StandaloneRootCa -ValidityPeriod Years -ValidityPeriodUnits 10