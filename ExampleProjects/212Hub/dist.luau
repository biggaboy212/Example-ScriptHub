--!nolint
--!nocheck
--!native
--!optimize 2

--[[
    212 Hub 

    SUPPORTED GAMES:
        [+] Clicking Simulator (https://www.roblox.com/games/14400545236)
        [+] Racing Simulator (https://www.roblox.com/games/105483453326837)

    This file was built with DarkLua, it is not intended for manual editing.
--]]

local a a={cache={},load=function(b)if not a.cache[b]then a.cache[b]={c=a[b]()}
end return a.cache[b].c end}do function a.a()return loadstring(game:
HttpGetAsync(
[[https://github.com/ActualMasterOogway/Fluent-Renewed/releases/latest/download/Fluent.luau]]
,true))()end function a.b()local b,c=game:GetService'HttpService',{}do c.Folder=
'FluentSettings'c.Ignore={}c.Parser={Toggle={Save=function(d,e)return{type=
'Toggle',idx=d,value=e.Value}end,Load=function(d,e)if c.Options[d]then c.Options
[d]:SetValue(e.value)end end},Slider={Save=function(d,e)return{type='Slider',idx
=d,value=tostring(e.Value)}end,Load=function(d,e)if c.Options[d]then c.Options[d
]:SetValue(e.value)end end},Dropdown={Save=function(d,e)return{type='Dropdown',
idx=d,value=e.Value,mutli=e.Multi}end,Load=function(d,e)if c.Options[d]then c.
Options[d]:SetValue(e.value)end end},Colorpicker={Save=function(d,e)return{type=
'Colorpicker',idx=d,value=e.Value:ToHex(),transparency=e.Transparency}end,Load=
function(d,e)if c.Options[d]then c.Options[d]:SetValueRGB(Color3.fromHex(e.value
),e.transparency)end end},Keybind={Save=function(d,e)return{type='Keybind',idx=d
,mode=e.Mode,key=e.Value}end,Load=function(d,e)if c.Options[d]then c.Options[d]:
SetValue(e.key,e.mode)end end},Input={Save=function(d,e)return{type='Input',idx=
d,text=e.Value}end,Load=function(d,e)if c.Options[d]and type(e.text)=='string'
then c.Options[d]:SetValue(e.text)end end}}function c:SetIgnoreIndexes(d)for e,f
in next,d do self.Ignore[f]=true end end function c:SetFolder(d)self.Folder=d
self:BuildFolderTree()end function c:Save(d)if(not d)then return false,
'no config file is selected'end local e,f=self.Folder..'/settings/'..d..'.json',
{objects={}}for g,h in next,c.Options do if not self.Parser[h.Type]then continue
end if self.Ignore[g]then continue end table.insert(f.objects,self.Parser[h.Type
].Save(g,h))end local i,j=pcall(b.JSONEncode,b,f)if not i then return false,
'failed to encode data'end writefile(e,j)return true end function c:Load(d)if(
not d)then return false,'no config file is selected'end local e=self.Folder..
'/settings/'..d..'.json'if not isfile(e)then return false,'invalid file'end
local f,g=pcall(b.JSONDecode,b,readfile(e))if not f then return false,
'decode error'end for h,i in next,g.objects do if self.Parser[i.type]then task.
spawn(function()self.Parser[i.type].Load(i.idx,i)end)end end return true end
function c:IgnoreThemeSettings()self:SetIgnoreIndexes{'InterfaceTheme',
'AcrylicToggle','TransparentToggle','MenuKeybind'}end function c:BuildFolderTree
()local d={self.Folder,self.Folder..'/settings'}for e=1,#d do local f=d[e]if not
isfolder(f)then makefolder(f)end end end function c:RefreshConfigList()local d,e
=listfiles(self.Folder..'/settings'),{}for f=1,#d do local g=d[f]if g:sub(-5)==
'.json'then local h=g:find('.json',1,true)local i,j=h,g:sub(h,h)while j~='/'and
j~='\\'and j~=''do h=h-1 j=g:sub(h,h)end if j=='/'or j=='\\'then local k=g:sub(h
+1,i-1)if k~='options'then table.insert(e,k)end end end end return e end
function c:SetLibrary(d)self.Library=d self.Options=d.Options end function c:
LoadAutoloadConfig()if isfile(self.Folder..'/settings/autoload.txt')then local d
=readfile(self.Folder..'/settings/autoload.txt')local e,f=self:Load(d)if not e
then return self.Library:Notify{Title='Interface',Content='Config loader',
SubContent='Failed to load autoload config: '..f,Duration=7}end self.Library:
Notify{Title='Interface',Content='Config loader',SubContent=string.format(
'Auto loaded config %q',d),Duration=7}return end return end function c:
BuildConfigSection(d)assert(self.Library,'Must set SaveManager.Library')local e=
d:AddSection'Configuration'e:AddInput('SaveManager_ConfigName',{Title=
'Config name'})e:AddDropdown('SaveManager_ConfigList',{Title='Config list',
Values=self:RefreshConfigList(),AllowNull=true})e:AddButton{Title=
'Create config',Callback=function()local f=c.Options.SaveManager_ConfigName.
Value if f:gsub(' ','')==''then return self.Library:Notify{Title='Interface',
Content='Config loader',SubContent='Invalid config name (empty)',Duration=7}end
local g,h=self:Save(f)if not g then return self.Library:Notify{Title='Interface'
,Content='Config loader',SubContent='Failed to save config: '..h,Duration=7}end
self.Library:Notify{Title='Interface',Content='Config loader',SubContent=string.
format('Created config %q',f),Duration=7}c.Options.SaveManager_ConfigList:
SetValues(self:RefreshConfigList())c.Options.SaveManager_ConfigList:SetValue(nil
)return end}e:AddButton{Title='Load config',Callback=function()local f=c.Options
.SaveManager_ConfigList.Value local g,h=self:Load(f)if not g then return self.
Library:Notify{Title='Interface',Content='Config loader',SubContent=
'Failed to load config: '..h,Duration=7}end self.Library:Notify{Title=
'Interface',Content='Config loader',SubContent=string.format('Loaded config %q',
f),Duration=7}return end}e:AddButton{Title='Overwrite config',Callback=function(
)local f=c.Options.SaveManager_ConfigList.Value local g,h=self:Save(f)if not g
then return self.Library:Notify{Title='Interface',Content='Config loader',
SubContent='Failed to overwrite config: '..h,Duration=7}end self.Library:Notify{
Title='Interface',Content='Config loader',SubContent=string.format(
'Overwrote config %q',f),Duration=7}return end}e:AddButton{Title='Refresh list',
Callback=function()c.Options.SaveManager_ConfigList:SetValues(self:
RefreshConfigList())c.Options.SaveManager_ConfigList:SetValue(nil)end}local f f=
e:AddButton{Title='Set as autoload',Description='Current autoload config: none',
Callback=function()local g=c.Options.SaveManager_ConfigList.Value writefile(self
.Folder..'/settings/autoload.txt',g)f:SetDesc('Current autoload config: '..g)
self.Library:Notify{Title='Interface',Content='Config loader',SubContent=string.
format('Set %q to auto load',g),Duration=7}end}if isfile(self.Folder..
'/settings/autoload.txt')then local g=readfile(self.Folder..
'/settings/autoload.txt')f:SetDesc('Current autoload config: '..g)end c:
SetIgnoreIndexes{'SaveManager_ConfigList','SaveManager_ConfigName'}end c:
BuildFolderTree()end return c end function a.c()local b,c=game:GetService
'HttpService',{}do c.Folder='FluentSettings'c.Settings={Theme='Dark',Acrylic=
true,Transparency=true,MenuKeybind='LeftControl'}function c:SetFolder(d)self.
Folder=d self:BuildFolderTree()end function c:SetLibrary(d)self.Library=d end
function c:BuildFolderTree()local d,e={},self.Folder:split'/'for f=1,#e do d[#d+
1]=table.concat(e,'/',1,f)end table.insert(d,self.Folder)table.insert(d,self.
Folder..'/settings')for f=1,#d do local g=d[f]if not isfolder(g)then makefolder(
g)end end end function c:SaveSettings()writefile(self.Folder..'/options.json',b:
JSONEncode(c.Settings))end function c:LoadSettings()local d=self.Folder..
'/options.json'if isfile(d)then local e=readfile(d)local f,g=pcall(b.JSONDecode,
b,e)if f then for h,i in next,g do c.Settings[h]=i end end end end function c:
BuildInterfaceSection(d)assert(self.Library,'Must set InterfaceManager.Library')
local e,f=self.Library,c.Settings c:LoadSettings()local g=d:AddSection
'Interface'local h=g:AddDropdown('InterfaceTheme',{Title='Theme',Description=
'Changes the interface theme.',Values=e.Themes,Default=f.Theme,Callback=function
(h)e:SetTheme(h)f.Theme=h c:SaveSettings()end})h:SetValue(f.Theme)if e.
UseAcrylic then g:AddToggle('AcrylicToggle',{Title='Acrylic',Description=
'The blurred background requires graphic quality 8+',Default=f.Acrylic,Callback=
function(i)e:ToggleAcrylic(i)f.Acrylic=i c:SaveSettings()end})end g:AddToggle(
'TransparentToggle',{Title='Transparency',Description=
'Makes the interface transparent.',Default=f.Transparency,Callback=function(i)e:
ToggleTransparency(i)f.Transparency=i c:SaveSettings()end})local i=g:AddKeybind(
'MenuKeybind',{Title='Minimize Bind',Default=f.MenuKeybind})i:OnChanged(function
()f.MenuKeybind=i.Value c:SaveSettings()end)e.MinimizeKeybind=i end end return c
end function a.d()local b={}b.SecureService=newcclosure(function(c)local d=
cloneref and cloneref(game)or game local e,f=pcall(function()return cloneref and
cloneref(d:GetService(c))or d:GetService(c)end)return e and f or error(
'Unable to get service: '..c)end)function b.GetPlayer()local c,d=pcall(function(
)return(b.SecureService'Players')end)return c and(d).LocalPlayer or nil end
function b.GetCharacter(c)local d,e=pcall(function()return c and c.Character or
nil end)return d and e or nil end function b.GetHumanoid(c)local d,e=pcall(
function()local d=b.GetCharacter(c)return d and d:FindFirstChildOfClass
'Humanoid'or nil end)return d and e or nil end return b end function a.e()local
b={}function b.init(c)local d,e,f,g=a.load'a',a.load'b',a.load'c',a.load'd'local
h=g.SecureService local i=h'ReplicatedStorage'local j=i.Packages local k=j and j
.Knit local l=k and k.Services local m={ClickService={l.ClickService,l.
ClickService.RF}}local n,o,p={Click=m.ClickService[2]:WaitForChild('Click',50)},
d.Options,d:CreateWindow{Title='212 Hub | '..c,SubTitle='by biggaboy212',
TabWidth=160,Size=UDim2.fromOffset(580,460),Acrylic=true,Theme='Dark',
MinimizeKey=Enum.KeyCode.LeftControl}local q,r,s={Main=p:AddTab{Title='Main'},
Settings=p:AddTab{Title='Settings'}},function()while o['Auto Clicker Toggle'].
Value do local q=o['Auto Clicker Delay']n.Click:InvokeServer()task.wait(q and q.
Value or 0)end end q.Main:AddToggle('Auto Clicker Toggle',{Title='Auto Clicker',
Description='Automatically clicks for you.',Default=false,Callback=function(t)if
t then s=task.spawn(r)elseif s then task.cancel(s)end end})q.Main:AddSlider(
'Auto Clicker Delay',{Title='Auto Clicker Delay',Description=
'The delay between clicks for the AutoClicker.',Default=0,Min=0,Max=5,Rounding=2
,Callback=function(t)if o['Auto Clicker Toggle'].Value and s then task.cancel(s)
s=task.spawn(r)end end})e:SetLibrary(d)f:SetLibrary(d)e:IgnoreThemeSettings()e:
SetIgnoreIndexes{}f:SetFolder'212Hub'e:SetFolder('212Hub/'..c)f:
BuildInterfaceSection(q.Settings)e:BuildConfigSection(q.Settings)p:SelectTab(1)
end return b end function a.f()local b={}function b.init(c)local d,e,f,g=a.load
'a',a.load'b',a.load'c',a.load'd'local h=g.SecureService local i,j=h'Workspace',
h'ReplicatedStorage'local k,l,m=j.Power,i.PowerHolder,i.GemHolder local n,o,p,q=
{FightUpdater=k:WaitForChild('FightUpdater',30)},d.Options,g.GetPlayer(),d:
CreateWindow{Title='212 Hub | '..c,SubTitle='by biggaboy212',TabWidth=160,Size=
UDim2.fromOffset(580,460),Acrylic=true,Theme='Dark',MinimizeKey=Enum.KeyCode.
LeftControl}local r,s,t={Main=q:AddTab{Title='Main'},Settings=q:AddTab{Title=
'Settings'}},function()while o['Auto Clicker Toggle'].Value do local r=o[
'Auto Clicker Delay']n.FightUpdater:FireServer()task.wait(r and r.Value or 0)end
end r.Main:AddToggle('Auto Clicker Toggle',{Title='Auto Clicker',Description=
'Automatically clicks for you.',Default=false,Callback=function(u)if u then t=
task.spawn(s)elseif t then task.cancel(t)end end})r.Main:AddSlider(
'Auto Clicker Delay',{Title='Auto Clicker Delay',Description=
'The delay between clicks for the AutoClicker.',Default=0,Min=0,Max=5,Rounding=2
,Callback=function(u)if o['Auto Clicker Toggle'].Value and t then task.cancel(t)
t=task.spawn(s)end end})local u,v,w=function(u,v,w)while o[v].Value do local x=g
.GetCharacter(p)local y=x and x:FindFirstChild'HumanoidRootPart'if y then for z,
A in ipairs(u:GetChildren())do if A.Name==w then local B=A:FindFirstChildOfClass
'TouchTransmitter'if B then firetouchinterest(y,A,0)task.wait()
firetouchinterest(y,A,1)end end end end task.wait(0.5)end end local x,y=function
()u(l,'Auto Collect Power Toggle','Power')end,function()u(m,
'Auto Collect Gems Toggle','Gem')end r.Main:AddToggle(
'Auto Collect Power Toggle',{Title='Auto Collect Power',Description=
'Automatically collects power for you.',Default=false,Callback=function(z)if z
then v=task.spawn(x)elseif v then task.cancel(v)end end})r.Main:AddToggle(
'Auto Collect Gems Toggle',{Title='Auto Collect Gems',Description=
'Automatically collects gems for you.',Default=false,Callback=function(z)if z
then w=task.spawn(y)elseif w then task.cancel(w)end end})e:SetLibrary(d)f:
SetLibrary(d)e:IgnoreThemeSettings()e:SetIgnoreIndexes{}f:SetFolder'212Hub'e:
SetFolder('212Hub/'..c)f:BuildInterfaceSection(r.Settings)e:BuildConfigSection(r
.Settings)q:SelectTab(1)end return b end end local b=cloneref and cloneref(
cloneref(game))or game local c,d=b.PlaceId,{['Clicking Simulator']={File=a.load
'e',Places={14400545236}},['Racing Simulator']={File=a.load'f',Places={
105483453326837}}}for e,f in pairs(d)do if f.Places then for g,h in ipairs(f.
Places)do if h==c then print(e)f.File.init(e)return end end end end