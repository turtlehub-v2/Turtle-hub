--!nocheck
-- Turtle Hub v66 | RAGE + OMG RAGE + Weapon Lock + Skybox + Custom Crosshair Text/Color + Kill Sounds
local LD=14;
if LD>0 then task.wait(LD) end;
pcall(function() local s=Instance.new("Sound"); s.SoundId="rbxassetid://86092213898958"; s.Volume=0.6; s.Parent=game:GetService("SoundService"); s:Play(); game:GetService("Debris"):AddItem(s,4) end);
local __S={};
for _,k in ipairs({"Library","Options","SaveManager","ThemeManager","Window"}) do __S[k]=rawget(getgenv(),k) end;
local R="https://raw.githubusercontent.com/deividcomsono/Obsidian/main/";
local Library,ThemeManager,SaveManager;
pcall(function() Library=loadstring(game:HttpGet(R.."Library.lua"))() end);
pcall(function() ThemeManager=loadstring(game:HttpGet(R.."addons/ThemeManager.lua"))() end);
pcall(function() SaveManager=loadstring(game:HttpGet(R.."addons/SaveManager.lua"))() end);
if not Library then warn("Library failed"); return end;
local Options=Library.Options;
for k,v in pairs(__S) do if v~=nil then pcall(function() getgenv()[k]=v end) end end;
local P=game:GetService("Players");
local RS=game:GetService("RunService");
local CG=game:GetService("CoreGui");
local UIS=game:GetService("UserInputService");
local HS=game:GetService("HttpService");
local LT=game:GetService("Lighting");
local LP=P.LocalPlayer;
local PG=LP:WaitForChild("PlayerGui");
local TG=(gethui and gethui()) or PG or CG;
local GN="TurtleHub_"..tostring(math.random(100000,999999));
pcall(function() for _,g in pairs(TG:GetChildren()) do if g.Name:match("^TurtleHub") then g:Destroy() end end end);
local function GD(o,f) if not o then return f end; local v=nil; pcall(function() v=o.Value end); if v==nil and o.GetValue then local ok,x=pcall(function() return o:GetValue() end); if ok then v=x end end; if type(v)=="table" then for k in pairs(v) do v=k; break end end; return v or f end;
local function GI(o,f) if not o then return f end; local v=nil; pcall(function() v=o.Value end); if v==nil and o.GetValue then local ok,x=pcall(function() return o:GetValue() end); if ok then v=x end end; return v or f end;
local function SN(n) return ({[0]="Off",[1]="Slot 1",[2]="Slot 2",[3]="Slot 3"})[n] or "Off" end;

local SP={
["SpongeBob"]={"15962101128","15970246218","15962101128","15962101128","15962101128","15962901054"},
["Deep Space"]={"159248188","159248183","159248187","159248173","159248192","159248176"},
["Crazy Hello City"]={"5487778646","5487764867","5487778646","5487778646","5487778646","5487762943"},
["One Piece"]={"158516797","158516788","158516797","158516797","158516797","158516792"},
["Matcha"]={"151165214","151165197","151165224","151165191","151165206","151165227"},
["Abyssal Blues"]={"16269815885","16269839652","16269798011","16269813852","16269814948","16269829700"},
["Pink Sky"]={"271042516","271077243","271042556","271042310","271042467","271077958"},
["Green Sky"]={"921882045","921881907","921882121","921881811","921881989","921882259"},
["Purple Nebula"]={"159454299","159454296","159454293","159454286","159454300","159454288"},
["Vaporwave"]={"1417494030","1417494146","1417494253","1417494402","1417494499","1417494643"},
["Redshift"]={"2670643365","2670643365","2670643365","2670643365","2670643365","2670643365"},
["Minecraft"]={"1876545003","1876544331","1876542941","1876543392","1876543764","1876544642"},
["PurpleDay"]={"296908715","296908724","296908740","296908755","296908764","296908769"},
["RedNight"]={"401664839","401664862","401664960","401664881","401664901","401664936"},
["Trollge"]={"6155393905","6155393905","6155393905","6155393905","6155393905","6155393905"},
["Night"]={"48020371","48020144","48020234","48020211","48020254","48020383"},
["Space"]={"149397692","149397686","149397697","149397684","149397688","149397702"},
["Default"]={"6444884337","6444884785","6444884337","6444884337","6444884337","6412503613"},
["VibeNight"]={"5084575798","5084575916","5103949679","5103948542","5103948784","5084576400"},
["PurpleSplash"]={"8539982183","8539981943","8539981721","8539981424","8539980766","8539981085"},
["Snowy"]={"155657655","155674246","155657609","155657671","155657619","155674931"},
["AlienRed"]={"1012890","1012891","1012887","1012889","1012888","1014449"},
["WallsOfAutumn"]={"7123244709","7123246497","7123255895","7123257992","7123279103","7123281828"},
["ColdWinterness"]={"7123754562","7123756028","7123757422","7123758897","7123760563","7123762364"},
["Oblivion"]={"7123654189","7123657455","7123662047","7123664533","7123666598","7123668994"},
["ClassicSky"]={"672345740","672345828","672345879","672345927","672346006","672346072"},
["YellowDay"]={"2651432901","2651434974","2651435990","2651436494","2651436979","2651437350"},
["Sunset"]={"150939022","150939038","150939047","150939056","150939063","150939082"},
["CartoonSky"]={"6778646360","6778658683","6778648039","6778649136","6778650519","6778658364"},
["Anime"]={"7643700666","7643743687","7644304186","7644288724","7643700819","7643757404"},
["HellSky"]={"437430787","437430804","437430543","437430732","437430747","437430771"},
["StarryNight"]={"8291078911","8291077403","8291081613","8291074004","8291080353","8291075054"},
["Omori"]={"8767416629","8767416629","8767416629","8767416629","8767416629","8767416629"},
["c00lkidd"]={"433381097","433381097","433381097","433381097","433381097","433381097"},
["ClearDay"]={"591058823","591059876","591058104","591057861","591057625","591059642"},
["Mountains"]={"324014980","324015477","324014995","324014679","324015013","324015409"},
["Forest"]={"70945545","70945449","70945487","70945523","70945508","70945531"},
["Crimson"]={"15832429892","15832430998","15832430210","15832430671","15832431198","15832429401"},
["PumpkinHill"]={"11202510597","11202510255","11202509993","11202510806","11202511066","11202509704"},
["AnimeIsland"]={"14753804949","14753795573","14753807625","14753797417","14753799966","14753810287"},
["Desert"]={"161319957","161319965","161319970","161319983","161319989","161319996"},
["Cloudy"]={"225469345","225469349","225469359","225469364","225469372","225469380"},
["Island"]={"319343577","319343653","319343666","319343686","319343631","319343614"},
["OrangeFog"]={"458016711","458016826","458016532","458016655","458016782","458016792"},
["Office"]={"658623433","316342560","658625205","658627155","658628504","658632701"},
["PurpleFog"]={"17279854976","17279856318","17279858447","17279860360","17279862234","17279864507"},
["EarthSpace"]={"15753305495","15753362674","15753305823","15753310707","15753304774","15753304473"},
["SummerDay"]={"135483466","135483484","135483461","135483495","135483499","135483475"},
["Underwater"]={"227635868","227635921","227635954","227635974","227635990","227636031"},
["Poison"]={"1370716695","1370716766","1370716833","1370716898","1370716955","1370717024"},
["BlueSpace"]={"1127563035","1127563006","1127563026","1127563216","1127563115","1127562999"},
["PinkGradient"]={"5371541816","5371541154","5371541816","5371541816","5371541816","5371540604"},
["BlueGradient"]={"4628466090","4628471901","4628466090","4628466090","4628466090","4628472152"},
["GreenNebula"]={"47974894","47974690","47974821","47974776","47974859","47974909"},
["GreenAurora"]={"16563478983","16563481302","16563484084","16563485362","16563487078","16563489821"},
["Blank"]={"1361097","1361097","1361097","1361097","1361097","1361097"},
["Clouds"]={"570557514","570557775","570557559","570557620","570557672","570557727"},
["Elegant Morning"]={"153767241","153767216","153767266","153767200","153767231","153767288"},
["Fade Blue"]={"153695414","153695352","153695452","153695320","153695383","153695471"},
["Neptune"]={"218955819","218953419","218954524","218958493","218957134","218950090"},
["Night Sky"]={"12064107","12064152","12064121","12063984","12064115","12064131"},
["Setting Sun"]={"626460377","626460216","626460513","626473032","626458639","626460625"},
["Twighlight"]={"264908339","264907909","264909420","264909758","264908886","264907379"},
["Vivid Skies"]={"271042516","271077243","271042556","271042310","271042467","271077958"},
["Elisium Sky"]={"1898724755","1898727189","1898722814","1898729298","1898741025","1898736761"},
};
local SL={};
for k,_ in pairs(SP) do table.insert(SL,k) end;
table.sort(SL);

local St={
CrosshairEnabled=true;FollowMouse=false;GlowEnabled=true;BaseLength=16;Thickness=2;CenterGap=13;
RotationSpeed=173;RGBSpeed=0.2;SizeRange=7;PulseSpeed=3.5;MinSpeedMultiplier=0.45;MaxSpeedMultiplier=1.75;
CrosshairFont="Roboto";TextSize=15;TextStrokeThickness=0.7;CrosshairX=0;CrosshairY=0;TextX=0;TextY=-11;
OutlineThickness=3;OutlineOpacity=65;GlowSize=26;GlowOpacity=100;TextGlowSize=10;TextGlowOpacity=100;
CrosshairText="Yokai.win";ColorMode="Static";StaticColor={185,170,235};
FastFire=false;FastMelee=false;AutoAvatarSlot=0;AutoLoad=true;SelfAutoExecEnabled=false;SelfAutoExecURL="";HeadlessEnabled=false;
FlyEnabled=false;FlySpeed=100;WalkSpeedEnabled=false;WalkSpeedValue=100;NoclipEnabled=false;JumpPowerEnabled=false;JumpPowerValue=100;
EliEnabled=false;EliFFA=false;EliPrediction=true;EliOffsetX=7;EliOffsetY=7;EliOffsetZ=7;EliPredictionAmount=1;
ESPEnabled=false;ESPColor={255,80,80};ESPTransparency=0.65;ESPColorStrength=1;ESPOutlineTransparency=0.15;
SkyEnabled=false;SkyPreset="Deep Space";SkyRotate=false;SkyRotateSpeed=1;SkyRotateDirection="Horizontal";SkyRotateMethod="Spin";
SkyRemoveSun=false;SkyRemoveMoon=false;SkyRemoveStars=false;
OrbitEnabled=false;AuraEnabled=false;ChinaHatEnabled=false;TurtleSwimEnabled=false;
ListBgColor={24,24,28};ListBgTransparency=30;ListCorner=6;ListHeight=220;ButtonBgColor={38,38,44};ButtonCorner=4;ButtonHeight=28;ShowEmptyText=true;
OMG_Speed=10.0;
KillSoundsEnabled=false;KillSoundID="135097031120155";KillSoundVolume=1.0;
};
local GF={{frac=0.15,transp=0.45,corner=3},{frac=0.35,transp=0.68,corner=5},{frac=0.60,transp=0.82,corner=8},{frac=1.00,transp=0.93,corner=12}};
local GFC=#GF;
local TGL={{stroke=3,transp=0.55,st=0.45},{stroke=7,transp=0.78,st=0.70},{stroke=13,transp=0.90,st=0.86}};
local TGC=#TGL;
local FL={"Arcade","GothamBold","Gotham","GothamBlack","SciFi","Fantasy","SourceSans","SourceSansBold","Arial","ArialBold","Legacy","Code","DenkOne","FredokaOne","Highway","JosefinSans","Merriweather","Montserrat","Oswald","Roboto","RobotoMono","TitilliumWeb","Ubuntu"};
local AP={Preset1="",Preset2="",Preset3="",Preset1Headless=false,Preset2Headless=false,Preset3Headless=false};
local BL={};
local SF="TurtleHubSettingsPC.json";
local AF="TurtleHubAvatarPresets.json";
local BF="TurtleHubBlacklist.json";

local function SS() pcall(function() if writefile then writefile(SF,HS:JSONEncode(St)) end end) end;
local function LS() 
    pcall(function() 
        if readfile and isfile and isfile(SF) then 
            local t=HS:JSONDecode(readfile(SF))
            for k,v in pairs(t) do if St[k]~=nil then St[k]=v end end 
        end 
    end) 
end;
local function SA() pcall(function() if writefile then writefile(AF,HS:JSONEncode(AP)) end end) end;
local function LA() 
    pcall(function() 
        if readfile and isfile and isfile(AF) then 
            local t=HS:JSONDecode(readfile(AF))
            for k,v in pairs(t) do if AP[k]~=nil then AP[k]=v end end 
        end 
    end) 
end;
local function SB() pcall(function() if writefile then writefile(BF,HS:JSONEncode(BL)) end end) end;
local function LB() 
    pcall(function() 
        if readfile and isfile and isfile(BF) then 
            local t=HS:JSONDecode(readfile(BF))
            for k,v in pairs(t) do BL[k]=v end 
        end 
    end) 
end;
LS(); LA(); LB();

local AEF="TurtleHub.lua";
local AEUF="TurtleHubURL.lua";

local function GSRC() 
    local gss=rawget(getgenv(),"getscriptsource")
    if type(gss)=="function" then 
        local ok,s=pcall(gss)
        if ok and type(s)=="string" and #s>500 then return s end 
    end
    for l=1,10 do 
        local ok,s=pcall(debug.info,l,"s")
        if ok and type(s)=="string" and s:sub(1,1)=="@" then 
            local p=s:sub(2)
            if readfile and isfile and isfile(p) then 
                local r,c=pcall(readfile,p)
                if r and c and #c>500 then return c end 
            end 
        end 
    end
    return nil 
end

local AEP={"autoexec/"..AEF,"autoexec/"..AEF..".txt","workspace/"..AEF,"scripts/"..AEF,AEF};
local AEUP={"autoexec/"..AEUF,"autoexec/"..AEUF..".txt","workspace/"..AEUF,"scripts/"..AEUF,AEUF};

local function IURL(u) 
    if not writefile then return false,"no wf" end
    if not u or u=="" then return false,"empty" end
    local b=string.format("loadstring(game:HttpGet(%q))()\n",u)
    local i={}
    for _,p in ipairs(AEUP) do 
        if pcall(function() writefile(p,b) end) then table.insert(i,p) end 
    end
    if #i==0 then return false,"fail" end
    return true,"URL ok" 
end

local function ISRC() 
    if not writefile then return false,"no wf" end
    local s=GSRC()
    if not s then return false,"no src" end
    local i={}
    for _,p in ipairs(AEP) do 
        if pcall(function() writefile(p,s) end) then table.insert(i,p) end 
    end
    if #i==0 then return false,"fail" end
    return true,"Src ok" 
end

local function _IAE() 
    if St.SelfAutoExecURL~="" then 
        local ok,m=IURL(St.SelfAutoExecURL)
        if ok then return true,m end 
    end
    local ok,m=ISRC()
    if ok then return true,m end
    return false,"URL empty+capture fail" 
end

local function _UAE() 
    if not delfile then return false,"no df" end
    local r={}
    for _,p in ipairs(AEP) do 
        if isfile and isfile(p) then 
            if pcall(function() delfile(p) end) then table.insert(r,p) end 
        end 
    end
    for _,p in ipairs(AEUP) do 
        if isfile and isfile(p) then 
            if pcall(function() delfile(p) end) then table.insert(r,p) end 
        end 
    end
    if #r==0 then return false,"no file" end
    return true,"Removed" 
end

local SKC={last=0,tick=0,orig=nil,def=nil};
pcall(function() local d=LT:FindFirstChildOfClass("Sky"); if d then SKC.def=d:Clone() end end);
local function ASKY()
    SKC.last=os.clock();
    for _,v in ipairs(LT:GetChildren()) do if v:IsA("Sky") then v:Destroy() end end;
    if not St.SkyEnabled then if SKC.def then pcall(function() local c=SKC.def:Clone(); c.Parent=LT end) end; return end;
    local d=SP[St.SkyPreset]; if not d then return end;
    local s=Instance.new("Sky");
    s.SkyboxBk="rbxassetid://"..d[1]; s.SkyboxDn="rbxassetid://"..d[2]; s.SkyboxFt="rbxassetid://"..d[3];
    s.SkyboxLf="rbxassetid://"..d[4]; s.SkyboxRt="rbxassetid://"..d[5]; s.SkyboxUp="rbxassetid://"..d[6];
    if St.SkyRemoveSun then s.SunTextureId="" end;
    if St.SkyRemoveMoon then s.MoonTextureId="" end;
    if St.SkyRemoveStars then s.StarCount=0 end;
    s.Parent=LT;
end;
LT.ChildRemoved:Connect(function(c) if c:IsA("Sky") and St.SkyEnabled and os.clock()-SKC.last>0.25 then task.defer(ASKY) end end);
LT.ChildAdded:Connect(function(c) if c:IsA("Sky") and St.SkyEnabled and os.clock()-SKC.last>0.25 then task.defer(ASKY) end end);
RS.Heartbeat:Connect(function(dt)
    if not St.SkyEnabled then return end;
    local sk=LT:FindFirstChildOfClass("Sky"); if not sk then return end;
    if St.SkyRotate then
        if not SKC.orig then SKC.orig=sk.SkyboxOrientation end;
        SKC.tick=SKC.tick+dt*St.SkyRotateSpeed*0.5;
        local a=0;
        if St.SkyRotateMethod=="Spin" then a=(SKC.tick*20)%360
        elseif St.SkyRotateMethod=="Wave" then a=math.sin(SKC.tick)*180
        else a=math.abs((SKC.tick*40%720)-360)-180 end;
        local r=Vector3.new(0,0,0);
        if St.SkyRotateDirection=="Horizontal" then r=Vector3.new(0,a,0)
        elseif St.SkyRotateDirection=="Vertical" then r=Vector3.new(a,0,0)
        else r=Vector3.new(a,a,a) end;
        pcall(function() sk.SkyboxOrientation=r end);
    elseif SKC.orig then pcall(function() sk.SkyboxOrientation=SKC.orig end); SKC.orig=nil; SKC.tick=0 end;
end);

task.spawn(function()
    while true do
        task.wait(1);
        if Library.Unloaded then break end;
        if St.SkyEnabled then
            local current=LT:FindFirstChildOfClass("Sky");
            if not current then
                pcall(ASKY);
            else
                local d=SP[St.SkyPreset];
                if d then
                    local expected="rbxassetid://"..d[1];
                    if current.SkyboxBk~=expected then
                        pcall(ASKY);
                    end;
                end;
            end;
        end;
    end;
end);

local EL={dfl={},loaded=false,RB=nil,DS=nil,kh=false,ch=false};
pcall(function()
    local rs=game:GetService("ReplicatedStorage");
    if not rs:FindFirstChild("Modules") then warn("[EL] not Rivals"); return end;
    local ut=require(rs.Modules.Utility);
    local en=require(rs.Modules.EnumLibrary);
    local fc=require(LP.PlayerScripts.Controllers.FighterController);
    local kt=require(LP.PlayerScripts.Modules.Items.Katana);
    if kt and kt._StartDeflecting and not EL.kh then
        EL.kh=true;
        local old=kt._StartDeflecting;
        kt._StartDeflecting=function(...)
            local a={...};
            local f=a[1] and a[1].ClientFighter;
            local p=f and f.Player;
            if p then EL.dfl[p]=true; task.delay((a[1].Info and a[1].Info.DeflectDuration) or 0.1,function() EL.dfl[p]=false end) end;
            return old(table.unpack(a));
        end;
    end;
    local function idf(p) return EL.dfl[p] end;
    local function hr(p) return workspace.ViewModels:FindFirstChild(p.Name.." - Riot Shield - Riot Shield")~=nil end;
    local DS={};
    function DS:Init()
        self.active=false; self.con=nil; self.sv=nil; self.cl=nil; self.fg=fc.LocalFighter;
        if not EL.ch then
            local ok,cc=pcall(function() return require(LP.PlayerScripts.Controllers.CameraController) end);
            if ok and cc and cc.Update then EL.ch=true; local ref=cc.Update; cc.Update=function(...) if self.active and self.fg and self.fg.Entity and self.fg.Entity.RootPart and self.cl then self.fg.Entity.RootPart.CFrame=self.cl end; return ref(...) end end;
        end;
    end;
    function DS:Start(t)
        if self.active then return end; if not LP.Character then return end;
        if not self.fg or not self.fg.Entity or not self.fg.Entity.RootPart then return end;
        self.active=true;
        self.con=RS.Heartbeat:Connect(function(dt)
            if not self.active then if self.con then self.con:Disconnect() end; self.con=nil; return end;
            if not t or not t.Character or not t.Character:FindFirstChild('HumanoidRootPart') or not self.fg or not self.fg.Entity or not self.fg.Entity.RootPart then
                if self.con then self.con:Disconnect() end; self.con=nil;
                if self.cl and self.fg and self.fg.Entity and self.fg.Entity.RootPart then self.fg.Entity.RootPart.CFrame=self.cl end;
                self.active=false; self.cl=nil; self.sv=nil; return;
            end;
            self.cl=self.fg.Entity.RootPart.CFrame;
            local it=self.fg.EquippedItem; if not it then return end;
            local tp=t.Character.HumanoidRootPart.Position;
            if idf(t) or hr(t) then self.sv=Vector3.new(0,2^26,0); return end;
            if it.Name=="Slingshot" then self.sv=Vector3.new(0,2^26,0) else self.sv=tp+Vector3.new(St.EliOffsetX,St.EliOffsetY,St.EliOffsetZ) end;
            self.fg.Entity.RootPart.CFrame=CFrame.new(self.sv);
        end);
    end;
    function DS:Stop()
        if not self.active then return end;
        if self.con then self.con:Disconnect(); self.con=nil end;
        if self.cl and self.fg and self.fg.Entity and self.fg.Entity.RootPart then self.fg.Entity.RootPart.CFrame=self.cl end;
        self.active=false; self.sv=nil; self.cl=nil;
    end;
    DS:Init();
    local RB={};
    function RB:Init() self.active=false; self.deb=0; self.ls=os.clock(); self.con=nil end;
    function RB:Valid(p)
        if not (p and p.Character and p.Character:FindFirstChild("Humanoid") and p.Character.Humanoid.Health>0 and p:GetAttribute('EnvironmentID')==LP:GetAttribute('EnvironmentID')) then return false end;
        if St.EliFFA then return true end;
        return LP:GetAttribute('TeamID')~=p:GetAttribute('TeamID');
    end;
    function RB:Closest() local c,b=nil,math.huge; for _,p in ipairs(P:GetPlayers()) do if p~=LP and self:Valid(p) then local rp=p.Character.HumanoidRootPart.Position; local m=LP:DistanceFromCharacter(rp); if m<b then c,b=p,m end end end; return c end;
    function RB:Fire(t)
        if not t or not t.Character then return end;
        local f=fc.LocalFighter; if not f then return end; local it=f.EquippedItem; if not it then return end;
        if idf(t) or hr(t) then return end;
        local hd=t.Character:FindFirstChild('HitboxHead') or t.Character:FindFirstChild('HitboxTorso') or t.Character:FindFirstChild('HumanoidRootPart');
        if not hd then return end;
        local ch=LP.Character; if not ch or not ch:FindFirstChild('HumanoidRootPart') then return end;
        local sp=DS.active and DS.sv or ch.HumanoidRootPart.Position;
        local ap=hd.Position;
        if St.EliPrediction then local tr=t.Character:FindFirstChild('HumanoidRootPart'); if tr then local pg=0.05; pcall(function() pg=LP:GetNetworkPing() end); local ld=math.clamp(pg,0,0.4)*(St.EliPredictionAmount or 1); ap=ap+tr.AssemblyLinearVelocity*ld end end;
        local d={[utf8.char(1)]={[utf8.char(0)]=ut:EncodeCFrame(CFrame.new(sp,ap)),[utf8.char(1)]=ut:EncodeCFrame(CFrame.new(sp,ap)),[utf8.char(2)]=hd,[utf8.char(1)]=ut:EncodeCFrame(CFrame.new(sp,ap))}};
        rs.Remotes.Replication.Fighter.UseItem:FireServer(it:Get('ObjectID'),en:ToEnum('StartShooting'),d,nil);
    end;
    function RB:PH()
        if self.pc then return end;
        self.pc=workspace.DescendantAdded:Connect(function(c)
            if not St.EliEnabled then return end;
            if c:IsA('BasePart') or c:IsA('Model') then
                if c.Name=="Slingshot" or c.Name=="CoreProjectile" or c.Name=="OuterProjectile" then
                    task.spawn(function()
                        task.wait(0.03);
                        local pj=c:IsA('BasePart') and c or c:FindFirstChildWhichIsA('BasePart'); if not pj then return end;
                        pj.CanTouch=true;
                        for i=1,45 do if not St.EliEnabled then break end;
                            local t=self:Closest();
                            if t and t.Character then local hp=t.Character:FindFirstChild('HitboxHead') or t.Character:FindFirstChild('HumanoidRootPart'); if hp and hp:IsA("BasePart") and hp.Parent and pj.Parent and hp:IsDescendantOf(workspace) and pj:IsDescendantOf(workspace) then pcall(firetouchinterest,hp,pj,0); pcall(firetouchinterest,hp,pj,1) end end;
                            task.wait();
                        end;
                    end);
                end;
            end;
        end);
    end;
    function RB:Start()
        if self.con then return end;
        self.con=RS.Heartbeat:Connect(function()
            if not St.EliEnabled then self:Stop(); return end;
            local t=self:Closest(); if not t then DS:Stop(); return end;
            local f=fc.LocalFighter; if not f then DS:Stop(); return end;
            local it=f.EquippedItem; if not it then DS:Stop(); return end;
            local tf=fc:GetFighter(t); if not tf then DS:Stop(); return end;
            local vm=it.ViewModel; if not vm then DS:Stop(); return end;
            local te=tf.Entity; if not te or te:Get('IsInvincible') then DS:Stop(); return end;
            if it:Get('Ammo') and it:Get('Ammo')>0 and not vm:IsAnimationPlaying('Reload') then
                if self.deb==0 then self.deb=os.clock()+0.5; return end;
                if self.deb<os.clock() then self.deb=0; return end;
                DS:Start(t);
                if not t.Character then return end;
                if DS.sv then self.ls=os.clock(); self:Fire(t) end;
            else
                if not vm:IsAnimationPlaying('Reload') then
                    pcall(function() setthreadidentity(2) end);
                    pcall(function() it:Input('StartReloading') end);
                    pcall(function() setthreadidentity(7) end);
                end;
            end;
        end);
    end;
    function RB:Stop() if self.con then self.con:Disconnect(); self.con=nil end; self.deb=0; DS:Stop() end;
    RB:Init(); RB:PH();
    EL.DS=DS; EL.RB=RB; EL.loaded=true;
    print("[Elisium] OK");
end);

-- ==========================================
-- WEAPON LOCK (Mode-based)
-- ==========================================
local WL={
    enabled=false;
    mode="Gun";
    gunSlot="Primary";
    lockedItem=nil;
    lockedName="";
    autoReload=true;
    autoSwing=true;
    swingRange=15;
    lastSwing=0;
    lastLockCheck=0;
};

local function WL_GetFighter()
    local ok,fc=pcall(function() return require(LP.PlayerScripts.Controllers.FighterController) end);
    if not ok or not fc then return nil,nil end;
    return fc,fc.LocalFighter;
end;

local function WL_IsGun(item)
    if not item then return false end;
    local ok,ammo=pcall(function() return item:Get('Ammo') end);
    return ok and ammo~=nil;
end;

local function WL_IsMelee(item)
    if not item then return false end;
    return not WL_IsGun(item);
end;

local function WL_MatchesMode(item)
    if not item then return false end;
    if WL.mode=="Gun" then return WL_IsGun(item) end;
    if WL.mode=="Melee" then return WL_IsMelee(item) end;
    return true;
end;

local function _WL_TryEquipBySlot()
    local _,fighter=WL_GetFighter();
    if not fighter then return false end;
    local target=nil;
    if WL.mode=="Melee" then
        local tries={function() return fighter.MeleeItem end,function() return fighter.Melee end};
        for _,fn in ipairs(tries) do local ok,v=pcall(fn); if ok and v then target=v; break end end;
    elseif WL.gunSlot=="Primary" then
        local tries={function() return fighter.PrimaryItem end,function() return fighter.Primary end};
        for _,fn in ipairs(tries) do local ok,v=pcall(fn); if ok and v then target=v; break end end;
    else
        local tries={function() return fighter.SecondaryItem end,function() return fighter.Secondary end};
        for _,fn in ipairs(tries) do local ok,v=pcall(fn); if ok and v then target=v; break end end;
    end;
    if not target then return false end;
    pcall(function()
        if fighter.Equip then fighter:Equip(target)
        elseif fighter.SetEquippedItem then fighter:SetEquippedItem(target)
        elseif fighter.SwitchItem then fighter:SwitchItem(target)
        elseif fighter.EquipItem then fighter:EquipItem(target)
        end;
    end);
    return true;
end;

local function _WL_LockCurrent()
    local _,fighter=WL_GetFighter();
    if not fighter then return false,"No fighter" end;
    local item=fighter.EquippedItem;
    if not item then return false,"No weapon equipped" end;
    if not WL_MatchesMode(item) then
        return false,"Weapon doesn't match mode ("..WL.mode..")";
    end;
    WL.lockedItem=item;
    WL.lockedName=item.Name or "?";
    return true,WL.lockedName;
end;

local function WL_ForceLock()
    if not WL.enabled or not WL.lockedItem then return end;
    local now=os.clock();
    if now-WL.lastLockCheck<0.05 then return end;
    WL.lastLockCheck=now;
    local _,fighter=WL_GetFighter();
    if not fighter then return end;
    local current=fighter.EquippedItem;
    if current==WL.lockedItem then return end;
    if not WL.lockedItem.Parent then
        WL.enabled=false; WL.lockedItem=nil; WL.lockedName="";
        return;
    end;
    pcall(function()
        if fighter.Equip then fighter:Equip(WL.lockedItem)
        elseif fighter.SetEquippedItem then fighter:SetEquippedItem(WL.lockedItem)
        elseif fighter.SwitchItem then fighter:SwitchItem(WL.lockedItem)
        elseif fighter.EquipItem then fighter:EquipItem(WL.lockedItem)
        end;
    end);
end;

RS.Heartbeat:Connect(function()
    if WL.enabled then pcall(WL_ForceLock) end;
end);

-- Auto Reload (Gun only)
task.spawn(function()
    while true do
        task.wait(0.15);
        if Library.Unloaded then break end;
        if WL.enabled and WL.autoReload and WL.mode=="Gun" then
            pcall(function()
                local _,fighter=WL_GetFighter();
                if not fighter then return end;
                local item=fighter.EquippedItem;
                if not item or not WL_IsGun(item) then return end;
                local ok,ammo=pcall(function() return item:Get('Ammo') end);
                if ok and ammo~=nil and ammo<=0 then
                    local vm=item.ViewModel;
                    if vm and not vm:IsAnimationPlaying('Reload') then
                        pcall(function() setthreadidentity(2) end);
                        pcall(function() item:Input('StartReloading') end);
                        pcall(function() setthreadidentity(7) end);
                    end;
                end;
            end);
        end;
    end;
end);

-- Auto Swing (Melee only)
task.spawn(function()
    while true do
        task.wait(0.1);
        if Library.Unloaded then break end;
        if WL.enabled and WL.autoSwing and WL.mode=="Melee" then
            pcall(function()
                local _,fighter=WL_GetFighter();
                if not fighter then return end;
                local item=fighter.EquippedItem;
                if not item or not WL_IsMelee(item) then return end;
                local myChar=LP.Character; if not myChar then return end;
                local myRoot=myChar:FindFirstChild('HumanoidRootPart'); if not myRoot then return end;
                local closest,best=nil,WL.swingRange;
                for _,p in ipairs(P:GetPlayers()) do
                    if p~=LP and p.Character then
                        local hum=p.Character:FindFirstChildOfClass('Humanoid');
                        local root=p.Character:FindFirstChild('HumanoidRootPart');
                        if hum and hum.Health>0 and root then
                            local d=(root.Position-myRoot.Position).Magnitude;
                            if d<best then closest,best=p,d end;
                        end;
                    end;
                end;
                if closest then
                    local now=os.clock();
                    if now-WL.lastSwing>0.15 then
                        WL.lastSwing=now;
                        pcall(function() item:Input('StartAttacking') end);
                    end;
                end;
            end);
        end;
    end;
end);

-- ==========================================
-- KILL SOUNDS SYSTEM
-- ==========================================
local KS={soundBox=nil,killSound=nil,playerConns={}};

local function KS_Apply()
    if not KS.killSound then return end;
    local id=tostring(St.KillSoundID or "");
    if id~="" and id~="nil" then
        KS.killSound.SoundId="rbxassetid://"..id;
    else
        KS.killSound.SoundId="";
    end;
    KS.killSound.Volume=tonumber(St.KillSoundVolume) or 1;
end;

local function KS_PlayInternal()
    if not KS.soundBox then return end;
    local sounds={};
    for _,ch in ipairs(KS.soundBox:GetChildren()) do
        if ch:IsA("Sound") and ch.SoundId~="" then
            table.insert(sounds,ch);
        end;
    end;
    if #sounds==0 then return end;
    local sel=sounds[math.random(1,#sounds)];
    pcall(function() sel:Stop(); sel:Play() end);
end;

local function KS_HookChar(player,char)
    if not char or not KS.playerConns[player] then return end;
    local newDied={};
    for _,entry in pairs(KS.playerConns[player].died) do
        if entry.hum and entry.hum.Parent and entry.hum.Health>0 then
            table.insert(newDied,entry);
        else
            pcall(function() entry.con:Disconnect() end);
        end;
    end;
    KS.playerConns[player].died=newDied;
    task.spawn(function()
        local hum=char:WaitForChild("Humanoid",5);
        if not hum then return end;
        local con=hum.Died:Connect(function()
            if not St.KillSoundsEnabled then return end;
            if LP.Team and player.Team and LP.Team==player.Team then return end;
            KS_PlayInternal();
        end);
        table.insert(KS.playerConns[player].died,{con=con,hum=hum});
    end);
end;

local function KS_SetupPlayer(player)
    if player==LP then return end;
    if KS.playerConns[player] then return end;
    KS.playerConns[player]={died={}};
    KS.playerConns[player].added=player.CharacterAdded:Connect(function(char) KS_HookChar(player,char) end);
    if player.Character then KS_HookChar(player,player.Character) end;
end;

pcall(function()
    local svc=game:GetService("SoundService");
    local box=svc:FindFirstChild("KillSoundBox");
    if not box then
        box=Instance.new("Folder");
        box.Name="KillSoundBox";
        box.Parent=svc;
    end;
    local s=box:FindFirstChild("KillSound");
    if not s then
        s=Instance.new("Sound");
        s.Name="KillSound";
        s.Parent=box;
    end;
    KS.soundBox=box;
    KS.killSound=s;
    KS_Apply();
end);

for _,p in ipairs(P:GetPlayers()) do KS_SetupPlayer(p) end;
P.PlayerAdded:Connect(KS_SetupPlayer);
P.PlayerRemoving:Connect(function(p)
    if KS.playerConns[p] then
        if KS.playerConns[p].added then pcall(function() KS.playerConns[p].added:Disconnect() end) end;
        for _,entry in pairs(KS.playerConns[p].died) do pcall(function() entry.con:Disconnect() end) end;
        KS.playerConns[p]=nil;
    end;
end);

local OW={Init=false};
local function AW()
    pcall(function()
        local rs=game:GetService("ReplicatedStorage"); local mo=rs:FindFirstChild("Modules"); if not mo then return end;
        local il=mo:FindFirstChild("ItemLibrary"); if not il then return end;
        local It=require(il).Items;
        if not OW.Init then for n,d in pairs(It) do if typeof(d)=="table" then OW[n]={SS=d.ShootSpread,SA=d.ShootAccuracy,SR=d.ShootRecoil,SC=d.ShootCooldown,AC=d.AttackCooldown,SWC=d.SwingCooldown,MC=d.MeleeCooldown,CD=d.Cooldown} end end; OW.Init=true end;
        for n,d in pairs(It) do if typeof(d)=="table" and OW[n] then local o=OW[n]; d.ShootSpread=o.SS; d.ShootAccuracy=o.SA; d.ShootRecoil=o.SR; d.ShootCooldown=o.SC; d.AttackCooldown=o.AC; d.SwingCooldown=o.SWC; d.MeleeCooldown=o.MC; d.Cooldown=o.CD end end;
        if St.FastFire then for _,d in pairs(It) do if typeof(d)=="table" then if d.ShootSpread~=nil then d.ShootSpread=0 end; if d.ShootAccuracy~=nil then d.ShootAccuracy=0 end; if d.ShootRecoil~=nil then d.ShootRecoil=0 end; if d.ShootCooldown~=nil then d.ShootCooldown=0.001 end end end end;
        if St.FastMelee then for _,d in pairs(It) do if typeof(d)=="table" then if d.AttackCooldown~=nil then d.AttackCooldown=0.001 end; if d.SwingCooldown~=nil then d.SwingCooldown=0.001 end; if d.MeleeCooldown~=nil then d.MeleeCooldown=0.001 end; if d.Cooldown~=nil then d.Cooldown=0.001 end end end end;
    end);
end;

local MovementState={}
local NoclipState={}
local NC=nil;
local function GH(c) return c and c:FindFirstChildOfClass("Humanoid") end
local function CAP(c)
    local h=GH(c); if not h or MovementState[c] then return end
    MovementState[c]={WalkSpeed=h.WalkSpeed,UseJumpPower=h.UseJumpPower,JumpPower=h.JumpPower,JumpHeight=h.JumpHeight,AutoRotate=h.AutoRotate}
end
local function AWS()
    local c=LP.Character; local h=GH(c); if not h then return end
    if St.WalkSpeedEnabled then CAP(c); h.WalkSpeed=St.WalkSpeedValue
    elseif MovementState[c] then h.WalkSpeed=MovementState[c].WalkSpeed end
end
local function AJP()
    local c=LP.Character; local h=GH(c); if not h then return end
    if St.JumpPowerEnabled then CAP(c); h.UseJumpPower=true; h.JumpPower=St.JumpPowerValue
    elseif MovementState[c] then local x=MovementState[c]; h.UseJumpPower=x.UseJumpPower; h.JumpPower=x.JumpPower; h.JumpHeight=x.JumpHeight end
end
local function CAPNC(c)
    if not c or NoclipState[c] then return end
    local x={}; for _,p in ipairs(c:GetDescendants()) do if p:IsA("BasePart") then x[p]=p.CanCollide end end; NoclipState[c]=x
end
local function SN1()
    if NC then return end; CAPNC(LP.Character)
    NC=RS.Stepped:Connect(function()
        if not St.NoclipEnabled then return end; local c=LP.Character; if not c then return end
        for _,p in ipairs(c:GetDescendants()) do if p:IsA("BasePart") then p.CanCollide=false end end
    end)
end
local function SN2()
    if NC then NC:Disconnect(); NC=nil end
    local c=LP.Character; local x=c and NoclipState[c]
    if x then for p,v in pairs(x) do if p and p.Parent then pcall(function() p.CanCollide=v end) end end; NoclipState[c]=nil end
end;

local FC=nil;
local FBV=nil;
local FBG=nil;
local FA=false;

local function CF()
    if FBV then pcall(function() FBV:Destroy() end); FBV=nil end;
    if FBG then pcall(function() FBG:Destroy() end); FBG=nil end;
    if FC then pcall(function() FC:Disconnect() end); FC=nil end;
    FA=false;
    local c=LP.Character;
    if c then for _,d in ipairs(c:GetDescendants()) do if (d:IsA("BodyVelocity") or d:IsA("BodyGyro") or d:IsA("BodyAngularVelocity")) and tostring(d.Name):match("^TH_") then pcall(function() d:Destroy() end) end end end;
end;
local function STFLY()
    local wa=FA;
    CF();
    if wa then
        local c=LP.Character;
        if c then
            local h=c:FindFirstChildOfClass("Humanoid");
            local r=c:FindFirstChild("HumanoidRootPart");
            if h then pcall(function() h.PlatformStand=false; h:ChangeState(Enum.HumanoidStateType.GettingUp) end) end;
            if r then pcall(function() r.AssemblyLinearVelocity=Vector3.new(0,0,0); r.AssemblyAngularVelocity=Vector3.new(0,0,0) end) end;
        end;
    end;
end;
local function STFLY2()
    STFLY();
    if not St.FlyEnabled then return end;
    local c=LP.Character; if not c then return end;
    local r=c:FindFirstChild("HumanoidRootPart"); if not r then return end;
    local h=c:FindFirstChildOfClass("Humanoid"); if not h then return end;
    task.wait(0.05);
    FA=true;
    local bv=Instance.new("BodyVelocity"); bv.Name="TH_FlyVelocity"; bv.MaxForce=Vector3.new(1e5,1e5,1e5); bv.Velocity=Vector3.new(0,0,0); bv.Parent=r; FBV=bv;
    local bg=Instance.new("BodyGyro"); bg.Name="TH_FlyGyro"; bg.MaxTorque=Vector3.new(1e5,1e5,1e5); bg.P=1e4; bg.D=100; bg.CFrame=r.CFrame; bg.Parent=r; FBG=bg;
    pcall(function() h:ChangeState(Enum.HumanoidStateType.Physics) end);
    pcall(function() h.PlatformStand=true end);
    FC=RS.RenderStepped:Connect(function(dt)
        if not FA then return end;
        local cc=LP.Character; if not cc then return end;
        local rr=cc:FindFirstChild("HumanoidRootPart"); if not rr then return end;
        local cm=workspace.CurrentCamera;
        local md=Vector3.new(0,0,0);
        if UIS:IsKeyDown(Enum.KeyCode.W) then md=md+cm.CFrame.LookVector end;
        if UIS:IsKeyDown(Enum.KeyCode.S) then md=md-cm.CFrame.LookVector end;
        if UIS:IsKeyDown(Enum.KeyCode.A) then md=md-cm.CFrame.RightVector end;
        if UIS:IsKeyDown(Enum.KeyCode.D) then md=md+cm.CFrame.RightVector end;
        if UIS:IsKeyDown(Enum.KeyCode.Space) then md=md+Vector3.new(0,1,0) end;
        if UIS:IsKeyDown(Enum.KeyCode.LeftControl) then md=md-Vector3.new(0,1,0) end;
        if md.Magnitude>0 then md=md.Unit*St.FlySpeed end;
        bv.Velocity=md;
        bg.CFrame=cm.CFrame;
    end);
end;

local CHP,CHL,CHM,CHC,CHT=nil,nil,nil,nil,0;
local function DH()
    if CHC then pcall(function() CHC:Disconnect() end); CHC=nil end;
    if CHP and CHP.Parent then pcall(function() CHP:Destroy() end) end;
    CHP=nil; CHL=nil; CHM=nil;
end;
local function BH(c)
    DH();
    if not St.ChinaHatEnabled then return end;
    if not c or not c.Parent then return end;
    local hd=c:FindFirstChild("Head"); if not hd then return end;
    local cn=Instance.new("Part");
    cn.Name="TH_ChinaHat"; cn.Size=Vector3.new(1,1,1); cn.BrickColor=BrickColor.new("Hot pink"); cn.Material=Enum.Material.Neon; cn.Transparency=0.1; cn.Anchored=true; cn.CanCollide=false; cn.CastShadow=false; cn.Color=Color3.fromRGB(255,105,180); cn.Parent=c;
    local m=Instance.new("SpecialMesh"); m.MeshType=Enum.MeshType.FileMesh; m.MeshId="rbxassetid://1033714"; m.Scale=Vector3.new(1.7,1.1,1.7); m.Parent=cn; CHM=m;
    local l=Instance.new("PointLight"); l.Name="TH_HatLight"; l.Color=Color3.fromRGB(255,105,180); l.Brightness=3; l.Range=14; l.Shadows=false; l.Parent=cn; CHL=l;
    CHP=cn; CHT=tick();
    CHC=RS.RenderStepped:Connect(function(dt)
        if not CHP or not CHP.Parent then if CHC then CHC:Disconnect() end; return end;
        local cc=LP.Character; if not cc then return end;
        local h=cc:FindFirstChild("Head"); if not h then return end;
        local t=tick()-CHT;
        local fy=math.sin(t*2)*0.12+math.sin(t*3.7)*0.05;
        local wz=math.sin(t*1.8)*math.rad(6);
        local wx=math.cos(t*2.3)*math.rad(3);
        local sy=(t*0.4)%(math.pi*2);
        local ps=1+math.sin(t*3)*0.06;
        if CHM then CHM.Scale=Vector3.new(1.7,1.1,1.7)*ps end;
        CHP.CFrame=h.CFrame*CFrame.new(0,0.9+fy,0)*CFrame.Angles(wx,sy,wz);
        local hue=(t*0.15)%1;
        local c1=Color3.fromHSV(hue,0.8,1);
        CHP.Color=c1;
        if CHL then CHL.Color=c1 end;
    end);
end;

local OP,OD,OC={},{},nil;
local function DO() for _,p in pairs(OP) do pcall(function() if p and p.Parent then p:Destroy() end end) end; OP={}; OD={}; if OC then pcall(function() OC:Disconnect() end); OC=nil end end;
local function BO(c)
    DO();
    if not St.OrbitEnabled then return end;
    if not c or not c.Parent then return end;
    local r=c:FindFirstChild("HumanoidRootPart"); if not r then return end;
    for i=1,6 do
        local o=Instance.new("Part");
        o.Shape=Enum.PartType.Ball; o.Size=Vector3.new(0.55,0.55,0.55); o.Material=Enum.Material.Neon; o.Color=Color3.fromRGB(120,200,255); o.Transparency=0.1; o.CanCollide=false; o.Massless=true; o.Anchored=true; o.CastShadow=false; o.Name="TH_OrbitOrb"; o.Parent=c;
        local l=Instance.new("PointLight"); l.Color=Color3.fromRGB(120,200,255); l.Brightness=3; l.Range=7; l.Parent=o;
        table.insert(OP,o);
        table.insert(OD,{orb=o,angle=(i-1)/6*math.pi*2,yOff=math.random()*math.pi*2});
    end;
    local t=0;
    OC=RS.RenderStepped:Connect(function(dt)
        t=t+dt;
        local cc=LP.Character; local rr=cc and cc:FindFirstChild("HumanoidRootPart"); if not rr then return end;
        for _,d in ipairs(OD) do if d.orb and d.orb.Parent then local a=d.angle+t*1.5; d.orb.CFrame=rr.CFrame*CFrame.new(math.cos(a)*5.5,math.sin(t*2+d.yOff)*0.6+3,math.sin(a)*5.5) end end;
    end);
end;

local AE={};
local function DA() for _,e in pairs(AE) do pcall(function() if e and e.Parent then e:Destroy() end end) end; AE={} end;
local function BA(c)
    DA();
    if not St.AuraEnabled then return end;
    if not c or not c.Parent then return end;
    local t=c:FindFirstChild("Torso") or c:FindFirstChild("UpperTorso");
    local r=c:FindFirstChild("HumanoidRootPart"); if not t or not r then return end;
    for _,p in ipairs({t,t,r}) do
        local pe=Instance.new("ParticleEmitter");
        pe.Texture="rbxasset://textures/particles/sparkles_main.dds";
        pe.Color=ColorSequence.new(Color3.fromRGB(150,60,220));
        pe.LightEmission=0.8; pe.LightInfluence=0;
        pe.Size=NumberSequence.new({NumberSequenceKeypoint.new(0,1.2),NumberSequenceKeypoint.new(1,0)});
        pe.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0,0.2),NumberSequenceKeypoint.new(0.7,0.5),NumberSequenceKeypoint.new(1,1)});
        pe.Lifetime=NumberRange.new(0.5,1);
        pe.Rate=60; pe.Speed=NumberRange.new(2,6); pe.SpreadAngle=Vector2.new(180,180); pe.Acceleration=Vector3.new(0,2,0);
        pe.Parent=p;
        table.insert(AE,pe);
    end;
end;

local TD,TC2={},nil;
local TPL=nil;
local function LT2() if TPL then return TPL end; local ok,a=pcall(function() return game:GetObjects("rbxassetid://22489116")[1] end); if not ok or not a then return nil end; TPL=a; return a end;
local function ET(a)
    local cl=a:Clone();
    local sk={"arena","grass","granit","granite","stage","floor","base","ground","platform","terrain"};
    local tr={};
    for _,d in ipairs(cl:GetDescendants()) do if d:IsA("BasePart") then local lo=d.Name:lower(); for _,kw in ipairs(sk) do if lo:find(kw) then table.insert(tr,d); break end end end end;
    for _,d in ipairs(tr) do pcall(function() d:Destroy() end) end;
    local ps={};
    for _,d in ipairs(cl:GetDescendants()) do if d:IsA("BasePart") and d.Name~="HumanoidRootPart" then table.insert(ps,d) end end;
    if #ps==0 then return a:Clone() end;
    local mn=Vector3.new(math.huge,math.huge,math.huge);
    local mx=Vector3.new(-math.huge,-math.huge,-math.huge);
    for _,p in ipairs(ps) do
        local cf=p.CFrame; local sz=p.Size;
        local cs={cf*Vector3.new(sz.X/2,sz.Y/2,sz.Z/2),cf*Vector3.new(-sz.X/2,sz.Y/2,sz.Z/2),cf*Vector3.new(sz.X/2,-sz.Y/2,sz.Z/2),cf*Vector3.new(-sz.X/2,-sz.Y/2,sz.Z/2),cf*Vector3.new(sz.X/2,sz.Y/2,-sz.Z/2),cf*Vector3.new(-sz.X/2,sz.Y/2,-sz.Z/2),cf*Vector3.new(sz.X/2,-sz.Y/2,-sz.Z/2),cf*Vector3.new(-sz.X/2,-sz.Y/2,-sz.Z/2)};
        for _,c in ipairs(cs) do mn=Vector3.new(math.min(mn.X,c.X),math.min(mn.Y,c.Y),math.min(mn.Z,c.Z)); mx=Vector3.new(math.max(mx.X,c.X),math.max(mx.Y,c.Y),math.max(mx.Z,c.Z)) end;
    end;
    local sv=mx-mn; local ce=(mn+mx)/2; local md=math.max(sv.X,sv.Y,sv.Z); if md<=0 then md=1 end; local sc=1.2/md;
    for _,p in ipairs(ps) do p.Size=p.Size*sc; p.CFrame=CFrame.new((p.Position-ce)*sc); p.Anchored=true; p.CanCollide=false; p.CastShadow=false end;
    local bp=Instance.new("Part"); bp.Name="TurtleRoot"; bp.Size=Vector3.new(0.1,0.1,0.1); bp.Transparency=1; bp.Anchored=true; bp.CanCollide=false; bp.CastShadow=false; bp.Parent=cl;
    for _,p in ipairs(ps) do p.Anchored=false; local w=Instance.new("WeldConstraint"); w.Part0=bp; w.Part1=p; w.Parent=bp end;
    return cl,bp;
end;
local function DT() for _,t in ipairs(TD) do if t.model and t.model.Parent then pcall(function() t.model:Destroy() end) end end; TD={}; if TC2 then pcall(function() TC2:Disconnect() end); TC2=nil end end;
local function BT(c)
    DT();
    if not St.TurtleSwimEnabled then return end;
    if not c or not c.Parent then return end;
    local r=c:FindFirstChild("HumanoidRootPart"); if not r then return end;
    local tp=LT2(); if not tp then return end;
    for i=1,3 do local ok,mo,bp=pcall(ET,tp); if ok and mo and bp then mo.Name="TH_Turtle_"..i; mo.Parent=c; table.insert(TD,{model=mo,root=bp,angle=(i-1)/3*math.pi*2,yP=i*1.9,pP=i*2.1,rP=i*0.7}) end end;
    if #TD==0 then return end;
    local t=0;
    TC2=RS.RenderStepped:Connect(function(dt)
        t=t+dt;
        local cc=LP.Character; local rr=cc and cc:FindFirstChild("HumanoidRootPart"); if not rr then return end;
        local ce=rr.CFrame.Position;
        for _,tu in ipairs(TD) do
            if tu.model and tu.model.Parent and tu.root then
                local a=tu.angle+t*0.30; local b=math.sin(t*1.3+tu.yP)*0.5;
                local px=ce.X+math.cos(a)*5.5; local pz=ce.Z+math.sin(a)*5.5; local py=ce.Y+2.2+b;
                local tx=-math.sin(a); local tz=math.cos(a);
                local p=math.sin(t*1.3+tu.pP)*math.rad(8); local ro=math.cos(t*0.9+tu.rP)*math.rad(12);
                tu.root.CFrame=CFrame.lookAt(Vector3.new(px,py,pz),Vector3.new(px+tx,py,pz+tz))*CFrame.Angles(p,0,ro);
            end;
        end;
    end);
end;
local OI={};
local AG=0;
local function SOA() local c=LP.Character; if not c then return end; OI={}; for _,ch in pairs(c:GetChildren()) do if ch:IsA("Shirt") or ch:IsA("Pants") or ch:IsA("Accessory") or ch:IsA("ShirtGraphic") or ch:IsA("BodyColors") or (ch:IsA("Model") and ch.Name=="Hair") then table.insert(OI,ch:Clone()) end end end;
local function RA() local c=LP.Character; if not c then return end; for _,ch in pairs(c:GetChildren()) do if ch:IsA("Shirt") or ch:IsA("Pants") or ch:IsA("Accessory") or ch:IsA("ShirtGraphic") or ch:IsA("BodyColors") or (ch:IsA("Model") and ch.Name=="Hair") then ch:Destroy() end end; for _,i in pairs(OI) do pcall(function() i.Parent=c end) end end;
local function AHL(en)
    local c=LP.Character; if not c then return end;
    local h=c:FindFirstChild("Head");
    if h then h.Transparency=en and 1 or 0; for _,d in ipairs(h:GetDescendants()) do if d:IsA("Decal") then d.Transparency=en and 1 or 0 end end end;
    for _,ch in ipairs(c:GetChildren()) do
        if ch:IsA("Accessory") then
            local hd=ch:FindFirstChild("Handle");
            if hd then
                local oh=false;
                for _,w in ipairs(hd:GetChildren()) do if w:IsA("Weld") and w.Part1 and w.Part1.Name=="Head" then oh=true; break end end;
                if oh then local t=en and 1 or 0; hd.Transparency=t; for _,d in ipairs(hd:GetDescendants()) do if d:IsA("BasePart") or d:IsA("Decal") then d.Transparency=t end end end;
            end;
        elseif ch:IsA("Model") and ch.Name=="Hair" then
            for _,p in ipairs(ch:GetDescendants()) do if p:IsA("BasePart") or p:IsA("Decal") then p.Transparency=en and 1 or 0 end end;
        end;
    end;
end;
local function TT(uid,nt)
    AG=AG+1;
    local mg=AG;
    local c=LP.Character; if not c then return end;
    task.spawn(function()
        local ok,mo=pcall(function() return P:GetCharacterAppearanceAsync(tonumber(uid)) end);
        if not ok or not mo then if nt then Library:Notify({Title="Avatar",Description="Load fail",Time=3}) end; return end;
        if AG~=mg then return end;
        local cc=LP.Character; if not cc or cc~=c then return end;
        for _,ch in pairs(c:GetChildren()) do if ch:IsA("Shirt") or ch:IsA("Pants") or ch:IsA("Accessory") or ch:IsA("ShirtGraphic") or ch:IsA("BodyColors") or (ch:IsA("Model") and ch.Name=="Hair") then ch:Destroy() end end;
        local mc=mo:Clone();
        for _,i in pairs(mc:GetChildren()) do
            pcall(function()
                if i:IsA("Shirt") or i:IsA("Pants") or i:IsA("ShirtGraphic") or i:IsA("BodyColors") then i.Parent=c
                elseif i:IsA("Accessory") then
                    local hd=i:FindFirstChild("Handle");
                    if hd then
                        hd.CanCollide=false; hd.Transparency=0;
                        for _,d in pairs(hd:GetDescendants()) do if d:IsA("BasePart") then d.Transparency=0; d.CanCollide=false elseif d:IsA("Decal") or d:IsA("Texture") then d.Transparency=0 end end;
                        local at=hd:FindFirstChildOfClass("Attachment");
                        if at then local ca=c:FindFirstChild(at.Name,true); if ca then local w=Instance.new("Weld"); w.Part0=hd; w.Part1=ca.Parent; w.C0=at.CFrame; w.C1=ca.CFrame; w.Parent=hd end end;
                        i.Parent=c;
                    end;
                elseif i:IsA("Model") and i.Name=="Hair" then i.Parent=c end;
            end);
        end;
        for _=1,20 do
            task.wait(0.05); if AG~=mg then return end; if not c.Parent then return end;
            local ad=true;
            for _,i in pairs(mc:GetChildren()) do if i:IsA("Accessory") and not c:FindFirstChild(i.Name) then ad=false; pcall(function() i.Parent=c end) end end;
            if ad then break end;
        end;
        if St.HeadlessEnabled then task.wait(0.2); AHL(true) end;
        if nt then Library:Notify({Title="Avatar Applied",Description=tostring(uid)..(St.HeadlessEnabled and " [HL]" or ""),Time=2}) end;
    end);
end;
local function TAA(r,nt)
    if not St.AutoAvatarSlot or St.AutoAvatarSlot<=0 then return false end;
    local pid=AP["Preset"..St.AutoAvatarSlot]; if not pid or pid=="" then return false end;
    local hl=AP["Preset"..St.AutoAvatarSlot.."Headless"];
    if hl~=nil then St.HeadlessEnabled=hl; if Options.HeadlessEnabled then pcall(function() Options.HeadlessEnabled:SetValue(hl) end) end end;
    task.spawn(function()
        local c=LP.Character;
        for _=1,80 do if c and c:FindFirstChild("Humanoid") then break end; task.wait(0.05); c=LP.Character end;
        if not c then return end;
        task.wait(0.4); TT(pid,nt);
        if nt and r then Library:Notify({Title="Auto Avatar",Description="Slot "..St.AutoAvatarSlot.." ("..tostring(r)..")",Time=2}) end;
    end);
    return true;
end;
local SLB=nil;
local function RSL()
    if not SLB then return end;
    local s=St.AutoAvatarSlot;
    if s and s>0 then
        local p=AP["Preset"..s];
        local h=AP["Preset"..s.."Headless"];
        SLB:SetText("Auto Slot: "..s..(p and p~="" and ("  (ID: "..p..")"..(h and " [HL]" or "")) or "  (empty)"));
    else
        SLB:SetText("Auto Slot: Off");
    end;
end;

local SG=Instance.new("ScreenGui");
SG.Name=GN; SG.ResetOnSpawn=false; SG.IgnoreGuiInset=true; SG.DisplayOrder=50000; SG.ZIndexBehavior=Enum.ZIndexBehavior.Global; SG.Parent=TG;
local IC=Color3.fromHSV(0,1,1);
local CC=Instance.new("Frame");
CC.Size=UDim2.new(0,0,0,0); CC.Position=UDim2.new(0.5,St.CrosshairX,0.5,St.CrosshairY); CC.BackgroundTransparency=1; CC.ZIndex=10; CC.Parent=SG;
local TC3=Instance.new("Frame");
TC3.Size=UDim2.new(0,0,0,0); TC3.Position=UDim2.new(0.5,St.TextX,0.5,St.TextY); TC3.BackgroundTransparency=1; TC3.ZIndex=30; TC3.Parent=SG;
local TGs,TGS={},{};
for i=1,TGC do
    local c=TGL[i];
    local l=Instance.new("TextLabel");
    l.Size=UDim2.new(0,360,0,50); l.Position=UDim2.new(0,-180,0,29); l.BackgroundTransparency=1; l.Text=St.CrosshairText; l.Font=Enum.Font[St.CrosshairFont]; l.TextSize=St.TextSize; l.TextColor3=IC; l.TextTransparency=c.transp; l.TextStrokeTransparency=1; l.ZIndex=30+i; l.Parent=TC3;
    local s=Instance.new("UIStroke"); s.Thickness=c.stroke; s.Color=IC; s.Transparency=c.st; s.LineJoinMode=Enum.LineJoinMode.Round; s.Parent=l;
    TGS[i]=s; TGs[i]=l;
end;
local TL=Instance.new("TextLabel");
TL.Size=UDim2.new(0,360,0,50); TL.Position=UDim2.new(0,-180,0,29); TL.BackgroundTransparency=1; TL.Text=St.CrosshairText; TL.Font=Enum.Font[St.CrosshairFont]; TL.TextSize=St.TextSize; TL.TextColor3=IC; TL.TextStrokeTransparency=0; TL.TextStrokeColor3=Color3.fromRGB(0,0,0); TL.ZIndex=50; TL.Parent=TC3;
local TS=Instance.new("UIStroke"); TS.Thickness=St.TextStrokeThickness; TS.Color=Color3.fromRGB(0,0,0); TS.Parent=TL;

local function UT()
    local t=St.CrosshairText or "Yokai.win";
    for i=1,TGC do if TGs[i] then TGs[i].Text=t end end;
    if TL then TL.Text=t end;
end;
local function SC()
    local arr = St.StaticColor or {185,170,235};
    local r = math.clamp(tonumber(arr[1]) or 185, 0, 255);
    local g = math.clamp(tonumber(arr[2]) or 170, 0, 255);
    local b = math.clamp(tonumber(arr[3]) or 235, 0, 255);
    return Color3.fromRGB(r, g, b);
end;
UT();

local Gs,GCs={},{};
for li=1,GFC do
    Gs[li]={}; GCs[li]={};
    local c=GF[li];
    for i=1,4 do
        local g=Instance.new("Frame");
        g.BorderSizePixel=0; g.BackgroundColor3=IC; g.BackgroundTransparency=c.transp; g.AnchorPoint=Vector2.new(0.5,0.5); g.ZIndex=10+(GFC-li); g.Parent=CC;
        Gs[li][i]=g;
        local gc=Instance.new("UICorner"); gc.CornerRadius=UDim.new(0,c.corner); gc.Parent=g;
        GCs[li][i]=gc;
    end;
end;
local Ln,On={},{};
for i=1,4 do
    local O=Instance.new("Frame");
    O.BorderSizePixel=0; O.BackgroundColor3=Color3.fromRGB(0,0,0); O.BackgroundTransparency=1-(St.OutlineOpacity/100); O.AnchorPoint=Vector2.new(0.5,0.5); O.ZIndex=30; O.Parent=CC;
    On[i]=O;
    local L=Instance.new("Frame");
    L.BorderSizePixel=0; L.BackgroundColor3=IC; L.AnchorPoint=Vector2.new(0.5,0.5); L.ZIndex=31; L.Parent=CC;
    Ln[i]=L;
end;
local W=Library:CreateWindow({Title="Turtle Hub v2",Footer="PC Version",Icon=95816097006870,NotifySide="Right",ShowCustomCursor=false});
local TB={Main=W:AddTab("Crosshair","crosshair"),Char=W:AddTab("Character","user"),Rage=W:AddTab("Ragebot","crosshair"),Sky=W:AddTab("Skybox","image"),Ava=W:AddTab("Avatar","user"),BL=W:AddTab("Blacklist","list"),Wp=W:AddTab("Weapon","crosshair"),ESP=W:AddTab("ESP","eye"),Cfg=W:AddTab("Config","settings")};
local ESPObjects={};
local ESPOriginalTransparency={};
local ESPConnections={};

local function ESPRemove(p)
    local h=ESPObjects[p];
    if h then pcall(function() h:Destroy() end); ESPObjects[p]=nil end;
    local saved=ESPOriginalTransparency[p];
    if saved then
        for part,value in pairs(saved) do
            if part and part.Parent then pcall(function() part.Transparency=value end) end
        end
        ESPOriginalTransparency[p]=nil;
    end;
end;

local function ESPIsEnemy(p)
    if not p or p==LP then return false end;
    local myTeam=LP.Team;
    local theirTeam=p.Team;
    if myTeam and theirTeam then return myTeam~=theirTeam end;
    return true;
end;

local function ESPApply(p)
    if not St.ESPEnabled or not ESPIsEnemy(p) then ESPRemove(p); return end;
    local c=p.Character;
    if not c or not c.Parent then ESPRemove(p); return end;

    local h=ESPObjects[p];
    if not h or h.Parent~=c then
        ESPRemove(p);
        h=Instance.new("Highlight");
        h.Name="TurtleHub_ESP";
        h.Adornee=c;
        h.DepthMode=Enum.HighlightDepthMode.Occluded;
        h.Parent=c;
        ESPObjects[p]=h;
    end;

    local col=St.ESPColor or {255,80,80};
    local color=Color3.fromRGB(math.clamp(tonumber(col[1]) or 255,0,255),math.clamp(tonumber(col[2]) or 80,0,255),math.clamp(tonumber(col[3]) or 80,0,255));
    local strength=math.clamp(tonumber(St.ESPColorStrength) or 1,0,1);
    local displayColor=Color3.new(1+(color.R-1)*strength,1+(color.G-1)*strength,1+(color.B-1)*strength);
    h.FillColor=displayColor;
    h.FillTransparency=math.clamp(0.35+(1-strength)*0.5,0,1);
    h.OutlineColor=displayColor;
    h.OutlineTransparency=math.clamp(tonumber(St.ESPOutlineTransparency) or 0.15,0,1);

    local transparency=math.clamp(tonumber(St.ESPTransparency) or 0.65,0,1);
    local saved=ESPOriginalTransparency[p];
    if not saved or next(saved)==nil then
        saved={}; ESPOriginalTransparency[p]=saved;
        for _,part in ipairs(c:GetDescendants()) do
            if part:IsA("BasePart") then saved[part]=part.Transparency end
        end;
    end;
    for part,original in pairs(saved) do
        if part and part.Parent and original<1 then pcall(function() part.Transparency=transparency end) end
    end;
end;

local function ESPRefresh()
    if not St.ESPEnabled then
        for p in pairs(ESPObjects) do ESPRemove(p) end;
        for p in pairs(ESPOriginalTransparency) do ESPRemove(p) end;
        return;
    end;
    for _,p in ipairs(P:GetPlayers()) do if p~=LP then ESPApply(p) end end;
end;

local function ESPWatch(p)
    if p==LP or ESPConnections[p] then return end;
    ESPConnections[p]={};
    ESPConnections[p].char=p.CharacterAdded:Connect(function() task.wait(0.15); ESPApply(p) end);
    ESPConnections[p].team=p:GetPropertyChangedSignal("Team"):Connect(function() ESPApply(p) end);
end;

P.PlayerAdded:Connect(ESPWatch);
P.PlayerRemoving:Connect(function(p)
    local con=ESPConnections[p];
    if con then for _,c in pairs(con) do pcall(function() c:Disconnect() end) end; ESPConnections[p]=nil end;
    ESPRemove(p);
end);
for _,p in ipairs(P:GetPlayers()) do ESPWatch(p) end;

local ESG=TB.ESP:AddLeftGroupbox("Player ESP");
ESG:AddToggle("ESPEnabled",{Text="Enable ESP",Default=St.ESPEnabled,Callback=function(v) St.ESPEnabled=v; ESPRefresh(); SS() end});
ESG:AddLabel("ESP Color"):AddColorPicker("ESPColor",{Default=Color3.fromRGB(St.ESPColor[1],St.ESPColor[2],St.ESPColor[3]),Title="Player ESP Color",Callback=function(v) St.ESPColor={math.floor(v.R*255+0.5),math.floor(v.G*255+0.5),math.floor(v.B*255+0.5)}; ESPRefresh(); SS() end});
ESG:AddSlider("ESPTransparency",{Text="Body Transparency",Default=St.ESPTransparency*100,Min=0,Max=100,Rounding=0,Suffix="%",Callback=function(v) St.ESPTransparency=v/100; ESPRefresh(); SS() end});
ESG:AddSlider("ESPColorStrength",{Text="Color Strength",Default=St.ESPColorStrength*100,Min=0,Max=100,Rounding=0,Suffix="%",Callback=function(v) St.ESPColorStrength=v/100; ESPRefresh(); SS() end});
ESG:AddSlider("ESPOutlineTransparency",{Text="Outline Transparency",Default=St.ESPOutlineTransparency*100,Min=0,Max=100,Rounding=0,Suffix="%",Callback=function(v) St.ESPOutlineTransparency=v/100; ESPRefresh(); SS() end});

local XG=TB.Main:AddLeftGroupbox("Crosshair");
XG:AddToggle("CrosshairEnabled",{Text="Enable Crosshair",Default=St.CrosshairEnabled,Callback=function(v) St.CrosshairEnabled=v; CC.Visible=v; TC3.Visible=v; SS() end}):AddKeyPicker("CrosshairEnabledKey",{Default="None",SyncToggleState=true,Mode="Toggle",Text="Crosshair key"});
XG:AddToggle("GlowEnabled",{Text="Glow",Default=St.GlowEnabled,Callback=function(v) St.GlowEnabled=v; for li=1,GFC do for i=1,4 do Gs[li][i].Visible=v end end; SS() end}):AddKeyPicker("GlowEnabledKey",{Default="None",SyncToggleState=true,Mode="Toggle",Text="Glow key"});
XG:AddSlider("GlowSize",{Text="Glow Size",Default=St.GlowSize,Min=5,Max=60,Rounding=0,Suffix="px",Callback=function(v) St.GlowSize=v; SS() end});
XG:AddSlider("GlowOpacity",{Text="Glow Opacity",Default=St.GlowOpacity,Min=0,Max=100,Rounding=0,Suffix="%",Callback=function(v) St.GlowOpacity=v; SS() end});
XG:AddToggle("FollowMouse",{Text="Follow Mouse",Default=St.FollowMouse,Callback=function(v) St.FollowMouse=v; SS() end}):AddKeyPicker("FollowMouseKey",{Default="None",SyncToggleState=true,Mode="Toggle",Text="FM key"});
XG:AddSlider("BaseLength",{Text="Base Length",Default=St.BaseLength,Min=10,Max=50,Rounding=0,Callback=function(v) St.BaseLength=v; SS() end});
XG:AddSlider("Thickness",{Text="Thickness",Default=St.Thickness,Min=0.5,Max=8,Rounding=1,Suffix="px",Callback=function(v) St.Thickness=v; SS() end});
XG:AddSlider("OutlineThickness",{Text="Outline Thickness",Default=St.OutlineThickness,Min=0,Max=6,Rounding=1,Suffix="px",Callback=function(v) St.OutlineThickness=v; SS() end});
XG:AddSlider("OutlineOpacity",{Text="Outline Opacity",Default=St.OutlineOpacity,Min=0,Max=100,Rounding=0,Suffix="%",Callback=function(v) St.OutlineOpacity=v; SS() end});
XG:AddSlider("CenterGap",{Text="Center Gap",Default=St.CenterGap,Min=5,Max=25,Rounding=0,Callback=function(v) St.CenterGap=v; SS() end});
XG:AddSlider("RotationSpeed",{Text="Rotation Speed",Default=St.RotationSpeed,Min=0,Max=400,Rounding=0,Callback=function(v) St.RotationSpeed=v; SS() end});
XG:AddSlider("RGBSpeed",{Text="RGB Speed",Default=St.RGBSpeed,Min=0.01,Max=0.5,Rounding=2,Callback=function(v) St.RGBSpeed=v; SS() end});
XG:AddSlider("SizeRange",{Text="Size Range",Default=St.SizeRange,Min=0,Max=20,Rounding=0,Callback=function(v) St.SizeRange=v; SS() end});
XG:AddSlider("PulseSpeed",{Text="Pulse Speed",Default=St.PulseSpeed,Min=0.5,Max=10,Rounding=1,Callback=function(v) St.PulseSpeed=v; SS() end});
XG:AddSlider("MinSpeedMultiplier",{Text="Min Spd Mult",Default=St.MinSpeedMultiplier,Min=0.1,Max=2,Rounding=2,Callback=function(v) St.MinSpeedMultiplier=v; SS() end});
XG:AddSlider("MaxSpeedMultiplier",{Text="Max Spd Mult",Default=St.MaxSpeedMultiplier,Min=0.5,Max=3,Rounding=2,Callback=function(v) St.MaxSpeedMultiplier=v; SS() end});
local PG2=TB.Main:AddRightGroupbox("Position");
PG2:AddSlider("CrosshairX",{Text="Crosshair X",Default=St.CrosshairX,Min=-200,Max=200,Rounding=0,Callback=function(v) St.CrosshairX=v; if not St.FollowMouse then CC.Position=UDim2.new(0.5,v,0.5,St.CrosshairY) end; SS() end});
PG2:AddSlider("CrosshairY",{Text="Crosshair Y",Default=St.CrosshairY,Min=-200,Max=200,Rounding=0,Callback=function(v) St.CrosshairY=v; if not St.FollowMouse then CC.Position=UDim2.new(0.5,St.CrosshairX,0.5,v) end; SS() end});
PG2:AddSlider("TextX",{Text="Text X",Default=St.TextX,Min=-200,Max=200,Rounding=0,Callback=function(v) St.TextX=v; if not St.FollowMouse then TC3.Position=UDim2.new(0.5,v,0.5,St.TextY) end; SS() end});
PG2:AddSlider("TextY",{Text="Text Y",Default=St.TextY,Min=-200,Max=200,Rounding=0,Callback=function(v) St.TextY=v; if not St.FollowMouse then TC3.Position=UDim2.new(0.5,St.TextX,0.5,v) end; SS() end});
local TXG=TB.Main:AddRightGroupbox("Text");

TXG:AddInput("CrosshairText",{
    Default=St.CrosshairText,
    Text="Crosshair Text",
    Placeholder="Yokai.win",
    Finished=false,
    Callback=function(v)
        St.CrosshairText=v;
        UT();
        SS();
    end
});
TXG:AddDropdown("ColorMode",{
    Values={"Rainbow","Static"},
    Default=St.ColorMode,
    Text="Color Mode",
    Callback=function(v)
        if type(v)=="table" then for k in pairs(v) do v=k; break end end;
        St.ColorMode=v or "Rainbow";
        SS();
    end
});
TXG:AddLabel("Static Color"):AddColorPicker("StaticColor",{
    Default=Color3.fromRGB(St.StaticColor[1],St.StaticColor[2],St.StaticColor[3]),
    Title="Crosshair Static Color",
    Callback=function(v)
        St.StaticColor={
            math.floor(v.R*255+0.5),
            math.floor(v.G*255+0.5),
            math.floor(v.B*255+0.5),
        };
        SS();
    end
});
TXG:AddDivider();

TXG:AddDropdown("CrosshairFont",{Values=FL,Default=St.CrosshairFont,Text="Font",Searchable=true,Callback=function(v) St.CrosshairFont=v; local f=Enum.Font[v]; if f then for i=1,TGC do TGs[i].Font=f end; TL.Font=f end; SS() end});
TXG:AddSlider("TextSize",{Text="Text Size",Default=St.TextSize,Min=10,Max=50,Rounding=0,Callback=function(v) St.TextSize=v; for i=1,TGC do TGs[i].TextSize=v end; TL.TextSize=v; SS() end});
TXG:AddSlider("TextStrokeThickness",{Text="Text Stroke",Default=St.TextStrokeThickness,Min=0,Max=2,Rounding=1,Callback=function(v) St.TextStrokeThickness=v; TS.Thickness=v; SS() end});
TXG:AddSlider("TextGlowSize",{Text="Txt Glow Size",Default=St.TextGlowSize,Min=0,Max=30,Rounding=0,Suffix="px",Callback=function(v) St.TextGlowSize=v; SS() end});
TXG:AddSlider("TextGlowOpacity",{Text="Txt Glow Opac",Default=St.TextGlowOpacity,Min=0,Max=100,Rounding=0,Suffix="%",Callback=function(v) St.TextGlowOpacity=v; SS() end});

local FG=TB.Char:AddLeftGroupbox("Fly");
FG:AddToggle("FlyEnabled",{Text="Enable Fly",Default=St.FlyEnabled,Tooltip="WASD/Space/LCtrl",Callback=function(v) St.FlyEnabled=v; if v then STFLY2() else STFLY() end; SS() end}):AddKeyPicker("FlyEnabledKey",{Default="None",SyncToggleState=true,Mode="Toggle",Text="Fly key"});
FG:AddSlider("FlySpeed",{Text="Fly Speed",Default=St.FlySpeed,Min=10,Max=1000,Rounding=0,Suffix="spd",Callback=function(v) St.FlySpeed=v; SS() end});
FG:AddDivider();
FG:AddLabel("W/A/S/D Move  Space Up  LCtrl Down",true);
local MG=TB.Char:AddRightGroupbox("Movement");
MG:AddToggle("WalkSpeedEnabled",{Text="WalkSpeed",Default=St.WalkSpeedEnabled,Callback=function(v) St.WalkSpeedEnabled=v; AWS(); SS() end}):AddKeyPicker("WalkSpeedEnabledKey",{Default="None",SyncToggleState=true,Mode="Toggle",Text="WS key"});
MG:AddSlider("WalkSpeedValue",{Text="WalkSpeed",Default=St.WalkSpeedValue,Min=16,Max=10000,Rounding=0,Suffix="spd",Callback=function(v) St.WalkSpeedValue=v; if St.WalkSpeedEnabled then AWS() end; SS() end});
MG:AddDivider();
MG:AddToggle("JumpPowerEnabled",{Text="JumpPower",Default=St.JumpPowerEnabled,Callback=function(v) St.JumpPowerEnabled=v; AJP(); SS() end}):AddKeyPicker("JumpPowerEnabledKey",{Default="None",SyncToggleState=true,Mode="Toggle",Text="JP key"});
MG:AddSlider("JumpPowerValue",{Text="JumpPower",Default=St.JumpPowerValue,Min=50,Max=10000,Rounding=0,Suffix="jp",Callback=function(v) St.JumpPowerValue=v; if St.JumpPowerEnabled then AJP() end; SS() end});
MG:AddDivider();
MG:AddToggle("NoclipEnabled",{Text="Noclip",Default=St.NoclipEnabled,Callback=function(v) St.NoclipEnabled=v; if v then SN1() else SN2() end; SS() end}):AddKeyPicker("NoclipEnabledKey",{Default="None",SyncToggleState=true,Mode="Toggle",Text="NC key"});

local SG2=TB.Sky:AddLeftGroupbox("Skybox");
SG2:AddToggle("SkyEnabled",{Text="Enable Skybox",Default=St.SkyEnabled,Callback=function(v) St.SkyEnabled=v; ASKY(); SS() end}):AddKeyPicker("SkyEnabledKey",{Default="None",SyncToggleState=true,Mode="Toggle",Text="Sky key"});
SG2:AddDropdown("SkyPreset",{Values=SL,Default=St.SkyPreset,Text="Preset",Searchable=true,Callback=function(v) St.SkyPreset=v; SS(); if St.SkyEnabled then ASKY() end end});
SG2:AddDivider();
SG2:AddToggle("SkyRemoveSun",{Text="Remove Sun",Default=St.SkyRemoveSun,Callback=function(v) St.SkyRemoveSun=v; SS(); if St.SkyEnabled then ASKY() end end});
SG2:AddToggle("SkyRemoveMoon",{Text="Remove Moon",Default=St.SkyRemoveMoon,Callback=function(v) St.SkyRemoveMoon=v; SS(); if St.SkyEnabled then ASKY() end end});
SG2:AddToggle("SkyRemoveStars",{Text="Remove Stars",Default=St.SkyRemoveStars,Callback=function(v) St.SkyRemoveStars=v; SS(); if St.SkyEnabled then ASKY() end end});
local SRG=TB.Sky:AddRightGroupbox("Rotation");
SRG:AddToggle("SkyRotate",{Text="Rotate Skybox",Default=St.SkyRotate,Callback=function(v) St.SkyRotate=v; SS() end});
SRG:AddSlider("SkyRotateSpeed",{Text="Rotate Speed",Default=St.SkyRotateSpeed,Min=0.1,Max=5,Rounding=1,Callback=function(v) St.SkyRotateSpeed=v; SS() end});
SRG:AddDropdown("SkyRotateDirection",{Values={"Horizontal","Vertical","Diagonal"},Default=St.SkyRotateDirection,Text="Direction",Callback=function(v) St.SkyRotateDirection=v; SS() end});
SRG:AddDropdown("SkyRotateMethod",{Values={"Spin","Wave","Alternate"},Default=St.SkyRotateMethod,Text="Method",Callback=function(v) St.SkyRotateMethod=v; SS() end});

local AvatarPreviewImage=nil;
local AvatarPreviewName=nil;
local AvatarPreviewFrame=nil;
local AG2=nil;

local function UpdateAvatarPreview(uid)
    pcall(function()
        if not AG2 then return end
        local parent=AG2.Container or AG2.Frame;
        if not parent or not parent:IsA("GuiObject") then return end;
        if not AvatarPreviewFrame or not AvatarPreviewFrame.Parent then
            AvatarPreviewFrame=Instance.new("Frame");
            AvatarPreviewFrame.Name="AvatarProfilePreview"; AvatarPreviewFrame.Size=UDim2.new(1,0,0,86); AvatarPreviewFrame.BackgroundTransparency=1; AvatarPreviewFrame.LayoutOrder=-100; AvatarPreviewFrame.Parent=parent;
            AvatarPreviewImage=Instance.new("ImageLabel"); AvatarPreviewImage.Name="AvatarProfileImage"; AvatarPreviewImage.Size=UDim2.new(0,70,0,70); AvatarPreviewImage.Position=UDim2.new(0,4,0.5,-35); AvatarPreviewImage.BackgroundTransparency=1; AvatarPreviewImage.ScaleType=Enum.ScaleType.Crop; AvatarPreviewImage.Parent=AvatarPreviewFrame;
            local cr=Instance.new("UICorner"); cr.CornerRadius=UDim.new(1,0); cr.Parent=AvatarPreviewImage;
            AvatarPreviewName=Instance.new("TextLabel"); AvatarPreviewName.Size=UDim2.new(1,-84,1,0); AvatarPreviewName.Position=UDim2.new(0,84,0,0); AvatarPreviewName.BackgroundTransparency=1; AvatarPreviewName.TextColor3=Color3.fromRGB(220,220,225); AvatarPreviewName.Font=Enum.Font.GothamSemibold; AvatarPreviewName.TextSize=13; AvatarPreviewName.TextXAlignment=Enum.TextXAlignment.Left; AvatarPreviewName.TextYAlignment=Enum.TextYAlignment.Center; AvatarPreviewName.Text="No avatar loaded"; AvatarPreviewName.Parent=AvatarPreviewFrame;
        end;
        local id=tonumber(uid);
        if not id then AvatarPreviewImage.Image=""; AvatarPreviewName.Text="No avatar loaded"; return end;
        AvatarPreviewImage.Image="rbxthumb://type=AvatarHeadShot&id="..tostring(id).."&w=420&h=420";
        AvatarPreviewName.Text="Avatar Preview\nUser ID: "..tostring(id);
    end);
end;

AG2=TB.Ava:AddLeftGroupbox("Avatar Changer");
AG2:AddInput("AvatarID",{Default="",Text="User ID",Placeholder="Enter user ID...",Numeric=true,Finished=false});
AG2:AddButton({Text="Transform",Func=function() local u=string.match(GI(Options.AvatarID,"") or "","%d+"); if u then UpdateAvatarPreview(u); TT(u,true) else Library:Notify({Title="Error",Description="Enter User ID",Time=2}) end end});
AG2:AddButton({Text="Restore Original",Func=function() AG=AG+1; RA(); if St.HeadlessEnabled then task.wait(0.2); AHL(true) end; Library:Notify({Title="Restored",Time=2}) end});
AG2:AddToggle("HeadlessEnabled",{Text="Headless",Default=St.HeadlessEnabled,Tooltip="Hide head/hair/hats",Callback=function(v) St.HeadlessEnabled=v; AHL(v); SS() end}):AddKeyPicker("HeadlessEnabledKey",{Default="None",SyncToggleState=true,Mode="Toggle",Text="HL key"});
local PrG=TB.Ava:AddRightGroupbox("Presets");
SLB=PrG:AddLabel("Auto Slot: Off");
PrG:AddDropdown("AutoAvatarSlot",{Values={"Off","Slot 1","Slot 2","Slot 3"},Default=SN(St.AutoAvatarSlot),Text="Auto Load on Spawn",Callback=function(v) if type(v)=="table" then for k in pairs(v) do v=k; break end end; local m={Off=0,["Slot 1"]=1,["Slot 2"]=2,["Slot 3"]=3}; St.AutoAvatarSlot=m[v] or 0; SS(); RSL(); if St.AutoAvatarSlot>0 then TAA("dropdown",true) end end});
PrG:AddDropdown("PresetSlot",{Values={"Slot 1","Slot 2","Slot 3"},Default="Slot 1",Text="Select Slot"});
PrG:AddButton({Text="Save Current ID to Slot",Func=function() local u=string.match(GI(Options.AvatarID,"") or "","%d+"); if not u then Library:Notify({Title="Error",Description="Enter User ID",Time=2}); return end; local sn=tonumber(string.match(tostring(GD(Options.PresetSlot,"Slot 1")),"%d+")) or 1; AP["Preset"..sn]=u; AP["Preset"..sn.."Headless"]=St.HeadlessEnabled; SA(); RSL(); Library:Notify({Title="Saved Slot "..sn,Description=u..(St.HeadlessEnabled and " + HL" or ""),Time=2}) end});
PrG:AddButton({Text="Load Selected Slot",Func=function() local sn=tonumber(string.match(tostring(GD(Options.PresetSlot,"Slot 1")),"%d+")) or 1; local p=AP["Preset"..sn]; if not p or p=="" then Library:Notify({Title="Error",Description="Slot "..sn.." empty",Time=2}); return end; if Options.AvatarID then pcall(function() Options.AvatarID:SetValue(p) end) end; local hl=AP["Preset"..sn.."Headless"]; if hl~=nil then St.HeadlessEnabled=hl; if Options.HeadlessEnabled then pcall(function() Options.HeadlessEnabled:SetValue(hl) end) end; SS() end; UpdateAvatarPreview(p); TT(p,true) end});
PrG:AddButton({Text="Clear Selected Slot",Func=function() local sn=tonumber(string.match(tostring(GD(Options.PresetSlot,"Slot 1")),"%d+")) or 1; AP["Preset"..sn]=""; AP["Preset"..sn.."Headless"]=false; SA(); RSL(); Library:Notify({Title="Cleared Slot "..sn,Time=2}) end});
local EG=TB.Ava:AddLeftGroupbox("Effects");
EG:AddToggle("TurtleSwimEnabled",{Text="Turtle Swim",Default=St.TurtleSwimEnabled,Callback=function(v) St.TurtleSwimEnabled=v; local c=LP.Character; if v then if c then BT(c) end else DT() end; SS() end}):AddKeyPicker("TurtleSwimEnabledKey",{Default="None",SyncToggleState=true,Mode="Toggle",Text="TS key"});
EG:AddDivider();
EG:AddToggle("ChinaHatEnabled",{Text="China Hat",Default=St.ChinaHatEnabled,Callback=function(v) St.ChinaHatEnabled=v; local c=LP.Character; if v then if c then BH(c) end else DH() end; SS() end}):AddKeyPicker("ChinaHatEnabledKey",{Default="None",SyncToggleState=true,Mode="Toggle",Text="CH key"});
EG:AddToggle("OrbitEnabled",{Text="Orbit Orbs",Default=St.OrbitEnabled,Callback=function(v) St.OrbitEnabled=v; local c=LP.Character; if v then if c then BO(c) end else DO() end; SS() end}):AddKeyPicker("OrbitEnabledKey",{Default="None",SyncToggleState=true,Mode="Toggle",Text="OR key"});
EG:AddToggle("AuraEnabled",{Text="Aura",Default=St.AuraEnabled,Callback=function(v) St.AuraEnabled=v; local c=LP.Character; if v then if c then BA(c) end else DA() end; SS() end}):AddKeyPicker("AuraEnabledKey",{Default="None",SyncToggleState=true,Mode="Toggle",Text="AU key"});

local SPs,PBs,PLF=nil,{},nil;
local BLG=TB.BL:AddLeftGroupbox("Player List");
local function GBP()
    if not BLG then return nil end;
    if BLG.Container then return BLG.Container end;
    if BLG.Frame then return BLG.Frame end;
    if typeof(BLG)=="Instance" then for _,c in pairs(BLG:GetChildren()) do if c.Name=="Container" or c.Name=="Holder" then return c end end; return BLG end;
    for _,v in pairs(BLG) do if typeof(v)=="Instance" then return v end end;
    return nil;
end;
task.spawn(function() task.wait(1); if Library.Unloaded then return end; pcall(function() if not BLG then return end; local function KB(b) if not b then return end; pcall(function() b.Active=false; b.AutoButtonColor=false; b.Selectable=false end); if getconnections then pcall(function() for _,c in ipairs(getconnections(b.MouseButton1Click) or {}) do pcall(function() c:Disable() end) end end) end end; KB(BLG.ToggleButton) end) end);
task.spawn(function() while true do task.wait(0.3); if Library.Unloaded then break end; pcall(function() local p=GBP(); if p and p:IsA("GuiObject") and not p.Visible then p.Visible=true end end) end end);
local function BLB()
    if PLF and PLF.Parent then PLF:Destroy() end;
    local p=GBP(); if not p then return end;
    local f=Instance.new("ScrollingFrame");
    f.Name="THPL"; f.Size=UDim2.new(1,-8,0,St.ListHeight); f.BackgroundColor3=Color3.fromRGB(St.ListBgColor[1],St.ListBgColor[2],St.ListBgColor[3]); f.BackgroundTransparency=St.ListBgTransparency/100; f.BorderSizePixel=0; f.ScrollBarThickness=3; f.ScrollBarImageColor3=Color3.fromRGB(80,200,120); f.ZIndex=5; f.CanvasSize=UDim2.new(0,0,0,0); f.AutomaticCanvasSize=Enum.AutomaticSize.Y; f.ScrollingDirection=Enum.ScrollingDirection.Y; f.ClipsDescendants=true; f.Parent=p;
    local c=Instance.new("UICorner"); c.CornerRadius=UDim.new(0,St.ListCorner); c.Parent=f;
    local l=Instance.new("UIListLayout"); l.Padding=UDim.new(0,3); l.SortOrder=Enum.SortOrder.LayoutOrder; l.Parent=f;
    local pd=Instance.new("UIPadding"); pd.PaddingTop=UDim.new(0,5); pd.PaddingLeft=UDim.new(0,5); pd.PaddingRight=UDim.new(0,5); pd.Parent=f;
    PLF=f;
end;
local function RLB()
    if not PLF or not PLF.Parent then BLB() end;
    if not PLF then return end;
    for _,b in pairs(PBs) do if b and b.Parent then b:Destroy() end end;
    PBs={};
    local o={};
    for _,p in pairs(P:GetPlayers()) do if p~=LP then table.insert(o,p) end end;
    if #o==0 then
        if St.ShowEmptyText then
            local e=Instance.new("TextLabel");
            e.Size=UDim2.new(1,-10,0,28); e.BackgroundTransparency=1; e.Text="No players"; e.TextColor3=Color3.fromRGB(120,120,120); e.Font=Enum.Font.Gotham; e.TextSize=13; e.LayoutOrder=1; e.ZIndex=6; e.Parent=PLF;
            table.insert(PBs,e);
        end;
        return;
    end;
    for i,p in ipairs(o) do
        local bl=BL[tostring(p.UserId)]~=nil;
        local b=Instance.new("TextButton");
        b.Size=UDim2.new(1,-10,0,St.ButtonHeight); b.BackgroundColor3=Color3.fromRGB(St.ButtonBgColor[1],St.ButtonBgColor[2],St.ButtonBgColor[3]); b.BorderSizePixel=0; b.Text=p.DisplayName.."  (@"..p.Name..")"; b.TextColor3=bl and Color3.fromRGB(255,80,80) or Color3.fromRGB(220,220,220); b.Font=Enum.Font.Gotham; b.TextSize=13; b.TextXAlignment=Enum.TextXAlignment.Left; b.AutoButtonColor=false; b.LayoutOrder=i; b.ZIndex=6; b.Parent=PLF;
        local cc=Instance.new("UICorner"); cc.CornerRadius=UDim.new(0,St.ButtonCorner); cc.Parent=b;
        local pd=Instance.new("UIPadding"); pd.PaddingLeft=UDim.new(0,8); pd.Parent=b;
        b.InputBegan:Connect(function(inp) if inp.UserInputType==Enum.UserInputType.MouseButton1 or inp.UserInputType==Enum.UserInputType.Touch then SPs=p; for _,x in pairs(PBs) do if x:IsA("TextButton") and x~=b then x.BackgroundColor3=Color3.fromRGB(St.ButtonBgColor[1],St.ButtonBgColor[2],St.ButtonBgColor[3]) end end; b.BackgroundColor3=Color3.fromRGB(60,90,70) end end);
        table.insert(PBs,b);
    end;
end;
local lv=false;
task.spawn(function()
    while true do
        task.wait(0.1);
        if Library.Unloaded then break end;
        pcall(function()
            local p=GBP();
            if not p then return end;
            local vis=true;
            local pp=p;
            while pp do if pp:IsA("GuiObject") and not pp.Visible then vis=false; break end; pp=pp.Parent end;
            local rv=vis and p.AbsoluteSize.X>20;
            if rv and not lv then lv=true; task.wait(0.1); BLB(); RLB()
            elseif not rv then lv=false end;
        end);
    end;
end);
task.spawn(function() while true do task.wait(2); if Library.Unloaded then break end; if lv then pcall(RLB) end end end);
local BA2=TB.BL:AddRightGroupbox("Actions");
BA2:AddButton({Text="Add Selected",Func=function() if not SPs then return end; BL[tostring(SPs.UserId)]={UserId=SPs.UserId,Name=SPs.Name,DisplayName=SPs.DisplayName}; SB(); RLB() end});
BA2:AddButton({Text="Remove Selected",Func=function() if not SPs then return end; BL[tostring(SPs.UserId)]=nil; SB(); RLB() end});
BA2:AddButton({Text="Refresh",Func=function() RLB() end});
BA2:AddButton({Text="Clear All",Func=function() BL={}; SB(); RLB() end});

-- Ragebot tab: duplicate Player List UI
local RBG=TB.Rage:AddLeftGroupbox("Player List");
local RPLF=nil;
local RPBs={};
local function RGBP()
    if not RBG then return nil end;
    if RBG.Container then return RBG.Container end;
    if RBG.Frame then return RBG.Frame end;
    if typeof(RBG)=="Instance" then for _,c in pairs(RBG:GetChildren()) do if c.Name=="Container" or c.Name=="Holder" then return c end end; return RBG end;
    for _,v in pairs(RBG) do if typeof(v)=="Instance" then return v end end;
    return nil;
end;
local function RBLB()
    if RPLF and RPLF.Parent then RPLF:Destroy() end;
    local parent=RGBP(); if not parent then return end;
    local f=Instance.new("ScrollingFrame");
    f.Name="RagebotPlayerList"; f.Size=UDim2.new(1,-8,0,St.ListHeight); f.BackgroundColor3=Color3.fromRGB(St.ListBgColor[1],St.ListBgColor[2],St.ListBgColor[3]); f.BackgroundTransparency=St.ListBgTransparency/100; f.BorderSizePixel=0; f.ScrollBarThickness=3; f.ScrollBarImageColor3=Color3.fromRGB(80,200,120); f.ZIndex=5; f.CanvasSize=UDim2.new(0,0,0,0); f.AutomaticCanvasSize=Enum.AutomaticSize.Y; f.ScrollingDirection=Enum.ScrollingDirection.Y; f.ClipsDescendants=true; f.Parent=parent;
    local c=Instance.new("UICorner"); c.CornerRadius=UDim.new(0,St.ListCorner); c.Parent=f;
    local l=Instance.new("UIListLayout"); l.Padding=UDim.new(0,3); l.SortOrder=Enum.SortOrder.LayoutOrder; l.Parent=f;
    local pd=Instance.new("UIPadding"); pd.PaddingTop=UDim.new(0,5); pd.PaddingLeft=UDim.new(0,5); pd.PaddingRight=UDim.new(0,5); pd.Parent=f;
    RPLF=f;
end;
local function RRLB()
    if not RPLF or not RPLF.Parent then RBLB() end;
    if not RPLF then return end;
    for _,b in pairs(RPBs) do if b and b.Parent then b:Destroy() end end;
    RPBs={};
    local players={};
    for _,plr in pairs(P:GetPlayers()) do if plr~=LP then table.insert(players,plr) end end;
    if #players==0 then
        if St.ShowEmptyText then
            local e=Instance.new("TextLabel"); e.Size=UDim2.new(1,-10,0,28); e.BackgroundTransparency=1; e.Text="No players"; e.TextColor3=Color3.fromRGB(120,120,120); e.Font=Enum.Font.Gotham; e.TextSize=13; e.LayoutOrder=1; e.ZIndex=6; e.Parent=RPLF; table.insert(RPBs,e);
        end;
        return;
    end;
    for i,plr in ipairs(players) do
        local isBlacklisted=BL[tostring(plr.UserId)]~=nil;
        local b=Instance.new("TextButton");
        b.Size=UDim2.new(1,-10,0,St.ButtonHeight); b.BackgroundColor3=Color3.fromRGB(St.ButtonBgColor[1],St.ButtonBgColor[2],St.ButtonBgColor[3]); b.BorderSizePixel=0; b.Text=plr.DisplayName.."  (@"..plr.Name..")"; b.TextColor3=isBlacklisted and Color3.fromRGB(255,80,80) or Color3.fromRGB(220,220,220); b.Font=Enum.Font.Gotham; b.TextSize=13; b.TextXAlignment=Enum.TextXAlignment.Left; b.AutoButtonColor=false; b.LayoutOrder=i; b.ZIndex=6; b.Parent=RPLF;
        local cc=Instance.new("UICorner"); cc.CornerRadius=UDim.new(0,St.ButtonCorner); cc.Parent=b;
        local pd=Instance.new("UIPadding"); pd.PaddingLeft=UDim.new(0,8); pd.Parent=b;
        b.InputBegan:Connect(function(inp)
            if inp.UserInputType==Enum.UserInputType.MouseButton1 or inp.UserInputType==Enum.UserInputType.Touch then
                SPs=plr;
                for _,x in pairs(RPBs) do if x:IsA("TextButton") and x~=b then x.BackgroundColor3=Color3.fromRGB(St.ButtonBgColor[1],St.ButtonBgColor[2],St.ButtonBgColor[3]) end end;
                b.BackgroundColor3=Color3.fromRGB(60,90,70);
            end;
        end);
        table.insert(RPBs,b);
    end;
end;
task.spawn(function()
    task.wait(1);
    while not Library.Unloaded do
        task.wait(2);
        pcall(function()
            local parent=RGBP();
            if not parent then return end;
            local visible=true; local cur=parent;
            while cur do if cur:IsA("GuiObject") and not cur.Visible then visible=false; break end; cur=cur.Parent end;
            if visible and parent:IsA("GuiObject") and parent.AbsoluteSize.X>20 then
                if not RPLF or not RPLF.Parent then RBLB() end;
                RRLB();
            end;
        end);
    end;
end);

-- 変更点: Rage Configの追加
local RCG=TB.Rage:AddLeftGroupbox("Rage Config");
RCG:AddSlider("OMGSpeed",{Text="OMG RAGE Speed",Default=St.OMG_Speed,Min=1,Max=20,Rounding=1,Callback=function(v) St.OMG_Speed=v; SS() end});

-- ==========================================
-- RAGEBOT PANEL (NEW + OMG RAGE)
-- ==========================================
local RBP = TB.Rage:AddRightGroupbox("Ragebot Panel");
local RageActive = false;
local RageConnection = nil;
local OMGRageActive = false;
local OMGRageConnection = nil;
local OMG_T = 0;

RBP:AddButton({Text="RAGE", Func=function()
    if not SPs then
        Library:Notify({Title="Error", Description="Select a player from the list first!", Time=3});
        return;
    end;
    
    RageActive = not RageActive;
    
    if RageActive then
        if OMGRageActive then
            OMGRageActive = false;
            if OMGRageConnection then OMGRageConnection:Disconnect(); OMGRageConnection = nil; end;
            if LP.Character then
                local myHum = LP.Character:FindFirstChildOfClass("Humanoid");
                if myHum then pcall(function() myHum.PlatformStand = false; myHum:ChangeState(Enum.HumanoidStateType.GettingUp) end) end;
            end;
        end;

        Library:Notify({Title="RAGE", Description="Targeting "..SPs.Name.."!", Time=2});
        RageConnection = RS.Heartbeat:Connect(function()
            if not RageActive or not SPs or not SPs.Character or not LP.Character then return end;
            
            local myRoot = LP.Character:FindFirstChild("HumanoidRootPart");
            local targetRoot = SPs.Character:FindFirstChild("HumanoidRootPart");
            
            if myRoot and targetRoot then
                local angle = math.random() * math.pi * 2;
                myRoot.CFrame = targetRoot.CFrame * CFrame.Angles(angle, angle, angle);
                myRoot.AssemblyLinearVelocity = Vector3.new(math.random(-200, 200), math.random(100, 300), math.random(-200, 200));
                myRoot.AssemblyAngularVelocity = Vector3.new(math.random(-500, 500), math.random(-500, 500), math.random(-500, 500));
            end;
        end);
    else
        if RageConnection then
            RageConnection:Disconnect();
            RageConnection = nil;
        end;
        Library:Notify({Title="RAGE", Description="Stopped.", Time=2});
    end;
end});

RBP:AddButton({Text="OMG RAGE", Func=function()
    if not SPs then
        Library:Notify({Title="Error", Description="Select a player from the list first!", Time=3});
        return;
    end;
    
    OMGRageActive = not OMGRageActive;
    
    if OMGRageActive then
        if RageActive then
            RageActive = false;
            if RageConnection then RageConnection:Disconnect(); RageConnection = nil; end;
        end;

        Library:Notify({Title="OMG RAGE", Description="Targeting "..SPs.Name.."'s back...", Time=2});
        OMG_T = 0;
        
        OMGRageConnection = RS.Heartbeat:Connect(function(dt)
            if not OMGRageActive or not SPs or not SPs.Character or not LP.Character then return end;
            
            local myRoot = LP.Character:FindFirstChild("HumanoidRootPart");
            local targetRoot = SPs.Character:FindFirstChild("HumanoidRootPart");
            local myHum = LP.Character:FindFirstChildOfClass("Humanoid");
            
            if myRoot and targetRoot then
                OMG_T = OMG_T + dt * St.OMG_Speed;
                local finalDist = 3 + math.sin(OMG_T) * 2;
                local targetPos = targetRoot.CFrame * CFrame.new(0, 0, finalDist).Position;
                myRoot.CFrame = CFrame.lookAt(targetPos, targetRoot.Position);
                myRoot.AssemblyLinearVelocity = Vector3.new(0, 0, 0);
                myRoot.AssemblyAngularVelocity = Vector3.new(0, 0, 0);
                if myHum then
                    pcall(function() myHum.PlatformStand = true; end);
                end;
            end;
        end);
    else
        if OMGRageConnection then
            OMGRageConnection:Disconnect();
            OMGRageConnection = nil;
        end;
        
        if LP.Character then
            local myHum = LP.Character:FindFirstChildOfClass("Humanoid");
            if myHum then pcall(function() myHum.PlatformStand = false; myHum:ChangeState(Enum.HumanoidStateType.GettingUp) end) end;
        end;
        
        Library:Notify({Title="OMG RAGE", Description="Stopped.", Time=2});
    end;
end});

RBP:AddDivider();
RBP:AddLabel("RAGE: Teleport, spin, and yeet.\nOMG RAGE: Teleport to back, swing.");

local WG=TB.Wp:AddLeftGroupbox("Weapon Mods");
WG:AddToggle("FastFire",{Text="Fast Fire",Default=St.FastFire,Callback=function(v) St.FastFire=v; AW(); SS() end}):AddKeyPicker("FastFireKey",{Default="None",SyncToggleState=true,Mode="Toggle",Text="FF key"});
WG:AddToggle("FastMelee",{Text="Fast Melee",Default=St.FastMelee,Callback=function(v) St.FastMelee=v; AW(); SS() end}):AddKeyPicker("FastMeleeKey",{Default="None",SyncToggleState=true,Mode="Toggle",Text="FM key"});

-- ==========================================
-- KILL SOUNDS UI (Weapon Tab - Right Box)
-- ==========================================
local KSG=TB.Wp:AddRightGroupbox("Kill Sounds");
KSG:AddToggle("KillSoundsEnabled",{Text="Enable Kill Sounds",Default=St.KillSoundsEnabled,Callback=function(v) St.KillSoundsEnabled=v; SS() end}):AddKeyPicker("KillSoundsEnabledKey",{Default="None",SyncToggleState=true,Mode="Toggle",Text="KS key"});
KSG:AddInput("KillSoundID",{Default=St.KillSoundID,Text="Sound Asset ID",Placeholder="e.g. 135097031120155",Finished=false});
KSG:AddButton({Text="Apply Sound ID",Func=function()
    local id=string.match(tostring(GI(Options.KillSoundID,"") or ""),"%d+");
    if not id then Library:Notify({Title="Error",Description="Enter valid Asset ID",Time=2}); return end;
    St.KillSoundID=id;
    KS_Apply();
    SS();
    Library:Notify({Title="Kill Sound Applied",Description="ID: "..id,Time=2});
end});
KSG:AddSlider("KillSoundVolume",{Text="Volume",Default=St.KillSoundVolume*100,Min=0,Max=100,Rounding=0,Suffix="%",Callback=function(v) St.KillSoundVolume=v/100; KS_Apply(); SS() end});
KSG:AddButton({Text="Test Play",Func=function() KS_PlayInternal() end});
KSG:AddDivider();
KSG:AddLabel("Plays when an enemy dies.\nTeam members are ignored.");

local MG2=TB.Cfg:AddRightGroupbox("Menu");
MG2:AddButton({Text="Save All",Func=function() SS(); SA(); SB() end});
MG2:AddLabel("Menu keybind"):AddKeyPicker("MenuKeybind",{Default="RightControl",NoUI=true,Text="Menu keybind"});
MG2:AddButton({Text="Unload Turtle Hub",Func=function()
    SS(); SA(); SB();
    STFLY(); SN2(); DT(); DH(); DO(); DA();
    WL.enabled=false;
    if RageConnection then RageConnection:Disconnect() end;
    if OMGRageConnection then OMGRageConnection:Disconnect() end;
    for _,con in pairs(KS.playerConns) do
        if con.added then pcall(function() con.added:Disconnect() end) end;
        for _,entry in pairs(con.died) do pcall(function() entry.con:Disconnect() end) end;
    end;
    KS.playerConns={};
    if LP.Character then
        local myHum = LP.Character:FindFirstChildOfClass("Humanoid");
        if myHum then pcall(function() myHum.PlatformStand = false; myHum:ChangeState(Enum.HumanoidStateType.GettingUp) end) end;
    end;
    if EL.loaded and EL.RB then pcall(function() EL.RB:Stop() end) end;
    if SG then SG:Destroy() end;
    Library:Unload();
end});
Library.ToggleKeybind=Options.MenuKeybind;

local Tk=0;
RS.RenderStepped:Connect(function(dt)
    if not SG or not SG.Parent then return end;
    pcall(function()
        Tk=Tk+dt;
        if St.FollowMouse then
            local mp=UIS:GetMouseLocation();
            CC.Position=UDim2.new(0,mp.X+St.CrosshairX,0,mp.Y+St.CrosshairY);
            TC3.Position=UDim2.new(0,mp.X+St.TextX,0,mp.Y+St.TextY);
        else
            CC.Position=UDim2.new(0.5,St.CrosshairX,0.5,St.CrosshairY);
            TC3.Position=UDim2.new(0.5,St.TextX,0.5,St.TextY);
        end;
        local pf=math.sin(Tk*St.PulseSpeed);
        local sp=(pf+1)/2;
        local sl=St.MinSpeedMultiplier+sp*(St.MaxSpeedMultiplier-St.MinSpeedMultiplier);
        CC.Rotation=(CC.Rotation+St.RotationSpeed*sl*dt)%360;
        local cc;
        if St.ColorMode=="Static" then
            cc=SC();
        else
            local hue=(Tk*St.RGBSpeed)%1;
            cc=Color3.fromHSV(hue,1,1);
        end;
        local to=St.TextGlowOpacity/100;
        local ts=St.TextGlowSize/10;
        for i=1,TGC do
            local c=TGL[i];
            TGs[i].TextColor3=cc;
            TGs[i].TextSize=St.TextSize;
            TGs[i].TextTransparency=math.clamp(1-(1-c.transp)*to,0,1);
            TGS[i].Color=cc;
            TGS[i].Thickness=c.stroke*ts;
            TGS[i].Transparency=math.clamp(1-(1-c.st)*to,0,1);
        end;
        TL.TextColor3=cc;
        local L=St.BaseLength+pf*St.SizeRange;
        local SP2=math.max(St.OutlineThickness,0);
        local ot=1-(St.OutlineOpacity/100);
        local gom=St.GlowOpacity/100;
        for i=1,4 do
            local isV=(i==1 or i==2);
            local sign=(i==1 and -1) or (i==2 and 1) or (i==3 and -1) or 1;
            local lS,lP;
            if isV then lS=UDim2.new(0,St.Thickness,0,L); lP=UDim2.new(0,0,0,sign*(St.CenterGap+L/2))
            else lS=UDim2.new(0,L,0,St.Thickness); lP=UDim2.new(0,sign*(St.CenterGap+L/2),0,0) end;
            Ln[i].Size=lS; Ln[i].Position=lP; Ln[i].BackgroundColor3=cc;
            On[i].BackgroundTransparency=ot;
            if isV then On[i].Size=UDim2.new(0,St.Thickness+SP2*2,0,L+SP2*2) else On[i].Size=UDim2.new(0,L+SP2*2,0,St.Thickness+SP2*2) end;
            On[i].Position=lP;
            for li=1,GFC do
                local gc=GF[li];
                local g=Gs[li][i];
                local gr=St.GlowSize*gc.frac;
                if isV then g.Size=UDim2.new(0,St.Thickness+gr*2,0,L+gr*2) else g.Size=UDim2.new(0,L+gr*2,0,St.Thickness+gr*2) end;
                g.Position=lP;
                g.BackgroundTransparency=math.clamp(1-(1-gc.transp)*gom,0,1);
                g.BackgroundColor3=cc;
            end;
        end;
    end);
end);

task.spawn(function()
    while true do
        task.wait(0.5);
        if Library.Unloaded then break end;
        pcall(function()
            if St.WalkSpeedEnabled then local c=LP.Character; local h=c and c:FindFirstChildOfClass("Humanoid"); if h and h.WalkSpeed~=St.WalkSpeedValue then h.WalkSpeed=St.WalkSpeedValue end end;
            if St.JumpPowerEnabled then local c=LP.Character; local h=c and c:FindFirstChildOfClass("Humanoid"); if h and (not h.UseJumpPower or h.JumpPower~=St.JumpPowerValue) then h.UseJumpPower=true; h.JumpPower=St.JumpPowerValue end end;
            if St.FlyEnabled then local c=LP.Character; local r=c and c:FindFirstChild("HumanoidRootPart"); if r and (not FBV or not FBV.Parent) then STFLY2() end end;
            if St.HeadlessEnabled then AHL(true) end;
        end);
    end;
end);

LP.CharacterAdded:Connect(function(ch)
    AG=AG+1;
    task.spawn(function()
        for _=1,100 do if ch.Parent and ch:FindFirstChild("Humanoid") then break end; task.wait(0.02) end;
        task.wait(0.3);
        SOA();
        if St.TurtleSwimEnabled then pcall(BT,ch) end;
        if St.ChinaHatEnabled then pcall(BH,ch) end;
        if St.OrbitEnabled then pcall(BO,ch) end;
        if St.AuraEnabled then pcall(BA,ch) end;
        task.wait(0.3);
        if St.WalkSpeedEnabled then AWS() end;
        if St.JumpPowerEnabled then AJP() end;
        if St.FlyEnabled then STFLY2() end;
        if St.NoclipEnabled then SN1() end;
        if St.HeadlessEnabled then AHL(true) end;
        task.wait(0.3);
        if St.SkyEnabled then pcall(ASKY) end;
        task.wait(0.5); TAA("respawn",false);
    end);
end);
LP.CharacterAppearanceLoaded:Connect(function(ch) task.spawn(function() task.wait(0.5); TAA("appearance",false) end) end);

local function SY()
    if not Options then return end;
    local function S(n,v) if Options[n] then pcall(function() Options[n]:SetValue(v) end) end end;
    S("CrosshairEnabled",St.CrosshairEnabled); S("GlowEnabled",St.GlowEnabled); S("FollowMouse",St.FollowMouse);
    S("FastFire",St.FastFire); S("FastMelee",St.FastMelee); S("FlyEnabled",St.FlyEnabled);
    S("WalkSpeedEnabled",St.WalkSpeedEnabled); S("JumpPowerEnabled",St.JumpPowerEnabled); S("NoclipEnabled",St.NoclipEnabled);
    S("EliEnabled",St.EliEnabled); S("EliFFA",St.EliFFA); S("EliPrediction",St.EliPrediction);
    S("SkyEnabled",St.SkyEnabled); S("SkyPreset",St.SkyPreset); S("SkyRotate",St.SkyRotate);
    S("SkyRotateDirection",St.SkyRotateDirection); S("SkyRotateMethod",St.SkyRotateMethod);
    S("SkyRemoveSun",St.SkyRemoveSun); S("SkyRemoveMoon",St.SkyRemoveMoon); S("SkyRemoveStars",St.SkyRemoveStars);
    S("TurtleSwimEnabled",St.TurtleSwimEnabled); S("ChinaHatEnabled",St.ChinaHatEnabled);
    S("OrbitEnabled",St.OrbitEnabled); S("AuraEnabled",St.AuraEnabled); S("HeadlessEnabled",St.HeadlessEnabled);
    S("AutoLoadToggle",St.AutoLoad); S("SelfAutoExecEnabled",St.SelfAutoExecEnabled);
    S("GlowSize",St.GlowSize); S("GlowOpacity",St.GlowOpacity); S("BaseLength",St.BaseLength); S("Thickness",St.Thickness);
    S("OutlineThickness",St.OutlineThickness); S("OutlineOpacity",St.OutlineOpacity); S("CenterGap",St.CenterGap);
    S("RotationSpeed",St.RotationSpeed); S("RGBSpeed",St.RGBSpeed); S("SizeRange",St.SizeRange); S("PulseSpeed",St.PulseSpeed);
    S("MinSpeedMultiplier",St.MinSpeedMultiplier); S("MaxSpeedMultiplier",St.MaxSpeedMultiplier);
    S("CrosshairX",St.CrosshairX); S("CrosshairY",St.CrosshairY); S("TextX",St.TextX); S("TextY",St.TextY);
    S("TextSize",St.TextSize); S("TextStrokeThickness",St.TextStrokeThickness);
    S("TextGlowSize",St.TextGlowSize); S("TextGlowOpacity",St.TextGlowOpacity);
    S("FlySpeed",St.FlySpeed); S("WalkSpeedValue",St.WalkSpeedValue); S("JumpPowerValue",St.JumpPowerValue);
    S("EliOffsetX",St.EliOffsetX); S("EliOffsetY",St.EliOffsetY); S("EliOffsetZ",St.EliOffsetZ);
    S("EliPredictionAmount",St.EliPredictionAmount); S("SkyRotateSpeed",St.SkyRotateSpeed); S("CrosshairFont",St.CrosshairFont);
    S("CrosshairText",St.CrosshairText);
    S("KillSoundsEnabled",St.KillSoundsEnabled);
    S("KillSoundID",St.KillSoundID);
    S("KillSoundVolume",St.KillSoundVolume*100);
    S("ESPEnabled",St.ESPEnabled); S("ESPTransparency",St.ESPTransparency*100); S("ESPColorStrength",St.ESPColorStrength*100); S("ESPOutlineTransparency",St.ESPOutlineTransparency*100);
    S("ColorMode",St.ColorMode);
    if Options.StaticColor then
        pcall(function()
            Options.StaticColor:SetValue(Color3.fromRGB(
                math.clamp(tonumber(St.StaticColor[1]) or 185,0,255),
                math.clamp(tonumber(St.StaticColor[2]) or 170,0,255),
                math.clamp(tonumber(St.StaticColor[3]) or 235,0,255)
            ))
        end);
    end;
    if Options.AutoAvatarSlot then S("AutoAvatarSlot",SN(St.AutoAvatarSlot)) end;
    if Options.OMGSpeed then S("OMGSpeed",St.OMG_Speed) end;
end;
task.spawn(function() task.wait(0.8); SY(); RSL(); UT() end);
task.spawn(function()
    task.wait(1.2);
    local c=LP.Character;
    if c then
        SOA();
        if St.WalkSpeedEnabled then AWS() end;
        if St.JumpPowerEnabled then AJP() end;
        if St.FlyEnabled then STFLY2() end;
        if St.NoclipEnabled then SN1() end;
        if St.TurtleSwimEnabled then pcall(BT,c) end;
        if St.ChinaHatEnabled then pcall(BH,c) end;
        if St.OrbitEnabled then pcall(BO,c) end;
        if St.AuraEnabled then pcall(BA,c) end;
        if St.HeadlessEnabled then AHL(true) end;
    end;
    task.wait(1.5); TAA("initial",false);
    if St.SkyEnabled then ASKY() end;
end);
if St.FastFire or St.FastMelee then task.spawn(function() task.wait(2); AW() end) end;
pcall(function()
    if ThemeManager and SaveManager then
        ThemeManager:SetLibrary(Library);
        SaveManager:SetLibrary(Library);
        SaveManager:IgnoreThemeSettings();
        SaveManager:SetIgnoreIndexes({"MenuKeybind"});
        ThemeManager:SetFolder("TurtleHub");
        SaveManager:SetFolder("TurtleHub");
        SaveManager:BuildConfigSection(TB.Cfg);
        ThemeManager:ApplyToTab(TB.Cfg);
        SaveManager:LoadAutoloadConfig();
    end;
end);
task.spawn(function() while true do task.wait(5); if Library.Unloaded then break end; if St.FastFire or St.FastMelee then pcall(AW) end end end);

print("[Turtle Hub v66] Loaded! Kill Sounds added!");