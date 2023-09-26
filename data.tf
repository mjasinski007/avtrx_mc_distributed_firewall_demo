data "http" "my_public_ip" {
    url = "http://ipv4.icanhazip.com"
}

###########################
### Ubuntu Customized AMI #
###########################

data "aws_ami" "ubuntu_golden_ami" {
    most_recent = true
    name_regex  = "^ubuntu-packer-base-"

    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }
    owners = ["169444603265"] # Canonical
}


##########################################
### Get latest Windows Server 2019 AMI ###
###########################################

data "aws_ami" "windows2019_ami" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["Windows_Server-2019-English-Full-Base*"]
  }
}

### Custom Image ###

# Locate the existing custom/golden image
data "azurerm_image" "ubuntu_golden_image" {
  name                = "Azure-Ubuntu-GoldenImage"
  resource_group_name = "packer-build-rg"
}


###########################################################
### Azure Private Ubuntu Host in VPC56 (Prod) Bootstrap ###
###########################################################


data "template_file" "az_ubnt56_priv_prod01_bootstrap" {
    template = file("${path.module}/scripts/ubuntu_bootstrap.sh")
    vars = {
        name     = "az-ubnt56-priv-prod01"
        password = var.az_ubnt56_priv_prod01_password
    }
}


##########################################################
### Azure Private Ubuntu Host in VPC57 (Dev) Bootstrap ###
##########################################################


data "template_file" "az_ubnt57_priv_dev01_bootstrap" {
    template = file("${path.module}/scripts/ubuntu_bootstrap.sh")
    vars = {
        name     = "az-ubnt57-priv-dev01"
        password = var.az_ubnt57_priv_dev01_password
    }
}


######################################################
### Bootstrapping PowerShell Script For JumpServer ###
######################################################

data "template_file" "windows_userdata" {
  template = <<EOF
  <powershell>
iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))
choco install azure-cli -y
choco install putty -y
choco install tor-browser -y
choco install notepadplusplus -y
choco install firefoxesr -y
choco install googlechrome -y 

$TargetFile = "$env:C:\ProgramData\chocolatey\bin\putty.exe"
$ShortcutFile = "$env:Public\Desktop\Putty.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$Shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$Shortcut.TargetPath = $TargetFile
$Shortcut.Save()

Install-WindowsFeature -name Web-Server -IncludeManagementTools;
shutdown -r -t 10;
</powershell>
EOF
}

# Rename-Computer -NewName "${var.aws_win66_pub_jumpsrv_instance_name}" -Force;

# /install /quiet /norestart

# https://silentinstallhq.com/microsoft-net-framework-silent-install-master-list/
# https://silentinstallhq.com/microsoft-net-framework-4-8-1-silent-install-powershell/

# https://silentinstallhq.com/microsoft-net-framework-silent-install-master-list/

# https://techcommunity.microsoft.com/t5/itops-talk-blog/how-to-run-powershell-scripts-on-azure-vms-with-terraform/ba-p/3827573