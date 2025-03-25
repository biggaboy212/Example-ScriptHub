--!nolint
--!nocheck
--!native
--!optimize 2

--[[
    SuperCool Hub

    This file was built with DarkLua, it is not intended for manual editing.
--]]

local a a={cache={},load=function(b)if not a.cache[b]then a.cache[b]={c=a[b]()}
end return a.cache[b].c end}do function a.a()local b={}b.SecureService=function(
c)local d=cloneref and cloneref(game)or game local e,f=pcall(function()return
cloneref and cloneref(d:GetService(c))or d:GetService(c)end)return e and f or
nil end b.SecureService=newcclosure and newcclosure(b.SecureService)or b.
SecureService function b.GetPlayer()local c,d=pcall(function()return(b.
SecureService'Players')end)return c and(d).LocalPlayer or nil end function b.
GetCharacter(c)local d,e=pcall(function()return c and c.Character or nil end)
return d and e or nil end function b.GetHumanoid(c)local d,e=pcall(function()
local d=b.GetCharacter(c)return d and d:FindFirstChildOfClass'Humanoid'or nil
end)return d and e or nil end return b end function a.b()local b={}function b:
Window(c)local d={Title=c.Title or'Window'}function d:Tab(e)local f={Title=e.
Label or'Tab'}function f:Section(g)local h={Title=g.Label or'Section'}function h
:Toggle(i)local j={Label=i.Label or'Toggle',State=i.State or false,Callback=i.
Callback or function()end}function j:Set(k)j.State=k j.Callback(j,k)end return j
end function h:Slider(i)local j={Label=i.Label or'Slider',Min=i.Min or 0,Max=i.
Max or 1,Value=i.Value or 0,Precision=i.Precision or 0,Callback=i.Callback or
function()end}function j:Set(k)j.Value=math.clamp(k,j.Min,j.Max)j.Callback(j,j.
Value)end return j end return h end return f end return d end return b end
function a.c()local b={Enabled=false,Boxes=false,Tracers=false}function b:
Initialize()print'Esp module Initialized!'return b end return b end function a.d
()local b={Aimbot={Enabled=false,Smoothing=0},Triggerbot={Enabled=false,Delay=0}
}function b:Initialize()print'Aiming module Initialized!'return b end return b
end function a.e()return function(b)local c,d,e,f=a.load'a',a.load'b',a.load'c':
Initialize(),a.load'd':Initialize()local g,h,i,j=c.SecureService,f.Aimbot,f.
Triggerbot,c.GetPlayer()local k,l=g'Workspace',d:Window{Title=`SuperCool Hub | {
b.Name}`}local m={Combat=l:Tab{Label='Combat'},Visuals=l:Tab{Label='Visuals'},
Player=l:Tab{Label='Player'}}do local n={Aimbot=m.Combat:Section{Label='Aimbot'}
,Triggerbot=m.Combat:Section{Label='Triggerbot'}}n.Aimbot:Toggle{Label='Enabled'
,Callback=function(o,p)h.Enabled=p end}n.Aimbot:Slider{Label='Smoothing',Min=0,
Max=20,Value=10,Callback=function(o,p)h.Smoothing=p end}n.Triggerbot:Toggle{
Label='Enabled',Callback=function(o,p)i.Enabled=p end}n.Triggerbot:Slider{Label=
'Delay',Min=0,Max=1,Value=0,Precision=3,Callback=function(o,p)i.Delay=p end}end
do local n={ESP=m.Visuals:Section{Label='ESP'}}n.ESP:Toggle{Label='Enabled',
Callback=function(o,p)e.Enabled=p end}n.ESP:Toggle{Label='Boxes',Callback=
function(o,p)e.Boxes=p end}n.ESP:Toggle{Label='Tracers',Callback=function(o,p)e.
Tracers=p end}end do local n={PlayerModification=m.Player:Section{Label=
'Player Modification'}}n.PlayerModification:Slider{Label='Player Speed',Min=1,
Max=100,Value=16,Callback=function(o,p)local q=c.GetHumanoid(j)if q then q.
WalkSpeed=p end end}n.PlayerModification:Slider{Label='Camera FOV',Min=1,Max=120
,Value=70,Precision=3,Callback=function(o,p)local q=k.CurrentCamera if q then q.
FieldOfView=p end end}end print(`SuperCool Hub Initialized | {b.Name}`)end end
function a.f()return function(b)end end end local b={Universal={Name='Universal'
,Load=a.load'e'},{Name='Blank Base',Load=a.load'f',Places={1234567890,987654321}
}}for c,d in pairs(b)do if d.Places then for e,f in ipairs(d.Places)do if f==
game.PlaceId then return d:Load()end end end end return b.Universal:Load()