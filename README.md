
# JustAanotherPrivacyTool

JustAanotherPrivacyTool offers a simple and easy one click script to despook your Windows 10 machine. 

**JustAanotherPrivacyTool installs the following by default**:
- ungoogled-chromium
- 7zip
- python3
- vlc
- deluge
- notepad++
- putty
- curl
- tor-browser
- rufus
- nmap
- bleachbit 
- wireshark

If you **do not** want the following programs to be installed by default you can go here: https://community.chocolatey.org/packages

**Everything can be configured with the json file found inside the folder along with everything.**
## Acknowledgements

JustAanotherPrivacyTool debloat system is based off : https://github.com/Sycnex/Windows10Debloater 


## Installation

1. Install my-project with git or download it from github.

```bash
git-clone https://github.com/aafidev/JustAanotherPrivacyTool.git
```
2. Open powershell as **administrator** it will **only** work if it is ran as **administrator**!
3. Customize ```package_list.json``` to your hearts content. Packages can be found here: https://community.chocolatey.org/packages
4. Run the ```install_programs.ps1``` powershell script it will download chocolatey if you **do not** have it on your system already. 
5. Run the ```run.ps1``` powershell script this scipt debloats and preps your system all in one go.
6. Note: make sure if all this does not work at all to run this command in your powershell ```Set-ExecutionPolicy -ExecutionPolicy RemoteSigned``` to set the execution policy on the device. 
7. Remember to run the command to ```cd``` to the directory where you put the files in when running it as admin.
8. Enjoy your fast and despooked / optimized system. 

