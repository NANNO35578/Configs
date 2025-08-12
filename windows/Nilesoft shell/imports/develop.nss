menu(mode="multiple" title='&Develop' vis=key.shift() sep=sep.bottom image=\uE26E)
{
	menu(type='*' where=(sel.count or wnd.is_taskbar or wnd.is_edit) title=title.terminal sep='top' image=icon.run_with_powershell)
	{
		$tip_run_admin=["\xE1A7 Press SHIFT key to run " + this.title + " as administrator", tip.warning, 1.0]
		$has_admin=key.shift() or key.rbutton()
		
		item(title=title.command_prompt tip=tip_run_admin admin=has_admin image cmd='cmd.exe' args='/K TITLE Command Prompt &ver& PUSHD "@sel.dir"')
		item(title=title.windows_powershell admin=has_admin tip=tip_run_admin image cmd='powershell.exe' args='-noexit -command Set-Location -Path "@sel.dir\."')
		item(where=package.exists("WindowsTerminal") title=title.Windows_Terminal tip=tip_run_admin admin=has_admin image='@package.path("WindowsTerminal")\WindowsTerminal.exe' cmd='wt.exe' arg='-d "@sel.path\."')
	} 

	menu(mode="single" title='editors' image=\uE17A)
	{
		item(title='Visual Studio Code' image=[\uE272, #22A7F2] cmd='code' args='"@sel.path"')
		separator
		item(type='file' mode="single" title='Windows notepad' image cmd='@sys.bin\notepad.exe' args='"@sel.path"')
	}

	menu(mode="multiple" title='dotnet' image=\uE143)
	{
		item(title='run' cmd-line='/K dotnet run' image=\uE149)
		item(title='watch' cmd-line='/K dotnet watch')
		item(title='clean' image=\uE0CE cmd-line='/K dotnet clean')
		separator
		item(title='build debug' cmd-line='/K dotnet build')
		item(title='build release' cmd-line='/K dotnet build -c release /p:DebugType=None')

		menu(mode="multiple" sep="both" title='publish' image=\ue11f)
		{
			$publish='dotnet publish -r win-x64 -c release --output publish /*/p:CopyOutputSymbolsToPublishDirectory=false*/'
			item(title='publish single file' sep="after" cmd-line='/K @publish --no-self-contained /p:PublishSingleFile=true')
			item(title='framework-dependent deployment' cmd-line='/K @publish')
			item(title='framework-dependent executable' cmd-line='/K @publish --self-contained false')
			item(title='self-contained deployment' cmd-line='/K @publish --self-contained true')
			item(title='single-file' cmd-line='/K @publish /p:PublishSingleFile=true /p:PublishTrimmed=false')
			item(title='single-file-trimmed' cmd-line='/K @publish /p:PublishSingleFile=true /p:PublishTrimmed=true')
		}
		
		item(title='ef migrations add InitialCreate' cmd-line='/K dotnet ef migrations add InitialCreate')
		item(title='ef database update' cmd-line='/K dotnet ef database update')
		separator
		item(title='help' image=\uE136 cmd-line='/k dotnet -h')
		item(title='version' cmd-line='/k dotnet --info')
	}
}
