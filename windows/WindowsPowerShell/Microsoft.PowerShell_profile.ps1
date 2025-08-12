oh-my-posh init pwsh --config "C:\Users\YINHA\AppData\Local\Programs\oh-my-posh\themes\ys.omp.json" | Invoke-Expression
# oh-my-posh init pwsh --config "C:\Users\YINHA\AppData\Local\Programs\oh-my-posh\themes\remk.omp.json" | Invoke-Expression
# 
Set-PSReadLineOption -EditMode vi


#
# functions


function colin1 {
	sudo    netsh interface ip set address name="Ethernet" static 192.168.1.153 255.255.255.0
}

function colin4 {
	sudo    netsh interface ip set address name="Ethernet" static 192.168.4.137 255.255.255.0
}

function school {
	sudo	netsh interface ip set address name="Ethernet" source=dhcp
}

# pswd:0000
function mysql {
	& "C:\Program Files\MySQL\MySQL Server 5.7\bin\mysql.exe" --defaults-file="C:\ProgramData\MySQL\MySQL Server 5.7\my.ini" -uroot -p --default-character-set=utf8
}

function :q{exit}

function msys{
	& "C:\msys64\usr\bin\bash.exe"
}



#"commandline": "D:\\Documents\\WindowsPowerShell\\start_fastfetch.bat"




# 定义可选的 logo
$logos = "XCP-ng", "Xenia", "Windows 95", "Windows", "vanilla2", "uwuntu", "ubuntu_old2", "SteamOS", "Sparky", "solus", "Soda", "Slitaz", "Sasanqua", "Regolith", "redstar", "rhel_old", "Radix", "Peppermint", "PearOS", "Parsix", "Panwah", "PacBSD", "oracle", "OpenBSD", "NetBSD", "Msys2", "Kali", "Kaisen", "januslinux", "hypros", "HarDClanZ", "GNOME", "DragonFly_old", "Debian", "Calculate", "BSD", "android"

# 生成随机索引
$randomIndex = Get-Random -Minimum 0 -Maximum $logos.Count

# 选择随机 logo
$logo = $logos[$randomIndex]

# 运行 fastfetch
#Start-Process -FilePath "D:\path\to\fastfetch.exe" -ArgumentList "--logo `"$logo`" --load-config D:\Downloads\fastfetch-dev\presets\examples\myFetch.jsonc"

fastfetch.exe --logo "$logo" --load-config "C:\\Users\\YINHA\\.config\\fastfetch\\myFetch.jsonc"

