local environmentGetter=getgenv or function()return _G end local
sharedEnvironment=environmentGetter()local Runtime=sharedEnvironment.
BloxStrikeRuntime if type(Runtime)~='table'then Runtime={Running=true,Cleanups={
}}function Runtime.Track(resource)local cleanup=type(resource)=='function'and
resource or function()if typeof(resource)=='RBXScriptConnection'then resource:
Disconnect()elseif typeof(resource)=='Instance'then resource:Destroy()end end if
Runtime.Running then table.insert(Runtime.Cleanups,cleanup)else pcall(cleanup)
end return resource end function Runtime.Cleanup()if not Runtime.Running then
return end Runtime.Running=false for index=#Runtime.Cleanups,1,-1 do pcall(
Runtime.Cleanups[index])end table.clear(Runtime.Cleanups)end sharedEnvironment.
BloxStrikeRuntime=Runtime end cloneref=cloneref or function(i)return i end
getcustomasset=getcustomasset or getsynasset getgenv=getgenv or getfenv local
LOAD_ENV=function()if game:GetService('RunService'):IsStudio()then local
BaseWorkspace=game:GetService('ReplicatedFirst'):FindFirstChild('PRI_WORKSPACE')
or Instance.new('Folder',game:GetService('ReplicatedFirst'))BaseWorkspace.Name=
'PRI\0.'..tostring(string.char(math.random(50,120)))..tostring(string.char(math.
random(50,120)))..tostring(string.char(math.random(50,120)))..tostring(string.
char(math.random(50,120)))..tostring(string.char(math.random(50,120)))..
tostring(string.char(math.random(50,120)))local __get_path_c=function(path)
return(string.find(path,'/',1,true)and string.split(path,'/'))or(string.find(
path,'\\',1,true)and string.split(path,'\\'))or{path}end local __get_path=
function(path)local main=__get_path_c(path)local block=BaseWorkspace for i,v in
next,main do block=block[v]end return block end getgenv().readfile=function(path
)local path:StringValue=__get_path(path)return path.Value end getgenv().isfile=
function(path)local success,message=pcall(function()return __get_path(path)end)
if success and not message:IsA('Folder')then return true end return false end
getgenv().isfolder=function(path)local success,message=pcall(function()return
__get_path(path)end)if success and message:IsA('Folder')then return true end
return false end getgenv().writefile=function(path,content)local main=
__get_path_c(path)local block=BaseWorkspace for i,v in next,main do local item=
block:FindFirstChild(v)if not item then local c=Instance.new('StringValue',block
)c.Name=tostring(v)c.Value=content else if item:IsA('StringValue')and tostring(
item)==v then item.Name=tostring(v)item.Value=content end block=item end end end
getgenv().listfiles=function(path)local fold=__get_path(path)local pa={}for i,v
in next,fold:GetChildren()do if v:IsA('StringValue')then table.insert(pa,path..
'/'..tostring(v))end end return pa end getgenv().makefolder=function(path)local
main=__get_path_c(path)local block=BaseWorkspace for i,v in next,main do local
item=block:FindFirstChild(v)if not item then local c=Instance.new('Folder',block
)c.Name=tostring(v)else block=item end end end getgenv().delfile=function(path)
local main=__get_path_c(path)local block=BaseWorkspace for i,v in next,main do
local item=block:FindFirstChild(v)if item and item:IsA('StringValue')then item:
Destroy()else block=item end end end end end LOAD_ENV()writefile=writefile or
getgenv().writefile makefolder=makefolder or getgenv().makefolder readfile=
readfile or getgenv().readfile delfolder=delfolder or getgenv().delfolder
delfile=delfile or getgenv().delfile listfiles=listfiles or getgenv().listfiles
isfolder=isfolder or getgenv().isfolder isfile=isfile or getgenv().isfile local
NeverLose={}NeverLose.BuiltInRegular=Font.new(
[[rbxasset://LuaPackages/Packages/_Index/BuilderIcons/BuilderIcons/BuilderIcons.json]]
,Enum.FontWeight.Regular,Enum.FontStyle.Normal)NeverLose.BuiltInBold=Font.new(
[[rbxasset://LuaPackages/Packages/_Index/BuilderIcons/BuilderIcons/BuilderIcons.json]]
,Enum.FontWeight.Bold,Enum.FontStyle.Normal)NeverLose.GlobalSignals={}NeverLose.
UnloadEnabled=false function NeverLose:Unload(force)if self.Unloaded or(not
force and not self.UnloadEnabled)then return end self.Unloaded=true for index=#
self.GlobalSignals,1,-1 do local connection=self.GlobalSignals[index]pcall(
function()connection:Disconnect()end)end table.clear(self.GlobalSignals)for _,
key in ipairs({'IndicatorGui','ScreenGui'})do local root=self[key]self[key]=nil
if root then pcall(function()root:Destroy()end)end end end Runtime.Track(
function()NeverLose:Unload(true)end)local cloneref:cloneref=cloneref or function
(f)return f end local TweenService:TweenService=cloneref(game:GetService(
'TweenService'))local UserInputService:UserInputService=cloneref(game:
GetService('UserInputService'))local TextService:TextService=cloneref(game:
GetService('TextService'))local RunService:RunService=cloneref(game:GetService(
'RunService'))local Players:Players=cloneref(game:GetService('Players'))local
HttpService:HttpService=cloneref(game:GetService('HttpService'))local
LocalPlayer:Player=Players.LocalPlayer local PlayerGui:PlayerGui=LocalPlayer:
WaitForChild('PlayerGui')if not Runtime.Running then return NeverLose end local
Mouse:Mouse=LocalPlayer:GetMouse()local CurrentCamera:Camera=cloneref(workspace.
CurrentCamera)local GlobalWindow=Instance.new('ScreenGui')NeverLose.ScreenGui=
GlobalWindow local ManualTween=TweenInfo.new(0.1)local SlowyTween=TweenInfo.new(
0.175)local FastTween=TweenInfo.new(0.05)local VSlowTween=TweenInfo.new(0.5,Enum
.EasingStyle.Quint)local Encryption={}xpcall(function()IsOnMobile=table.find({
Enum.Platform.Android,Enum.Platform.IOS},UserInputService:GetPlatform())end,
function()IsOnMobile=UserInputService.TouchEnabled and not UserInputService.
KeyboardEnabled end)NeverLose.UserProfile=Players:GetUserThumbnailAsync(
LocalPlayer.UserId,Enum.ThumbnailType.HeadShot,Enum.ThumbnailSize.Size150x150)if
not Runtime.Running then return NeverLose end NeverLose.RandomString=function()
return string.rep(string.char(math.random(1,7)),math.random(1,4))..string.rep(
string.char(math.random(1,7)),math.random(1,4))..string.rep(string.char(math.
random(1,7)),math.random(1,4))..string.rep(string.char(math.random(1,7)),math.
random(1,4))..string.rep(string.char(math.random(1,7)),math.random(1,4))..string
.rep(string.char(math.random(1,7)),math.random(1,4))..string.rep(string.char(
math.random(1,7)),math.random(1,4))..string.rep(string.char(math.random(1,7)),
math.random(1,4))..string.rep(string.char(math.random(1,7)),math.random(1,4))..
string.rep(string.char(math.random(1,7)),math.random(1,4))..string.rep(string.
char(math.random(1,7)),math.random(1,4))end GlobalWindow.Name=NeverLose.
RandomString()GlobalWindow.IgnoreGuiInset=true GlobalWindow.ZIndexBehavior=Enum.
ZIndexBehavior.Global GlobalWindow.ResetOnSpawn=false GlobalWindow.Parent=
PlayerGui NeverLose.Scales={Small=UDim2.fromOffset(540,380),Mobile=UDim2.
fromOffset(640,385),Default=UDim2.fromOffset(640,480),Large=UDim2.fromOffset(800
,600)}NeverLose.IconColor=Color3.fromRGB(255,255,255)NeverLose.ScreenGui=
GlobalWindow NeverLose.Flags={}NeverLose.AccentColor=Color3.fromRGB(78,127,252)
NeverLose.MainColor=Color3.fromRGB(8,8,13)NeverLose.RegisiteryColor={}NeverLose.
NameRegisitry={}NeverLose.IsMosueOverOtherFrame=false NeverLose.GlobalLogo=
'rbxassetid://120358385035996'if getcustomasset then local link=
[[https://github.com/4lpaca-pin/NeverLose/blob/main/assets/%s?raw=true]]local
dir='NLAssets'if not isfolder(dir)then makefolder(dir)end pcall(function()if not
isfile(dir..'/'..'logo.png')then local byte=game:HttpGet(string.format(link,
'logo.png'))writefile(dir..'/'..'logo.png',byte)task.wait()end if isfile(dir..
'/'..'logo.png')then NeverLose.GlobalLogo=getcustomasset(dir..'/'..'logo.png')
end end)end if not Runtime.Running then return NeverLose end function NeverLose:
AddSignal(RBXSignal)if NeverLose.Unloaded then pcall(function()RBXSignal:
Disconnect()end)elseif NeverLose.UnloadEnabled then table.insert(NeverLose.
GlobalSignals,RBXSignal)end return RBXSignal end function NeverLose:AddQuery(
ItemRoot:Frame,Name:string)table.insert(NeverLose.NameRegisitry,{Root=ItemRoot,
Idx=Name})end function Encryption.new(data:string)local bytes={}local
encrypt_seed=((#data+3782)%111)+1 string.gsub(data,'.',function(dt)table.insert(
bytes,tostring(dt:byte()+encrypt_seed))end)local concatbyte=table.concat(bytes,
'?')table.clear(bytes)return'{'..tostring(encrypt_seed+72667)..'}?'..concatbyte
end function Encryption.reverse(data:string)local main_data=string.split(data,
'?')local seed_str=main_data[1]:gsub('{',''):gsub('}','')local seed=tonumber(
seed_str)local ks={}local real_seed=seed-72667 for i,v in next,main_data do if i
>1 then local fake_byte=tonumber(v)table.insert(ks,string.char(fake_byte-
real_seed))end end local data=table.concat(ks)table.clear(ks)return data end do
local b=[[ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/]]
NeverLose.Base64Encode=function(data)return((data:gsub('.',function(x)local r,b=
'',x:byte()for i=8,1,-1 do r=r..(b%2^i-b%2^(i-1)>0 and'1'or'0')end return r end)
..'0000'):gsub('%d%d%d?%d?%d?%d?',function(x)if#x<6 then return''end local c=0
for i=1,6 do c=c+(x:sub(i,i)=='1'and 2^(6-i)or 0)end return b:sub(c+1,c+1)end)..
({'','==','='})[#data%3+1])end NeverLose.Base64Decode=function(data)data=string.
gsub(data,'[^'..b..'=]','')return(data:gsub('.',function(x)if x=='='then return
''end local r,f='',(b:find(x)-1)for i=6,1,-1 do r=r..(f%2^i-f%2^(i-1)>0 and'1'or
'0')end return r end):gsub('%d%d%d?%d?%d?%d?%d?%d?',function(x)if#x~=8 then
return''end local c=0 for i=1,8 do c=c+(x:sub(i,i)=='1'and 2^(8-i)or 0)end
return string.char(c)end))end end NeverLose.LoadIcon=function()NeverLose.
RobloxIcon={['3d-cube-arrow-left']='3d-cube-arrow-left',['amazon']='amazon',[
'arm-left']='arm-left',['arm-right']='arm-right',['arrow-curl-to-left']=
'arrow-curl-to-left',['arrow-curl-to-right']='arrow-curl-to-right',[
'arrow-down-to-line']='arrow-down-to-line',['arrow-large-down']=
'arrow-large-down',['arrow-large-left']='arrow-large-left',['arrow-large-right']
='arrow-large-right',['arrow-large-up']='arrow-large-up',[
'arrow-right-from-portrait-rectangle']='arrow-right-from-portrait-rectangle',[
'arrow-right-to-portrait-rectangle']='arrow-right-to-portrait-rectangle',[
'arrow-rotate-down-dashed']='arrow-rotate-down-dashed',['arrow-rotate-right']=
'arrow-rotate-right',['arrow-rotate-right-dashed']='arrow-rotate-right-dashed',[
'arrow-small-down']='arrow-small-down',['arrow-small-left']='arrow-small-left',[
'arrow-small-right']='arrow-small-right',['arrow-small-up']='arrow-small-up',[
'arrow-spin-clockwise']='arrow-spin-clockwise',['arrow-spin-clockwise-10']=
'arrow-spin-clockwise-10',['arrow-spin-clockwise-15']='arrow-spin-clockwise-15',
['arrow-spin-clockwise-30']='arrow-spin-clockwise-30',[
'arrow-spin-counter-clockwise-10']='arrow-spin-counter-clockwise-10',[
'arrow-spin-counter-clockwise-15']='arrow-spin-counter-clockwise-15',[
'arrow-spin-counter-clockwise-30']='arrow-spin-counter-clockwise-30',[
'arrow-thick-to-left']='arrow-thick-to-left',['arrow-thick-to-right']=
'arrow-thick-to-right',['arrow-up-from-landscape-rectangle']=
'arrow-up-from-landscape-rectangle',['arrow-up-right-from-square']=
'arrow-up-right-from-square',['arrow-wide-short-down']='arrow-wide-short-down',[
'arrow-wide-short-left']='arrow-wide-short-left',['arrow-wide-short-right']=
'arrow-wide-short-right',['arrow-wide-short-up']='arrow-wide-short-up',[
'arrows-small-directional']='arrows-small-directional',['audio-wave-dotted-line'
]='audio-wave-dotted-line',['backpack']='backpack',['beard']='beard',['bell']=
'bell',['bell-clock']='bell-clock',['bell-plus']='bell-plus',['bell-slash']=
'bell-slash',['belt']='belt',['binoculars']='binoculars',['book-closed']=
'book-closed',['bookmark']='bookmark',['bow-tie']='bow-tie',['building-store']=
'building-store',['bullet-flying']='bullet-flying',['butterfly-wings']=
'butterfly-wings',['calendar']='calendar',['calendar-plus']='calendar-plus',[
'calendar-star']='calendar-star',['camera-small']='camera-small',[
'caret-small-down']='caret-small-down',['caret-small-left']='caret-small-left',[
'caret-small-right']='caret-small-right',['caret-small-up']='caret-small-up',[
'chain-link']='chain-link',['chart-four-vertical-bars']=
'chart-four-vertical-bars',['chart-line']='chart-line',['chart-pie']='chart-pie'
,['chart-scatter-plot']='chart-scatter-plot',['chart-three-vertical-bars']=
'chart-three-vertical-bars',['check']='check',['check-large']='check-large',[
'check-small']='check-small',['chevron-large-down']='chevron-large-down',[
'chevron-large-down-to-line']='chevron-large-down-to-line',['chevron-large-left'
]='chevron-large-left',['chevron-large-left-to-line']=
'chevron-large-left-to-line',['chevron-large-right']='chevron-large-right',[
'chevron-large-right-to-line']='chevron-large-right-to-line',['chevron-large-up'
]='chevron-large-up',['chevron-large-up-to-line']='chevron-large-up-to-line',[
'chevron-small-down']='chevron-small-down',['chevron-small-down-to-line']=
'chevron-small-down-to-line',['chevron-small-left']='chevron-small-left',[
'chevron-small-left-to-line']='chevron-small-left-to-line',[
'chevron-small-right']='chevron-small-right',['chevron-small-right-to-line']=
'chevron-small-right-to-line',['chevron-small-up']='chevron-small-up',[
'chevron-small-up-to-line']='chevron-small-up-to-line',['circle-check']=
'circle-check',['circle-i']='circle-i',['circle-minus']='circle-minus',[
'circle-person']='circle-person',[
'circle-person-three-horizontal-bars-wrapping-right']=
'circle-person-three-horizontal-bars-wrapping-right',['circle-play']=
'circle-play',['circle-plus']='circle-plus',['circle-question']=
'circle-question',['circle-slash']='circle-slash',['circle-star']='circle-star',
['circle-three-dots-horizontal']='circle-three-dots-horizontal',[
'circle-three-dots-vertical']='circle-three-dots-vertical',['circle-x']=
'circle-x',['clock']='clock',['clock-dashed']='clock-dashed',[
'clock-spin-reverse']='clock-spin-reverse',['clock-spin-reverse-dashed']=
'clock-spin-reverse-dashed',['clothes-hanger']='clothes-hanger',['cloud']=
'cloud',['cloud-arrow-down']='cloud-arrow-down',['code']='code',[
'compact-makeup-brush']='compact-makeup-brush',['compass']='compass',[
'controller-with-cog']='controller-with-cog',['crop']='crop',['crosshairs']=
'crosshairs',['crosshairs-slash']='crosshairs-slash',['cube-vertexes']=
'cube-vertexes',['curved-rectangle-megaphone']='curved-rectangle-megaphone',[
'diagonal-line-pattern']='diagonal-line-pattern',[
'diagonal-line-pattern-sticker']='diagonal-line-pattern-sticker',[
'diamond-simplified']='diamond-simplified',['discord']='discord',[
'disguise-nose-glasses']='disguise-nose-glasses',['document-circle-slash']=
'document-circle-slash',['document-list-heart']='document-list-heart',[
'door-open-arrow-to-bottom-right']='door-open-arrow-to-bottom-right',['dress']=
'dress',['dual-arrows-horizontal']='dual-arrows-horizontal',[
'dual-arrows-to-corners']='dual-arrows-to-corners',['dual-arrows-vertical']=
'dual-arrows-vertical',['envelope']='envelope',['eraser']='eraser',['eye']='eye'
,['eye-slash']='eye-slash',['eye-with-eyeliner']='eye-with-eyeliner',['eyebrows'
]='eyebrows',['eyelashes']='eyelashes',['face-winking']='face-winking',[
'facebook']='facebook',['file-box']='file-box',['fingerprint']='fingerprint',[
'flag']='flag',['flame']='flame',['folder']='folder',['fountain-pen-nib']=
'fountain-pen-nib',['four-bars-horizontal-center-aligned']=
'four-bars-horizontal-center-aligned',['four-bars-horizontal-chevron-left']=
'four-bars-horizontal-chevron-left',['four-bars-horizontal-chevron-right']=
'four-bars-horizontal-chevron-right',['four-bars-horizontal-justified-aligned']=
'four-bars-horizontal-justified-aligned',['four-bars-horizontal-left-aligned']=
'four-bars-horizontal-left-aligned',['four-bars-horizontal-right-aligned']=
'four-bars-horizontal-right-aligned',['frame-bubble-slash']='frame-bubble-slash'
,['frame-bubble-soundwave']='frame-bubble-soundwave',['frame-camera']=
'frame-camera',['frame-camera-center']='frame-camera-center',['frame-collapsed']
='frame-collapsed',['frame-corners']='frame-corners',['frame-expanded']=
'frame-expanded',['frame-face']='frame-face',['frame-person-torso']=
'frame-person-torso',['frame-record']='frame-record',[
'frame-single-bar-horizontal']='frame-single-bar-horizontal',['frame-soundwave']
='frame-soundwave',['frame-video-camera']='frame-video-camera',['gear']='gear',[
'generic-dpad']='generic-dpad',['gift-box']='gift-box',['gift-card']='gift-card'
,['glasses']='glasses',['globe-detailed']='globe-detailed',['globe-simplified']=
'globe-simplified',['globe-simplipfied-speech-bubble']=
'globe-simplipfied-speech-bubble',['grid']='grid',['guilded']='guilded',[
'hack-week']='hack-week',['hammer-code']='hammer-code',['hand-curved-arrow-left'
]='hand-curved-arrow-left',['hand-dual-arrows']='hand-dual-arrows',[
'hand-ellipse']='hand-ellipse',['hand-half-ellipse']='hand-half-ellipse',[
'hand-two-arrows-horizontal']='hand-two-arrows-horizontal',['hashtag']='hashtag'
,['hat-fedora']='hat-fedora',['hat-toque']='hat-toque',['head-blank']=
'head-blank',['head-blush']='head-blush',['head-female']='head-female',[
'head-freckles']='head-freckles',['head-lips']='head-lips',['head-male']=
'head-male',['headphones']='headphones',['headphones-arrow-up']=
'headphones-arrow-up',['headphones-arrow-up-lock']='headphones-arrow-up-lock',[
'headphones-slash']='headphones-slash',['headphones-x']='headphones-x',[
'headphones-x-lock']='headphones-x-lock',['heart']='heart',['house']='house',[
'image']='image',['image-stacked']='image-stacked',['instagram']='instagram',[
'jacket']='jacket',['key']='key',['key-alt']='key-alt',['key-apostrophe']=
'key-apostrophe',['key-arrow-down']='key-arrow-down',['key-arrow-right']=
'key-arrow-right',['key-arrow-up']='key-arrow-up',['key-asterisk']=
'key-asterisk',['key-backspace']='key-backspace',['key-caps-lock']=
'key-caps-lock',['key-caret']='key-caret',['key-comma']='key-comma',[
'key-command']='key-command',['key-control']='key-control',['key-grave-accent']=
'key-grave-accent',['key-period']='key-period',['key-return']='key-return',[
'key-shift']='key-shift',['key-space']='key-space',['key-tab']='key-tab',[
'language-characters']='language-characters',['leg-left']='leg-left',[
'leg-right']='leg-right',['lightning-bolt']='lightning-bolt',['linkedin']=
'linkedin',['lips']='lips',['lipstick']='lipstick',['list-bulleted']=
'list-bulleted',['location-pin']='location-pin',['location-pin-map']=
'location-pin-map',['lock-closed']='lock-closed',['lollipop']='lollipop',[
'magnifying-glass']='magnifying-glass',['magnifying-glass-minus']=
'magnifying-glass-minus',['magnifying-glass-plus']='magnifying-glass-plus',[
'mascara']='mascara',['megaphone']='megaphone',['memory-card']='memory-card',[
'messenger']='messenger',['microphone']='microphone',['microphone-slash']=
'microphone-slash',['microphone-text-box']='microphone-text-box',[
'microphone-triangle-exclamation']='microphone-triangle-exclamation',['minus']=
'minus',['minus-small']='minus-small',['mirror-standing']='mirror-standing',[
'moments']='moments',['moon']='moon',['mouse-button-left']='mouse-button-left',[
'mouse-button-right']='mouse-button-right',['mouse-scrollwheel']=
'mouse-scrollwheel',['music-note']='music-note',['nebula']='nebula',['necklace']
='necklace',['nine-dots-grid']='nine-dots-grid',['ninja']='ninja',['nose']=
'nose',['page']='page',['paint-brush']='paint-brush',['paint-bucket']=
'paint-bucket',['pants']='pants',['pants-2d-text']='pants-2d-text',[
'paper-airplane']='paper-airplane',['parrot']='parrot',['pause-large']=
'pause-large',['pause-small']='pause-small',['pencil']='pencil',['pencil-square'
]='pencil-square',['person']='person',['person-arrow-from-bottom-right']=
'person-arrow-from-bottom-right',['person-check']='person-check',[
'person-circle-slash']='person-circle-slash',['person-climbing']=
'person-climbing',['person-clock']='person-clock',['person-falling']=
'person-falling',['person-graduate']='person-graduate',['person-jumping']=
'person-jumping',['person-magnifying-glass']='person-magnifying-glass',[
'person-photo-camera']='person-photo-camera',['person-play']='person-play',[
'person-play-clock']='person-play-clock',['person-plus']='person-plus',[
'person-racing']='person-racing',['person-running']='person-running',[
'person-standing']='person-standing',['person-standing-arrow-reverse']=
'person-standing-arrow-reverse',['person-standing-dual-arrows-vertical']=
'person-standing-dual-arrows-vertical',['person-standing-gear']=
'person-standing-gear',['person-swimming']='person-swimming',['person-teleport']
='person-teleport',['person-trash-can']='person-trash-can',['person-walking']=
'person-walking',['person-with-smaller-person']='person-with-smaller-person',[
'phone']='phone',['phone-down']='phone-down',['phone-plus']='phone-plus',[
'phone-volume']='phone-volume',['phone-x']='phone-x',['photo-camera']=
'photo-camera',['photo-camera-face']='photo-camera-face',['photo-camera-slash']=
'photo-camera-slash',['picture-in-picture']='picture-in-picture',['pig']='pig',[
'pin']='pin',['pin-slash']='pin-slash',['play-large']='play-large',['play-small'
]='play-small',['plus-large']='plus-large',['plus-small']='plus-small',[
'premium']='premium',['ps-circle']='ps-circle',['ps-dpad-down']='ps-dpad-down',[
'ps-dpad-left']='ps-dpad-left',['ps-dpad-right']='ps-dpad-right',['ps-dpad-up']=
'ps-dpad-up',['ps-l1']='ps-l1',['ps-l2']='ps-l2',['ps-l3']='ps-l3',['ps-r1']=
'ps-r1',['ps-r2']='ps-r2',['ps-r3']='ps-r3',['ps-square']='ps-square',[
'ps-stick-left']='ps-stick-left',['ps-stick-right']='ps-stick-right',[
'ps-triagle']='ps-triagle',['ps-x']='ps-x',['ps4-options']='ps4-options',[
'ps4-share']='ps4-share',['ps4-touchpad']='ps4-touchpad',['ps5-options']=
'ps5-options',['ps5-share']='ps5-share',['ps5-touchpad']='ps5-touchpad',[
'pumpkin']='pumpkin',['purse']='purse',['rectangle-list']='rectangle-list',[
'rectangle-numbers-counting']='rectangle-numbers-counting',[
'rectangle-person-with-three-horizontal-lines']=
'rectangle-person-with-three-horizontal-lines',['robux']='robux',[
'rosette-seven-point']='rosette-seven-point',['rosette-ten-point']=
'rosette-ten-point',['seven-point-rosette']='seven-point-rosette',[
'shield-check']='shield-check',['shield-lock']='shield-lock',['shirt']='shirt',[
'shirt-2d-text']='shirt-2d-text',['shirt-pants']='shirt-pants',['shoe-left']=
'shoe-left',['shoe-right']='shoe-right',['shopping-basket']='shopping-basket',[
'shopping-basket-check']='shopping-basket-check',['shopping-cart']=
'shopping-cart',['shorts']='shorts',['sidebar']='sidebar',['signal-exclamation']
='signal-exclamation',['six-dots-two-column-grid']='six-dots-two-column-grid',[
'skip-end-large']='skip-end-large',['skip-end-small']='skip-end-small',[
'skip-next-large']='skip-next-large',['skip-next-small']='skip-next-small',[
'skip-previous-large']='skip-previous-large',['skip-previous-small']=
'skip-previous-small',['skip-start-large']='skip-start-large',[
'skip-start-small']='skip-start-small',['smartphone-portrait']=
'smartphone-portrait',['speaker']='speaker',['speaker-slash']='speaker-slash',[
'speaker-triangle-exclamation']='speaker-triangle-exclamation',['speaker-x']=
'speaker-x',['speech-bubble-align-center']='speech-bubble-align-center',[
'speech-bubble-align-left']='speech-bubble-align-left',[
'speech-bubble-exclamation']='speech-bubble-exclamation',['speech-bubble-round']
='speech-bubble-round',['square-bone']='square-bone',['square-books']=
'square-books',['square-check']='square-check',['square-code']='square-code',[
'square-dashed-person-standing']='square-dashed-person-standing',[
'square-dual-arrows-horizontal']='square-dual-arrows-horizontal',[
'square-dual-arrows-to-corner']='square-dual-arrows-to-corner',[
'square-face-sound']='square-face-sound',['square-face-waving-hand']=
'square-face-waving-hand',['square-face-winking']='square-face-winking',[
'square-minus']='square-minus',['square-person']='square-person',[
'squares-grid-plus']='squares-grid-plus',['squares-grid-qr']='squares-grid-qr',[
'stacked-squares-arrow-down-left']='stacked-squares-arrow-down-left',[
'stacked-squares-arrow-up-right']='stacked-squares-arrow-up-right',[
'stacked-squares-plus']='stacked-squares-plus',['star']='star',['stop-large']=
'stop-large',['stop-small']='stop-small',['studio']='studio',['sun']='sun',[
'sweater']='sweater',['sword']='sword',['tag-sparkle']='tag-sparkle',['teletype'
]='teletype',['tencent-qq']='tencent-qq',['text-b-bold']='text-b-bold',[
'text-box-microphone']='text-box-microphone',['text-h-subscript-1']=
'text-h-subscript-1',['text-h-subscript-2']='text-h-subscript-2',[
'text-h-subscript-3']='text-h-subscript-3',['text-i-italic']='text-i-italic',[
'text-s-strikethrough']='text-s-strikethrough',['text-u-underline']=
'text-u-underline',['text-uppercase-a-lowercase-a']=
'text-uppercase-a-lowercase-a',['text-x-subscript-2']='text-x-subscript-2',[
'text-x-superscript-2']='text-x-superscript-2',['three-bars-horizontal']=
'three-bars-horizontal',['three-bars-horizontal-chevron-left']=
'three-bars-horizontal-chevron-left',['three-bars-horizontal-narrowing']=
'three-bars-horizontal-narrowing',['three-bars-horizontal-triangles-vertical']=
'three-bars-horizontal-triangles-vertical',[
'three-bars-vertical-triangles-horizontal']=
'three-bars-vertical-triangles-horizontal',['three-chevrons-enlarging-down']=
'three-chevrons-enlarging-down',['three-chevrons-enlarging-up']=
'three-chevrons-enlarging-up',['three-dots-horizontal']='three-dots-horizontal',
['three-dots-vertical']='three-dots-vertical',[
'three-horizontal-bars-wrapping-right']='three-horizontal-bars-wrapping-right',[
'three-people']='three-people',['three-ring-note']='three-ring-note',[
'three-sliders-horizontal']='three-sliders-horizontal',[
'three-stacked-squares-tilted']='three-stacked-squares-tilted',['thumb-down']=
'thumb-down',['thumb-up']='thumb-up',['tik-tok']='tik-tok',['tilt']='tilt',[
'torso']='torso',['trash-can']='trash-can',['triangle-exclamation']=
'triangle-exclamation',['trophy']='trophy',['tshirt']='tshirt',['tshirt-2d-text'
]='tshirt-2d-text',['tshirt-dual-arrows']='tshirt-dual-arrows',['twitch']=
'twitch',['twitter']='twitter',['two-arrows-down-and-up']=
'two-arrows-down-and-up',['two-arrows-from-center']='two-arrows-from-center',[
'two-arrows-left-right']='two-arrows-left-right',['two-arrows-loop-clockwise']=
'two-arrows-loop-clockwise',['two-arrows-loop-clockwise-1']=
'two-arrows-loop-clockwise-1',['two-arrows-loop-clockwise-infinity']=
'two-arrows-loop-clockwise-infinity',['two-arrows-spin-clockwise']=
'two-arrows-spin-clockwise',['two-arrows-spin-clockwise-plus']=
'two-arrows-spin-clockwise-plus',['two-arrows-switch-right']=
'two-arrows-switch-right',['two-arrows-to-center']='two-arrows-to-center',[
'two-folders']='two-folders',['two-location-pins-connecting-arrow']=
'two-location-pins-connecting-arrow',['two-makeup-brushes']='two-makeup-brushes'
,['two-people']='two-people',['two-people-speech-bubble']=
'two-people-speech-bubble',['two-stacked-squares']='two-stacked-squares',[
'two-switches-horizontal']='two-switches-horizontal',['verified-backplate']=
'verified-backplate',['verified-check']='verified-check',['verified-mono']=
'verified-mono',['video-camera']='video-camera',[
'video-camera-arrow-to-bottom-left']='video-camera-arrow-to-bottom-left',[
'video-camera-arrow-to-top-right']='video-camera-arrow-to-top-right',[
'video-camera-slash']='video-camera-slash',['video-camera-triangle-exclamation']
='video-camera-triangle-exclamation',['video-camera-x']='video-camera-x',[
'wallet']='wallet',['we-chat']='we-chat',['whatsapp']='whatsapp',['x']='x',[
'x-small']='x-small',['xbox-a']='xbox-a',['xbox-a-pressed']='xbox-a-pressed',[
'xbox-a-unpressed']='xbox-a-unpressed',['xbox-b']='xbox-b',['xbox-dpad']=
'xbox-dpad',['xbox-dpad-down']='xbox-dpad-down',['xbox-dpad-left']=
'xbox-dpad-left',['xbox-dpad-right']='xbox-dpad-right',['xbox-dpad-up']=
'xbox-dpad-up',['xbox-lb']='xbox-lb',['xbox-lt']='xbox-lt',['xbox-menu']=
'xbox-menu',['xbox-rb']='xbox-rb',['xbox-rt']='xbox-rt',['xbox-stick-left']=
'xbox-stick-left',['xbox-stick-left-directional']='xbox-stick-left-directional',
['xbox-stick-left-horizontal']='xbox-stick-left-horizontal',[
'xbox-stick-left-vertical']='xbox-stick-left-vertical',['xbox-stick-right']=
'xbox-stick-right',['xbox-stick-right-directional']=
'xbox-stick-right-directional',['xbox-stick-right-horizontal']=
'xbox-stick-right-horizontal',['xbox-stick-right-vertical']=
'xbox-stick-right-vertical',['xbox-view']='xbox-view',['xbox-x']='xbox-x',[
'xbox-y']='xbox-y',['xr-headset']='xr-headset',['youtube']='youtube'}end
NeverLose.IsMouseOverFrame=function(self,Frame)if not Frame then return end
local AbsPos:Vector2,AbsSize:Vector2=Frame.AbsolutePosition,Frame.AbsoluteSize
if Mouse.X>=AbsPos.X and Mouse.X<=AbsPos.X+AbsSize.X and Mouse.Y>=AbsPos.Y and
Mouse.Y<=AbsPos.Y+AbsSize.Y then return true end end NeverLose.CreateSignal=
function(self,DefaultValue)local __cache=Instance.new('BindableEvent')local bind
={Value=DefaultValue,__event=__cache}function bind:GetValue()return bind.Value
end function bind:SetValue(f)bind.Value=f return __cache:Fire(f)end function
bind:Connect(f)local signal=__cache.Event:Connect(f)NeverLose:AddSignal(signal)
return signal end return bind end NeverLose.SetIconMode=function(self,Label:
TextLabel,Icon:string)local useBold=string.lower(string.sub(Icon,-5))=='-bold'if
useBold then Label.Text=Icon:sub(1,-6)Label.FontFace=NeverLose.BuiltInBold else
Label.Text=Icon Label.FontFace=NeverLose.BuiltInRegular end end function
NeverLose:GetIconFont(icon:string)local useBold=string.lower(string.sub(icon,-5)
)=='-bold'if useBold then return NeverLose.BuiltInBold end return NeverLose.
BuiltInRegular end function NeverLose:MoreThanHalfY(Value:number)return(
NeverLose.ScreenGui.AbsoluteSize.Y/2)<Value end NeverLose.IsStudio=RunService:
IsStudio()NeverLose.IsMobile=UserInputService.TouchEnabled NeverLose.CreateInput
=function(self,Frame,Callback)local Button=Instance.new('ImageButton',Frame)
Button.ZIndex=Frame.ZIndex+10 Button.Size=UDim2.fromScale(1,1)Button.
BackgroundTransparency=1 Button.ImageTransparency=1 Button.Image=
'rbxasset://textuers/translateIcon.png'if Callback then local bth_signal=Button.
MouseButton1Click:Connect(Callback)return Button,bth_signal end return Button
end NeverLose.PlayAnimate=function(Self,Info,Property)local Tween=TweenService:
Create(Self,Info or TweenInfo.new(0.25),Property)Tween:Play()return Tween end
NeverLose.Drag=function(InputFrame:Frame,MoveFrame:Frame,Speed:number)local
dragToggle:boolean=false local dragStart:Vector3=nil local startPos:UDim2=nil
local Tween=TweenInfo.new(Speed)local updateInput=function(input)local delta=
input.Position-dragStart local position=UDim2.new(startPos.X.Scale,startPos.X.
Offset+delta.X,startPos.Y.Scale,startPos.Y.Offset+delta.Y)NeverLose.PlayAnimate(
MoveFrame,Tween,{Position=position})end NeverLose:AddSignal(InputFrame.
InputBegan:Connect(function(input)if input.UserInputType==Enum.UserInputType.
MouseButton1 or input.UserInputType==Enum.UserInputType.Touch then dragToggle=
true dragStart=input.Position startPos=MoveFrame.Position local input_end
input_end=input.Changed:Connect(function()if input.UserInputState==Enum.
UserInputState.End then dragToggle=false input_end:Disconnect()end end)end end))
NeverLose:AddSignal(UserInputService.InputChanged:Connect(function(input)if
input.UserInputType==Enum.UserInputType.MouseMovement or input.UserInputType==
Enum.UserInputType.Touch then if dragToggle then updateInput(input)end end end))
end NeverLose.Rounding=function(num,numDecimalPlaces)local mult=10^(
numDecimalPlaces or 0)return math.floor(num*mult+0.5)/mult end NeverLose.
ProcessParams=function(self,Params,Fixed)Params=Params or{}local k=Params or{}
for i,v in next,Fixed do k[i]=Params[i]or v end table.clear(Fixed)return k end
NeverLose.EnabledBlur=true NeverLose.BlurModuleParent=workspace.CurrentCamera
NeverLose.GetCalculatePosition=function(planePos,planeNormal,rayOrigin,
rayDirection)local n=planeNormal local d=rayDirection local v=rayOrigin-planePos
local num=(n.x*v.x)+(n.y*v.y)+(n.z*v.z)local den=(n.x*d.x)+(n.y*d.y)+(n.z*d.z)
local a=-num/den return rayOrigin+(a*rayDirection)end NeverLose.CreateBlurModule
=function(self,Frame,Signal)if not NeverLose.EnabledBlur then return NeverLose:
AddSignal(Instance.new('BindableEvent').Event:Connect(function()return'nl'end))
end local Part=Instance.new('Part',NeverLose.BlurModuleParent)local DepthOfField
=Instance.new('DepthOfFieldEffect',cloneref(game:GetService('Lighting')))
DepthOfField:SetAttribute('MoonInterfacePostEffect',true)local BlockMesh=
Instance.new('BlockMesh')BlockMesh.Parent=Part Part.Material=Enum.Material.Glass
Part.Transparency=1 Part.Reflectance=1 Part.CastShadow=false Part.Anchored=true
Part.CanCollide=false Part.CanQuery=false Part.CollisionGroup=NeverLose.
RandomString()Part.Size=Vector3.new(1,1,1)*0.01 Part.Color=Color3.fromRGB(0,0,0)
DepthOfField.Enabled=true DepthOfField.FarIntensity=0 DepthOfField.FocusDistance
=0 DepthOfField.InFocusRadius=1000 DepthOfField.NearIntensity=1 DepthOfField.
Name=NeverLose.RandomString()Part.Name=NeverLose.RandomString()local disconnect
local UpdateFunction=function()local IsWindowActive=Signal:GetValue()if
IsWindowActive then NeverLose.PlayAnimate(DepthOfField,TweenInfo.new(0.1),{
NearIntensity=1})NeverLose.PlayAnimate(Part,TweenInfo.new(0.1),{Transparency=
0.97,Size=Vector3.new(1,1,1)*0.01})Part.Parent=NeverLose.BlurModuleParent else
NeverLose.PlayAnimate(DepthOfField,TweenInfo.new(0.1),{NearIntensity=0})
NeverLose.PlayAnimate(Part,TweenInfo.new(0.1),{Size=Vector3.zero,Transparency=
1.5})Part.Parent=nil return false end if IsWindowActive then local corner0=Frame
.AbsolutePosition local corner1=corner0+Frame.AbsoluteSize local ray0=
CurrentCamera.ScreenPointToRay(CurrentCamera,corner0.X,corner0.Y,1)local ray1=
CurrentCamera.ScreenPointToRay(CurrentCamera,corner1.X,corner1.Y,1)local
planeOrigin=CurrentCamera.CFrame.Position+CurrentCamera.CFrame.LookVector*(0.05-
CurrentCamera.NearPlaneZ)local planeNormal=CurrentCamera.CFrame.LookVector local
pos0=NeverLose.GetCalculatePosition(planeOrigin,planeNormal,ray0.Origin,ray0.
Direction)local pos1=NeverLose.GetCalculatePosition(planeOrigin,planeNormal,ray1
.Origin,ray1.Direction)pos0=CurrentCamera.CFrame:PointToObjectSpace(pos0)pos1=
CurrentCamera.CFrame:PointToObjectSpace(pos1)local size=pos1-pos0 local center=(
pos0+pos1)/2 BlockMesh.Offset=center BlockMesh.Scale=size/0.0101 Part.CFrame=
CurrentCamera.CFrame end end local rbxsignal=NeverLose:AddSignal(CurrentCamera:
GetPropertyChangedSignal('CFrame'):Connect(UpdateFunction))local loopThread=
NeverLose:AddSignal(UserInputService.InputChanged:Connect(function(Input)if
Input.UserInputType==Enum.UserInputType.MouseButton1 or Input.UserInputType==
Enum.UserInputType.MouseMovement or Input.UserInputType==Enum.UserInputType.
Touch then pcall(UpdateFunction)end end))local THREAD=task.spawn(function()while
true do task.wait(0.1)pcall(UpdateFunction)end end)disconnect=function()
rbxsignal:Disconnect()loopThread:Disconnect()task.cancel(THREAD)Part:Destroy()
DepthOfField:Destroy()end Frame.Destroying:Connect(disconnect)return rbxsignal
end local EmptyFunction=function()end function NeverLose:RollingEffect(parent)
local UIGradient=Instance.new('UIGradient')UIGradient.Transparency=
NumberSequence.new({NumberSequenceKeypoint.new(0,0.4),NumberSequenceKeypoint.
new(1,0)})UIGradient.Parent=parent return UIGradient end function NeverLose:
CreateShadow(parent,RollingEffect)local Shadow={}local UIShadowSafe85=Instance.
new('UIStroke')local UIShadowSafe65=Instance.new('UIStroke')local UIShadowSafe50
=Instance.new('UIStroke')local UIShadowSafe45=Instance.new('UIStroke')
UIShadowSafe85.Thickness=6 UIShadowSafe85.Transparency=1 UIShadowSafe85.Parent=
parent UIShadowSafe65.Thickness=5 UIShadowSafe65.Transparency=1 UIShadowSafe65.
Parent=parent UIShadowSafe50.Thickness=4 UIShadowSafe50.Transparency=1
UIShadowSafe50.Parent=parent UIShadowSafe45.Thickness=3 UIShadowSafe45.
Transparency=1 UIShadowSafe45.Parent=parent local RollingEffectThread local r1,
r2,r3,r4 if RollingEffect then r1=NeverLose:RollingEffect(UIShadowSafe85)r2=
NeverLose:RollingEffect(UIShadowSafe65)r3=NeverLose:RollingEffect(UIShadowSafe50
)r4=NeverLose:RollingEffect(UIShadowSafe45)end Shadow.Render=function(self,value
)if RollingEffectThread then task.cancel(RollingEffectThread)RollingEffectThread
=nil end if value then NeverLose.PlayAnimate(UIShadowSafe85,SlowyTween,{
Transparency=0.9})NeverLose.PlayAnimate(UIShadowSafe65,SlowyTween,{Transparency=
0.9})NeverLose.PlayAnimate(UIShadowSafe50,SlowyTween,{Transparency=0.9})
NeverLose.PlayAnimate(UIShadowSafe45,SlowyTween,{Transparency=0.9})if
RollingEffect then RollingEffectThread=task.spawn(function()local level=20 while
true do task.wait(0.025)NeverLose.PlayAnimate(r1,SlowyTween,{Rotation=r1.
Rotation+level})NeverLose.PlayAnimate(r2,SlowyTween,{Rotation=r2.Rotation+level}
)NeverLose.PlayAnimate(r3,SlowyTween,{Rotation=r3.Rotation+level})NeverLose.
PlayAnimate(r4,SlowyTween,{Rotation=r4.Rotation+level})end end)end else
NeverLose.PlayAnimate(UIShadowSafe85,SlowyTween,{Transparency=1})NeverLose.
PlayAnimate(UIShadowSafe65,SlowyTween,{Transparency=1})NeverLose.PlayAnimate(
UIShadowSafe50,SlowyTween,{Transparency=1})NeverLose.PlayAnimate(UIShadowSafe45,
SlowyTween,{Transparency=1})end end return Shadow end function NeverLose:
CreateOptionWindow(Frame:Frame,Zindex,Bounds)Zindex=Zindex or 9 local Window={
Signal=NeverLose:CreateSignal(false)}local OptionHandler=Instance.new('Frame')
local UICorner=Instance.new('UICorner')local UIListLayout=Instance.new(
'UIListLayout')local UIStroke=Instance.new('UIStroke')local shadow=NeverLose:
CreateShadow(OptionHandler)OptionHandler.Name=NeverLose.RandomString()
OptionHandler.Parent=NeverLose.ScreenGui OptionHandler.AnchorPoint=Vector2.new(0
,0)OptionHandler.BackgroundColor3=Color3.fromRGB(20,22,27)OptionHandler.
BackgroundTransparency=0.035 OptionHandler.BorderColor3=Color3.fromRGB(0,0,0)
OptionHandler.BorderSizePixel=0 OptionHandler.ClipsDescendants=true
OptionHandler.Position=UDim2.new(255,255,255,255)OptionHandler.Size=UDim2.new(0,
220,0,75)OptionHandler.ZIndex=Zindex+9 local inputShield=Instance.new(
'TextButton')inputShield.Name='OptionInputShield'inputShield.
BackgroundTransparency=1 inputShield.Text=''inputShield.AutoButtonColor=false
inputShield.Active=true inputShield.Visible=false inputShield.ZIndex=
OptionHandler.ZIndex+1 inputShield.Parent=NeverLose.ScreenGui local function 
syncInputShield()inputShield.AnchorPoint=OptionHandler.AnchorPoint inputShield.
Position=OptionHandler.Position inputShield.Size=OptionHandler.Size end
NeverLose:AddSignal(OptionHandler:GetPropertyChangedSignal('Size'):Connect(
syncInputShield))NeverLose:AddSignal(OptionHandler:GetPropertyChangedSignal(
'Position'):Connect(syncInputShield))NeverLose:AddSignal(OptionHandler:
GetPropertyChangedSignal('AnchorPoint'):Connect(syncInputShield))UICorner.
CornerRadius=UDim.new(0,10)UICorner.Parent=OptionHandler UIListLayout.Parent=
OptionHandler UIListLayout.HorizontalAlignment=Enum.HorizontalAlignment.Center
UIListLayout.SortOrder=Enum.SortOrder.LayoutOrder UIStroke.Transparency=0.65
UIStroke.Color=Color3.fromRGB(45,48,58)UIStroke.Parent=OptionHandler NeverLose:
AddSignal(UIListLayout:GetPropertyChangedSignal('AbsoluteContentSize'):Connect(
function()NeverLose.PlayAnimate(OptionHandler,SlowyTween,{Size=UDim2.new(0,220,0
,UIListLayout.AbsoluteContentSize.Y-1)})end))NeverLose:AddSignal(OptionHandler:
GetPropertyChangedSignal('BackgroundTransparency'):Connect(function()if
OptionHandler.BackgroundTransparency>0.9 then OptionHandler.Visible=false
UIListLayout.Parent=nil OptionHandler.Parent=nil else OptionHandler.Visible=true
UIListLayout.Parent=OptionHandler OptionHandler.Parent=NeverLose.ScreenGui end
end))local FollowingThread local SetPosition=function()if Bounds then local
minimum=Bounds.AbsolutePosition+Vector2.new(6,6)local maximum=Bounds.
AbsolutePosition+Bounds.AbsoluteSize-OptionHandler.AbsoluteSize-Vector2.new(6,6)
OptionHandler.AnchorPoint=Vector2.zero OptionHandler.Position=UDim2.fromOffset(
math.clamp(Frame.AbsolutePosition.X+Frame.AbsoluteSize.X-220,minimum.X,math.max(
minimum.X,maximum.X)),math.clamp(Frame.AbsolutePosition.Y+Frame.AbsoluteSize.Y+6
,minimum.Y,math.max(minimum.Y,maximum.Y)))return end if NeverLose:MoreThanHalfY(
Frame.AbsolutePosition.Y+65)then OptionHandler.AnchorPoint=Vector2.new(0,1)else
OptionHandler.AnchorPoint=Vector2.new(0,0)end OptionHandler.Position=UDim2.
fromOffset(Frame.AbsolutePosition.X+18,Frame.AbsolutePosition.Y+65)end Window.
SetRender=function(value)inputShield.Visible=value if FollowingThread then task.
cancel(FollowingThread)FollowingThread=nil end if value then SetPosition()
syncInputShield()NeverLose.PlayAnimate(OptionHandler,SlowyTween,{
BackgroundTransparency=0.035})NeverLose.PlayAnimate(UIStroke,SlowyTween,{
Transparency=0.65})shadow:Render(true)OptionHandler.Parent=NeverLose.ScreenGui
FollowingThread=task.spawn(function()while true do task.wait()SetPosition()end
end)else NeverLose.PlayAnimate(OptionHandler,SlowyTween,{BackgroundTransparency=
1})NeverLose.PlayAnimate(UIStroke,SlowyTween,{Transparency=1})shadow:Render(
false)end end Window.SetRender(false)Window.Signal:Connect(Window.SetRender)
local Payback=NeverLose:RegisiterItem(OptionHandler,Window.Signal)Payback.
Winbdow=Window Payback.Root=OptionHandler Payback.Signal=Window.Signal Runtime.
Track(function()Window.Signal:SetValue(false)inputShield:Destroy()OptionHandler:
Destroy()Window.Signal.__event:Destroy()end)return Payback end NeverLose.
ColorCodec=(function()local codec={Formats={'HEX','RGB','HSV'}}local function 
byte(value)return math.clamp(math.floor(value*255+0.5),0,255)end local function 
number(text,maximum)local cleaned=tostring(text):gsub('%%','')local value=
tonumber(cleaned)if not value or value~=value or math.abs(value)==math.huge then
return nil end return math.clamp(value,0,maximum)end function codec.Format(color
,opacity,mode,alpha)if mode=='HEX'then local hex='#'..string.upper(color:ToHex()
)if alpha then return{hex..string.format('%02X',byte(opacity)),tostring(math.
floor(opacity*100+0.5))..'%'}end return{hex}end local values if mode=='HSV'then
local h,s,v=color:ToHSV()values={byte(h),byte(s),byte(v)}else values={byte(color
.R),byte(color.G),byte(color.B)}end if alpha then values[4]=byte(opacity)end for
index=1,#values do values[index]=tostring(values[index])end return values end
function codec.Parse(mode,fields,alpha,opacity,changed)if mode=='HEX'then local
text=tostring(fields[1]or''):gsub('^#','')if(#text~=6 and#text~=8)or not text:
match('^%x+$')then return nil end local ok,color=pcall(Color3.fromHex,text:sub(1
,6))if not ok then return nil end if alpha and changed==2 then local percent=
number(fields[2],100)if not percent then return nil end opacity=percent/100
elseif alpha and#text==8 then opacity=tonumber(text:sub(7,8),16)/255 end return
color,opacity end if mode~='RGB'and mode~='HSV'then return nil end local values=
{}for index=1,alpha and 4 or 3 do local value=number(fields[index],255)if not
value then return nil end values[index]=value/255 end local color=mode=='HSV'and
Color3.fromHSV(values[1],values[2],values[3])or Color3.new(values[1],values[2],
values[3])return color,alpha and values[4]or opacity,mode=='HSV'and values or
nil end return codec end)()function NeverLose:CreateColorPicker(HandleFrame:
Frame,Config)Config=Config or{}local ZIndex=HandleFrame.ZIndex local
hasNamedColors=type(Config.NamedColors)=='table'and#Config.NamedColors>0 local
namedColorsOffset=hasNamedColors and 30 or 0 local ColorPickerLib={Format='HEX',
Signal=NeverLose:CreateSignal(false),Visible=false}ColorPickerLib.Signal.Picker=
ColorPickerLib ColorPickerLib.Popups={}Runtime.Track(ColorPickerLib.Signal.
__event)local namedColorButtons={}local namedColorEntries={}local
ColorPickerHandler=Instance.new('Frame')Runtime.Track(ColorPickerHandler)local
UICorner=Instance.new('UICorner')local UIStroke=Instance.new('UIStroke')local
SaViMap=Instance.new('Frame')local UICorner_2=Instance.new('UICorner')local
SaturationOverlay=Instance.new('Frame')local SaturationGradient=Instance.new(
'UIGradient')local ValueOverlay=Instance.new('Frame')local ValueGradient=
Instance.new('UIGradient')local ColorZoneSelection=Instance.new('Frame')local
UICorner_3=Instance.new('UICorner')local UIStroke_2=Instance.new('UIStroke')
local ColorMap=Instance.new('Frame')local UIGradient=Instance.new('UIGradient')
local UICorner_4=Instance.new('UICorner')local ColorMapSelection=Instance.new(
'Frame')local UIStroke_3=Instance.new('UIStroke')local UICorner_5=Instance.new(
'UICorner')local AlphaMap=Instance.new('Frame')local UICorner_Alpha=Instance.
new('UICorner')local AlphaGradient=Instance.new('UIGradient')local
AlphaMapSelection=Instance.new('Frame')local UIStroke_Alpha=Instance.new(
'UIStroke')local formatRow=Instance.new('Frame')local formatButton=Instance.new(
'TextButton')local formatMenu=Instance.new('Frame')local fieldsRoot=Instance.
new('Frame')local fields={}local Shadow=NeverLose:CreateShadow(
ColorPickerHandler)ColorPickerHandler.Name=NeverLose.RandomString()
ColorPickerHandler.Parent=NeverLose.ScreenGui ColorPickerHandler.AnchorPoint=
Vector2.new(0,0)ColorPickerHandler.BackgroundColor3=Color3.fromRGB(20,22,27)
ColorPickerHandler.BackgroundTransparency=0.035 ColorPickerHandler.BorderColor3=
Color3.fromRGB(0,0,0)ColorPickerHandler.BorderSizePixel=0 ColorPickerHandler.
Active=true ColorPickerHandler.ClipsDescendants=true ColorPickerHandler.Position
=UDim2.new(255,0,255,20)ColorPickerHandler.Size=UDim2.new(0,220,0,(Config.
TransparencyEnabled and 292 or 272)+namedColorsOffset)ColorPickerHandler.ZIndex=
ZIndex+125 NeverLose:AddSignal(ColorPickerHandler:GetPropertyChangedSignal(
'BackgroundTransparency'):Connect(function()if ColorPickerHandler.
BackgroundTransparency>0.9 then ColorPickerHandler.Visible=false
ColorPickerHandler.Parent=nil else ColorPickerHandler.Visible=true
ColorPickerHandler.Parent=NeverLose.ScreenGui end end))UICorner.CornerRadius=
UDim.new(0,10)UICorner.Parent=ColorPickerHandler UIStroke.Transparency=0.65
UIStroke.Color=Color3.fromRGB(45,48,58)UIStroke.Parent=ColorPickerHandler if
hasNamedColors then local namedColorHeader=Instance.new('Frame')namedColorHeader
.Name='NamedColorHeader'namedColorHeader.BackgroundTransparency=1
namedColorHeader.BorderSizePixel=0 namedColorHeader.Position=UDim2.fromOffset(8,
5)namedColorHeader.Size=UDim2.new(1,-16,0,22)namedColorHeader.ZIndex=ZIndex+126
namedColorHeader.Parent=ColorPickerHandler local namedColorLayout=Instance.new(
'UIListLayout')namedColorLayout.FillDirection=Enum.FillDirection.Horizontal
namedColorLayout.HorizontalAlignment=Enum.HorizontalAlignment.Left
namedColorLayout.VerticalAlignment=Enum.VerticalAlignment.Center
namedColorLayout.Padding=UDim.new(0,4)namedColorLayout.Parent=namedColorHeader
for index=1,#Config.NamedColors do local namedColorButton=Instance.new(
'TextButton')namedColorButton.Name='NamedColor'..tostring(index)namedColorButton
.BackgroundColor3=Color3.fromRGB(31,34,42)namedColorButton.
BackgroundTransparency=1 namedColorButton.BorderSizePixel=0 namedColorButton.
Size=UDim2.fromOffset(24,22)namedColorButton.Text=''namedColorButton.
AutoButtonColor=false namedColorButton.Active=true namedColorButton.Selectable=
true namedColorButton.ZIndex=ZIndex+127 namedColorButton.Parent=namedColorHeader
local namedColorCorner=Instance.new('UICorner')namedColorCorner.CornerRadius=
UDim.new(0,5)namedColorCorner.Parent=namedColorButton local namedColorStroke=
Instance.new('UIStroke')namedColorStroke.Color=Color3.fromRGB(105,115,132)
namedColorStroke.Transparency=1 namedColorStroke.Thickness=1 namedColorStroke.
Parent=namedColorButton local swatch=Instance.new('Frame')swatch.Name='Swatch'
swatch.BackgroundColor3=Color3.new(1,1,1)swatch.BorderSizePixel=0 swatch.
Position=UDim2.fromOffset(4,4)swatch.Size=UDim2.fromOffset(14,14)swatch.ZIndex=
ZIndex+128 swatch.Parent=namedColorButton local swatchCorner=Instance.new(
'UICorner')swatchCorner.CornerRadius=UDim.new(0,3)swatchCorner.Parent=swatch
local title=Instance.new('TextLabel')title.Name='Title'title.
BackgroundTransparency=1 title.BorderSizePixel=0 title.Position=UDim2.
fromOffset(22,0)title.Size=UDim2.new(1,-25,1,0)title.Font=Enum.Font.GothamMedium
title.Text=''title.TextColor3=Color3.fromRGB(230,233,239)title.TextSize=10 title
.TextXAlignment=Enum.TextXAlignment.Left title.TextTruncate=Enum.TextTruncate.
AtEnd title.Visible=false title.ZIndex=ZIndex+128 title.Parent=namedColorButton
namedColorButtons[index]={Button=namedColorButton,Stroke=namedColorStroke,Swatch
=swatch,Title=title}namedColorButton.Activated:Connect(function()local entry=
namedColorEntries[index]if entry and type(Config.NamedColorSelected)=='function'
then Config.NamedColorSelected(entry.Id)end end)end end local function 
refreshNamedColorHeader(entries,activeId)if not hasNamedColors then return end
table.clear(namedColorEntries)for index=1,math.min(#entries,#namedColorButtons)
do local entry=entries[index]namedColorEntries[index]=entry local button=
namedColorButtons[index]local selected=entry.Id==activeId button.Button.Size=
UDim2.fromOffset(selected and 132 or 22,22)button.Button.BackgroundTransparency=
selected and 0 or 1 button.Stroke.Transparency=selected and 0.45 or 1 button.
Swatch.BackgroundColor3=typeof(entry.Color)=='Color3'and entry.Color or Color3.
new(1,1,1)button.Title.Text=tostring(entry.Name or entry.Id or'')button.Title.
Visible=selected end for index=#entries+1,#namedColorButtons do
namedColorButtons[index].Button.Visible=false end end SaViMap.Name=NeverLose.
RandomString()SaViMap.Parent=ColorPickerHandler SaViMap.AnchorPoint=Vector2.new(
0.5,0)SaViMap.BackgroundColor3=Color3.fromRGB(255,0,4)SaViMap.BorderColor3=
Color3.fromRGB(0,0,0)SaViMap.BorderSizePixel=0 SaViMap.Position=UDim2.new(0.5,0,
0,5+namedColorsOffset)SaViMap.Size=UDim2.fromOffset(120,120)SaViMap.ZIndex=
ZIndex+126 SaViMap.ClipsDescendants=true UICorner_2.CornerRadius=UDim.new(0,5)
UICorner_2.Parent=SaViMap SaturationOverlay.Parent=SaViMap SaturationOverlay.
BackgroundColor3=Color3.new(1,1,1)SaturationOverlay.BorderSizePixel=0
SaturationOverlay.Size=UDim2.fromScale(1,1)SaturationOverlay.ZIndex=ZIndex+127
SaturationGradient.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0
,0),NumberSequenceKeypoint.new(1,1)})SaturationGradient.Rotation=0
SaturationGradient.Parent=SaturationOverlay ValueOverlay.Parent=SaViMap
ValueOverlay.BackgroundColor3=Color3.new(0,0,0)ValueOverlay.BorderSizePixel=0
ValueOverlay.Size=UDim2.fromScale(1,1)ValueOverlay.ZIndex=ZIndex+128
ValueGradient.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(1,0)})ValueGradient.Rotation=90 ValueGradient.Parent=
ValueOverlay ColorZoneSelection.Name=NeverLose.RandomString()ColorZoneSelection.
Parent=SaViMap ColorZoneSelection.AnchorPoint=Vector2.new(0.5,0.5)
ColorZoneSelection.BackgroundColor3=Color3.fromRGB(255,255,255)
ColorZoneSelection.BackgroundTransparency=1 ColorZoneSelection.BorderColor3=
Color3.fromRGB(0,0,0)ColorZoneSelection.BorderSizePixel=0 ColorZoneSelection.
Position=UDim2.new(0.5,0,0.5,0)ColorZoneSelection.Size=UDim2.new(0,10,0,10)
ColorZoneSelection.ZIndex=ZIndex+129 UICorner_3.CornerRadius=UDim.new(1,0)
UICorner_3.Parent=ColorZoneSelection UIStroke_2.Color=Color3.fromRGB(255,255,255
)UIStroke_2.Parent=ColorZoneSelection ColorMap.Name=NeverLose.RandomString()
ColorMap.Parent=ColorPickerHandler ColorMap.AnchorPoint=Vector2.new(0.5,0)
ColorMap.BackgroundColor3=Color3.fromRGB(255,255,255)ColorMap.BorderColor3=
Color3.fromRGB(0,0,0)ColorMap.BorderSizePixel=0 ColorMap.Position=UDim2.new(0.5,
0,0,200+namedColorsOffset)ColorMap.Size=UDim2.new(1,-15,0,10)ColorMap.ZIndex=
ZIndex+126 UIGradient.Color=ColorSequence.new({ColorSequenceKeypoint.new(0,
Color3.fromRGB(255,0,0)),ColorSequenceKeypoint.new(0.1,Color3.fromRGB(255,153,0)
),ColorSequenceKeypoint.new(0.2,Color3.fromRGB(203,255,0)),ColorSequenceKeypoint
.new(0.3,Color3.fromRGB(50,255,0)),ColorSequenceKeypoint.new(0.4,Color3.fromRGB(
0,255,102)),ColorSequenceKeypoint.new(0.5,Color3.fromRGB(0,255,255)),
ColorSequenceKeypoint.new(0.6,Color3.fromRGB(0,101,255)),ColorSequenceKeypoint.
new(0.7,Color3.fromRGB(50,0,255)),ColorSequenceKeypoint.new(0.8,Color3.fromRGB(
204,0,255)),ColorSequenceKeypoint.new(0.9,Color3.fromRGB(255,0,153)),
ColorSequenceKeypoint.new(1,Color3.fromRGB(255,0,0))})UIGradient.Parent=ColorMap
UICorner_4.CornerRadius=UDim.new(0,3)UICorner_4.Parent=ColorMap
ColorMapSelection.Name=NeverLose.RandomString()ColorMapSelection.Parent=ColorMap
ColorMapSelection.AnchorPoint=Vector2.new(0.5,0.5)ColorMapSelection.
BackgroundColor3=Color3.fromRGB(255,255,255)ColorMapSelection.
BackgroundTransparency=1 ColorMapSelection.BorderColor3=Color3.fromRGB(0,0,0)
ColorMapSelection.BorderSizePixel=0 ColorMapSelection.Position=UDim2.new(0,0,0.5
,0)ColorMapSelection.Size=UDim2.new(0,5,1,0)ColorMapSelection.ZIndex=ZIndex+126
UIStroke_3.Thickness=2 UIStroke_3.Color=Color3.fromRGB(255,255,255)UIStroke_3.
Parent=ColorMapSelection UICorner_5.CornerRadius=UDim.new(0,3)UICorner_5.Parent=
ColorMapSelection AlphaMap.Name=NeverLose.RandomString()AlphaMap.Parent=
ColorPickerHandler AlphaMap.AnchorPoint=Vector2.new(0.5,0)AlphaMap.
BackgroundColor3=Color3.fromRGB(255,0,4)AlphaMap.BorderSizePixel=0 AlphaMap.
Position=UDim2.new(0.5,0,0,218+namedColorsOffset)AlphaMap.Size=UDim2.new(1,-15,0
,10)AlphaMap.Visible=Config.TransparencyEnabled==true AlphaMap.ZIndex=ZIndex+126
AlphaGradient.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(1,0)})AlphaGradient.Parent=AlphaMap UICorner_Alpha.
CornerRadius=UDim.new(0,3)UICorner_Alpha.Parent=AlphaMap AlphaMapSelection.Name=
NeverLose.RandomString()AlphaMapSelection.Parent=AlphaMap AlphaMapSelection.
AnchorPoint=Vector2.new(0.5,0.5)AlphaMapSelection.BackgroundTransparency=1
AlphaMapSelection.BorderSizePixel=0 AlphaMapSelection.Position=UDim2.new(0,0,0.5
,0)AlphaMapSelection.Size=UDim2.new(0,5,1,0)AlphaMapSelection.ZIndex=ZIndex+127
UIStroke_Alpha.Thickness=2 UIStroke_Alpha.Color=Color3.new(1,1,1)UIStroke_Alpha.
Parent=AlphaMapSelection formatRow.Name,formatRow.Parent='ColorFormatRow',
ColorPickerHandler formatRow.BackgroundTransparency,formatRow.Size=1,UDim2.new(1
,-20,0,24)formatRow.ZIndex=ZIndex+130 formatButton.Name,formatButton.Parent=
'ColorFormat',formatRow formatButton.Size,formatButton.BackgroundTransparency=
UDim2.fromOffset(55,24),1 formatButton.BorderSizePixel,formatButton.
AutoButtonColor=0,false formatButton.Font,formatButton.TextSize=Enum.Font.
GothamMedium,11 formatButton.TextColor3,formatButton.Text=Color3.fromRGB(223,223
,223),'HEX \u{25be}'formatButton.ZIndex=ZIndex+131 fieldsRoot.Parent,fieldsRoot.
BackgroundTransparency=formatRow,1 fieldsRoot.Position,fieldsRoot.Size=UDim2.
fromOffset(60,0),UDim2.new(1,-60,1,0)fieldsRoot.ZIndex=ZIndex+130 formatMenu.
Name,formatMenu.Parent='ColorFormatMenu',ColorPickerHandler formatMenu.Size,
formatMenu.BackgroundColor3=UDim2.fromOffset(78,76),Color3.fromRGB(26,28,36)
formatMenu.BorderSizePixel,formatMenu.Visible,formatMenu.ZIndex=0,false,ZIndex+
160 formatMenu.Active=true local menuCorner=Instance.new('UICorner')menuCorner.
CornerRadius,menuCorner.Parent=UDim.new(0,6),formatMenu for index,mode in
ipairs(NeverLose.ColorCodec.Formats)do local button=Instance.new('TextButton')
button.Name,button.Parent=mode,formatMenu button.Size,button.Position=UDim2.new(
1,-6,0,23),UDim2.fromOffset(3,3+(index-1)*23)button.BackgroundTransparency,
button.BorderSizePixel=1,0 button.Font,button.TextSize,button.Text=Enum.Font.
GothamMedium,11,mode button.TextColor3,button.ZIndex=Color3.fromRGB(223,223,223)
,ZIndex+161 NeverLose:AddSignal(button.Activated:Connect(function()
ColorPickerLib:SetFormat(mode)end))end for index=1,4 do local field=Instance.
new('TextBox')field.Name,field.Parent='Channel'..index,fieldsRoot field.
BackgroundColor3,field.BackgroundTransparency=Color3.fromRGB(39,40,49),0.3 field
.BorderSizePixel,field.ClearTextOnFocus,field.MultiLine=0,false,false field.Font
,field.TextSize=Enum.Font.GothamMedium,11 field.TextColor3,field.Text,field.
ZIndex=Color3.fromRGB(223,223,223),'',ZIndex+131 local corner=Instance.new(
'UICorner')corner.CornerRadius,corner.Parent=UDim.new(0,5),field fields[index]=
field NeverLose:AddSignal(field.FocusLost:Connect(function()ColorPickerLib:
CommitFields(index)end))end NeverLose:AddSignal(formatButton.Activated:Connect(
function()formatMenu.Visible=not formatMenu.Visible end))ColorPickerLib.Fields,
ColorPickerLib.FormatButton=fields,formatButton function ColorPickerLib:
RefreshFields(force)if not self.H then return end local values=NeverLose.
ColorCodec.Format(Color3.fromHSV(self.H,self.S,self.V),self.Opacity,self.Format,
Config.TransparencyEnabled==true)if self.Format=='HSV'then values[1],values[2],
values[3]=tostring(math.floor(self.H*255+0.5)),tostring(math.floor(self.S*255+
0.5)),tostring(math.floor(self.V*255+0.5))end local count=#values for index=1,4
do local field=fields[index]field.Visible=index<=count if field.Visible then if
force or not field:IsFocused()then field.Text=values[index]end if self.Format==
'HEX'then field.Position=index==1 and UDim2.fromOffset(0,0)or UDim2.new(1,-47,0,
0)field.Size=index==1 and UDim2.new(1,count==2 and-51 or 0,1,0)or UDim2.
fromOffset(47,24)else field.Position,field.Size=UDim2.new((index-1)/count,0,0,0)
,UDim2.new(1/count,-3,1,0)end end end formatButton.Text=self.Format..' \u{25be}'
end function ColorPickerLib:SetFormat(mode)if not table.find(NeverLose.
ColorCodec.Formats,mode)then return false end self.Format,formatMenu.Visible=
mode,false self:RefreshFields(true)return true end function ColorPickerLib:
CommitFields(changed)local text={}for index,field in ipairs(fields)do text[index
]=field.Text end local color,opacity,hsv=NeverLose.ColorCodec.Parse(self.Format,
text,Config.TransparencyEnabled==true,self.Opacity,changed)if not color then
self:RefreshFields(true)return false end if hsv then self.H,self.S,self.V=hsv[1]
,hsv[2],hsv[3]self:Update()else self:SetValue(color)end if Config.
TransparencyEnabled and opacity~=self.Opacity then self:SetOpacity(opacity)end
self:RefreshFields(true)return true end function ColorPickerLib:Layout()local
camera=workspace.CurrentCamera local bounds=self.Bounds or(self.ParentPicker and
self.ParentPicker.Bounds)local available=bounds and bounds.AbsoluteSize or(
camera and camera.ViewportSize)or Vector2.new(800,600)local width=math.clamp(
available.X-12,180,220)local chrome=(Config.TransparencyEnabled and 92 or 72)+
namedColorsOffset local mapHeight=120 local base=mapHeight+chrome SaViMap.Size,
SaViMap.Position=UDim2.fromOffset(mapHeight,mapHeight),UDim2.new(0.5,0,0,10+
namedColorsOffset)ColorMap.Position=UDim2.new(0.5,0,0,mapHeight+20+
namedColorsOffset)AlphaMap.Position=UDim2.new(0.5,0,0,mapHeight+38+
namedColorsOffset)local inputY=mapHeight+(Config.TransparencyEnabled and 58 or
38)+namedColorsOffset formatRow.Position,formatMenu.Position=UDim2.fromOffset(10
,inputY),UDim2.fromOffset(10,inputY-80)local extra=0 if self.Option then local
content=self.Option.Layout.AbsoluteContentSize.Y extra=math.min(content,math.
max(36,math.min(180,available.Y-base-20)))self.Option.Root.Visible,self.Option.
Divider.Visible=extra>0,extra>0 self.Option.Root.Position,self.Option.Root.Size=
UDim2.fromOffset(5,base+4),UDim2.new(1,-10,0,extra)self.Option.Root.CanvasSize=
UDim2.fromOffset(0,content)self.Option.Divider.Position=UDim2.fromOffset(10,base
-2)if extra>0 then extra+=8 end end ColorPickerHandler.Size=UDim2.fromOffset(
width,base+extra)end function ColorPickerLib:CreateOption()if self.Option then
return self.Option end local footer=Instance.new('ScrollingFrame')footer.Name,
footer.Parent='ColorPickerOptions',ColorPickerHandler footer.
BackgroundTransparency,footer.BorderSizePixel,footer.ScrollBarThickness=1,0,2
footer.Active=true footer.ZIndex=ZIndex+125 local layout=Instance.new(
'UIListLayout')layout.SortOrder,layout.Parent=Enum.SortOrder.LayoutOrder,footer
local divider=Instance.new('Frame')divider.Name,divider.Parent='OptionsDivider',
ColorPickerHandler divider.Size,divider.BorderSizePixel=UDim2.new(1,-20,0,1),0
divider.BackgroundColor3,divider.BackgroundTransparency,divider.ZIndex=Color3.
fromRGB(45,48,58),0.5,ZIndex+126 local option=NeverLose:RegisiterItem(footer,
self.Signal)option.Root,option.Signal,option.Layout,option.Divider=footer,self.
Signal,layout,divider self.Option=option NeverLose:AddSignal(layout:
GetPropertyChangedSignal('AbsoluteContentSize'):Connect(function()self:Layout()
if self.Visible then self:PositionPopup()end end))self:Layout()return option end
function ColorPickerLib:PositionPopup()local camera=workspace.CurrentCamera
local bounds=self.Bounds or(self.ParentPicker and self.ParentPicker.Bounds)local
minimum=bounds and bounds.AbsolutePosition+Vector2.new(6,6)or Vector2.new(6,6)
local extent=bounds and bounds.AbsolutePosition+bounds.AbsoluteSize or(camera
and camera.ViewportSize)or Vector2.new(800,600)local size=Vector2.new(
ColorPickerHandler.Size.X.Offset,ColorPickerHandler.Size.Y.Offset)local maximum=
extent-size-Vector2.new(6,6)ColorPickerHandler.Position=UDim2.fromOffset(math.
clamp(HandleFrame.AbsolutePosition.X,minimum.X,math.max(minimum.X,maximum.X)),
math.clamp(HandleFrame.AbsolutePosition.Y+24,minimum.Y,math.max(minimum.Y,
maximum.Y)))end function ColorPickerLib:RegisterPopup(root,close,isOpen)self.
Popups[#self.Popups+1]={Root=root,Close=close,IsOpen=isOpen}end function
ColorPickerLib:ContainsPoint()if NeverLose:IsMouseOverFrame(self.Root)then
return true end for _,popup in ipairs(self.Popups)do if popup.IsOpen()and(
NeverLose:IsMouseOverFrame(popup.Root)or(popup.Picker and popup.Picker:
ContainsPoint()))then return true end end return false end function
ColorPickerLib:ClosePopups()local closed=false for _,popup in ipairs(self.Popups
)do if popup.IsOpen()then popup.Close(false)closed=true end end return closed
end ColorPickerLib.SetRender=function(value)ColorPickerLib.Visible=value==true
ColorPickerLib.Signal:SetValue(value==true)if not value then ColorPickerLib.
DragInput,ColorPickerLib.DragMode,ColorPickerLib.IsHold=nil,nil,false formatMenu
.Visible=false ColorPickerLib:ClosePopups()for _,field in ipairs(fields)do if
field:IsFocused()then field:ReleaseFocus()end end end if value then
ColorPickerLib:Layout()ColorPickerLib:PositionPopup()NeverLose.PlayAnimate(
ColorPickerHandler,SlowyTween,{BackgroundTransparency=0.035})NeverLose.
PlayAnimate(UIStroke,SlowyTween,{Transparency=0.65})NeverLose.PlayAnimate(
SaViMap,SlowyTween,{BackgroundTransparency=0})NeverLose.PlayAnimate(
SaturationOverlay,SlowyTween,{BackgroundTransparency=0})NeverLose.PlayAnimate(
ValueOverlay,SlowyTween,{BackgroundTransparency=0})NeverLose.PlayAnimate(
UIStroke_2,SlowyTween,{Transparency=0})NeverLose.PlayAnimate(ColorMap,SlowyTween
,{BackgroundTransparency=0})NeverLose.PlayAnimate(UIStroke_3,SlowyTween,{
Transparency=0})NeverLose.PlayAnimate(AlphaMap,SlowyTween,{
BackgroundTransparency=0})NeverLose.PlayAnimate(UIStroke_Alpha,SlowyTween,{
Transparency=0})Shadow:Render(true)else NeverLose.PlayAnimate(ColorPickerHandler
,SlowyTween,{BackgroundTransparency=1})NeverLose.PlayAnimate(UIStroke,SlowyTween
,{Transparency=1})NeverLose.PlayAnimate(SaViMap,SlowyTween,{
BackgroundTransparency=1})NeverLose.PlayAnimate(SaturationOverlay,SlowyTween,{
BackgroundTransparency=1})NeverLose.PlayAnimate(ValueOverlay,SlowyTween,{
BackgroundTransparency=1})NeverLose.PlayAnimate(UIStroke_2,SlowyTween,{
Transparency=1})NeverLose.PlayAnimate(ColorMap,SlowyTween,{
BackgroundTransparency=1})NeverLose.PlayAnimate(UIStroke_3,SlowyTween,{
Transparency=1})NeverLose.PlayAnimate(AlphaMap,SlowyTween,{
BackgroundTransparency=1})NeverLose.PlayAnimate(UIStroke_Alpha,SlowyTween,{
Transparency=1})Shadow:Render(false)end end ColorPickerLib.SetRender(false)
ColorPickerLib.Root=ColorPickerHandler ColorPickerLib.H=1 ColorPickerLib.S=1
ColorPickerLib.V=1 ColorPickerLib.Opacity=math.clamp(tonumber(Config.Opacity)or
1,0,1)ColorPickerLib.Callback=EmptyFunction ColorPickerLib.OpacityCallback=
EmptyFunction ColorPickerLib.SetNamedColors=function(_,entries,activeId)
refreshNamedColorHeader(entries or{},activeId)end function ColorPickerLib:Update
()local RealColor=Color3.fromHSV(ColorPickerLib.H,ColorPickerLib.S,
ColorPickerLib.V)NeverLose.PlayAnimate(ColorZoneSelection,ManualTween,{Position=
UDim2.fromScale(ColorPickerLib.S,1-ColorPickerLib.V)})NeverLose.PlayAnimate(
SaViMap,ManualTween,{BackgroundColor3=Color3.fromHSV(ColorPickerLib.H,1,1)})
AlphaMap.BackgroundColor3=RealColor NeverLose.PlayAnimate(ColorMapSelection,
ManualTween,{Position=UDim2.fromScale(ColorPickerLib.H,0.5)})NeverLose.
PlayAnimate(AlphaMapSelection,ManualTween,{Position=UDim2.new(ColorPickerLib.
Opacity,0,0.5,0)})ColorPickerLib:RefreshFields()ColorPickerLib.Callback(
RealColor)end function ColorPickerLib:SetOpacity(value,silent)ColorPickerLib.
Opacity=math.clamp(tonumber(value)or 1,0,1)NeverLose.PlayAnimate(
AlphaMapSelection,ManualTween,{Position=UDim2.new(ColorPickerLib.Opacity,0,0.5,0
)})self:RefreshFields()if not silent then ColorPickerLib.OpacityCallback(
ColorPickerLib.Opacity)end end function ColorPickerLib:SetValue(Color)if typeof(
Color)=='string'then Color=Color3.fromHex(Color)end local H,S,V=Color:ToHSV()
ColorPickerLib.H=H ColorPickerLib.S=S ColorPickerLib.V=V ColorPickerLib:Update()
end function ColorPickerLib:EndDrag()self.DragInput,self.DragMode,self.IsHold=
nil,nil,false end function ColorPickerLib:UpdateDrag(position)local mode=self.
DragMode if not mode then return end local area=mode=='Hue'and ColorMap or mode
=='Alpha'and AlphaMap or SaViMap local x=math.clamp((position.X-area.
AbsolutePosition.X)/math.max(1,area.AbsoluteSize.X),0,1)if mode=='Hue'then self.
H=x self:Update()elseif mode=='Alpha'then self:SetOpacity(x)else self.S=x self.V
=1-math.clamp((position.Y-area.AbsolutePosition.Y)/math.max(1,area.AbsoluteSize.
Y),0,1)self:Update()end end local function bindDrag(area,mode)NeverLose:
AddSignal(area.InputBegan:Connect(function(input)if ColorPickerLib.DragInput
then return end if input.UserInputType~=Enum.UserInputType.MouseButton1 and
input.UserInputType~=Enum.UserInputType.Touch then return end ColorPickerLib.
DragInput,ColorPickerLib.DragMode,ColorPickerLib.IsHold=input,mode,true
ColorPickerLib:UpdateDrag(input.Position)end))end bindDrag(ColorMap,'Hue')
bindDrag(AlphaMap,'Alpha')bindDrag(SaViMap,'SaturationValue')NeverLose:
AddSignal(UserInputService.InputChanged:Connect(function(input)local active=
ColorPickerLib.DragInput if active and(input==active or(active.UserInputType==
Enum.UserInputType.MouseButton1 and input.UserInputType==Enum.UserInputType.
MouseMovement))then ColorPickerLib:UpdateDrag(input.Position)end end))NeverLose:
AddSignal(UserInputService.InputEnded:Connect(function(input)local active=
ColorPickerLib.DragInput if active and(input==active or(active.UserInputType==
Enum.UserInputType.MouseButton1 and input.UserInputType==Enum.UserInputType.
MouseButton1))then ColorPickerLib:EndDrag()end end))NeverLose:AddSignal(
UserInputService.WindowFocusReleased:Connect(function()ColorPickerLib:EndDrag()
end))Runtime.Track(function()ColorPickerLib:EndDrag()end)ColorPickerLib.Signal:
Connect(function(value)if ColorPickerLib.Visible~=value then ColorPickerLib.
SetRender(value)end end)NeverLose:AddSignal(UserInputService.InputBegan:Connect(
function(input)if ColorPickerLib.Visible and input.KeyCode==Enum.KeyCode.Escape
then ColorPickerLib.ClosedByInput=input if formatMenu.Visible then formatMenu.
Visible=false elseif not ColorPickerLib:ClosePopups()then ColorPickerLib.
SetRender(false)end elseif formatMenu.Visible and(input.UserInputType==Enum.
UserInputType.MouseButton1 or input.UserInputType==Enum.UserInputType.Touch)then
if not NeverLose:IsMouseOverFrame(formatMenu)and not NeverLose:IsMouseOverFrame(
formatButton)then formatMenu.Visible=false end end end))return ColorPickerLib
end NeverLose.KeyEnum={One='1',Two='2',Three='3',Four='4',Five='5',Six='6',Seven
='7',Eight='8',Nine='9',Zero='0',['Minus']='-',['Plus']='+',BackSlash='\\',Slash
='/',Period='.',Semicolon=';',Colon=':',LeftControl='LCtrl',RightControl='RCtrl'
,LeftShift='LShift',RightShift='RShift',Return='Enter',LeftBracket='[',
RightBracket=']',Quote="'",Comma=',',Equals='=',LeftSuper='Super',RightSuper=
'Super',LeftAlt='LAlt',RightAlt='RAlt',Escape='Esc'}NeverLose.EnumReverse={}for
i,v in next,NeverLose.KeyEnum do NeverLose.EnumReverse[v]=i end function
NeverLose:KeyCodeToStr(K:Enum.KeyCode)if typeof(K)=='string'then if NeverLose.
KeyEnum[K]then return NeverLose.KeyEnum[K]end return K end return(NeverLose.
KeyEnum[K.Name]or K.Name)end function NeverLose:StrToKeyCode(str:string)if
NeverLose.EnumReverse[str]then return Enum.KeyCode[NeverLose.EnumReverse[str] ]
end return Enum.KeyCode[str]end function NeverLose:RegisiterHandler(Handler:
Frame,Signal)local handle={}local ZINdex=Handler.ZIndex function handle:
AddToggle(Config)Config=NeverLose:ProcessParams(Config,{Default=false,Flag=nil,
Callback=EmptyFunction})local Toggle=Instance.new('Frame')local UICorner=
Instance.new('UICorner')local Circle=Instance.new('Frame')local UICorner_2=
Instance.new('UICorner')Toggle.Name=NeverLose.RandomString()Toggle.Parent=
Handler Toggle.BackgroundColor3=Color3.fromRGB(10,13,21)Toggle.BorderColor3=
Color3.fromRGB(0,0,0)Toggle.BorderSizePixel=0 Toggle.ClipsDescendants=true
Toggle.Size=UDim2.new(0,30,0,18)Toggle.ZIndex=ZINdex+13 Toggle.LayoutOrder=-(#
Handler:GetChildren()+5)UICorner.CornerRadius=UDim.new(1,0)UICorner.Parent=
Toggle Circle.Name=NeverLose.RandomString()Circle.Parent=Toggle Circle.
AnchorPoint=Vector2.new(0.5,0.5)Circle.BackgroundColor3=Color3.fromRGB(255,255,
255)Circle.BackgroundTransparency=0.5 Circle.BorderColor3=Color3.fromRGB(0,0,0)
Circle.BorderSizePixel=0 Circle.Position=UDim2.new(0.300000012,0,0.5,0)Circle.
Size=UDim2.new(0,16,0,16)Circle.ZIndex=ZINdex+14 UICorner_2.CornerRadius=UDim.
new(1,0)UICorner_2.Parent=Circle local ToggleLib={Root=Toggle}ToggleLib.SetUI=
function(value)if value then NeverLose.PlayAnimate(Toggle,SlowyTween,{
BackgroundTransparency=0,BackgroundColor3=NeverLose.AccentColor})NeverLose.
PlayAnimate(Circle,SlowyTween,{BackgroundColor3=Color3.fromRGB(255,255,255),
BackgroundTransparency=0,Position=UDim2.new(0.7,0,0.5,0)})else NeverLose.
PlayAnimate(Toggle,SlowyTween,{BackgroundTransparency=0,BackgroundColor3=Color3.
fromRGB(10,13,21)})NeverLose.PlayAnimate(Circle,SlowyTween,{BackgroundColor3=
Color3.fromRGB(255,255,255),BackgroundTransparency=0.5,Position=UDim2.new(
0.300000012,0,0.5,0)})end end ToggleLib.SetVisible=function(value)if value then
ToggleLib.SetUI(Config.Default)else NeverLose.PlayAnimate(Toggle,SlowyTween,{
BackgroundTransparency=1,BackgroundColor3=Color3.fromRGB(10,13,21)})NeverLose.
PlayAnimate(Circle,SlowyTween,{BackgroundColor3=Color3.fromRGB(255,255,255),
BackgroundTransparency=1,Position=UDim2.new(0.300000012,0,0.5,0)})end end
ToggleLib.SetUI(Config.Default)ToggleLib.SetVisible(Signal:GetValue())NeverLose:
CreateInput(Toggle,function()Config.Default=not Config.Default ToggleLib.SetUI(
Config.Default)Config.Callback(Config.Default)end)ToggleLib.Signal=Signal:
Connect(ToggleLib.SetVisible)function ToggleLib:GetValue()return Config.Default
end function ToggleLib:SetValue(v)Config.Default=v if Signal:GetValue()then
ToggleLib.SetUI(Config.Default)end Config.Callback(Config.Default)end if Config.
Flag then NeverLose.Flags[Config.Flag]=ToggleLib end return ToggleLib end
function handle:AddSlider(Config)Config=NeverLose:ProcessParams(Config,{Default=
50,Min=0,Max=10,Type='',Rounding=0,Increment=0,Nums={},Flag=nil,Size=125,
Callback=EmptyFunction})local function normalizeSliderValue(value)local numeric=
tonumber(value)if not numeric or numeric~=numeric then numeric=Config.Default
end numeric=math.clamp(numeric,Config.Min,Config.Max)if type(Config.Increment)==
'number'and Config.Increment>0 then numeric=Config.Min+math.floor((numeric-
Config.Min)/Config.Increment+0.5)*Config.Increment end return math.clamp(
NeverLose.Rounding(numeric,Config.Rounding),Config.Min,Config.Max)end Config.
Default=normalizeSliderValue(Config.Default)local SliderLib={}SliderLib.GetSize=
function()if Config.Max<=Config.Min then return 0 end return(Config.Default-
Config.Min)/(Config.Max-Config.Min)end local FullNumSize=TextService:
GetTextSize(string.rep('0',(Config.Rounding+#tostring(Config.Max))+1)..tostring(
Config.Type),10,Enum.Font.GothamMedium,Vector2.new(math.huge,math.huge))
SliderLib.MaximumSize=FullNumSize.X if Config.Nums then local nszie=0 for i,ns
in next,Config.Nums do local size=TextService:GetTextSize(string.rep('m',string.
len(tostring(ns))),10,Enum.Font.GothamMedium,Vector2.new(math.huge,math.huge))if
nszie<size.X then nszie=size.X end end if SliderLib.MaximumSize<nszie then
SliderLib.MaximumSize=nszie end end local Slider=Instance.new('Frame')local
UICorner=Instance.new('UICorner')local ValueFrame=Instance.new('Frame')local
UICorner_2=Instance.new('UICorner')local UIStroke=Instance.new('UIStroke')local
ValueLabel=Instance.new('TextBox')local SlideMain=Instance.new('Frame')local
SlideFrame=Instance.new('Frame')local UICorner_3=Instance.new('UICorner')local
SlideMoving=Instance.new('Frame')local UICorner_4=Instance.new('UICorner')local
Frame=Instance.new('Frame')local UICorner_5=Instance.new('UICorner')local
boxSize=2 Slider.Name=NeverLose.RandomString()Slider.Parent=Handler Slider.
BackgroundColor3=Color3.fromRGB(26,28,36)Slider.BackgroundTransparency=1 Slider.
BorderColor3=Color3.fromRGB(0,0,0)Slider.BorderSizePixel=0 Slider.
ClipsDescendants=false Slider.Size=UDim2.new(0,Config.Size,0,18)Slider.ZIndex=
ZINdex+13 Slider.LayoutOrder=-(#Handler:GetChildren()+5)UICorner.CornerRadius=
UDim.new(0,4)UICorner.Parent=Slider ValueFrame.Name=NeverLose.RandomString()
ValueFrame.Parent=Slider ValueFrame.AnchorPoint=Vector2.new(1,0)ValueFrame.
BackgroundColor3=Color3.fromRGB(26,28,36)ValueFrame.BorderColor3=Color3.fromRGB(
0,0,0)ValueFrame.BorderSizePixel=0 ValueFrame.ClipsDescendants=true ValueFrame.
Position=UDim2.new(1,0,0,0)ValueFrame.Size=UDim2.new(0,SliderLib.MaximumSize+
boxSize,0,18)ValueFrame.ZIndex=ZINdex+13 UICorner_2.CornerRadius=UDim.new(0,4)
UICorner_2.Parent=ValueFrame UIStroke.Transparency=0.65 UIStroke.Color=Color3.
fromRGB(45,48,58)UIStroke.Parent=ValueFrame ValueLabel.Name=NeverLose.
RandomString()ValueLabel.Parent=ValueFrame ValueLabel.AnchorPoint=Vector2.new(
0.5,0.5)ValueLabel.BackgroundColor3=Color3.fromRGB(255,255,255)ValueLabel.
BackgroundTransparency=1 ValueLabel.BorderColor3=Color3.fromRGB(0,0,0)ValueLabel
.BorderSizePixel=0 ValueLabel.Position=UDim2.new(0.5,0,0.5,0)ValueLabel.Size=
UDim2.new(1,0,1,0)ValueLabel.ZIndex=ZINdex+14 ValueLabel.Font=Enum.Font.
GothamMedium ValueLabel.Text=Config.Nums[Config.Default]or(tostring(Config.
Default)..tostring(Config.Type))ValueLabel.TextColor3=Color3.fromRGB(255,255,255
)ValueLabel.TextSize=10 ValueLabel.ClearTextOnFocus=false ValueLabel.
TextTransparency=0.35 SlideMain.Name=NeverLose.RandomString()SlideMain.Parent=
Slider SlideMain.AnchorPoint=Vector2.new(0,0.5)SlideMain.BackgroundColor3=Color3
.fromRGB(255,255,255)SlideMain.BackgroundTransparency=1 SlideMain.BorderColor3=
Color3.fromRGB(0,0,0)SlideMain.BorderSizePixel=0 SlideMain.Position=UDim2.new(0,
0,0.5,0)SlideMain.Size=UDim2.new(1,-(SliderLib.MaximumSize+11),0,18)SlideMain.
ZIndex=ZINdex+13 SlideFrame.Name=NeverLose.RandomString()SlideFrame.Parent=
SlideMain SlideFrame.AnchorPoint=Vector2.new(0,0.5)SlideFrame.BackgroundColor3=
Color3.fromRGB(30,29,36)SlideFrame.BorderColor3=Color3.fromRGB(0,0,0)SlideFrame.
BorderSizePixel=0 SlideFrame.Position=UDim2.new(0,0,0.5,0)SlideFrame.Size=UDim2.
new(1,0,0,5)SlideFrame.ZIndex=ZINdex+13 UICorner_3.CornerRadius=UDim.new(1,0)
UICorner_3.Parent=SlideFrame SlideMoving.Name=NeverLose.RandomString()
SlideMoving.Parent=SlideFrame SlideMoving.BackgroundColor3=NeverLose.AccentColor
SlideMoving.BorderColor3=Color3.fromRGB(0,0,0)SlideMoving.BorderSizePixel=0
SlideMoving.Size=UDim2.new(SliderLib.GetSize(),0,1,0)SlideMoving.ZIndex=ZINdex+
14 UICorner_4.CornerRadius=UDim.new(1,0)UICorner_4.Parent=SlideMoving Frame.
Parent=SlideMoving Frame.AnchorPoint=Vector2.new(1,0.5)Frame.BackgroundColor3=
Color3.fromRGB(255,255,255)Frame.BorderColor3=Color3.fromRGB(0,0,0)Frame.
BorderSizePixel=0 Frame.Position=UDim2.new(1,5,0.5,0)Frame.Size=UDim2.new(0,10,0
,10)Frame.ZIndex=ZINdex+15 UICorner_5.CornerRadius=UDim.new(1,0)UICorner_5.
Parent=Frame local LoadText=function()if Config.Nums[Config.Default]then
ValueLabel.Text=Config.Nums[Config.Default]else ValueLabel.Text=tostring(Config.
Default)..tostring(Config.Type)end end ValueLabel.FocusLost:Connect(function()
local OutVal=NeverLose:ParseInput(ValueLabel.Text,true)if OutVal then local rx=
math.clamp(OutVal,Config.Min,Config.Max)local Value=normalizeSliderValue(rx)if
Value then Config.Default=Value TweenService:Create(SlideMoving,ManualTween,{
Size=UDim2.new(SliderLib.GetSize(),0,1,0)}):Play()LoadText()Config.Callback(
Config.Default)else LoadText()end else LoadText()end end)SliderLib.SetRender=
function(value)if value then NeverLose.PlayAnimate(ValueFrame,SlowyTween,{
BackgroundTransparency=0,Size=UDim2.new(0,SliderLib.MaximumSize+boxSize,0,18)})
NeverLose.PlayAnimate(UIStroke,SlowyTween,{Transparency=0.65})NeverLose.
PlayAnimate(ValueLabel,SlowyTween,{TextTransparency=0.35})NeverLose.PlayAnimate(
SlideFrame,SlowyTween,{BackgroundTransparency=0})NeverLose.PlayAnimate(
SlideMoving,SlowyTween,{BackgroundTransparency=0,Size=UDim2.new(SliderLib.
GetSize(),0,1,0)})NeverLose.PlayAnimate(Frame,SlowyTween,{BackgroundTransparency
=0})else NeverLose.PlayAnimate(ValueFrame,SlowyTween,{BackgroundTransparency=1})
NeverLose.PlayAnimate(UIStroke,SlowyTween,{Transparency=1})NeverLose.
PlayAnimate(ValueLabel,SlowyTween,{TextTransparency=1})NeverLose.PlayAnimate(
SlideFrame,SlowyTween,{BackgroundTransparency=1})NeverLose.PlayAnimate(
SlideMoving,SlowyTween,{BackgroundTransparency=1,Size=UDim2.new(0,0,1,0)})
NeverLose.PlayAnimate(Frame,SlowyTween,{BackgroundTransparency=1})end end
SliderLib.SetRender(Signal:GetValue())SliderLib.Signal=Signal:Connect(SliderLib.
SetRender)local Update=function(Input)local SizeScale=math.clamp(((Input.
Position.X-SlideMain.AbsolutePosition.X)/SlideMain.AbsoluteSize.X),0,1)local
Main=((Config.Max-Config.Min)*SizeScale)+Config.Min local Value=
normalizeSliderValue(Main)local PositionX=UDim2.fromScale(SizeScale,1)local Size
=((Value-Config.Min)/(Config.Max-Config.Min))+0.02 Config.Default=Value
TweenService:Create(SlideMoving,ManualTween,{Size=UDim2.new(SliderLib.GetSize(),
0,1,0)}):Play()LoadText()Config.Callback(Value)end local IsHold=false do
SlideMain.InputBegan:Connect(function(Input)if Input.UserInputType==Enum.
UserInputType.MouseButton1 or Input.UserInputType==Enum.UserInputType.Touch then
IsHold=true Update(Input)end end)SlideMain.InputEnded:Connect(function(Input)if
Input.UserInputType==Enum.UserInputType.MouseButton1 or Input.UserInputType==
Enum.UserInputType.Touch then if UserInputService.TouchEnabled then if not
NeverLose:IsMouseOverFrame(SlideMain)then IsHold=false end else IsHold=false end
end end)UserInputService.InputChanged:Connect(function(Input)if IsHold then if
Input.UserInputType==Enum.UserInputType.MouseMovement or Input.UserInputType==
Enum.UserInputType.Touch then if UserInputService.TouchEnabled then if not
NeverLose:IsMouseOverFrame(SlideMain)then IsHold=false else Update(Input)end
else Update(Input)end end end end)end function SliderLib:GetValue()return Config
.Default end function SliderLib:SetValue(v)Config.Default=normalizeSliderValue(v
)if Signal:GetValue()then NeverLose.PlayAnimate(SlideMoving,SlowyTween,{
BackgroundTransparency=0,Size=UDim2.new(SliderLib.GetSize(),0,1,0)})end
LoadText()Config.Callback(Config.Default)end function SliderLib:SetRange(minimum
,maximum)Config.Min,Config.Max=minimum,math.max(minimum,maximum)self:SetValue(
Config.Default)end if Config.Flag then NeverLose.Flags[Config.Flag]=SliderLib
end return SliderLib end function handle:AddOption(GearIcon,clickRow,bounds)if
self.Picker then return self.Picker:CreateOption()end local Option=Instance.new(
'Frame')local Icon=Instance.new('TextLabel')local UICorner=Instance.new(
'UICorner')Option.Name=NeverLose.RandomString()Option.Parent=Handler Option.
BackgroundColor3=Color3.fromRGB(39,40,49)Option.BackgroundTransparency=1 Option.
BorderColor3=Color3.fromRGB(0,0,0)Option.BorderSizePixel=0 Option.
ClipsDescendants=true Option.Size=UDim2.new(0,20,0,18)Option.ZIndex=ZINdex+13
Option.LayoutOrder=-(#Handler:GetChildren()+5)Icon.Name=NeverLose.RandomString()
Icon.Parent=Option Icon.AnchorPoint=Vector2.new(0.5,0.5)Icon.BackgroundColor3=
Color3.fromRGB(255,255,255)Icon.BackgroundTransparency=1 Icon.BorderColor3=
Color3.fromRGB(0,0,0)Icon.BorderSizePixel=0 Icon.Position=UDim2.new(0.5,0,0.5,0)
Icon.Size=UDim2.new(1,0,1,0)Icon.ZIndex=ZINdex+14 Icon.FontFace=NeverLose.
BuiltInBold Icon.Text=(GearIcon==1 and'gear')or(GearIcon==2 and
'chevron-large-right')or'three-dots-horizontal'Icon.TextColor3=Color3.fromRGB(
223,223,223)Icon.TextSize=16 Icon.TextTransparency=0.4 Icon.TextWrapped=true
UICorner.CornerRadius=UDim.new(0,4)UICorner.Parent=Option local Window=NeverLose
:CreateOptionWindow(Option,ZINdex+13,bounds)local reciveSignal Window.Signal:
Connect(function(open)if not open and reciveSignal then reciveSignal:Disconnect(
)reciveSignal=nil end end)Window.SetRender=function(value)if value then
NeverLose.PlayAnimate(Icon,SlowyTween,{TextTransparency=0.4})else NeverLose.
PlayAnimate(Icon,SlowyTween,{TextTransparency=1})end end Window.SetRender(Signal
:GetValue())Signal:Connect(Window.SetRender)local clickTarget=clickRow and self.
Root or Option local bthg=NeverLose:CreateInput(clickTarget,function()if
reciveSignal then reciveSignal:Disconnect()reciveSignal=nil end Window.Signal:
SetValue(true)reciveSignal=NeverLose:AddSignal(UserInputService.InputBegan:
Connect(function(Input)if Input.UserInputType==Enum.UserInputType.MouseButton1
or Input.UserInputType==Enum.UserInputType.Touch then if not NeverLose:
IsMouseOverFrame(Window.Root)and not NeverLose:IsMouseOverFrame(clickTarget)then
if reciveSignal then reciveSignal:Disconnect()reciveSignal=nil end Window.Signal
:SetValue(false)end end end))end)bthg.ZIndex=Option.ZIndex+10 NeverLose:
AddSignal(bthg.MouseEnter:Connect(function()NeverLose.PlayAnimate(clickTarget,
SlowyTween,{BackgroundTransparency=0.5})NeverLose.PlayAnimate(Icon,SlowyTween,{
TextTransparency=0.25})end))NeverLose:AddSignal(bthg.MouseLeave:Connect(function
()NeverLose.PlayAnimate(clickTarget,SlowyTween,{BackgroundTransparency=1})
NeverLose.PlayAnimate(Icon,SlowyTween,{TextTransparency=0.4})end))return Window
end function handle:AddColorPicker(Config)Config=NeverLose:ProcessParams(Config,
{Default=Color3.fromRGB(255,255,255),Transparency=1,TransparencyEnabled=false,
Callback=EmptyFunction})if typeof(Config.Default)=='string'then Config.Default=
Color3.fromHex(Config.Default:gsub('#',''))end local ColorPickerLib={}local
ColorPicker=Instance.new('Frame')ColorPickerLib.Root=ColorPicker local UICorner=
Instance.new('UICorner')local UIStroke=Instance.new('UIStroke')local ImageLabel=
Instance.new('ImageLabel')local UICorner_2=Instance.new('UICorner')local
splitPreviewFrames={}ColorPicker.Name=NeverLose.RandomString()ColorPicker.Parent
=Handler ColorPicker.BackgroundColor3=Config.Default ColorPicker.
BackgroundTransparency=0 ColorPicker.BorderColor3=Color3.fromRGB(0,0,0)
ColorPicker.BorderSizePixel=0 ColorPicker.ClipsDescendants=true ColorPicker.Size
=UDim2.new(0,18,0,18)ColorPicker.ZIndex=ZINdex+13 ColorPicker.LayoutOrder=-(#
Handler:GetChildren()+5)UICorner.CornerRadius=UDim.new(0,4)UICorner.Parent=
ColorPicker UIStroke.Transparency=0.65 UIStroke.Color=Color3.fromRGB(45,48,58)
UIStroke.Parent=ColorPicker ImageLabel.Parent=ColorPicker ImageLabel.
BackgroundColor3=Color3.fromRGB(255,255,255)ImageLabel.BorderColor3=Color3.
fromRGB(0,0,0)ImageLabel.BorderSizePixel=0 ImageLabel.Size=UDim2.new(1,0,1,0)
ImageLabel.ZIndex=ZINdex+11 ImageLabel.Image=
'rbxasset://textures/meshPartFallback.png'ImageLabel.ImageTransparency=0.9
ImageLabel.BackgroundTransparency=1 ImageLabel.ScaleType=Enum.ScaleType.Crop
UICorner_2.CornerRadius=UDim.new(0,4)UICorner_2.Parent=ImageLabel if Config.
SplitPreview==true then ImageLabel.Visible=false for index=1,2 do local preview=
Instance.new('Frame')preview.Name='ColorPreview'..tostring(index)preview.
BackgroundColor3=Color3.new(1,1,1)preview.BorderSizePixel=0 preview.Position=
UDim2.new((index-1)*0.5,0,0,0)preview.Size=UDim2.new(0.5,0,1,0)preview.ZIndex=
ZINdex+12 preview.Parent=ColorPicker local previewCorner=Instance.new('UICorner'
)previewCorner.CornerRadius=UDim.new(0,4)previewCorner.Parent=preview
splitPreviewFrames[index]=preview end end local BackendM=NeverLose:
CreateColorPicker(ColorPicker,Config)ColorPickerLib.Picker=BackendM self.Picker=
self.Picker or BackendM if Signal.Picker then BackendM.ParentPicker=Signal.
Picker Signal.Picker:RegisterPopup(BackendM.Root,BackendM.SetRender,function()
return BackendM.Visible end)Signal.Picker.Popups[#Signal.Picker.Popups].Picker=
BackendM end BackendM:SetValue(Config.Default)BackendM.Callback=function(color)
ColorPicker.BackgroundColor3=color Config.Default=color Config.Callback(Config.
Default)end local signal NeverLose:CreateInput(ColorPicker,function()if signal
then signal:Disconnect()signal=nil end BackendM.SetRender(true)signal=NeverLose:
AddSignal(UserInputService.InputBegan:Connect(function(Input)if Input.
UserInputType==Enum.UserInputType.MouseButton1 or Input.UserInputType==Enum.
UserInputType.Touch then if not NeverLose:IsMouseOverFrame(ColorPicker)and not
BackendM:ContainsPoint()then if signal then signal:Disconnect()signal=nil end
BackendM.SetRender(false)end end end))end)ColorPickerLib.SetRender=function(
value)if not value then BackendM.SetRender(false)end if value then NeverLose.
PlayAnimate(ColorPicker,SlowyTween,{BackgroundTransparency=0})NeverLose.
PlayAnimate(UIStroke,SlowyTween,{Transparency=0.65})NeverLose.PlayAnimate(
ImageLabel,SlowyTween,{ImageTransparency=0.9})else NeverLose.PlayAnimate(
ColorPicker,SlowyTween,{BackgroundTransparency=1})NeverLose.PlayAnimate(UIStroke
,SlowyTween,{Transparency=1})NeverLose.PlayAnimate(ImageLabel,SlowyTween,{
ImageTransparency=1})end end ColorPickerLib.SetRender(Signal:GetValue())Signal:
Connect(ColorPickerLib.SetRender)function ColorPickerLib:GetValue()return Config
.Default end function ColorPickerLib:SetValue(v)Config.Default=v BackendM:
SetValue(Config.Default)end function ColorPickerLib:SetNamedColors(entries,
activeId)BackendM:SetNamedColors(entries,activeId)end function ColorPickerLib:
SetPreviewColors(colors)for index=1,#splitPreviewFrames do local color=colors
and colors[index]if typeof(color)=='Color3'then splitPreviewFrames[index].
BackgroundColor3=color end end end if Config.SplitPreview then ColorPickerLib:
SetPreviewColors(Config.PreviewColors)end if Config.Flag then NeverLose.Flags[
Config.Flag]=ColorPickerLib end return ColorPickerLib end function handle:
AddKeybind(Config)Config=NeverLose:ProcessParams(Config,{Default=nil,Blacklist={
},Callback=EmptyFunction,Flag=nil})local KeybindLib={}local Keybind=Instance.
new('Frame')local UICorner=Instance.new('UICorner')local UIStroke=Instance.new(
'UIStroke')local ValueLabel=Instance.new('TextLabel')Keybind.Name=NeverLose.
RandomString()Keybind.Parent=Handler Keybind.BackgroundColor3=Color3.fromRGB(26,
28,36)Keybind.BorderColor3=Color3.fromRGB(0,0,0)Keybind.BorderSizePixel=0
Keybind.ClipsDescendants=true Keybind.Size=UDim2.new(0,45,0,18)Keybind.ZIndex=
ZINdex+13 Keybind.LayoutOrder=-(#Handler:GetChildren()+5)UICorner.CornerRadius=
UDim.new(0,4)UICorner.Parent=Keybind UIStroke.Transparency=0.65 UIStroke.Color=
Color3.fromRGB(45,48,58)UIStroke.Parent=Keybind ValueLabel.Name=NeverLose.
RandomString()ValueLabel.Parent=Keybind ValueLabel.AnchorPoint=Vector2.new(0.5,
0.5)ValueLabel.BackgroundColor3=Color3.fromRGB(255,255,255)ValueLabel.
BackgroundTransparency=1 ValueLabel.BorderColor3=Color3.fromRGB(0,0,0)ValueLabel
.BorderSizePixel=0 ValueLabel.ClipsDescendants=true ValueLabel.Position=UDim2.
new(0.5,0,0.5,0)ValueLabel.Size=UDim2.new(1,0,1,0)ValueLabel.ZIndex=ZINdex+14
ValueLabel.Font=Enum.Font.GothamMedium ValueLabel.Text=NeverLose:KeyCodeToStr(
Config.Default or'None')ValueLabel.TextColor3=Color3.fromRGB(255,255,255)
ValueLabel.TextSize=10 ValueLabel.TextTransparency=0.5 KeybindLib.SetRender=
function(value)if value then NeverLose.PlayAnimate(Keybind,SlowyTween,{
BackgroundTransparency=0})NeverLose.PlayAnimate(UIStroke,SlowyTween,{
Transparency=0.65})NeverLose.PlayAnimate(ValueLabel,SlowyTween,{TextTransparency
=0.5})else NeverLose.PlayAnimate(Keybind,SlowyTween,{BackgroundTransparency=1})
NeverLose.PlayAnimate(UIStroke,SlowyTween,{Transparency=1})NeverLose.
PlayAnimate(ValueLabel,SlowyTween,{TextTransparency=1})end end function
KeybindLib:Update()local size=TextService:GetTextSize(ValueLabel.Text,ValueLabel
.TextSize,ValueLabel.Font,Vector2.new(math.huge,math.huge))NeverLose.
PlayAnimate(Keybind,SlowyTween,{Size=UDim2.new(0,size.X+7,0,18)})end local
IsBlacklist=function(v)return Config.Blacklist and(Config.Blacklist[v]or table.
find(Config.Blacklist,v))end KeybindLib:Update()KeybindLib.SetRender(Signal:
GetValue())Signal:Connect(KeybindLib.SetRender)local IsBinding=false NeverLose:
CreateInput(Keybind,function()if IsBinding then return end IsBinding=true
ValueLabel.Text='...'KeybindLib:Update()local Selected=nil while not Selected do
local Key=UserInputService.InputBegan:Wait()if Key.KeyCode~=Enum.KeyCode.Unknown
and not IsBlacklist(Key.KeyCode)and not IsBlacklist(Key.KeyCode.Name)then
Selected=Key.KeyCode else if Key.UserInputType==Enum.UserInputType.MouseButton1
and not IsBlacklist(Enum.UserInputType.MouseButton1)and not IsBlacklist('M1B')
then Selected='M1B'elseif Key.UserInputType==Enum.UserInputType.MouseButton2 and
not IsBlacklist(Enum.UserInputType.MouseButton2)and not IsBlacklist('M2B')then
Selected='M2B'end end end IsBinding=false local KeyName=typeof(Selected)==
'string'and Selected or Selected.Name Config.Default=KeyName ValueLabel.Text=
NeverLose:KeyCodeToStr(KeyName)KeybindLib:Update()Config.Callback(KeyName)end)
function KeybindLib:GetValue()return Config.Default end function KeybindLib:
SetValue(v)Config.Default=v ValueLabel.Text=NeverLose:KeyCodeToStr(v)KeybindLib:
Update()Config.Callback(Config.Default)end if Config.Flag then NeverLose.Flags[
Config.Flag]=KeybindLib end return KeybindLib end function handle:AddTextInput(
Config)Config=NeverLose:ProcessParams(Config,{Default='',Placeholder=
'Placeholder',Callback=print,Flag=nil,Size=100,Numeric=false})local TextBoxLib={
}local TextInput=Instance.new('Frame')local UICorner=Instance.new('UICorner')
local UIStroke=Instance.new('UIStroke')local TextBox=Instance.new('TextBox')
TextBoxLib.Input=TextBox TextBoxLib.Root=TextInput TextInput.Name=NeverLose.
RandomString()TextInput.Parent=Handler TextInput.BackgroundColor3=Color3.
fromRGB(26,28,36)TextInput.BorderColor3=Color3.fromRGB(0,0,0)TextInput.
BorderSizePixel=0 TextInput.ClipsDescendants=true TextInput.Size=UDim2.new(0,
Config.Size,0,18)TextInput.ZIndex=ZINdex+13 TextInput.LayoutOrder=-(#Handler:
GetChildren()+5)UICorner.CornerRadius=UDim.new(0,4)UICorner.Parent=TextInput
UIStroke.Transparency=0.65 UIStroke.Color=Color3.fromRGB(45,48,58)UIStroke.
Parent=TextInput TextBox.Parent=TextInput TextBox.AnchorPoint=Vector2.new(0,0.5)
TextBox.BackgroundColor3=Color3.fromRGB(255,255,255)TextBox.
BackgroundTransparency=1 TextBox.BorderColor3=Color3.fromRGB(0,0,0)TextBox.
BorderSizePixel=0 TextBox.Position=UDim2.new(0,5,0.5,0)TextBox.Size=UDim2.new(1,
-5,0,17)TextBox.ZIndex=ZINdex+14 TextBox.ClearTextOnFocus=false TextBox.Font=
Enum.Font.GothamMedium TextBox.PlaceholderText=Config.Placeholder TextBox.Text=
tostring(Config.Default)TextBox.TextColor3=Color3.fromRGB(255,255,255)TextBox.
TextSize=11 TextBox.TextTransparency=0.35 TextBox.TextXAlignment=Enum.
TextXAlignment.Left TextBoxLib.SetRender=function(value)if value then NeverLose.
PlayAnimate(TextInput,SlowyTween,{BackgroundTransparency=0})NeverLose.
PlayAnimate(UIStroke,SlowyTween,{Transparency=0.65})NeverLose.PlayAnimate(
TextBox,SlowyTween,{TextTransparency=0.35})else NeverLose.PlayAnimate(TextInput,
SlowyTween,{BackgroundTransparency=1})NeverLose.PlayAnimate(UIStroke,SlowyTween,
{Transparency=1})NeverLose.PlayAnimate(TextBox,SlowyTween,{TextTransparency=1})
end end NeverLose:AddSignal(TextBox:GetPropertyChangedSignal('Text'):Connect(
function()local valout=NeverLose:ParseInput(TextBox.Text,Config.Numeric)if
Config.Numeric then TextBox.Text=string.gsub(TextBox.Text,'[^0-9.]','')end if
valout then Config.Default=valout Config.Callback(valout)end end))TextBoxLib.
SetRender(Signal:GetValue())Signal:Connect(TextBoxLib.SetRender)function
TextBoxLib:GetValue()return Config.Default end function TextBoxLib:SetValue(v)
Config.Default=v TextBox.Text=tostring(v)Config.Callback(Config.Default)end
function TextBoxLib:SetPlaceholder(value)Config.Placeholder=tostring(value or'')
TextBox.PlaceholderText=Config.Placeholder end if Config.Flag then NeverLose.
Flags[Config.Flag]=TextBoxLib end return TextBoxLib end function handle:
AddDropdown(Config)Config=NeverLose:ProcessParams(Config,{Default=nil,Values={},
Multi=false,Callback=EmptyFunction,AutoUpdate=false,Flag=nil,Size=100})Config.
Default=NeverLose.ProcessDropdown(Config.Default)local Dropdown=Instance.new(
'Frame')local DropdownIcon=Instance.new('TextLabel')local UICorner=Instance.new(
'UICorner')local UIStroke=Instance.new('UIStroke')local BasedLabel=Instance.new(
'TextLabel')local function displayDropdownValue(value)local key=tostring(value
or'None')local values=Config.DisplayValues return type(values)=='table'and
values[key]or key end local function dropdownSummary()local value=Config.Default
if type(value)=='table'then local selected={}if#value>0 then for _,option in
ipairs(value)do table.insert(selected,option)end else for option,enabled in
pairs(value)do if enabled then table.insert(selected,option)end end end if#
selected==0 then return displayDropdownValue('None')elseif#selected>1 then
return displayDropdownValue('Various')end return displayDropdownValue(selected[1
])end return displayDropdownValue(value)end Dropdown.Name=NeverLose.
RandomString()Dropdown.Parent=Handler Dropdown.BackgroundColor3=Color3.fromRGB(
26,28,36)Dropdown.BorderColor3=Color3.fromRGB(0,0,0)Dropdown.BorderSizePixel=0
Dropdown.ClipsDescendants=true Dropdown.Size=UDim2.new(0,Config.Size,0,18)
Dropdown.ZIndex=ZINdex+13 Dropdown.LayoutOrder=-(#Handler:GetChildren()+5)
DropdownIcon.Name=NeverLose.RandomString()DropdownIcon.Parent=Dropdown
DropdownIcon.AnchorPoint=Vector2.new(1,0.5)DropdownIcon.BackgroundColor3=Color3.
fromRGB(255,255,255)DropdownIcon.BackgroundTransparency=1 DropdownIcon.
BorderColor3=Color3.fromRGB(0,0,0)DropdownIcon.BorderSizePixel=0 DropdownIcon.
Position=UDim2.new(1,-2,0.5,0)DropdownIcon.Size=UDim2.new(0,18,0,18)DropdownIcon
.ZIndex=ZINdex+14 DropdownIcon.FontFace=NeverLose.BuiltInBold DropdownIcon.Text=
'chevron-small-down'DropdownIcon.TextColor3=Color3.fromRGB(223,223,223)
DropdownIcon.TextSize=16 DropdownIcon.TextTransparency=0.25 DropdownIcon.
TextWrapped=true UICorner.CornerRadius=UDim.new(0,4)UICorner.Parent=Dropdown
UIStroke.Transparency=0.65 UIStroke.Color=Color3.fromRGB(45,48,58)UIStroke.
Parent=Dropdown BasedLabel.Name=NeverLose.RandomString()BasedLabel.Parent=
Dropdown BasedLabel.AnchorPoint=Vector2.new(0,0.5)BasedLabel.BackgroundColor3=
Color3.fromRGB(255,255,255)BasedLabel.BackgroundTransparency=1 BasedLabel.
BorderColor3=Color3.fromRGB(0,0,0)BasedLabel.BorderSizePixel=0 BasedLabel.
ClipsDescendants=true BasedLabel.Position=UDim2.new(0,5,0.5,0)BasedLabel.Size=
UDim2.new(1,-25,0,15)BasedLabel.ZIndex=ZINdex+14 BasedLabel.Font=Enum.Font.
GothamMedium BasedLabel.Text=dropdownSummary()BasedLabel.TextColor3=Color3.
fromRGB(255,255,255)BasedLabel.TextSize=12 BasedLabel.TextTransparency=0.5
BasedLabel.TextXAlignment=Enum.TextXAlignment.Left do local UIGradient=Instance.
new('UIGradient')UIGradient.Transparency=NumberSequence.new({
NumberSequenceKeypoint.new(0,0),NumberSequenceKeypoint.new(0.85,0.23),
NumberSequenceKeypoint.new(1,1)})UIGradient.Parent=BasedLabel end NeverLose:
AddSignal(Dropdown.MouseEnter:Connect(function()NeverLose.PlayAnimate(BasedLabel
,SlowyTween,{TextTransparency=0.2})end))NeverLose:AddSignal(Dropdown.MouseLeave:
Connect(function()NeverLose.PlayAnimate(BasedLabel,SlowyTween,{TextTransparency=
0.5})end))local DropdownLib={Root=Dropdown,Bounds=Config.Bounds,OpenSignal=
NeverLose:CreateSignal(false),Signals={},Refuse={}}Runtime.Track(DropdownLib.
OpenSignal.__event)DropdownLib.SetRender=function(value)if value then NeverLose.
PlayAnimate(Dropdown,SlowyTween,{BackgroundTransparency=0})NeverLose.
PlayAnimate(DropdownIcon,SlowyTween,{TextTransparency=0.25})NeverLose.
PlayAnimate(UIStroke,SlowyTween,{Transparency=0.65})NeverLose.PlayAnimate(
BasedLabel,SlowyTween,{TextTransparency=0.5})else NeverLose.PlayAnimate(Dropdown
,SlowyTween,{BackgroundTransparency=1})NeverLose.PlayAnimate(DropdownIcon,
SlowyTween,{TextTransparency=1})NeverLose.PlayAnimate(UIStroke,SlowyTween,{
Transparency=1})NeverLose.PlayAnimate(BasedLabel,SlowyTween,{TextTransparency=1}
)end end DropdownLib.SetRender(Signal:GetValue())Signal:Connect(DropdownLib.
SetRender)DropdownLib.ExtentSize=0 do local DropdownHandler=Instance.new('Frame'
)local UICorner=Instance.new('UICorner')local UIStroke=Instance.new('UIStroke')
local DropdownScrollFrame=Instance.new('ScrollingFrame')local UIListLayout=
Instance.new('UIListLayout')local Shadow=NeverLose:CreateShadow(DropdownHandler)
DropdownHandler.Name=NeverLose.RandomString()DropdownHandler.Parent=NeverLose.
ScreenGui DropdownHandler.AnchorPoint=Vector2.new(0.5,0)DropdownHandler.
BackgroundColor3=Color3.fromRGB(20,22,27)DropdownHandler.BackgroundTransparency=
0.5 DropdownHandler.BorderColor3=Color3.fromRGB(0,0,0)DropdownHandler.
BorderSizePixel=0 DropdownHandler.ClipsDescendants=true DropdownHandler.Position
=UDim2.new(255,255,255,255)DropdownHandler.Size=UDim2.new(0,125,0,50)
DropdownHandler.ZIndex=ZINdex+125 DropdownLib.BlockRoot=DropdownHandler Runtime.
Track(DropdownHandler)NeverLose:AddSignal(DropdownHandler:
GetPropertyChangedSignal('BackgroundTransparency'):Connect(function()if
DropdownHandler.BackgroundTransparency>0.9 then DropdownHandler.Visible=false
DropdownHandler.Parent=nil else DropdownHandler.Visible=true DropdownHandler.
Parent=NeverLose.ScreenGui end end))UICorner.CornerRadius=UDim.new(0,10)UICorner
.Parent=DropdownHandler UIStroke.Transparency=0.65 UIStroke.Color=Color3.
fromRGB(45,48,58)UIStroke.Parent=DropdownHandler DropdownScrollFrame.Name=
NeverLose.RandomString()DropdownScrollFrame.Parent=DropdownHandler
DropdownScrollFrame.Active=true DropdownScrollFrame.AnchorPoint=Vector2.new(0.5,
0.5)DropdownScrollFrame.BackgroundColor3=Color3.fromRGB(255,255,255)
DropdownScrollFrame.BackgroundTransparency=1 DropdownScrollFrame.BorderColor3=
Color3.fromRGB(0,0,0)DropdownScrollFrame.BorderSizePixel=0 DropdownScrollFrame.
Position=UDim2.new(0.5,0,0.5,0)DropdownScrollFrame.Size=UDim2.new(1,-5,1,-5)
DropdownScrollFrame.ZIndex=ZINdex+127 DropdownScrollFrame.ScrollBarThickness=0
DropdownLib.RootItem=DropdownScrollFrame UIListLayout.Parent=DropdownScrollFrame
UIListLayout.HorizontalAlignment=Enum.HorizontalAlignment.Center UIListLayout.
SortOrder=Enum.SortOrder.LayoutOrder NeverLose:AddSignal(UIListLayout:
GetPropertyChangedSignal('AbsoluteContentSize'):Connect(function()
DropdownScrollFrame.CanvasSize=UDim2.fromOffset(0,UIListLayout.
AbsoluteContentSize.Y)NeverLose.PlayAnimate(DropdownHandler,SlowyTween,{Size=
UDim2.new(0,(Dropdown.AbsoluteSize.X+5)+DropdownLib.ExtentSize,0,math.min(
UIListLayout.AbsoluteContentSize.Y+5,250))})end))local SetPosition=function()
local bounds=DropdownLib.Bounds if bounds then local minimum=bounds.
AbsolutePosition+Vector2.new(6,6)local maximum=bounds.AbsolutePosition+bounds.
AbsoluteSize-DropdownHandler.AbsoluteSize-Vector2.new(6,6)DropdownHandler.
AnchorPoint=Vector2.zero DropdownHandler.Position=UDim2.fromOffset(math.clamp(
Dropdown.AbsolutePosition.X,minimum.X,math.max(minimum.X,maximum.X)),math.clamp(
Dropdown.AbsolutePosition.Y+Dropdown.AbsoluteSize.Y+6,minimum.Y,math.max(minimum
.Y,maximum.Y)))return end if NeverLose:MoreThanHalfY(Dropdown.AbsolutePosition.Y
+85)then DropdownHandler.AnchorPoint=Vector2.new(0.5,1)else DropdownHandler.
AnchorPoint=Vector2.new(0.5,0)end DropdownHandler.Position=UDim2.fromOffset(
Dropdown.AbsolutePosition.X+(DropdownHandler.AbsoluteSize.X/2),Dropdown.
AbsolutePosition.Y+85)end DropdownLib.SetFrameRender=function(value)DropdownLib.
OpenSignal:SetValue(value)if value then Shadow:Render(true)DropdownHandler.Size=
UDim2.new(0,(Dropdown.AbsoluteSize.X+5)+DropdownLib.ExtentSize,0,math.min(
UIListLayout.AbsoluteContentSize.Y+5,250))SetPosition()NeverLose.PlayAnimate(
DropdownHandler,SlowyTween,{BackgroundTransparency=0.035})if Config.AutoUpdate
then DropdownLib:Generate()end else NeverLose.PlayAnimate(DropdownHandler,
SlowyTween,{BackgroundTransparency=1})Shadow:Render(false)end end DropdownLib.
SetFrameRender(false)end local SecureSignal DropdownLib.Input=NeverLose:
CreateInput(Dropdown,function()if SecureSignal then SecureSignal:Disconnect()
SecureSignal=nil end DropdownLib.SetFrameRender(true)NeverLose.
IsMosueOverOtherFrame=true SecureSignal=UserInputService.InputBegan:Connect(
function(Input)if Input.UserInputType==Enum.UserInputType.MouseButton1 or Input.
UserInputType==Enum.UserInputType.Touch then if not NeverLose:IsMouseOverFrame(
DropdownLib.BlockRoot)and not NeverLose:IsMouseOverFrame(Dropdown)then if
SecureSignal then SecureSignal:Disconnect()SecureSignal=nil end NeverLose.
IsMosueOverOtherFrame=false DropdownLib.SetFrameRender(false)end end end)end)
DropdownLib.IsMatch=function(v1)if typeof(Config.Default)=='table'then if Config
.Default[v1]or table.find(Config.Default,v1)then return true end end if Config.
Default==v1 then return true end end function DropdownLib:Generate()for i,v in
next,DropdownLib.RootItem:GetChildren()do if v:IsA('Frame')then v:Destroy()end
end for i,v in next,DropdownLib.Signals do v:Disconnect()end table.clear(
DropdownLib.Signals)table.clear(DropdownLib.Refuse)local Lastone for i,Value in
next,Config.Values do local ItemFrame=Instance.new('Frame')local ItemLabel=
Instance.new('TextLabel')local UICorner=Instance.new('UICorner')ItemFrame.Name=
NeverLose.RandomString()ItemFrame.Parent=DropdownLib.RootItem ItemFrame.
BackgroundColor3=Color3.fromRGB(29,31,38)ItemFrame.BackgroundTransparency=1
ItemFrame.BorderColor3=Color3.fromRGB(0,0,0)ItemFrame.BorderSizePixel=0
ItemFrame.Size=UDim2.new(1,0,0,25)ItemFrame.ZIndex=ZINdex+1258 ItemLabel.Name=
NeverLose.RandomString()ItemLabel.Parent=ItemFrame ItemLabel.BackgroundColor3=
Color3.fromRGB(255,255,255)ItemLabel.BackgroundTransparency=1 ItemLabel.
BorderColor3=Color3.fromRGB(0,0,0)ItemLabel.BorderSizePixel=0 ItemLabel.Position
=UDim2.new(0,15,0,4)ItemLabel.Size=UDim2.new(0,1,0,15)ItemLabel.ZIndex=ZINdex+
1258 ItemLabel.Font=Enum.Font.GothamMedium ItemLabel.Text=displayDropdownValue(
Value)ItemLabel.TextColor3=Color3.fromRGB(255,255,255)ItemLabel.TextSize=13
ItemLabel.TextTransparency=0.2 ItemLabel.TextXAlignment=Enum.TextXAlignment.Left
UICorner.CornerRadius=UDim.new(0,10)UICorner.Parent=ItemFrame local sizetext=
TextService:GetTextSize(ItemLabel.Text,ItemLabel.TextSize,ItemLabel.Font,Vector2
.new(math.huge,math.huge))DropdownLib.ExtentSize=math.max(DropdownLib.ExtentSize
,sizetext.X)local MIcon,MarkItem=nil,nil if Config.Multi then local Icon=
Instance.new('TextLabel')Icon.Parent=ItemFrame Icon.AnchorPoint=Vector2.new(0,
0.5)Icon.BackgroundColor3=Color3.fromRGB(255,255,255)Icon.BackgroundTransparency
=1 Icon.BorderColor3=Color3.fromRGB(0,0,0)Icon.BorderSizePixel=0 Icon.Position=
UDim2.new(0,5,0.5,0)Icon.Size=UDim2.new(0,20,0,20)Icon.ZIndex=ZINdex+1259 Icon.
FontFace=NeverLose.BuiltInBold Icon.Text='check'Icon.TextColor3=Color3.fromRGB(
223,223,223)Icon.TextSize=18 Icon.TextTransparency=1 Icon.TextWrapped=true local
VisiblewOfMult=function()if DropdownLib.IsMatch(Value)then NeverLose.
PlayAnimate(ItemLabel,VSlowTween,{TextTransparency=0.2,Position=UDim2.new(0,30,0
,4)})NeverLose.PlayAnimate(Icon,vs,{TextTransparency=0.25})Lastone=ItemLabel
else NeverLose.PlayAnimate(Icon,SlowyTween,{TextTransparency=1})NeverLose.
PlayAnimate(ItemLabel,VSlowTween,{TextTransparency=0.5,Position=UDim2.new(0,15,0
,4)})end end MIcon=Icon MarkItem=VisiblewOfMult else local DefaultVisible=
function()if DropdownLib.IsMatch(Value)then NeverLose.PlayAnimate(ItemLabel,
SlowyTween,{TextTransparency=0.2})Lastone=ItemLabel else NeverLose.PlayAnimate(
ItemLabel,SlowyTween,{TextTransparency=0.5})end end MarkItem=DefaultVisible end
MarkItem()table.insert(DropdownLib.Refuse,MarkItem)table.insert(DropdownLib.
Signals,ItemFrame.MouseEnter:Connect(function()NeverLose.PlayAnimate(ItemFrame,
SlowyTween,{BackgroundTransparency=0.1})end))table.insert(DropdownLib.Signals,
ItemFrame.MouseLeave:Connect(function()NeverLose.PlayAnimate(ItemFrame,
SlowyTween,{BackgroundTransparency=1})end))table.insert(DropdownLib.Signals,
DropdownLib.OpenSignal:Connect(function(val)if val then MarkItem()else NeverLose
.PlayAnimate(ItemLabel,SlowyTween,{TextTransparency=1})if MIcon then NeverLose.
PlayAnimate(MIcon,SlowyTween,{TextTransparency=1})end end end))if Config.Multi
then local _,bth_signal=NeverLose:CreateInput(ItemFrame,function()Config.Default
[Value]=not Config.Default[Value]MarkItem()BasedLabel.Text=dropdownSummary()
Config.Callback(Config.Default)end)table.insert(DropdownLib.Signals,bth_signal)
else local _,bth_signal=NeverLose:CreateInput(ItemFrame,function()Config.Default
=Value for i,v in next,DropdownLib.Refuse do task.spawn(v)end BasedLabel.Text=
dropdownSummary()Config.Callback(Config.Default)end)table.insert(DropdownLib.
Signals,bth_signal)end end end if Signal.Picker then Signal.Picker:
RegisterPopup(DropdownLib.BlockRoot,DropdownLib.SetFrameRender,function()return
DropdownLib.OpenSignal:GetValue()end)end DropdownLib:Generate()function
DropdownLib:GetValue()return Config.Default end function DropdownLib:SetValue(v)
Config.Default=v BasedLabel.Text=dropdownSummary()for i,v in next,DropdownLib.
Refuse do task.spawn(v)end Config.Callback(Config.Default)end function
DropdownLib:SetValues(a)Config.Values=a if not Config.AutoUpdate then
DropdownLib:Generate()end BasedLabel.Text=dropdownSummary()end function
DropdownLib:SetDisplayValues(values)Config.DisplayValues=type(values)=='table'
and values or{}DropdownLib:Generate()BasedLabel.Text=dropdownSummary()end if
Config.Flag then NeverLose.Flags[Config.Flag]=DropdownLib end return DropdownLib
end return handle end NeverLose.ProcessDropdown=function(value)if typeof(value)
=='table'then local data={}for i,v in next,value do if typeof(v)=='boolean'and
typeof(i)~='number'then data[i]=v else data[v]=true end end return data else
return value end end NeverLose.ParseDropdown=function(value)if not value then
return'Select'end local Out if typeof(value)=='table'then if#value>0 then local
x={}for i,v in next,value do table.insert(x,tostring(v))end Out=table.concat(x,
' , ')table.clear(x)else local x={}for i,v in next,value do if v==true then
table.insert(x,tostring(i))end end Out=table.concat(x,' , ')table.clear(x)if not
Out:byte()then Out='Select'end end else Out=tostring(value or'Select')end return
Out end function NeverLose:ParseInput(Value,Numeric)if not Value then return(
Numeric and nil)or''end if Numeric then local out=string.gsub(tostring(Value),
'[^0-9.%-]','')if tonumber(out)then return tonumber(out)end return nil end
return Value end function NeverLose:CreateToolTips(Container:Frame,Name:string,
Content:string)local Tooltips=Instance.new('Frame')local UICorner=Instance.new(
'UICorner')local UIStroke=Instance.new('UIStroke')local TooltipName=Instance.
new('TextLabel')local TooltipContent=Instance.new('TextLabel')local Shadow=
NeverLose:CreateShadow(Tooltips)Tooltips.Name=NeverLose.RandomString()Tooltips.
BackgroundColor3=Color3.fromRGB(20,22,27)Tooltips.BackgroundTransparency=0.075
Tooltips.BorderColor3=Color3.fromRGB(0,0,0)Tooltips.BorderSizePixel=0 Tooltips.
ClipsDescendants=true Tooltips.Position=UDim2.new(255,255,255,255)Tooltips.Size=
UDim2.new(0,0,0,0)Tooltips.ZIndex=130 UICorner.CornerRadius=UDim.new(0,10)
UICorner.Parent=Tooltips UIStroke.Transparency=0.65 UIStroke.Color=Color3.
fromRGB(45,48,58)UIStroke.Parent=Tooltips TooltipName.Name=NeverLose.
RandomString()TooltipName.Parent=Tooltips TooltipName.BackgroundColor3=Color3.
fromRGB(255,255,255)TooltipName.BackgroundTransparency=1 TooltipName.
BorderColor3=Color3.fromRGB(0,0,0)TooltipName.BorderSizePixel=0 TooltipName.
Position=UDim2.new(0,15,0,5)TooltipName.Size=UDim2.new(0,1,0,20)TooltipName.
ZIndex=132 TooltipName.Font=Enum.Font.GothamBold TooltipName.Text=Name
TooltipName.TextColor3=Color3.fromRGB(255,255,255)TooltipName.TextSize=15
TooltipName.TextXAlignment=Enum.TextXAlignment.Left TooltipContent.Name=
NeverLose.RandomString()TooltipContent.Parent=Tooltips TooltipContent.
BackgroundColor3=Color3.fromRGB(255,255,255)TooltipContent.
BackgroundTransparency=1 TooltipContent.BorderColor3=Color3.fromRGB(0,0,0)
TooltipContent.BorderSizePixel=0 TooltipContent.Position=UDim2.new(0,15,0,30)
TooltipContent.Size=UDim2.new(0,1,0,15)TooltipContent.ZIndex=132 TooltipContent.
Font=Enum.Font.GothamBold TooltipContent.Text=Content TooltipContent.TextColor3=
Color3.fromRGB(255,255,255)TooltipContent.TextSize=12 TooltipContent.
TextTransparency=0.65 TooltipContent.TextXAlignment=Enum.TextXAlignment.Left
TooltipContent.TextYAlignment=Enum.TextYAlignment.Top local ToolTip={}ToolTip.
Update=function()local SizeName=TextService:GetTextSize(TooltipName.Text,
TooltipName.TextSize,TooltipName.Font,Vector2.new(math.huge,math.huge))local
SizeContent=TextService:GetTextSize(TooltipContent.Text,TooltipContent.TextSize,
TooltipContent.Font,Vector2.new(math.huge,math.huge))local MaxX=math.max(
SizeName.X,SizeContent.X)+65 local MaxY=SizeName.Y+SizeContent.Y+30 NeverLose.
PlayAnimate(Tooltips,SlowyTween,{Size=UDim2.new(0,MaxX,0,MaxY)})end NeverLose:
AddSignal(Tooltips:GetPropertyChangedSignal('BackgroundTransparency'):Connect(
function()if Tooltips.BackgroundTransparency>0.9 then Tooltips.Visible=false
Tooltips.Parent=nil else Tooltips.Visible=true Tooltips.Parent=NeverLose.
ScreenGui end end))ToolTip.SetRender=function(value)if value then Tooltips.
Position=UDim2.fromOffset(Container.AbsolutePosition.X+Container.AbsoluteSize.X,
Container.AbsolutePosition.Y+(Container.AbsoluteSize.Y+25))NeverLose.
PlayAnimate(Tooltips,SlowyTween,{BackgroundTransparency=0.075})NeverLose.
PlayAnimate(UIStroke,SlowyTween,{Transparency=0.65})NeverLose.PlayAnimate(
TooltipName,SlowyTween,{TextTransparency=0})NeverLose.PlayAnimate(TooltipContent
,SlowyTween,{TextTransparency=0.65})ToolTip.Update()Shadow:Render(true)else
NeverLose.PlayAnimate(Tooltips,SlowyTween,{BackgroundTransparency=1})NeverLose.
PlayAnimate(UIStroke,SlowyTween,{Transparency=1})NeverLose.PlayAnimate(
TooltipName,SlowyTween,{TextTransparency=1})NeverLose.PlayAnimate(TooltipContent
,SlowyTween,{TextTransparency=1})Shadow:Render(false)end end ToolTip.SetRender(
false)ToolTip.Update()local DelayThread NeverLose:AddSignal(Container.MouseEnter
:Connect(function()if DelayThread then task.cancel(DelayThread)DelayThread=nil
end DelayThread=task.delay(1,ToolTip.SetRender,true)end))NeverLose:AddSignal(
Container.MouseLeave:Connect(function()if DelayThread then task.cancel(
DelayThread)DelayThread=nil end ToolTip.SetRender(false)ToolTip.Update()end))
return ToolTip end function NeverLose:CreateCaption(parent,text)local label=
Instance.new('TextLabel')label.BackgroundTransparency,label.BorderSizePixel=1,0
label.Font,label.TextSize=Enum.Font.GothamMedium,13 label.TextColor3,label.
TextTransparency=Color3.new(1,1,1),0.35 label.TextXAlignment=Enum.TextXAlignment
.Left label.Text,label.Parent=text or'',parent return label end function
NeverLose:RegisiterItem(Frame:Frame,Signel)local idx={}local LayerIndex=Frame.
ZIndex function idx:AddLabel(Name:string,Warp:boolean)local BasedFrame=Instance.
new('Frame')local BasedLabel=NeverLose:CreateCaption(nil,Name)local LineFrame=
Instance.new('Frame')local BasedHandler=Instance.new('Frame')local UIListLayout=
Instance.new('UIListLayout')local UICorner=Instance.new('UICorner')BasedFrame.
Name=NeverLose.RandomString()BasedFrame.Parent=Frame BasedFrame.BackgroundColor3
=Color3.fromRGB(25,27,33)BasedFrame.BackgroundTransparency=1 BasedFrame.
BorderColor3=Color3.fromRGB(0,0,0)BasedFrame.BorderSizePixel=0 BasedFrame.Size=
UDim2.new(1,0,0,30)BasedFrame.ZIndex=LayerIndex+8 NeverLose:AddQuery(BasedFrame,
Name)BasedLabel.Name=NeverLose.RandomString()BasedLabel.Parent=BasedFrame
BasedLabel.BackgroundColor3=Color3.fromRGB(255,255,255)BasedLabel.
BackgroundTransparency=1 BasedLabel.BorderColor3=Color3.fromRGB(0,0,0)BasedLabel
.BorderSizePixel=0 BasedLabel.Position=UDim2.new(0,11,0,6)BasedLabel.Size=UDim2.
new(0,1,0,15)BasedLabel.ZIndex=LayerIndex+9 BasedLabel.Font=Enum.Font.
GothamMedium BasedLabel.Text=Name BasedLabel.TextColor3=Color3.fromRGB(255,255,
255)BasedLabel.TextSize=13 BasedLabel.TextTransparency=0.35 BasedLabel.
TextXAlignment=Enum.TextXAlignment.Left LineFrame.Name=NeverLose.RandomString()
LineFrame.Parent=BasedFrame LineFrame.AnchorPoint=Vector2.new(0.5,1)LineFrame.
BackgroundColor3=Color3.fromRGB(45,48,58)LineFrame.BackgroundTransparency=0.65
LineFrame.BorderColor3=Color3.fromRGB(0,0,0)LineFrame.BorderSizePixel=0
LineFrame.Position=UDim2.new(0.5,0,1,0)LineFrame.Size=UDim2.new(1,-20,0,1)
LineFrame.ZIndex=LayerIndex+11 BasedHandler.Name=NeverLose.RandomString()
BasedHandler.Parent=BasedFrame BasedHandler.AnchorPoint=Vector2.new(1,0)
BasedHandler.BackgroundColor3=Color3.fromRGB(255,255,255)BasedHandler.
BackgroundTransparency=1 BasedHandler.BorderColor3=Color3.fromRGB(0,0,0)
BasedHandler.BorderSizePixel=0 BasedHandler.Position=UDim2.new(1,-11,0,2)
BasedHandler.Size=UDim2.new(1,-20,0,25)BasedHandler.ZIndex=LayerIndex+12
UIListLayout.Parent=BasedHandler UIListLayout.FillDirection=Enum.FillDirection.
Horizontal UIListLayout.HorizontalAlignment=Enum.HorizontalAlignment.Right
UIListLayout.SortOrder=Enum.SortOrder.LayoutOrder UIListLayout.VerticalAlignment
=Enum.VerticalAlignment.Center UIListLayout.Padding=UDim.new(0,5)UICorner.
CornerRadius=UDim.new(0,10)UICorner.Parent=BasedFrame local UpdateWarp=function(
)local size=TextService:GetTextSize(BasedLabel.Text,BasedLabel.TextSize,
BasedLabel.Font,Vector2.new(math.huge,math.huge))NeverLose.PlayAnimate(
BasedFrame,SlowyTween,{Size=UDim2.new(1,0,0,size.Y+13)})BasedLabel.Size=UDim2.
new(1,-35,1,0)BasedLabel.TextYAlignment=Enum.TextYAlignment.Top end if Warp then
UpdateWarp()end local captionClip=Instance.new('Frame')captionClip.
BackgroundTransparency=1 captionClip.BorderSizePixel=0 captionClip.Position=
UDim2.fromOffset(11,6)captionClip.Size=UDim2.new(1,-22,0,15)captionClip.
ClipsDescendants=true captionClip.ZIndex=BasedLabel.ZIndex captionClip.Parent=
BasedFrame BasedLabel.Parent=captionClip BasedLabel.Position=UDim2.fromOffset(0,
0)local repeatedLabel=BasedLabel:Clone()repeatedLabel.Visible=false
repeatedLabel.Parent=captionClip local hovering,captionEnabled=false,true local
captionTweens={}local captionWidth=0 local CAPTION_GAP,CAPTION_SPEED=24,32 local 
function stopCaption()for index=1,#captionTweens do captionTweens[index]:Cancel(
)end table.clear(captionTweens)BasedLabel.Position=UDim2.fromOffset(0,0)
repeatedLabel.Visible=false end local function refreshCaption()stopCaption()
local available=math.max(0,BasedFrame.AbsoluteSize.X-22)local occupied=
UIListLayout.AbsoluteContentSize.X if occupied>0 then available=math.max(0,
available-occupied-8)end captionWidth=TextService:GetTextSize(BasedLabel.Text,
BasedLabel.TextSize,BasedLabel.Font,Vector2.new(math.huge,math.huge)).X
captionClip.Size=UDim2.fromOffset(available,Warp and math.max(15,BasedFrame.
AbsoluteSize.Y-13)or 15)BasedLabel.Size=UDim2.fromOffset(math.max(available,
captionWidth),15)BasedLabel.TextTruncate=Enum.TextTruncate.None repeatedLabel.
Text=BasedLabel.Text repeatedLabel.Font=BasedLabel.Font repeatedLabel.TextSize=
BasedLabel.TextSize repeatedLabel.TextColor3=BasedLabel.TextColor3 repeatedLabel
.TextTransparency=BasedLabel.TextTransparency repeatedLabel.Size=BasedLabel.Size
if not hovering or not captionEnabled or not BasedFrame.Visible or available<=0
or captionWidth<=available then return end local distance=captionWidth+
CAPTION_GAP repeatedLabel.Position=UDim2.fromOffset(distance,0)repeatedLabel.
Visible=true local info=TweenInfo.new(distance/CAPTION_SPEED,Enum.EasingStyle.
Linear,Enum.EasingDirection.InOut,-1)captionTweens[1]=TweenService:Create(
BasedLabel,info,{Position=UDim2.fromOffset(-distance,0)})captionTweens[2]=
TweenService:Create(repeatedLabel,info,{Position=UDim2.fromOffset(0,0)})
captionTweens[1]:Play()captionTweens[2]:Play()end NeverLose:AddSignal(
captionClip.MouseEnter:Connect(function()hovering=true refreshCaption()end))
NeverLose:AddSignal(captionClip.MouseLeave:Connect(function()hovering=false
stopCaption()end))for _,property in{'Text','TextSize','Font'}do NeverLose:
AddSignal(BasedLabel:GetPropertyChangedSignal(property):Connect(refreshCaption))
end NeverLose:AddSignal(BasedLabel:GetPropertyChangedSignal('TextTransparency'):
Connect(function()repeatedLabel.TextTransparency=BasedLabel.TextTransparency end
))NeverLose:AddSignal(BasedLabel:GetPropertyChangedSignal('TextColor3'):Connect(
function()repeatedLabel.TextColor3=BasedLabel.TextColor3 end))NeverLose:
AddSignal(BasedFrame:GetPropertyChangedSignal('AbsoluteSize'):Connect(
refreshCaption))NeverLose:AddSignal(BasedFrame:GetPropertyChangedSignal(
'Visible'):Connect(function()hovering=false refreshCaption()end))NeverLose:
AddSignal(UIListLayout:GetPropertyChangedSignal('AbsoluteContentSize'):Connect(
refreshCaption))Runtime.Track(stopCaption)refreshCaption()local handle=NeverLose
:RegisiterHandler(BasedHandler,Signel)handle.Root=BasedFrame handle.Label=
BasedLabel handle.CaptionRoot=captionClip handle.SetRender=function(value)
captionEnabled=value if not value then hovering=false end refreshCaption()if
value then NeverLose.PlayAnimate(BasedFrame,SlowyTween,{BackgroundTransparency=1
})NeverLose.PlayAnimate(BasedLabel,SlowyTween,{TextTransparency=0.35})NeverLose.
PlayAnimate(LineFrame,SlowyTween,{BackgroundTransparency=0.65})else NeverLose.
PlayAnimate(BasedFrame,SlowyTween,{BackgroundTransparency=1})NeverLose.
PlayAnimate(BasedLabel,SlowyTween,{TextTransparency=1})NeverLose.PlayAnimate(
LineFrame,SlowyTween,{BackgroundTransparency=1})end end function handle:
SetVisible(val)BasedFrame.Visible=val end NeverLose:AddSignal(BasedFrame.
MouseEnter:Connect(function()NeverLose.PlayAnimate(BasedFrame,SlowyTween,{
BackgroundTransparency=0.35})NeverLose.PlayAnimate(BasedLabel,SlowyTween,{
TextTransparency=0.25})end))NeverLose:AddSignal(BasedFrame.MouseLeave:Connect(
function()NeverLose.PlayAnimate(BasedFrame,SlowyTween,{BackgroundTransparency=1}
)NeverLose.PlayAnimate(BasedLabel,SlowyTween,{TextTransparency=0.35})end))
function handle:SetText(t)local oldtxt=BasedLabel.Text BasedLabel.Text=t if Warp
and oldtxt~=t then UpdateWarp()end end function handle:ToolTip(Content:string)
handle.ToolTip=NeverLose:CreateToolTips(BasedFrame,Name,Content)return handle
end handle.SetRender(Signel:GetValue())Signel:Connect(handle.SetRender)return
handle end function idx:AddButton(Config)Config=NeverLose:ProcessParams(Config,{
Icon='chevron-large-left',Name='Button',Callback=EmptyFunction,ToolTip=nil,
Compact=false})local Button={}local ButtonFrame=Instance.new(Config.Compact and
'TextButton'or'Frame')local BasedLabel=NeverLose:CreateCaption(nil,Config.Name)
local LineFrame=Instance.new('Frame')local UICorner=Instance.new('UICorner')
local Icon=Instance.new('TextLabel')Button.Root=ButtonFrame Button.Label=
BasedLabel Button.Icon=Icon if not Config.Compact then NeverLose:AddQuery(
ButtonFrame,Config.Name)end ButtonFrame.Name=NeverLose.RandomString()ButtonFrame
.Parent=Frame ButtonFrame.BackgroundColor3=Color3.fromRGB(25,27,33)ButtonFrame.
BackgroundTransparency=1 ButtonFrame.BorderColor3=Color3.fromRGB(0,0,0)
ButtonFrame.BorderSizePixel=0 ButtonFrame.Size=UDim2.new(1,0,0,30)ButtonFrame.
ZIndex=LayerIndex+8 BasedLabel.Name=NeverLose.RandomString()BasedLabel.Parent=
ButtonFrame BasedLabel.BackgroundColor3=Color3.fromRGB(255,255,255)BasedLabel.
BackgroundTransparency=1 BasedLabel.BorderColor3=Color3.fromRGB(0,0,0)BasedLabel
.BorderSizePixel=0 BasedLabel.Position=UDim2.new(0,35,0,6)BasedLabel.Size=UDim2.
new(0,1,0,15)BasedLabel.ZIndex=LayerIndex+9 BasedLabel.Font=Enum.Font.
GothamMedium BasedLabel.Text=Config.Name BasedLabel.TextColor3=Color3.fromRGB(
255,255,255)BasedLabel.TextSize=13 BasedLabel.TextTransparency=0.2 BasedLabel.
TextXAlignment=Enum.TextXAlignment.Left LineFrame.Name=NeverLose.RandomString()
LineFrame.Parent=ButtonFrame LineFrame.AnchorPoint=Vector2.new(0.5,1)LineFrame.
BackgroundColor3=Color3.fromRGB(45,48,58)LineFrame.BackgroundTransparency=0.65
LineFrame.BorderColor3=Color3.fromRGB(0,0,0)LineFrame.BorderSizePixel=0
LineFrame.Position=UDim2.new(0.5,0,1,0)LineFrame.Size=UDim2.new(1,-20,0,1)
LineFrame.ZIndex=LayerIndex+11 UICorner.CornerRadius=UDim.new(0,10)UICorner.
Parent=ButtonFrame Icon.Name=NeverLose.RandomString()Icon.Parent=ButtonFrame
Icon.BackgroundColor3=Color3.fromRGB(255,255,255)Icon.BackgroundTransparency=1
Icon.BorderColor3=Color3.fromRGB(0,0,0)Icon.BorderSizePixel=0 Icon.Position=
UDim2.new(0,11,0,5)Icon.Size=UDim2.new(0,18,0,18)Icon.ZIndex=LayerIndex+9 Icon.
FontFace=NeverLose.BuiltInBold Icon.Text=Config.Icon Icon.TextColor3=Color3.
fromRGB(223,223,223)Icon.TextSize=16 Icon.TextTransparency=0.25 Icon.TextWrapped
=true function Button:SetText(t)BasedLabel.Text=t end function Button:SetIcon(t)
Icon.Text=t end function Button:SetVisible(value)ButtonFrame.Visible=value end
local bth if Config.Compact then ButtonFrame.Text,ButtonFrame.TextTransparency=
Config.Name,1 ButtonFrame.AutoButtonColor=false Icon.Visible,LineFrame.Visible=
false,false BasedLabel.Position,BasedLabel.Size=UDim2.fromOffset(0,0),UDim2.
fromScale(1,1)BasedLabel.TextXAlignment=Enum.TextXAlignment.Center bth=
ButtonFrame NeverLose:AddSignal(bth.MouseButton1Click:Connect(Config.Callback))
NeverLose:AddSignal(ButtonFrame:GetPropertyChangedSignal('Text'):Connect(
function()BasedLabel.Text=ButtonFrame.Text end))for _,property in{'TextSize',
'Font','TextColor3','TextXAlignment','TextYAlignment'}do NeverLose:AddSignal(
ButtonFrame:GetPropertyChangedSignal(property):Connect(function()BasedLabel[
property]=ButtonFrame[property]end))end else bth=NeverLose:CreateInput(
ButtonFrame,function()Config.Callback()end)end Button.Input=bth NeverLose:
AddSignal(bth.MouseEnter:Connect(function()NeverLose.PlayAnimate(ButtonFrame,
SlowyTween,{BackgroundTransparency=0.35})end))NeverLose:AddSignal(bth.MouseLeave
:Connect(function()NeverLose.PlayAnimate(ButtonFrame,SlowyTween,{
BackgroundTransparency=Config.Compact and ButtonFrame:GetAttribute('Selected')
and 0.35 or 1})end))Button.SetRender=function(value)if value then NeverLose.
PlayAnimate(ButtonFrame,SlowyTween,{BackgroundTransparency=1})NeverLose.
PlayAnimate(BasedLabel,SlowyTween,{TextTransparency=0.2})NeverLose.PlayAnimate(
LineFrame,SlowyTween,{BackgroundTransparency=0.65})NeverLose.PlayAnimate(Icon,
SlowyTween,{TextTransparency=0.25})else NeverLose.PlayAnimate(ButtonFrame,
SlowyTween,{BackgroundTransparency=1})NeverLose.PlayAnimate(BasedLabel,
SlowyTween,{TextTransparency=1})NeverLose.PlayAnimate(LineFrame,SlowyTween,{
BackgroundTransparency=1})NeverLose.PlayAnimate(Icon,SlowyTween,{
TextTransparency=1})end end if Config.ToolTip then Button.ToolTip=NeverLose:
CreateToolTips(ButtonFrame,Config.Name,Config.ToolTip)end Button.SetRender(
Signel:GetValue())Signel:Connect(Button.SetRender)return Button end function idx
:AddUserFrame(Name:string,Profile:string,Expires:string)local UserFrame=Instance
.new('Frame')local UserLabel=Instance.new('TextLabel')local LineFrame=Instance.
new('Frame')local UICorner=Instance.new('UICorner')local LogoImage=Instance.new(
'ImageLabel')local UICorner_2=Instance.new('UICorner')local UserStatusLabel=
Instance.new('TextLabel')UserFrame.Name=NeverLose.RandomString()UserFrame.Parent
=Frame UserFrame.BackgroundColor3=Color3.fromRGB(25,27,33)UserFrame.
BackgroundTransparency=1 UserFrame.BorderColor3=Color3.fromRGB(0,0,0)UserFrame.
BorderSizePixel=0 UserFrame.Size=UDim2.new(1,0,0,60)UserFrame.ZIndex=LayerIndex+
8 UserLabel.Name=NeverLose.RandomString()UserLabel.Parent=UserFrame UserLabel.
BackgroundColor3=Color3.fromRGB(255,255,255)UserLabel.BackgroundTransparency=1
UserLabel.BorderColor3=Color3.fromRGB(0,0,0)UserLabel.BorderSizePixel=0
UserLabel.Position=UDim2.new(0,65,0,10)UserLabel.Size=UDim2.new(1,-35,0,15)
UserLabel.ZIndex=LayerIndex+9 UserLabel.Font=Enum.Font.GothamMedium UserLabel.
Text=Name or'User'UserLabel.TextColor3=Color3.fromRGB(255,255,255)UserLabel.
TextSize=13 UserLabel.TextTransparency=0.2 UserLabel.TextXAlignment=Enum.
TextXAlignment.Left LineFrame.Name=NeverLose.RandomString()LineFrame.Parent=
UserFrame LineFrame.AnchorPoint=Vector2.new(0.5,1)LineFrame.BackgroundColor3=
Color3.fromRGB(45,48,58)LineFrame.BackgroundTransparency=0.65 LineFrame.
BorderColor3=Color3.fromRGB(0,0,0)LineFrame.BorderSizePixel=0 LineFrame.Position
=UDim2.new(0.5,0,1,0)LineFrame.Size=UDim2.new(1,-20,0,1)LineFrame.ZIndex=
LayerIndex+11 UICorner.CornerRadius=UDim.new(0,10)UICorner.Parent=UserFrame
LogoImage.Name=NeverLose.RandomString()LogoImage.Parent=UserFrame LogoImage.
BackgroundColor3=Color3.fromRGB(255,255,255)LogoImage.BackgroundTransparency=1
LogoImage.BorderColor3=Color3.fromRGB(0,0,0)LogoImage.BorderSizePixel=0
LogoImage.Position=UDim2.new(0,10,0,5)LogoImage.Size=UDim2.new(0,45,0,45)
LogoImage.ZIndex=LayerIndex+9 LogoImage.Image=Profile or
'rbxasset://textures/ui/clb_robux_20@3x.png'UICorner_2.CornerRadius=UDim.new(1,0
)UICorner_2.Parent=LogoImage UserStatusLabel.Name=NeverLose.RandomString()
UserStatusLabel.Parent=UserFrame UserStatusLabel.BackgroundColor3=Color3.
fromRGB(255,255,255)UserStatusLabel.BackgroundTransparency=1 UserStatusLabel.
BorderColor3=Color3.fromRGB(0,0,0)UserStatusLabel.BorderSizePixel=0
UserStatusLabel.Position=UDim2.new(0,65,0,25)UserStatusLabel.Size=UDim2.new(1,-
35,0,15)UserStatusLabel.ZIndex=LayerIndex+9 UserStatusLabel.Font=Enum.Font.
GothamMedium UserStatusLabel.Text=Expires or'Never'UserStatusLabel.TextColor3=
Color3.fromRGB(255,255,255)UserStatusLabel.TextSize=13 UserStatusLabel.
TextTransparency=0.2 UserStatusLabel.TextXAlignment=Enum.TextXAlignment.Left
local UserFrameItem={}UserFrameItem.SetRender=function(value)if value then
NeverLose.PlayAnimate(UserLabel,SlowyTween,{TextTransparency=0.2})NeverLose.
PlayAnimate(LineFrame,SlowyTween,{BackgroundTransparency=0.65})NeverLose.
PlayAnimate(LogoImage,SlowyTween,{ImageTransparency=0})NeverLose.PlayAnimate(
UserStatusLabel,SlowyTween,{TextTransparency=0.2})else NeverLose.PlayAnimate(
UserLabel,SlowyTween,{TextTransparency=1})NeverLose.PlayAnimate(LineFrame,
SlowyTween,{BackgroundTransparency=1})NeverLose.PlayAnimate(LogoImage,SlowyTween
,{ImageTransparency=1})NeverLose.PlayAnimate(UserStatusLabel,SlowyTween,{
TextTransparency=1})end end UserFrameItem.SetRender(Signel:GetValue())Signel:
Connect(UserFrameItem.SetRender)function UserFrameItem:SetUsername(name)
UserLabel.Text=name or'User'end function UserFrameItem:SetProfile(Profile)
LogoImage.Image=Profile or'rbxasset://textures/ui/clb_robux_20@3x.png'end
function UserFrameItem:SetExpires(Exp)UserStatusLabel.Text=Exp or'Never'end
return UserFrameItem end return idx end function NeverLose:CreateWindow(Config)
Config=NeverLose:ProcessParams(Config,{Logo=NeverLose.GlobalLogo,Name=
'Neverlose',Content='Counter-Strike 2',Size=UDim2.new(0,640,0,480),ConfigFolder=
'NeverLoseConfigs',Keybind='Insert'})local Window={Logo=Config.Logo,Name=Config.
Name,Content=Config.Content,Size=Config.Size,ConfigFolder=Config.ConfigFolder,
Signal=NeverLose:CreateSignal(true),Tabs={},CurrentTab=1,Keybind=Config.Keybind}
NeverLose.GlobalLogo=Window.Logo local Logging=NeverLose:CreateLogger()if not
isfolder(Window.ConfigFolder)then makefolder(Window.ConfigFolder)end local
WindowFrame=Instance.new('Frame')local UICorner=Instance.new('UICorner')local
LeftMenuFrame=Instance.new('Frame')local HeadFrame=Instance.new('Frame')local
LogoImage=Instance.new('ImageLabel')local HideButton=Instance.new('TextButton')
local showFloatingOnHide=false local UICorner_2=Instance.new('UICorner')local
WindowName=Instance.new('TextLabel')local WindowContent=Instance.new('TextLabel'
)local LineFrame=Instance.new('Frame')local LeftScrollingFrame=Instance.new(
'ScrollingFrame')local UIListLayout=Instance.new('UIListLayout')local
BottomFrame=Instance.new('Frame')local AccountProfile=Instance.new('ImageLabel')
local UICorner_3=Instance.new('UICorner')local AccountName=Instance.new(
'TextLabel')local ExpireLabel=Instance.new('TextLabel')local LineFrame_2=
Instance.new('Frame')local UserSettingButton=Instance.new('TextLabel')local
RightMenuFrame=Instance.new('Frame')local UIStroke=Instance.new('UIStroke')local
UICorner_4=Instance.new('UICorner')local RightHeader=Instance.new('Frame')local
LineFrame_3=Instance.new('Frame')local ConfigFrame=Instance.new('Frame')local
UIStroke_2=Instance.new('UIStroke')local UICorner_5=Instance.new('UICorner')
local ConfigIcon=Instance.new('TextLabel')local LineFrame_4=Instance.new('Frame'
)local ConfigName=Instance.new('TextLabel')local ConfigBthIcon=Instance.new(
'TextLabel')local SearchFrame=Instance.new('Frame')local SearchIcon=Instance.
new('TextLabel')local SearchBox=Instance.new('TextBox')local TabContainer=
Instance.new('Frame')WindowFrame.Name=NeverLose.RandomString()WindowFrame.Parent
=NeverLose.ScreenGui WindowFrame.AnchorPoint=Vector2.new(0.5,0.5)WindowFrame.
BackgroundColor3=Color3.fromRGB(8,8,13)WindowFrame.BackgroundTransparency=0.055
WindowFrame.BorderColor3=Color3.fromRGB(0,0,0)WindowFrame.BorderSizePixel=0
WindowFrame.ClipsDescendants=true WindowFrame.Position=UDim2.new(255,0,255,0)
WindowFrame.Size=Window.Size WindowFrame.Active=true Window.Root=WindowFrame if
not NeverLose.EnabledBlur then WindowFrame.BackgroundTransparency=0.0255 end
local renderParentWindow=function()if WindowFrame.BackgroundTransparency>0.9
then WindowFrame.Visible=false WindowFrame.Parent=nil else WindowFrame.Visible=
true WindowFrame.Parent=NeverLose.ScreenGui end end NeverLose:AddSignal(
WindowFrame:GetPropertyChangedSignal('BackgroundTransparency'):Connect(
renderParentWindow))Window.SetRender=function(self,value)if value then NeverLose
.PlayAnimate(WindowFrame,SlowyTween,{BackgroundTransparency=(NeverLose.
EnabledBlur and 0.055)or 0.0255,Size=Window.Size})NeverLose.PlayAnimate(
LogoImage,SlowyTween,{ImageTransparency=0})NeverLose.PlayAnimate(HideButton,
SlowyTween,{TextTransparency=0})NeverLose.PlayAnimate(WindowName,SlowyTween,{
TextTransparency=0})NeverLose.PlayAnimate(WindowContent,SlowyTween,{
TextTransparency=0.65})NeverLose.PlayAnimate(LineFrame,SlowyTween,{
BackgroundTransparency=0.65})NeverLose.PlayAnimate(AccountProfile,SlowyTween,{
ImageTransparency=0})NeverLose.PlayAnimate(AccountName,SlowyTween,{
TextTransparency=0})NeverLose.PlayAnimate(ExpireLabel,SlowyTween,{
TextTransparency=0.65})NeverLose.PlayAnimate(LineFrame_2,SlowyTween,{
BackgroundTransparency=0.65})NeverLose.PlayAnimate(UserSettingButton,SlowyTween,
{TextTransparency=0.5})NeverLose.PlayAnimate(RightMenuFrame,SlowyTween,{
BackgroundTransparency=0.6})NeverLose.PlayAnimate(UIStroke,SlowyTween,{
Transparency=0.65})NeverLose.PlayAnimate(LineFrame_3,SlowyTween,{
BackgroundTransparency=0.65})NeverLose.PlayAnimate(ConfigFrame,SlowyTween,{
BackgroundTransparency=0.75})NeverLose.PlayAnimate(UIStroke_2,SlowyTween,{
Transparency=0.65})NeverLose.PlayAnimate(ConfigIcon,SlowyTween,{TextTransparency
=0.25})NeverLose.PlayAnimate(LineFrame_4,SlowyTween,{BackgroundTransparency=0.65
})NeverLose.PlayAnimate(ConfigName,SlowyTween,{TextTransparency=0.35})NeverLose.
PlayAnimate(ConfigBthIcon,SlowyTween,{TextTransparency=0.25})NeverLose.
PlayAnimate(SearchIcon,SlowyTween,{TextTransparency=0.25})NeverLose.PlayAnimate(
SearchBox,SlowyTween,{TextTransparency=0.35})Window.Shadow:Render(true)else
NeverLose.PlayAnimate(WindowFrame,SlowyTween,{BackgroundTransparency=1,Size=
Window.Size+UDim2.fromOffset(-15,-15)})NeverLose.PlayAnimate(LogoImage,
SlowyTween,{ImageTransparency=1})NeverLose.PlayAnimate(HideButton,SlowyTween,{
TextTransparency=1})NeverLose.PlayAnimate(WindowName,SlowyTween,{
TextTransparency=1})NeverLose.PlayAnimate(WindowContent,SlowyTween,{
TextTransparency=1})NeverLose.PlayAnimate(LineFrame,SlowyTween,{
BackgroundTransparency=1})NeverLose.PlayAnimate(AccountProfile,SlowyTween,{
ImageTransparency=1})NeverLose.PlayAnimate(AccountName,SlowyTween,{
TextTransparency=1})NeverLose.PlayAnimate(ExpireLabel,SlowyTween,{
TextTransparency=1})NeverLose.PlayAnimate(LineFrame_2,SlowyTween,{
BackgroundTransparency=1})NeverLose.PlayAnimate(UserSettingButton,SlowyTween,{
TextTransparency=1})NeverLose.PlayAnimate(RightMenuFrame,SlowyTween,{
BackgroundTransparency=1})NeverLose.PlayAnimate(UIStroke,SlowyTween,{
Transparency=1})NeverLose.PlayAnimate(LineFrame_3,SlowyTween,{
BackgroundTransparency=1})NeverLose.PlayAnimate(ConfigFrame,SlowyTween,{
BackgroundTransparency=1})NeverLose.PlayAnimate(UIStroke_2,SlowyTween,{
Transparency=1})NeverLose.PlayAnimate(ConfigIcon,SlowyTween,{TextTransparency=1}
)NeverLose.PlayAnimate(LineFrame_4,SlowyTween,{BackgroundTransparency=1})
NeverLose.PlayAnimate(ConfigName,SlowyTween,{TextTransparency=1})NeverLose.
PlayAnimate(ConfigBthIcon,SlowyTween,{TextTransparency=1})NeverLose.PlayAnimate(
SearchIcon,SlowyTween,{TextTransparency=1})NeverLose.PlayAnimate(SearchBox,
SlowyTween,{TextTransparency=1})Window.Shadow:Render(false)end end Window.Shadow
=NeverLose:CreateShadow(WindowFrame)Window.Shadow:Render(false)NeverLose:
AddSignal(Window.Signal:Connect(function(value)Window:SetRender(value)end))task.
delay(0.25,function()WindowFrame.Position=UDim2.new(0.5,0,0.5,0)Window:
SetRender(Window.Signal:GetValue())end)if NeverLose.EnabledBlur then NeverLose:
CreateBlurModule(WindowFrame,Window.Signal)end do local Frame=Instance.new(
'Frame')Frame.Parent=WindowFrame Frame.BackgroundColor3=Color3.fromRGB(255,255,
255)Frame.BorderColor3=Color3.fromRGB(0,0,0)Frame.BorderSizePixel=0 Frame.Size=
UDim2.new(1,0,0,50)Frame.ZIndex=7 Frame.BackgroundTransparency=1 NeverLose.Drag(
Frame,WindowFrame,0.15)end UICorner.Parent=WindowFrame LeftMenuFrame.Name=
NeverLose.RandomString()LeftMenuFrame.Parent=WindowFrame LeftMenuFrame.
BackgroundColor3=Color3.fromRGB(255,255,255)LeftMenuFrame.BackgroundTransparency
=1 LeftMenuFrame.BorderColor3=Color3.fromRGB(0,0,0)LeftMenuFrame.BorderSizePixel
=0 LeftMenuFrame.Size=UDim2.new(0,175,1,0)HeadFrame.Name=NeverLose.RandomString(
)HeadFrame.Parent=LeftMenuFrame HeadFrame.BackgroundColor3=Color3.fromRGB(255,
255,255)HeadFrame.BackgroundTransparency=1 HeadFrame.BorderColor3=Color3.
fromRGB(0,0,0)HeadFrame.BorderSizePixel=0 HeadFrame.Size=UDim2.new(1,0,0,50)
HeadFrame.ZIndex=7 LogoImage.Name=NeverLose.RandomString()LogoImage.Parent=
HeadFrame LogoImage.AnchorPoint=Vector2.new(0,0.5)LogoImage.BackgroundColor3=
Color3.fromRGB(255,255,255)LogoImage.BackgroundTransparency=1 LogoImage.
BorderColor3=Color3.fromRGB(0,0,0)LogoImage.BorderSizePixel=0 LogoImage.Position
=UDim2.new(0,10,0.5,0)LogoImage.Size=UDim2.new(0,35,0,35)LogoImage.ZIndex=9
LogoImage.Image=Window.Logo or NeverLose.GlobalLogo or
'rbxasset://textures/ui/VerifiedBadgeNameIcon.png'LogoImage.ImageTransparency=0
UICorner_2.CornerRadius=UDim.new(0,7)UICorner_2.Parent=LogoImage local floating=
Instance.new('TextButton')floating.Name='MoonFloatingButton'floating.Parent=
NeverLose.ScreenGui floating.Size=UDim2.fromOffset(35,35)floating.Position=UDim2
.fromOffset(20,120)floating.BackgroundColor3=Color3.fromRGB(20,22,27)floating.
BackgroundTransparency=0.05 floating.BorderSizePixel=0 floating.AutoButtonColor=
false floating.Text='Moon'floating.Font=Enum.Font.GothamBold floating.TextSize=
10 floating.TextColor3=Color3.new(1,1,1)floating.ZIndex=200 floating.Visible=
false local floatingCorner=Instance.new('UICorner')floatingCorner.CornerRadius=
UDim.new(0,7)floatingCorner.Parent=floating local dragInput,dragStart,
dragPosition,dragged local dragGeneration=0 NeverLose:AddSignal(floating.
InputBegan:Connect(function(input)if input.UserInputType==Enum.UserInputType.
MouseButton1 or input.UserInputType==Enum.UserInputType.Touch then
dragGeneration+=1 dragInput,dragStart,dragPosition,dragged=input,input.Position,
floating.Position,false end end))NeverLose:AddSignal(UserInputService.
InputChanged:Connect(function(input)if not dragInput or not(input==dragInput or(
dragInput.UserInputType==Enum.UserInputType.MouseButton1 and input.UserInputType
==Enum.UserInputType.MouseMovement))then return end local delta=input.Position-
dragStart if not dragged and Vector2.new(delta.X,delta.Y).Magnitude<6 then
return end dragged=true local size=NeverLose.ScreenGui.AbsoluteSize local x=math
.clamp(dragPosition.X.Offset+delta.X,0,math.max(0,size.X-floating.AbsoluteSize.X
))local y=math.clamp(dragPosition.Y.Offset+delta.Y,0,math.max(0,size.Y-floating.
AbsoluteSize.Y))floating.Position=UDim2.fromOffset(x,y)end))NeverLose:AddSignal(
UserInputService.InputEnded:Connect(function(input)if input~=dragInput then
return end dragInput=nil local generation=dragGeneration task.delay(0.1,function
()if not dragInput and dragGeneration==generation then dragged=false end end)end
))NeverLose:AddSignal(floating.Activated:Connect(function()if not dragged and
not Window.Signal:GetValue()then Window:ToggleInterface()end end))NeverLose:
AddSignal(Window.Signal:Connect(function(visible)floating.Visible=not visible
and showFloatingOnHide end))WindowName.Name=NeverLose.RandomString()WindowName.
Parent=HeadFrame WindowName.BackgroundColor3=Color3.fromRGB(255,255,255)
WindowName.BackgroundTransparency=1 WindowName.BorderColor3=Color3.fromRGB(0,0,0
)WindowName.BorderSizePixel=0 WindowName.Position=UDim2.new(0,55,0,4)WindowName.
Size=UDim2.new(0,200,0,25)WindowName.ZIndex=7 WindowName.Font=Enum.Font.
GothamBold WindowName.Text=Window.Name WindowName.TextColor3=Color3.fromRGB(255,
255,255)WindowName.TextSize=18 WindowName.TextXAlignment=Enum.TextXAlignment.
Left WindowContent.Name=NeverLose.RandomString()WindowContent.Parent=HeadFrame
WindowContent.BackgroundColor3=Color3.fromRGB(255,255,255)WindowContent.
BackgroundTransparency=1 WindowContent.BorderColor3=Color3.fromRGB(0,0,0)
WindowContent.BorderSizePixel=0 WindowContent.Position=UDim2.new(0,55,0,25)
WindowContent.Size=UDim2.new(0,200,0,15)WindowContent.ZIndex=7 WindowContent.
Font=Enum.Font.GothamBold WindowContent.Text=Window.Content WindowContent.
TextColor3=Color3.fromRGB(255,255,255)WindowContent.TextSize=9 WindowContent.
TextTransparency=0.65 WindowContent.TextXAlignment=Enum.TextXAlignment.Left
LineFrame.Name=NeverLose.RandomString()LineFrame.Parent=HeadFrame LineFrame.
AnchorPoint=Vector2.new(0.5,1)LineFrame.BackgroundColor3=Color3.fromRGB(45,48,58
)LineFrame.BackgroundTransparency=0.65 LineFrame.BorderColor3=Color3.fromRGB(0,0
,0)LineFrame.BorderSizePixel=0 LineFrame.Position=UDim2.new(0.5,0,1,0)LineFrame.
Size=UDim2.new(1,-10,0,1)LineFrame.ZIndex=5 LeftScrollingFrame.Name=NeverLose.
RandomString()LeftScrollingFrame.Parent=LeftMenuFrame LeftScrollingFrame.Active=
true LeftScrollingFrame.AnchorPoint=Vector2.new(0.5,0)LeftScrollingFrame.
BackgroundColor3=Color3.fromRGB(255,255,255)LeftScrollingFrame.
BackgroundTransparency=1 LeftScrollingFrame.BorderColor3=Color3.fromRGB(0,0,0)
LeftScrollingFrame.BorderSizePixel=0 LeftScrollingFrame.Position=UDim2.new(0.5,0
,0,60)LeftScrollingFrame.Size=UDim2.new(1,-10,1,-115)LeftScrollingFrame.ZIndex=7
LeftScrollingFrame.ScrollBarThickness=0 UIListLayout.Parent=LeftScrollingFrame
UIListLayout.HorizontalAlignment=Enum.HorizontalAlignment.Center UIListLayout.
SortOrder=Enum.SortOrder.LayoutOrder UIListLayout.Padding=UDim.new(0,5)NeverLose
:AddSignal(UIListLayout:GetPropertyChangedSignal('AbsoluteContentSize'):Connect(
function()LeftScrollingFrame.CanvasSize=UDim2.fromOffset(0,UIListLayout.
AbsoluteContentSize.Y+1)end))BottomFrame.Name=NeverLose.RandomString()
BottomFrame.Parent=LeftMenuFrame BottomFrame.AnchorPoint=Vector2.new(0,1)
BottomFrame.BackgroundColor3=Color3.fromRGB(255,255,255)BottomFrame.
BackgroundTransparency=1 BottomFrame.BorderColor3=Color3.fromRGB(0,0,0)
BottomFrame.BorderSizePixel=0 BottomFrame.Position=UDim2.new(0,0,1,0)BottomFrame
.Size=UDim2.new(1,0,0,50)BottomFrame.ZIndex=7 AccountProfile.Name=NeverLose.
RandomString()AccountProfile.Parent=BottomFrame AccountProfile.AnchorPoint=
Vector2.new(0,0.5)AccountProfile.BackgroundColor3=Color3.fromRGB(255,255,255)
AccountProfile.BackgroundTransparency=1 AccountProfile.BorderColor3=Color3.
fromRGB(0,0,0)AccountProfile.BorderSizePixel=0 AccountProfile.Position=UDim2.
new(0,10,0.5,0)AccountProfile.Size=UDim2.new(0,35,0,35)AccountProfile.ZIndex=7
AccountProfile.Image=NeverLose.UserProfile or''UICorner_3.CornerRadius=UDim.new(
1,0)UICorner_3.Parent=AccountProfile AccountName.Name=NeverLose.RandomString()
AccountName.Parent=BottomFrame AccountName.BackgroundColor3=Color3.fromRGB(255,
255,255)AccountName.BackgroundTransparency=1 AccountName.BorderColor3=Color3.
fromRGB(0,0,0)AccountName.BorderSizePixel=0 AccountName.Position=UDim2.new(0,55,
0,5)AccountName.Size=UDim2.new(0,100,0,25)AccountName.ZIndex=7 AccountName.Font=
Enum.Font.GothamBold AccountName.Text=''AccountName.TextColor3=Color3.fromRGB(
255,255,255)AccountName.TextSize=14 AccountName.TextXAlignment=Enum.
TextXAlignment.Left AccountName.TextTruncate=Enum.TextTruncate.SplitWord
ExpireLabel.Name=NeverLose.RandomString()ExpireLabel.Parent=BottomFrame
ExpireLabel.BackgroundColor3=Color3.fromRGB(255,255,255)ExpireLabel.
BackgroundTransparency=1 ExpireLabel.BorderColor3=Color3.fromRGB(0,0,0)
ExpireLabel.BorderSizePixel=0 ExpireLabel.Position=UDim2.new(0,55,0,25)
ExpireLabel.Size=UDim2.new(0,200,0,15)ExpireLabel.ZIndex=7 ExpireLabel.Font=Enum
.Font.GothamBold ExpireLabel.Text='never'ExpireLabel.TextColor3=Color3.fromRGB(
255,255,255)ExpireLabel.TextSize=10 ExpireLabel.TextTransparency=0.65
ExpireLabel.TextXAlignment=Enum.TextXAlignment.Left LineFrame_2.Name=NeverLose.
RandomString()LineFrame_2.Parent=BottomFrame LineFrame_2.AnchorPoint=Vector2.
new(0.5,0)LineFrame_2.BackgroundColor3=Color3.fromRGB(45,48,58)LineFrame_2.
BackgroundTransparency=0.65 LineFrame_2.BorderColor3=Color3.fromRGB(0,0,0)
LineFrame_2.BorderSizePixel=0 LineFrame_2.Position=UDim2.new(0.5,0,0,0)
LineFrame_2.Size=UDim2.new(1,-10,0,1)LineFrame_2.ZIndex=5 UserSettingButton.Name
=NeverLose.RandomString()UserSettingButton.Parent=BottomFrame UserSettingButton.
AnchorPoint=Vector2.new(1,0.5)UserSettingButton.BackgroundColor3=Color3.fromRGB(
255,255,255)UserSettingButton.BackgroundTransparency=1 UserSettingButton.
BorderColor3=Color3.fromRGB(0,0,0)UserSettingButton.BorderSizePixel=0
UserSettingButton.Position=UDim2.new(1,-7,0.5,0)UserSettingButton.Size=UDim2.
new(0,25,0,25)UserSettingButton.ZIndex=7 UserSettingButton.FontFace=NeverLose.
BuiltInBold UserSettingButton.Text='chevron-large-right'UserSettingButton.
TextColor3=Color3.fromRGB(255,255,255)UserSettingButton.TextSize=13
UserSettingButton.TextTransparency=0.5 NeverLose:AddSignal(BottomFrame.
MouseEnter:Connect(function()NeverLose.PlayAnimate(UserSettingButton,SlowyTween,
{TextTransparency=0.25})end))NeverLose:AddSignal(BottomFrame.MouseLeave:Connect(
function()NeverLose.PlayAnimate(UserSettingButton,SlowyTween,{TextTransparency=
0.5})end))RightMenuFrame.Name=NeverLose.RandomString()RightMenuFrame.Parent=
WindowFrame RightMenuFrame.BackgroundColor3=Color3.fromRGB(8,8,13)RightMenuFrame
.BackgroundTransparency=0.6 RightMenuFrame.BorderColor3=Color3.fromRGB(0,0,0)
RightMenuFrame.BorderSizePixel=0 RightMenuFrame.ClipsDescendants=true
RightMenuFrame.Position=UDim2.new(0,176,0,0)RightMenuFrame.Size=UDim2.new(1,-176
,1,0)RightMenuFrame.ZIndex=8 UIStroke.Transparency=0.65 UIStroke.Color=Color3.
fromRGB(45,48,58)UIStroke.Parent=RightMenuFrame UICorner_4.CornerRadius=UDim.
new(0,13)UICorner_4.Parent=RightMenuFrame RightHeader.Name=NeverLose.
RandomString()RightHeader.Parent=RightMenuFrame RightHeader.BackgroundColor3=
Color3.fromRGB(255,255,255)RightHeader.BackgroundTransparency=1 RightHeader.
BorderColor3=Color3.fromRGB(0,0,0)RightHeader.BorderSizePixel=0 RightHeader.Size
=UDim2.new(1,0,0,50)RightHeader.ZIndex=9 HideButton.Name='HideMenuButton'
HideButton.Parent=RightHeader HideButton.AnchorPoint=Vector2.new(1,0.5)
HideButton.Position=UDim2.new(1,-10,0.5,0)HideButton.Size=UDim2.fromOffset(30,30
)HideButton.BackgroundTransparency=1 HideButton.BorderSizePixel=0 HideButton.
AutoButtonColor=false HideButton.Font=Enum.Font.GothamMedium HideButton.Text=
'\u{2212}'HideButton.TextSize=26 HideButton.TextColor3=NeverLose.IconColor
HideButton.ZIndex=12 NeverLose:AddSignal(HideButton.Activated:Connect(function()
Window:ToggleInterface(true)end))LineFrame_3.Name=NeverLose.RandomString()
LineFrame_3.Parent=RightHeader LineFrame_3.AnchorPoint=Vector2.new(0.5,1)
LineFrame_3.BackgroundColor3=Color3.fromRGB(45,48,58)LineFrame_3.
BackgroundTransparency=0.65 LineFrame_3.BorderColor3=Color3.fromRGB(0,0,0)
LineFrame_3.BorderSizePixel=0 LineFrame_3.Position=UDim2.new(0.5,0,1,0)
LineFrame_3.Size=UDim2.new(1,-10,0,1)LineFrame_3.ZIndex=9 ConfigFrame.Name=
NeverLose.RandomString()ConfigFrame.Parent=RightHeader ConfigFrame.AnchorPoint=
Vector2.new(0,0.5)ConfigFrame.BackgroundColor3=Color3.fromRGB(13,17,22)
ConfigFrame.BackgroundTransparency=0.75 ConfigFrame.BorderColor3=Color3.fromRGB(
0,0,0)ConfigFrame.BorderSizePixel=0 ConfigFrame.Position=UDim2.new(0,10,0.5,0)
ConfigFrame.Size=UDim2.new(0,115,0,30)ConfigFrame.ZIndex=9 UIStroke_2.
Transparency=0.65 UIStroke_2.Color=Color3.fromRGB(45,48,58)UIStroke_2.Parent=
ConfigFrame UICorner_5.CornerRadius=UDim.new(0,4)UICorner_5.Parent=ConfigFrame
ConfigIcon.Name=NeverLose.RandomString()ConfigIcon.Parent=ConfigFrame ConfigIcon
.AnchorPoint=Vector2.new(0,0.5)ConfigIcon.BackgroundColor3=Color3.fromRGB(255,
255,255)ConfigIcon.BackgroundTransparency=1 ConfigIcon.BorderColor3=Color3.
fromRGB(0,0,0)ConfigIcon.BorderSizePixel=0 ConfigIcon.Position=UDim2.new(0,2,0.5
,0)ConfigIcon.Size=UDim2.new(0,25,0,25)ConfigIcon.ZIndex=9 ConfigIcon.FontFace=
NeverLose.BuiltInBold ConfigIcon.Text='floppy-disk'ConfigIcon.TextColor3=Color3.
fromRGB(223,223,223)ConfigIcon.TextSize=16 ConfigIcon.TextTransparency=0.25
ConfigIcon.TextWrapped=true LineFrame_4.Name=NeverLose.RandomString()LineFrame_4
.Parent=ConfigFrame LineFrame_4.BackgroundColor3=Color3.fromRGB(45,48,58)
LineFrame_4.BackgroundTransparency=0.65 LineFrame_4.BorderColor3=Color3.fromRGB(
0,0,0)LineFrame_4.BorderSizePixel=0 LineFrame_4.Position=UDim2.new(0,30,0,0)
LineFrame_4.Size=UDim2.new(0,1,1,0)ConfigName.Name=NeverLose.RandomString()
ConfigName.Parent=ConfigFrame ConfigName.AnchorPoint=Vector2.new(0,0.5)
ConfigName.BackgroundColor3=Color3.fromRGB(255,255,255)ConfigName.
BackgroundTransparency=1 ConfigName.BorderColor3=Color3.fromRGB(0,0,0)ConfigName
.BorderSizePixel=0 ConfigName.Position=UDim2.new(0,40,0.5,0)ConfigName.Size=
UDim2.new(1,-7,0,15)ConfigName.ZIndex=9 ConfigName.Font=Enum.Font.GothamMedium
ConfigName.Text='Default'ConfigName.TextColor3=Color3.fromRGB(255,255,255)
ConfigName.TextSize=12 ConfigName.TextTransparency=0.35 ConfigName.
TextXAlignment=Enum.TextXAlignment.Left ConfigBthIcon.Name=NeverLose.
RandomString()ConfigBthIcon.Parent=ConfigFrame ConfigBthIcon.AnchorPoint=Vector2
.new(1,0.5)ConfigBthIcon.BackgroundColor3=Color3.fromRGB(255,255,255)
ConfigBthIcon.BackgroundTransparency=1 ConfigBthIcon.BorderColor3=Color3.
fromRGB(0,0,0)ConfigBthIcon.BorderSizePixel=0 ConfigBthIcon.Position=UDim2.new(1
,-2,0.5,0)ConfigBthIcon.Size=UDim2.new(0,25,0,25)ConfigBthIcon.ZIndex=9
ConfigBthIcon.FontFace=NeverLose.BuiltInBold ConfigBthIcon.Text=
'chevron-small-down'ConfigBthIcon.TextColor3=Color3.fromRGB(223,223,223)
ConfigBthIcon.TextSize=16 ConfigBthIcon.TextTransparency=0.25 ConfigBthIcon.
TextWrapped=true SearchFrame.Name=NeverLose.RandomString()SearchFrame.Parent=
RightHeader SearchFrame.AnchorPoint=Vector2.new(1,0.5)SearchFrame.
BackgroundColor3=Color3.fromRGB(255,255,255)SearchFrame.BackgroundTransparency=1
SearchFrame.BorderColor3=Color3.fromRGB(0,0,0)SearchFrame.BorderSizePixel=0
SearchFrame.ClipsDescendants=true SearchFrame.Position=UDim2.new(1,-60,0.5,0)
SearchFrame.Size=UDim2.new(0,30,0,30)SearchFrame.ZIndex=12 SearchIcon.Name=
NeverLose.RandomString()SearchIcon.Parent=SearchFrame SearchIcon.AnchorPoint=
Vector2.new(0,0.5)SearchIcon.BackgroundColor3=Color3.fromRGB(255,255,255)
SearchIcon.BackgroundTransparency=1 SearchIcon.BorderColor3=Color3.fromRGB(0,0,0
)SearchIcon.BorderSizePixel=0 SearchIcon.Position=UDim2.new(0,2,0.5,0)SearchIcon
.Size=UDim2.new(0,25,0,25)SearchIcon.ZIndex=12 SearchIcon.FontFace=NeverLose.
BuiltInBold SearchIcon.Text='magnifying-glass'SearchIcon.TextColor3=Color3.
fromRGB(223,223,223)SearchIcon.TextSize=14 SearchIcon.TextTransparency=0.45
SearchIcon.TextWrapped=true SearchBox.Name=NeverLose.RandomString()SearchBox.
Parent=SearchFrame SearchBox.AnchorPoint=Vector2.new(0,0.5)SearchBox.
BackgroundColor3=Color3.fromRGB(255,255,255)SearchBox.BackgroundTransparency=1
SearchBox.BorderColor3=Color3.fromRGB(0,0,0)SearchBox.BorderSizePixel=0
SearchBox.Position=UDim2.new(0,35,0.5,0)SearchBox.Size=UDim2.new(1,-35,0,25)
SearchBox.ZIndex=12 SearchBox.ClearTextOnFocus=false SearchBox.Font=Enum.Font.
GothamMedium SearchBox.PlaceholderText='Search'SearchBox.Text=''SearchBox.
TextColor3=Color3.fromRGB(255,255,255)SearchBox.TextSize=13 SearchBox.
TextTransparency=1 SearchBox.TextXAlignment=Enum.TextXAlignment.Left
TabContainer.Name=NeverLose.RandomString()TabContainer.Parent=RightMenuFrame
TabContainer.BackgroundColor3=Color3.fromRGB(255,255,255)TabContainer.
BackgroundTransparency=1 TabContainer.BorderColor3=Color3.fromRGB(0,0,0)
TabContainer.BorderSizePixel=0 TabContainer.ClipsDescendants=true TabContainer.
Position=UDim2.new(0,0,0,50)TabContainer.Size=UDim2.new(1,0,1,-50)TabContainer.
ZIndex=5 do Window.Searching=false local Input=NeverLose:CreateInput(SearchIcon,
function()Window.Searching=not Window.Searching if Window.Searching then
NeverLose.PlayAnimate(SearchFrame,VSlowTween,{Size=UDim2.new(0,220,0,30)})
NeverLose.PlayAnimate(SearchIcon,SlowyTween,{TextTransparency=0.25})NeverLose.
PlayAnimate(SearchBox,VSlowTween,{TextTransparency=0.35})else NeverLose.
PlayAnimate(SearchFrame,VSlowTween,{Size=UDim2.new(0,30,0,30)})NeverLose.
PlayAnimate(SearchIcon,SlowyTween,{TextTransparency=0.45})NeverLose.PlayAnimate(
SearchBox,SlowyTween,{TextTransparency=1})SearchBox.Text=''end end)local
wati_for_finish=tick()local last_thread local max_time=0.2 NeverLose:AddSignal(
SearchBox:GetPropertyChangedSignal('Text'):Connect(function()if not SearchBox.
Text:byte()then for i,v in next,NeverLose.NameRegisitry do v.Root.Visible=true
end return end wati_for_finish=tick()if last_thread then task.cancel(last_thread
)last_thread=nil end last_thread=task.delay(max_time,function()if SearchBox.Text
:byte()and(tick()-wati_for_finish)>max_time then for i,v in next,NeverLose.
NameRegisitry do if string.find(string.lower(v.Idx),string.lower(SearchBox.Text)
,1,true)then v.Root.Visible=true else v.Root.Visible=false end end end end)end))
NeverLose:AddSignal(Input.MouseEnter:Connect(function()NeverLose.PlayAnimate(
SearchIcon,SlowyTween,{TextTransparency=0.25})end))NeverLose:AddSignal(Input.
MouseLeave:Connect(function()if Window.Searching then NeverLose.PlayAnimate(
SearchIcon,SlowyTween,{TextTransparency=0.25})else NeverLose.PlayAnimate(
SearchIcon,SlowyTween,{TextTransparency=0.45})end end))end function Window:
AddTabLabel(Name:string)local TabLabel=Instance.new('TextLabel')TabLabel.Name=
NeverLose.RandomString()TabLabel.Parent=LeftScrollingFrame TabLabel.
BackgroundColor3=Color3.fromRGB(255,255,255)TabLabel.BackgroundTransparency=1
TabLabel.BorderColor3=Color3.fromRGB(0,0,0)TabLabel.BorderSizePixel=0 TabLabel.
Size=UDim2.new(1,-7,0,15)TabLabel.ZIndex=8 TabLabel.Font=Enum.Font.GothamMedium
TabLabel.Text=Name TabLabel.TextColor3=Color3.fromRGB(255,255,255)TabLabel.
TextSize=11 TabLabel.TextTransparency=0.5 TabLabel.TextXAlignment=Enum.
TextXAlignment.Left local SetRender=function(val)if val then NeverLose.
PlayAnimate(TabLabel,SlowyTween,{TextTransparency=0.5})else NeverLose.
PlayAnimate(TabLabel,SlowyTween,{TextTransparency=1})end end SetRender(Window.
Signal:GetValue())return Window.Signal:Connect(SetRender)end function Window:
AddTab(Config)Config=NeverLose:ProcessParams(Config,{Icon='crosshairs',Name=
'Tab',Type='Double'})local Tab={Signal=NeverLose:CreateSignal(false)}local
TabButton=Instance.new('Frame')local UICorner=Instance.new('UICorner')local
TabIcon=Instance.new('TextLabel')local TabContentLabel=Instance.new('TextLabel')
Tab.Idx=TabButton TabButton.Name=NeverLose.RandomString()TabButton.Parent=
LeftScrollingFrame TabButton.BackgroundColor3=Color3.fromRGB(41,45,49)TabButton.
BackgroundTransparency=0.5 TabButton.BorderColor3=Color3.fromRGB(0,0,0)TabButton
.BorderSizePixel=0 TabButton.Size=UDim2.new(1,-1,0,30)TabButton.ZIndex=8
UICorner.CornerRadius=UDim.new(0,6)UICorner.Parent=TabButton TabIcon.Name=
NeverLose.RandomString()TabIcon.Parent=TabButton TabIcon.AnchorPoint=Vector2.
new(0,0.5)TabIcon.BackgroundColor3=Color3.fromRGB(255,255,255)TabIcon.
BackgroundTransparency=1 TabIcon.BorderColor3=Color3.fromRGB(0,0,0)TabIcon.
BorderSizePixel=0 TabIcon.Position=UDim2.new(0,2,0.5,0)TabIcon.Size=UDim2.new(0,
25,0,25)TabIcon.ZIndex=9 TabIcon.FontFace=NeverLose.BuiltInBold TabIcon.Text=
Config.Icon TabIcon.TextColor3=NeverLose.AccentColor TabIcon.TextSize=16 TabIcon
.TextWrapped=true TabContentLabel.Name=NeverLose.RandomString()TabContentLabel.
Parent=TabButton TabContentLabel.AnchorPoint=Vector2.new(0,0.5)TabContentLabel.
BackgroundColor3=Color3.fromRGB(255,255,255)TabContentLabel.
BackgroundTransparency=1 TabContentLabel.BorderColor3=Color3.fromRGB(0,0,0)
TabContentLabel.BorderSizePixel=0 TabContentLabel.Position=UDim2.new(0,30,0.5,0)
TabContentLabel.Size=UDim2.new(1,-7,0,15)TabContentLabel.ZIndex=9
TabContentLabel.Font=Enum.Font.GothamMedium TabContentLabel.Text=Config.Name
TabContentLabel.TextColor3=Color3.fromRGB(255,255,255)TabContentLabel.TextSize=
12 TabContentLabel.TextXAlignment=Enum.TextXAlignment.Left Tab.Label=
TabContentLabel local TabFrame=Instance.new('Frame')local LeftScroll=Instance.
new('ScrollingFrame')local UIListLayout=Instance.new('UIListLayout')local
RightScroll=Instance.new('ScrollingFrame')local UIListLayout_2=Instance.new(
'UIListLayout')TabFrame.Name=NeverLose.RandomString()TabFrame.Parent=
TabContainer TabFrame.AnchorPoint=Vector2.new(0.5,0.5)TabFrame.BackgroundColor3=
Color3.fromRGB(255,255,255)TabFrame.BackgroundTransparency=1 TabFrame.
BorderColor3=Color3.fromRGB(0,0,0)TabFrame.BorderSizePixel=0 TabFrame.
ClipsDescendants=true TabFrame.Position=UDim2.new(0.5,0,0.5,0)TabFrame.Size=
UDim2.new(1,0,1,0)TabFrame.Visible=true Tab.Root=TabFrame LeftScroll.Name=
NeverLose.RandomString()LeftScroll.Parent=TabFrame LeftScroll.Active=true
LeftScroll.AnchorPoint=Vector2.new(0.5,0.5)LeftScroll.BackgroundColor3=Color3.
fromRGB(255,255,255)LeftScroll.BackgroundTransparency=1 LeftScroll.BorderColor3=
Color3.fromRGB(0,0,0)LeftScroll.BorderSizePixel=0 LeftScroll.ClipsDescendants=
false LeftScroll.Position=UDim2.new(0.25,0,0.5,0)LeftScroll.Size=UDim2.new(0.5,0
,1,-5)LeftScroll.ScrollBarThickness=0 UIListLayout.Parent=LeftScroll
UIListLayout.HorizontalAlignment=Enum.HorizontalAlignment.Right UIListLayout.
SortOrder=Enum.SortOrder.LayoutOrder UIListLayout.Padding=UDim.new(0,5)NeverLose
:AddSignal(UIListLayout:GetPropertyChangedSignal('AbsoluteContentSize'):Connect(
function()LeftScroll.CanvasSize=UDim2.fromOffset(0,UIListLayout.
AbsoluteContentSize.Y+1)end))RightScroll.Name=NeverLose.RandomString()
RightScroll.Parent=TabFrame RightScroll.Active=true RightScroll.AnchorPoint=
Vector2.new(0.5,0.5)RightScroll.BackgroundColor3=Color3.fromRGB(255,255,255)
RightScroll.BackgroundTransparency=1 RightScroll.BorderColor3=Color3.fromRGB(0,0
,0)RightScroll.BorderSizePixel=0 RightScroll.ClipsDescendants=false RightScroll.
Position=UDim2.new(0.75,0,0.5,0)RightScroll.Size=UDim2.new(0.5,0,1,-5)
RightScroll.ScrollBarThickness=0 UIListLayout_2.Parent=RightScroll
UIListLayout_2.SortOrder=Enum.SortOrder.LayoutOrder UIListLayout_2.Padding=UDim.
new(0,5)if Config.Type=='Single'then UIListLayout_2:Destroy()RightScroll:
Destroy()RightScroll=LeftScroll UIListLayout_2=UIListLayout LeftScroll.Size=
UDim2.new(1,0,1,-5)LeftScroll.Position=UDim2.new(0.5,0,0.5,0)else NeverLose:
AddSignal(UIListLayout_2:GetPropertyChangedSignal('AbsoluteContentSize'):
Connect(function()RightScroll.CanvasSize=UDim2.fromOffset(0,UIListLayout_2.
AbsoluteContentSize.Y+1)end))end NeverLose:AddSignal(TabIcon:
GetPropertyChangedSignal('TextTransparency'):Connect(function()if TabIcon.
TextTransparency>0.4 then UIListLayout.Parent=nil UIListLayout_2.Parent=nil
TabFrame.Visible=false TabFrame.Parent=nil else UIListLayout.Parent=LeftScroll
UIListLayout_2.Parent=RightScroll TabFrame.Visible=true TabFrame.Parent=
TabContainer end end))Tab.SetValue=function(value)Tab.Signal:SetValue(value)if
value then NeverLose.PlayAnimate(TabButton,SlowyTween,{BackgroundTransparency=
0.5})NeverLose.PlayAnimate(TabIcon,SlowyTween,{TextTransparency=0,TextColor3=
NeverLose.AccentColor})NeverLose.PlayAnimate(TabContentLabel,SlowyTween,{
TextTransparency=0})else NeverLose.PlayAnimate(TabButton,SlowyTween,{
BackgroundTransparency=1})NeverLose.PlayAnimate(TabIcon,SlowyTween,{
TextTransparency=0.5,TextColor3=Color3.fromRGB(252,252,252)})NeverLose.
PlayAnimate(TabContentLabel,SlowyTween,{TextTransparency=0.5})end end table.
insert(Window.Tabs,Tab)if Window.Tabs[Window.CurrentTab]==Tab then Tab.SetValue(
true)else Tab.SetValue(false)end local over=NeverLose:CreateInput(TabButton,
function()for i,v in next,Window.Tabs do if v.Idx==TabButton then v.SetValue(
true)Window.CurrentTab=i else v.SetValue(false)end end end)NeverLose:AddSignal(
over.MouseEnter:Connect(function()if Window.Tabs[Window.CurrentTab]==Tab then
NeverLose.PlayAnimate(TabButton,SlowyTween,{BackgroundTransparency=0.5})else
NeverLose.PlayAnimate(TabButton,SlowyTween,{BackgroundTransparency=0.8})end end)
)NeverLose:AddSignal(over.MouseLeave:Connect(function()if Window.Tabs[Window.
CurrentTab]==Tab then NeverLose.PlayAnimate(TabButton,SlowyTween,{
BackgroundTransparency=0.5})else NeverLose.PlayAnimate(TabButton,SlowyTween,{
BackgroundTransparency=1})end end))Window.Signal:Connect(function(value)if value
then if Window.Tabs[Window.CurrentTab]==Tab then Tab.SetValue(true)else Tab.
SetValue(false)end else Tab.SetValue(false)NeverLose.PlayAnimate(TabButton,
SlowyTween,{BackgroundTransparency=1})NeverLose.PlayAnimate(TabIcon,SlowyTween,{
TextTransparency=1})NeverLose.PlayAnimate(TabContentLabel,SlowyTween,{
TextTransparency=1})end end)function Tab:AddSection(Config)Config=NeverLose:
ProcessParams(Config,{Name='SECTION',Position='left'})local SectionFrame=
Instance.new('Frame')local SectionLabel=Instance.new('TextLabel')local
SectionHandler=Instance.new('Frame')local UIStroke=Instance.new('UIStroke')local
UICorner=Instance.new('UICorner')local UIListLayout=Instance.new('UIListLayout')
SectionFrame.Name=NeverLose.RandomString()SectionFrame.Parent=(string.lower(
Config.Position)=='left'and LeftScroll)or RightScroll SectionFrame.
BackgroundColor3=Color3.fromRGB(255,255,255)SectionFrame.BackgroundTransparency=
1 SectionFrame.BorderColor3=Color3.fromRGB(0,0,0)SectionFrame.BorderSizePixel=0
SectionFrame.ClipsDescendants=true SectionFrame.Size=UDim2.new(1,-5,0,0)
SectionFrame.ZIndex=9 SectionLabel.Name=NeverLose.RandomString()SectionLabel.
Parent=SectionFrame SectionLabel.AnchorPoint=Vector2.new(0.5,0)SectionLabel.
BackgroundColor3=Color3.fromRGB(255,255,255)SectionLabel.BackgroundTransparency=
1 SectionLabel.BorderColor3=Color3.fromRGB(0,0,0)SectionLabel.BorderSizePixel=0
SectionLabel.Position=UDim2.new(0.5,0,0,0)SectionLabel.Size=UDim2.new(1,-35,0,15
)SectionLabel.ZIndex=9 SectionLabel.Font=Enum.Font.GothamMedium SectionLabel.
Text=Config.Name SectionLabel.TextColor3=Color3.fromRGB(255,255,255)SectionLabel
.TextSize=11 SectionLabel.TextTransparency=0.5 SectionLabel.TextXAlignment=Enum.
TextXAlignment.Left SectionHandler.Name=NeverLose.RandomString()SectionHandler.
Parent=SectionFrame SectionHandler.AnchorPoint=Vector2.new(0.5,0)SectionHandler.
BackgroundColor3=Color3.fromRGB(20,22,27)SectionHandler.BackgroundTransparency=
0.5 SectionHandler.BorderColor3=Color3.fromRGB(0,0,0)SectionHandler.
BorderSizePixel=0 SectionHandler.ClipsDescendants=true SectionHandler.Position=
UDim2.new(0.5,0,0,20)SectionHandler.Size=UDim2.new(1,-10,1,-21)SectionHandler.
ZIndex=9 UIStroke.Transparency=0.65 UIStroke.Color=Color3.fromRGB(45,48,58)
UIStroke.Parent=SectionHandler UICorner.CornerRadius=UDim.new(0,10)UICorner.
Parent=SectionHandler UIListLayout.Parent=SectionHandler UIListLayout.
HorizontalAlignment=Enum.HorizontalAlignment.Center UIListLayout.SortOrder=Enum.
SortOrder.LayoutOrder UIListLayout:GetPropertyChangedSignal(
'AbsoluteContentSize'):Connect(function()if UIListLayout.AbsoluteContentSize.Y<=
1 then NeverLose.PlayAnimate(SectionFrame,VSlowTween,{Size=UDim2.new(1,-5,0,0)})
else NeverLose.PlayAnimate(SectionFrame,VSlowTween,{Size=UDim2.new(1,-5,0,
UIListLayout.AbsoluteContentSize.Y+19.5)})end end)local Section=NeverLose:
RegisiterItem(SectionHandler,Tab.Signal)Section.Root=SectionFrame Section.Label=
SectionLabel Section.SetRender=function(value)if value then NeverLose.
PlayAnimate(SectionLabel,SlowyTween,{TextTransparency=0.5})NeverLose.
PlayAnimate(SectionHandler,SlowyTween,{BackgroundTransparency=0.5})NeverLose.
PlayAnimate(UIStroke,SlowyTween,{Transparency=0.65})else NeverLose.PlayAnimate(
SectionLabel,SlowyTween,{TextTransparency=1})NeverLose.PlayAnimate(
SectionHandler,SlowyTween,{BackgroundTransparency=1})NeverLose.PlayAnimate(
UIStroke,SlowyTween,{Transparency=1})end end Section.SetRender(Tab.Signal:
GetValue())Tab.Signal:Connect(Section.SetRender)return Section end return Tab
end function Window:_InitConfig()local ConfigSignal=NeverLose:CreateSignal(false
)local ConfigLib={Signals={}}local ConfigMenu=Instance.new('Frame')local
UICorner=Instance.new('UICorner')local UIListLayout=Instance.new('UIListLayout')
local UIStroke=Instance.new('UIStroke')local InputFrame=Instance.new('Frame')
local BasedLabel=Instance.new('TextLabel')local LineFrame=Instance.new('Frame')
local BasedHandler=Instance.new('Frame')local UIListLayout_2=Instance.new(
'UIListLayout')local TextInput=Instance.new('Frame')local UICorner_2=Instance.
new('UICorner')local UIStroke_2=Instance.new('UIStroke')local TextBox=Instance.
new('TextBox')local LoadConfig=Instance.new('Frame')local Icon=Instance.new(
'TextLabel')local UICorner_3=Instance.new('UICorner')local UICorner_4=Instance.
new('UICorner')local shadow=NeverLose:CreateShadow(ConfigMenu)ConfigLib.
SetRender=function(value)if value then ConfigMenu.Position=UDim2.fromOffset(
ConfigFrame.AbsolutePosition.X+110,ConfigFrame.AbsolutePosition.Y+96)NeverLose.
PlayAnimate(ConfigMenu,SlowyTween,{BackgroundTransparency=0.035,Position=UDim2.
fromOffset(ConfigFrame.AbsolutePosition.X+110,ConfigFrame.AbsolutePosition.Y+95)
})NeverLose.PlayAnimate(UIStroke,SlowyTween,{Transparency=0.65})NeverLose.
PlayAnimate(BasedLabel,SlowyTween,{TextTransparency=0.2})NeverLose.PlayAnimate(
UIStroke_2,SlowyTween,{Transparency=0.65})NeverLose.PlayAnimate(LineFrame,
SlowyTween,{BackgroundTransparency=0.65})NeverLose.PlayAnimate(TextInput,
SlowyTween,{BackgroundTransparency=0})NeverLose.PlayAnimate(TextBox,SlowyTween,{
TextTransparency=0.35})NeverLose.PlayAnimate(Icon,SlowyTween,{TextTransparency=
0.35})NeverLose.PlayAnimate(ConfigBthIcon,SlowyTween,{Rotation=180})shadow:
Render(true)else NeverLose.PlayAnimate(ConfigBthIcon,SlowyTween,{Rotation=0})
NeverLose.PlayAnimate(ConfigMenu,SlowyTween,{BackgroundTransparency=1,Position=
UDim2.fromOffset(ConfigFrame.AbsolutePosition.X+110,ConfigFrame.AbsolutePosition
.Y+96)})NeverLose.PlayAnimate(UIStroke_2,SlowyTween,{Transparency=1})NeverLose.
PlayAnimate(UIStroke,SlowyTween,{Transparency=1})NeverLose.PlayAnimate(
BasedLabel,SlowyTween,{TextTransparency=1})NeverLose.PlayAnimate(LineFrame,
SlowyTween,{BackgroundTransparency=1})NeverLose.PlayAnimate(TextInput,SlowyTween
,{BackgroundTransparency=1})NeverLose.PlayAnimate(TextBox,SlowyTween,{
TextTransparency=1})NeverLose.PlayAnimate(Icon,SlowyTween,{TextTransparency=1})
shadow:Render(false)end end NeverLose:AddSignal(ConfigMenu:
GetPropertyChangedSignal('BackgroundTransparency'):Connect(function()if
ConfigMenu.BackgroundTransparency>0.9 then ConfigMenu.Visible=false UIListLayout
.Parent=nil ConfigMenu.Parent=nil else ConfigMenu.Visible=true UIListLayout.
Parent=ConfigMenu ConfigMenu.Parent=NeverLose.ScreenGui end end))ConfigMenu.Name
=NeverLose.RandomString()ConfigMenu.Parent=NeverLose.ScreenGui ConfigMenu.
AnchorPoint=Vector2.new(0.5,0)ConfigMenu.BackgroundColor3=Color3.fromRGB(20,22,
27)ConfigMenu.BackgroundTransparency=0.035 ConfigMenu.BorderColor3=Color3.
fromRGB(0,0,0)ConfigMenu.BorderSizePixel=0 ConfigMenu.ClipsDescendants=true
ConfigMenu.Position=UDim2.new(255,255,255,255)ConfigMenu.Size=UDim2.new(0,220,0,
110)ConfigMenu.ZIndex=151 UICorner.CornerRadius=UDim.new(0,10)UICorner.Parent=
ConfigMenu UIListLayout.Parent=ConfigMenu UIListLayout.HorizontalAlignment=Enum.
HorizontalAlignment.Center UIListLayout.SortOrder=Enum.SortOrder.LayoutOrder
UIListLayout.Padding=UDim.new(0,4)UIStroke.Transparency=0.65 UIStroke.Color=
Color3.fromRGB(45,48,58)UIStroke.Parent=ConfigMenu InputFrame.Name=NeverLose.
RandomString()InputFrame.Parent=ConfigMenu InputFrame.BackgroundColor3=Color3.
fromRGB(25,27,33)InputFrame.BackgroundTransparency=1 InputFrame.BorderColor3=
Color3.fromRGB(0,0,0)InputFrame.BorderSizePixel=0 InputFrame.Size=UDim2.new(1,0,
0,30)InputFrame.ZIndex=154 BasedLabel.Name=NeverLose.RandomString()BasedLabel.
Parent=InputFrame BasedLabel.BackgroundColor3=Color3.fromRGB(255,255,255)
BasedLabel.BackgroundTransparency=1 BasedLabel.BorderColor3=Color3.fromRGB(0,0,0
)BasedLabel.BorderSizePixel=0 BasedLabel.Position=UDim2.new(0,11,0,6)BasedLabel.
Size=UDim2.new(0,1,0,15)BasedLabel.ZIndex=154 BasedLabel.Font=Enum.Font.
GothamMedium BasedLabel.Text='Config'BasedLabel.TextColor3=Color3.fromRGB(255,
255,255)BasedLabel.TextSize=13 BasedLabel.TextTransparency=0.2 BasedLabel.
TextXAlignment=Enum.TextXAlignment.Left LineFrame.Name=NeverLose.RandomString()
LineFrame.Parent=InputFrame LineFrame.AnchorPoint=Vector2.new(0.5,1)LineFrame.
BackgroundColor3=Color3.fromRGB(45,48,58)LineFrame.BackgroundTransparency=0.65
LineFrame.BorderColor3=Color3.fromRGB(0,0,0)LineFrame.BorderSizePixel=0
LineFrame.Position=UDim2.new(0.5,0,1,0)LineFrame.Size=UDim2.new(1,-20,0,1)
LineFrame.ZIndex=154 BasedHandler.Name=NeverLose.RandomString()BasedHandler.
Parent=InputFrame BasedHandler.AnchorPoint=Vector2.new(1,0)BasedHandler.
BackgroundColor3=Color3.fromRGB(255,255,255)BasedHandler.BackgroundTransparency=
1 BasedHandler.BorderColor3=Color3.fromRGB(0,0,0)BasedHandler.BorderSizePixel=0
BasedHandler.Position=UDim2.new(1,-11,0,2)BasedHandler.Size=UDim2.new(1,-20,0,25
)BasedHandler.ZIndex=154 UIListLayout_2.Parent=BasedHandler UIListLayout_2.
FillDirection=Enum.FillDirection.Horizontal UIListLayout_2.HorizontalAlignment=
Enum.HorizontalAlignment.Right UIListLayout_2.SortOrder=Enum.SortOrder.
LayoutOrder UIListLayout_2.VerticalAlignment=Enum.VerticalAlignment.Center
UIListLayout_2.Padding=UDim.new(0,5)NeverLose:AddSignal(UIListLayout:
GetPropertyChangedSignal('AbsoluteContentSize'):Connect(function()if#ConfigLib.
Signals<=0 then NeverLose.PlayAnimate(ConfigMenu,SlowyTween,{Size=UDim2.new(0,
220,0,UIListLayout.AbsoluteContentSize.Y+0)})else NeverLose.PlayAnimate(
ConfigMenu,SlowyTween,{Size=UDim2.new(0,220,0,UIListLayout.AbsoluteContentSize.Y
+5)})end end))TextInput.Name=NeverLose.RandomString()TextInput.Parent=
BasedHandler TextInput.BackgroundColor3=Color3.fromRGB(26,28,36)TextInput.
BorderColor3=Color3.fromRGB(0,0,0)TextInput.BorderSizePixel=0 TextInput.
ClipsDescendants=true TextInput.Size=UDim2.new(0,100,0,18)TextInput.ZIndex=154
UICorner_2.CornerRadius=UDim.new(0,4)UICorner_2.Parent=TextInput UIStroke_2.
Transparency=0.65 UIStroke_2.Color=Color3.fromRGB(45,48,58)UIStroke_2.Parent=
TextInput TextBox.Parent=TextInput TextBox.AnchorPoint=Vector2.new(0,0.5)TextBox
.BackgroundColor3=Color3.fromRGB(255,255,255)TextBox.BackgroundTransparency=1
TextBox.BorderColor3=Color3.fromRGB(0,0,0)TextBox.BorderSizePixel=0 TextBox.
Position=UDim2.new(0,5,0.5,0)TextBox.Size=UDim2.new(1,-5,0,17)TextBox.ZIndex=154
TextBox.ClearTextOnFocus=false TextBox.Font=Enum.Font.GothamMedium TextBox.
PlaceholderText='Config Name ...'TextBox.Text=''TextBox.TextColor3=Color3.
fromRGB(255,255,255)TextBox.TextSize=11 TextBox.TextTransparency=0.35 TextBox.
TextXAlignment=Enum.TextXAlignment.Left LoadConfig.Name=NeverLose.RandomString()
LoadConfig.Parent=BasedHandler LoadConfig.BackgroundColor3=Color3.fromRGB(39,40,
49)LoadConfig.BackgroundTransparency=1 LoadConfig.BorderColor3=Color3.fromRGB(0,
0,0)LoadConfig.BorderSizePixel=0 LoadConfig.ClipsDescendants=true LoadConfig.
Size=UDim2.new(0,20,0,18)LoadConfig.ZIndex=153 Icon.Name=NeverLose.RandomString(
)Icon.Parent=LoadConfig Icon.AnchorPoint=Vector2.new(0.5,0.5)Icon.
BackgroundColor3=Color3.fromRGB(255,255,255)Icon.BackgroundTransparency=1 Icon.
BorderColor3=Color3.fromRGB(0,0,0)Icon.BorderSizePixel=0 Icon.Position=UDim2.
new(0.5,0,0.5,0)Icon.Size=UDim2.new(1,0,1,0)Icon.ZIndex=153 Icon.FontFace=
NeverLose.BuiltInBold Icon.Text='plus-large'Icon.TextColor3=Color3.fromRGB(223,
223,223)Icon.TextSize=16 Icon.TextTransparency=0.35 Icon.TextWrapped=true
UICorner_3.CornerRadius=UDim.new(0,4)UICorner_3.Parent=LoadConfig UICorner_4.
CornerRadius=UDim.new(0,10)UICorner_4.Parent=InputFrame local OpenButton=
Instance.new('TextButton')local UICorner=Instance.new('UICorner')OpenButton.Name
=NeverLose.RandomString()OpenButton.Parent=ConfigFrame OpenButton.AnchorPoint=
Vector2.new(0,0.5)OpenButton.BackgroundColor3=Color3.fromRGB(20,22,27)OpenButton
.BackgroundTransparency=1 OpenButton.BorderColor3=Color3.fromRGB(0,0,0)
OpenButton.BorderSizePixel=0 OpenButton.Position=UDim2.new(0,31,0.5,0)OpenButton
.Size=UDim2.new(1,-31,1,0)OpenButton.ZIndex=10 OpenButton.Font=Enum.Font.
SourceSans OpenButton.Text=''OpenButton.TextColor3=Color3.fromRGB(0,0,0)
OpenButton.TextSize=14 UICorner.CornerRadius=UDim.new(0,4)UICorner.Parent=
OpenButton ConfigLib.SetRender(false)ConfigSignal:Connect(ConfigLib.SetRender)
ConfigLib.UnsafeThread=nil ConfigLib.SelectedConfig='Default'local UpdateSize=
function()local size=TextService:GetTextSize(ConfigName.Text,ConfigName.TextSize
,ConfigName.Font,Vector2.new(math.huge,math.huge))NeverLose.PlayAnimate(
ConfigFrame,SlowyTween,{Size=UDim2.fromOffset(size.X+75,30)})end UpdateSize()
function ConfigLib:GetData(performance)local ikc={}local cd=0 for Flag,v in next
,NeverLose.Flags do if v and v.GetValue then local data=v:GetValue()if typeof(
data)=='Color3'then table.insert(ikc,{Idx=Flag,Value=data:ToHex()})else table.
insert(ikc,{Idx=Flag,Value=data})end end if performance then if cd%35==1 then
task.wait()end end cd+=1 end return NeverLose.Base64Encode(Encryption.new(
HttpService:JSONEncode(ikc)))end function ConfigLib:DecodeData(data)return
HttpService:JSONDecode(Encryption.reverse(NeverLose.Base64Decode(data)))end
function ConfigLib:LoadData(data)if self.BeforeLoad and self.BeforeLoad()==false
then return false end local coded=self:DecodeData(data)self.LastLoadedValues=
coded if NeverLose.TransformConfig then coded=NeverLose.TransformConfig(coded)
end local loaded={}for _,v in next,coded do local control=v.Idx and NeverLose.
Flags[v.Idx]if control then loaded[v.Idx]=true if control.LoadSynchronously then
control:SetValue(v.Value)else task.spawn(function()control:SetValue(v.Value)end)
end end end for flag,control in pairs(NeverLose.Flags)do if control.
LoadDefaultOnMissing and not loaded[flag]then control:SetValue(nil)end end end
function ConfigLib:RefreshConfig()if not isfolder(Window.ConfigFolder)then
makefolder(Window.ConfigFolder)end if not isfile(Window.ConfigFolder..'/Default'
)then writefile(Window.ConfigFolder..'/Default',ConfigLib:GetData())end for i,v
in next,ConfigMenu:GetChildren()do if v:GetAttribute('ConfigItem')then v:
Destroy()end end for i,v in next,ConfigLib.Signals do v:Disconnect()end table.
clear(ConfigLib.Signals)local ConfigList={}for i,v in next,listfiles(Window.
ConfigFolder)do local name=string.sub(v,#Window.ConfigFolder+2)table.insert(
ConfigList,name)end for i,ConfigNameStr in next,ConfigList do local
ConfigItemFrame=Instance.new('Frame')local BasedHandler=Instance.new('Frame')
local UIListLayout=Instance.new('UIListLayout')local DeleteConfig=Instance.new(
'Frame')local Icon=Instance.new('TextLabel')local UICorner=Instance.new(
'UICorner')local LoadConfig=Instance.new('Frame')local Icon_2=Instance.new(
'TextLabel')local UICorner_2=Instance.new('UICorner')local UICorner_3=Instance.
new('UICorner')local BasedLabel=Instance.new('TextLabel')local UIStroke=Instance
.new('UIStroke')ConfigItemFrame.Name=NeverLose.RandomString()ConfigItemFrame.
Parent=ConfigMenu ConfigItemFrame.BackgroundColor3=Color3.fromRGB(21,20,27)
ConfigItemFrame.BorderColor3=Color3.fromRGB(0,0,0)ConfigItemFrame.
BorderSizePixel=0 ConfigItemFrame.Size=UDim2.new(1,-10,0,30)ConfigItemFrame.
ZIndex=153 ConfigItemFrame:SetAttribute('ConfigItem',true)BasedHandler.Name=
NeverLose.RandomString()BasedHandler.Parent=ConfigItemFrame BasedHandler.
AnchorPoint=Vector2.new(1,0)BasedHandler.BackgroundColor3=Color3.fromRGB(255,255
,255)BasedHandler.BackgroundTransparency=1 BasedHandler.BorderColor3=Color3.
fromRGB(0,0,0)BasedHandler.BorderSizePixel=0 BasedHandler.Position=UDim2.new(1,-
11,0,2)BasedHandler.Size=UDim2.new(1,-20,0,25)BasedHandler.ZIndex=153
UIListLayout.Parent=BasedHandler UIListLayout.FillDirection=Enum.FillDirection.
Horizontal UIListLayout.HorizontalAlignment=Enum.HorizontalAlignment.Right
UIListLayout.SortOrder=Enum.SortOrder.LayoutOrder UIListLayout.VerticalAlignment
=Enum.VerticalAlignment.Center UIListLayout.Padding=UDim.new(0,5)DeleteConfig.
Name=NeverLose.RandomString()DeleteConfig.Parent=BasedHandler DeleteConfig.
BackgroundColor3=Color3.fromRGB(39,40,49)DeleteConfig.BackgroundTransparency=1
DeleteConfig.BorderColor3=Color3.fromRGB(0,0,0)DeleteConfig.BorderSizePixel=0
DeleteConfig.ClipsDescendants=true DeleteConfig.Size=UDim2.new(0,20,0,18)
DeleteConfig.ZIndex=153 Icon.Name=NeverLose.RandomString()Icon.Parent=
DeleteConfig Icon.AnchorPoint=Vector2.new(0.5,0.5)Icon.BackgroundColor3=Color3.
fromRGB(255,255,255)Icon.BackgroundTransparency=1 Icon.BorderColor3=Color3.
fromRGB(0,0,0)Icon.BorderSizePixel=0 Icon.Position=UDim2.new(0.5,0,0.5,0)Icon.
Size=UDim2.new(1,0,1,0)Icon.ZIndex=153 Icon.FontFace=NeverLose.BuiltInBold Icon.
Text='trash-can'Icon.TextColor3=Color3.fromRGB(223,223,223)Icon.TextSize=16 Icon
.TextTransparency=0.4 Icon.TextWrapped=true UICorner.CornerRadius=UDim.new(0,4)
UICorner.Parent=DeleteConfig LoadConfig.Name=NeverLose.RandomString()LoadConfig.
Parent=BasedHandler LoadConfig.BackgroundColor3=Color3.fromRGB(39,40,49)
LoadConfig.BackgroundTransparency=1 LoadConfig.BorderColor3=Color3.fromRGB(0,0,0
)LoadConfig.BorderSizePixel=0 LoadConfig.ClipsDescendants=true LoadConfig.Size=
UDim2.new(0,20,0,18)LoadConfig.ZIndex=153 Icon_2.Name=NeverLose.RandomString()
Icon_2.Parent=LoadConfig Icon_2.AnchorPoint=Vector2.new(0.5,0.5)Icon_2.
BackgroundColor3=Color3.fromRGB(255,255,255)Icon_2.BackgroundTransparency=1
Icon_2.BorderColor3=Color3.fromRGB(0,0,0)Icon_2.BorderSizePixel=0 Icon_2.
Position=UDim2.new(0.5,0,0.5,0)Icon_2.Size=UDim2.new(1,0,1,0)Icon_2.ZIndex=153
Icon_2.FontFace=NeverLose.BuiltInBold Icon_2.Text=
'arrow-right-from-portrait-rectangle'Icon_2.TextColor3=Color3.fromRGB(223,223,
223)Icon_2.TextSize=16 Icon_2.TextTransparency=0.4 Icon_2.TextWrapped=true
UICorner_2.CornerRadius=UDim.new(0,4)UICorner_2.Parent=LoadConfig UICorner_3.
CornerRadius=UDim.new(0,5)UICorner_3.Parent=ConfigItemFrame BasedLabel.Name=
NeverLose.RandomString()BasedLabel.Parent=ConfigItemFrame BasedLabel.
BackgroundColor3=Color3.fromRGB(255,255,255)BasedLabel.BackgroundTransparency=1
BasedLabel.BorderColor3=Color3.fromRGB(0,0,0)BasedLabel.BorderSizePixel=0
BasedLabel.Position=UDim2.new(0,11,0,7)BasedLabel.Size=UDim2.new(0,1,0,15)
BasedLabel.ZIndex=153 BasedLabel.Font=Enum.Font.GothamMedium BasedLabel.Text=
ConfigNameStr BasedLabel.TextColor3=Color3.fromRGB(255,255,255)BasedLabel.
TextSize=13 BasedLabel.TextTransparency=0.2 BasedLabel.TextXAlignment=Enum.
TextXAlignment.Left UIStroke.Transparency=0.5 UIStroke.Color=Color3.fromRGB(45,
48,58)UIStroke.Parent=ConfigItemFrame local Render=function(rst)if rst then
NeverLose.PlayAnimate(ConfigItemFrame,SlowyTween,{BackgroundTransparency=0})
NeverLose.PlayAnimate(Icon,SlowyTween,{TextTransparency=0.4})NeverLose.
PlayAnimate(Icon_2,SlowyTween,{TextTransparency=0.4})NeverLose.PlayAnimate(
BasedLabel,SlowyTween,{TextTransparency=0.2})NeverLose.PlayAnimate(UIStroke,
SlowyTween,{Transparency=0.5})else NeverLose.PlayAnimate(ConfigItemFrame,
SlowyTween,{BackgroundTransparency=1})NeverLose.PlayAnimate(Icon,SlowyTween,{
TextTransparency=1})NeverLose.PlayAnimate(Icon_2,SlowyTween,{TextTransparency=1}
)NeverLose.PlayAnimate(BasedLabel,SlowyTween,{TextTransparency=1})NeverLose.
PlayAnimate(UIStroke,SlowyTween,{Transparency=1})end end Render(ConfigSignal:
GetValue())table.insert(ConfigLib.Signals,ConfigSignal:Connect(Render))table.
insert(ConfigLib.Signals,ConfigItemFrame.MouseEnter:Connect(function()NeverLose.
PlayAnimate(UIStroke,SlowyTween,{Transparency=0.25})end))table.insert(ConfigLib.
Signals,ConfigItemFrame.MouseLeave:Connect(function()NeverLose.PlayAnimate(
UIStroke,SlowyTween,{Transparency=0.5})end))local deleter,signal=NeverLose:
CreateInput(DeleteConfig,function()if ConfigNameStr=='Default'then Logging.new(
'trash-can',"You can't delete default config!",3.5)return end delfile(Window.
ConfigFolder..'/'..ConfigNameStr)UpdateSize()ConfigLib:RefreshConfig()Logging.
new('trash-can','Deleted '..tostring(ConfigNameStr),3.5)end)local _,load_signal=
NeverLose:CreateInput(LoadConfig,function()local path=Window.ConfigFolder..'/'..
ConfigNameStr if isfile(path)then local data=readfile(path)if ConfigLib:
LoadData(data)==false then return end ConfigLib.SelectedConfig=ConfigNameStr
ConfigName.Text=ConfigNameStr UpdateSize()ConfigLib:RefreshConfig()Logging.new(
'folder','Loaded '..tostring(ConfigNameStr),3.5)end end)table.insert(ConfigLib.
Signals,signal)table.insert(ConfigLib.Signals,load_signal)table.insert(ConfigLib
.Signals,deleter.MouseEnter:Connect(function()NeverLose.PlayAnimate(Icon,
SlowyTween,{TextTransparency=0.2,TextColor3=Color3.fromRGB(223,125,125)})end))
table.insert(ConfigLib.Signals,deleter.MouseLeave:Connect(function()NeverLose.
PlayAnimate(Icon,SlowyTween,{TextTransparency=0.4,TextColor3=Color3.fromRGB(223,
223,223)})end))table.insert(ConfigLib.Signals,LoadConfig.MouseEnter:Connect(
function()NeverLose.PlayAnimate(Icon_2,SlowyTween,{TextTransparency=0.2,
TextColor3=NeverLose.AccentColor})end))table.insert(ConfigLib.Signals,LoadConfig
.MouseLeave:Connect(function()NeverLose.PlayAnimate(Icon_2,SlowyTween,{
TextTransparency=0.4,TextColor3=Color3.fromRGB(223,223,223)})end))end table.
clear(ConfigList)end task.delay(1,function()if ConfigLib.SelectedConfig==
'Default'then local path=Window.ConfigFolder..'/Default'local ConfigNameStr=
'Default'if isfile(path)then local data=readfile(path)if ConfigLib:LoadData(data
)==false then return end ConfigLib.SelectedConfig=ConfigNameStr ConfigName.Text=
ConfigNameStr UpdateSize()ConfigLib:RefreshConfig()Logging.new('folder',
'Loaded Default Config',3.5)task.spawn(function()while not NeverLose.Unloaded do
task.wait(5.75)if isfile(path)and ConfigLib.SelectedConfig=='Default'then
writefile(Window.ConfigFolder..'/Default',ConfigLib:GetData(true))end end end)
end end end)local hover_write=NeverLose:CreateInput(ConfigIcon,function()local
path=Window.ConfigFolder..'/'..(ConfigLib.SelectedConfig or'Default')if isfile(
path)then writefile(Window.ConfigFolder..'/'..(ConfigLib.SelectedConfig or
'Default'),ConfigLib:GetData())Logging.new('folder','Saved '..tostring(ConfigLib
.SelectedConfig),3.5)end end)NeverLose:AddSignal(hover_write.MouseEnter:Connect(
function()NeverLose.PlayAnimate(ConfigIcon,SlowyTween,{TextTransparency=0.1})end
))NeverLose:AddSignal(hover_write.MouseLeave:Connect(function()NeverLose.
PlayAnimate(ConfigIcon,SlowyTween,{TextTransparency=0.25})end))local mv=
NeverLose:CreateInput(LoadConfig,function()local cfg_name=TextBox.Text if
cfg_name and cfg_name:byte()and not cfg_name:find('/',1,true)and not cfg_name:
find('\\',1,true)then cfg_name=string.sub(cfg_name,1,24)writefile(Window.
ConfigFolder..'/'..cfg_name,ConfigLib:GetData())ConfigLib.SelectedConfig=
cfg_name ConfigName.Text=cfg_name Logging.new('folder','Created '..tostring(
cfg_name),3.5)TextBox.Text=''UpdateSize()ConfigLib:RefreshConfig()end end)
NeverLose:AddSignal(mv.MouseEnter:Connect(function()NeverLose.PlayAnimate(Icon,
SlowyTween,{TextTransparency=0.1})end))NeverLose:AddSignal(mv.MouseLeave:
Connect(function()NeverLose.PlayAnimate(Icon,SlowyTween,{TextTransparency=0.35})
end))ConfigLib:RefreshConfig()OpenButton.MouseButton1Click:Connect(function()if
ConfigLib.UnsafeThread then ConfigLib.UnsafeThread:Disconnect()ConfigLib.
UnsafeThread=nil end ConfigSignal:SetValue(true)ConfigLib.UnsafeThread=
UserInputService.InputBegan:Connect(function(Input)if Input.UserInputType==Enum.
UserInputType.MouseButton1 or Input.UserInputType==Enum.UserInputType.Touch then
if not NeverLose:IsMouseOverFrame(ConfigMenu)then if ConfigLib.UnsafeThread then
ConfigLib.UnsafeThread:Disconnect()ConfigLib.UnsafeThread=nil end ConfigSignal:
SetValue(false)end end end)end)return ConfigLib end Window.Config=Window:
_InitConfig()local UserSettings=NeverLose:CreateOptionWindow(BottomFrame,
BottomFrame.ZIndex+13)local reciveSignal NeverLose:CreateInput(BottomFrame,
function()if reciveSignal then reciveSignal:Disconnect()reciveSignal=nil end
UserSettings.Signal:SetValue(true)reciveSignal=UserInputService.InputBegan:
Connect(function(Input)if Input.UserInputType==Enum.UserInputType.MouseButton1
or Input.UserInputType==Enum.UserInputType.Touch then if not NeverLose:
IsMouseOverFrame(UserSettings.Root)and not NeverLose:IsMouseOverFrame(
BottomFrame)and not NeverLose.IsMosueOverOtherFrame then if reciveSignal then
reciveSignal:Disconnect()reciveSignal=nil end UserSettings.Signal:SetValue(false
)end end end)end)Window.UserSettings=UserSettings function Window:SetAccount(
Config)Config=NeverLose:ProcessParams(Config,{Profile=NeverLose.UserProfile,
Username=LocalPlayer.DisplayName,Expires='Never'})AccountName.Text=Config.
Username AccountProfile.Image=Config.Profile ExpireLabel.Text=Config.Expires
Window.Username=Config.Username or Window.Username Window.Profile=Config.Profile
or Window.Profile Window.Expires=Config.Expires or Window.Expires if Window.
UserSettings.UserFrame then Window.UserSettings.UserFrame:SetUsername(Window.
Username)Window.UserSettings.UserFrame:SetProfile(Window.Profile)Window.
UserSettings.UserFrame:SetExpires(Window.Expires)else Window.UserSettings.
UserFrame=UserSettings:AddUserFrame(Window.Username,Window.Profile,Window.
Expires)end end function Window:SetSize(newsize)Window.Size=newsize if Window.
Signal:GetValue()then NeverLose.PlayAnimate(WindowFrame,VSlowTween,{Size=Window.
Size})end end Window:SetAccount()NeverLose:AddSignal(UserInputService.InputBegan
:Connect(function(value,ISTYPING)if value.KeyCode==Window.Keybind or value.
KeyCode.Name==Window.Keybind then if not ISTYPING then Window:ToggleInterface()
end end end))function Window:ToggleInterface(fromHideButton)showFloatingOnHide=
fromHideButton==true and Window.Signal:GetValue()Window.Signal:SetValue(not
Window.Signal:GetValue())end function Window:Watermark()if NeverLose.
__WatermarkCache then return NeverLose.__WatermarkCache end local Watermark_lb={
}local Watermark=Instance.new('Frame')local UICorner=Instance.new('UICorner')
local UIListLayout=Instance.new('UIListLayout')local Shadow=NeverLose:
CreateShadow(Watermark)Watermark.Name=NeverLose.RandomString()Watermark.Parent=
NeverLose.ScreenGui Watermark.AnchorPoint=Vector2.new(1,0)Watermark.
BackgroundColor3=Color3.fromRGB(8,8,13)Watermark.BackgroundTransparency=0.2
Watermark.BorderColor3=Color3.fromRGB(0,0,0)Watermark.BorderSizePixel=0
Watermark.ClipsDescendants=true Watermark.Position=UDim2.new(1,-10,0,10)
Watermark.Size=UDim2.new(0,120,0,30)Watermark.ZIndex=16 UICorner.CornerRadius=
UDim.new(0,25)UICorner.Parent=Watermark UIListLayout.Parent=Watermark
UIListLayout.FillDirection=Enum.FillDirection.Horizontal UIListLayout.SortOrder=
Enum.SortOrder.LayoutOrder UIListLayout.HorizontalAlignment=Enum.
HorizontalAlignment.Right local empty_space=Instance.new('Frame')empty_space.
Size=UDim2.fromOffset(15,0)empty_space.BackgroundTransparency=1 empty_space.
Parent=Watermark empty_space.LayoutOrder=5 Watermark:GetPropertyChangedSignal(
'BackgroundTransparency'):Connect(function()if Watermark.BackgroundTransparency>
0.9 then Watermark.Visible=false Watermark.Parent=nil else Watermark.Parent=
NeverLose.ScreenGui Watermark.Visible=true end end)UIListLayout:
GetPropertyChangedSignal('AbsoluteContentSize'):Connect(function()NeverLose.
PlayAnimate(Watermark,SlowyTween,{Size=UDim2.new(0,UIListLayout.
AbsoluteContentSize.X+5,0,30)})end)NeverLose.__WatermarkCache=Watermark_lb
Shadow:Render(true)Watermark_lb.Renders={}Watermark_lb.Status=true function
Watermark_lb:SetRender(value)Watermark_lb.Status=value if value then NeverLose.
PlayAnimate(Watermark,SlowyTween,{BackgroundTransparency=0.2})Shadow:Render(true
)for i,v in next,Watermark_lb.Renders do pcall(v,true)end else NeverLose.
PlayAnimate(Watermark,SlowyTween,{BackgroundTransparency=1})Shadow:Render(false)
for i,v in next,Watermark_lb.Renders do pcall(v,false)end end end function
Watermark_lb:AddBlock(IconStr,Name)local InnerBlock={}local Frame=Instance.new(
'Frame')local Content=Instance.new('TextLabel')local Icon=Instance.new(
'TextLabel')Frame.Parent=Watermark Frame.BackgroundColor3=Color3.fromRGB(255,255
,255)Frame.BackgroundTransparency=1 Frame.BorderColor3=Color3.fromRGB(0,0,0)
Frame.BorderSizePixel=0 Frame.Size=UDim2.new(0,50,0,30)Content.Name=NeverLose.
RandomString()Content.Parent=Frame Content.AnchorPoint=Vector2.new(0,0.5)Content
.BackgroundColor3=Color3.fromRGB(186,186,186)Content.BackgroundTransparency=1
Content.BorderColor3=Color3.fromRGB(0,0,0)Content.BorderSizePixel=0 Content.
Position=UDim2.new(0,35,0.5,0)Content.Size=UDim2.new(0,1,0,25)Content.ZIndex=17
Content.Font=Enum.Font.GothamBold Content.Text=Name Content.TextColor3=Color3.
fromRGB(186,186,186)Content.TextSize=15 Content.TextTransparency=0.2 Content.
TextXAlignment=Enum.TextXAlignment.Left Icon.Name=NeverLose.RandomString()Icon.
Parent=Frame Icon.AnchorPoint=Vector2.new(0,0.5)Icon.BackgroundColor3=Color3.
fromRGB(186,186,186)Icon.BackgroundTransparency=1 Icon.BorderColor3=Color3.
fromRGB(0,0,0)Icon.BorderSizePixel=0 Icon.Position=UDim2.new(0,10,0.5,0)Icon.
Size=UDim2.new(0,20,0,20)Icon.ZIndex=17 Icon.FontFace=NeverLose.BuiltInBold Icon
.Text=IconStr Icon.TextColor3=NeverLose.AccentColor Icon.TextSize=18 Icon.
TextTransparency=0.25 Icon.TextWrapped=true InnerBlock.Update=function(value)
local size=TextService:GetTextSize(Content.Text,Content.TextSize,Content.Font,
Vector2.new(math.huge,math.huge))if InnerBlock.Visible then NeverLose.
PlayAnimate(Frame,VSlowTween,{Size=UDim2.new(0,size.X+35,0,30)})else NeverLose.
PlayAnimate(Frame,VSlowTween,{Size=UDim2.new(0,0,0,30)})end end InnerBlock.
Visible=true InnerBlock.Update()function InnerBlock:SetVisible(v)InnerBlock.
Visible=v if Watermark_lb.Status then InnerBlock.SetRender(v)end InnerBlock.
Update()end InnerBlock.SetRender=function(value)if value and InnerBlock.Visible
then NeverLose.PlayAnimate(Content,SlowyTween,{TextTransparency=0.2})NeverLose.
PlayAnimate(Icon,SlowyTween,{TextTransparency=0.25})else NeverLose.PlayAnimate(
Content,SlowyTween,{TextTransparency=1})NeverLose.PlayAnimate(Icon,SlowyTween,{
TextTransparency=1})end end table.insert(Watermark_lb.Renders,InnerBlock.
SetRender)function InnerBlock:SetText(t)Content.Text=t InnerBlock.Update()end
function InnerBlock:Input(func)local c,s=NeverLose:CreateInput(Frame,func)return
s end return InnerBlock end return Watermark_lb end Window:SetRender(false)
return Window end function NeverLose:CreateNotification()if NeverLose.
__Notification_Cache then return NeverLose.__Notification_Cache end local
Notifier={}local Notification=Instance.new('Frame')local UIListLayout=Instance.
new('UIListLayout')Notification.Name=NeverLose.RandomString()Notification.Parent
=NeverLose.ScreenGui Notification.AnchorPoint=Vector2.new(1,0)Notification.
BackgroundColor3=Color3.fromRGB(255,255,255)Notification.BackgroundTransparency=
1 Notification.BorderColor3=Color3.fromRGB(0,0,0)Notification.BorderSizePixel=0
Notification.Position=UDim2.new(1,-25,0,25)Notification.Size=UDim2.new(0,25,0,25
)UIListLayout.Parent=Notification UIListLayout.HorizontalAlignment=Enum.
HorizontalAlignment.Right UIListLayout.SortOrder=Enum.SortOrder.LayoutOrder
UIListLayout.Padding=UDim.new(0,0)NeverLose.__Notification_Cache=Notifier
function Notifier.new(Config)Config=NeverLose:ProcessParams(Config,{Title=
'Notification',Content='Hello World!',Logo=NeverLose.GlobalLogo or
'rbxasset://textures/ui/VerifiedBadgeNameIcon.png',Duration=5})if NeverLose.
__WatermarkCache then NeverLose.PlayAnimate(Notification,SlowyTween,{Position=
UDim2.new(1,-25,0,55)})end local ContainerFrame=Instance.new('Frame')local
NotifyFrame=Instance.new('Frame')local UICorner=Instance.new('UICorner')local
UIStroke=Instance.new('UIStroke')local LogoImage=Instance.new('ImageLabel')local
UICorner_2=Instance.new('UICorner')local NotifyName=Instance.new('TextLabel')
local NotifyContent=Instance.new('TextLabel')local shadow=NeverLose:
CreateShadow(NotifyFrame,true)ContainerFrame.Name=NeverLose.RandomString()
ContainerFrame.Parent=Notification ContainerFrame.BackgroundColor3=Color3.
fromRGB(255,255,255)ContainerFrame.BackgroundTransparency=1 ContainerFrame.
BorderColor3=Color3.fromRGB(0,0,0)ContainerFrame.BorderSizePixel=0
ContainerFrame.Size=UDim2.new(0,0,0,100)NotifyFrame.Name=NeverLose.RandomString(
)NotifyFrame.Parent=ContainerFrame NotifyFrame.AnchorPoint=Vector2.new(1,0)
NotifyFrame.BackgroundColor3=Color3.fromRGB(20,22,27)NotifyFrame.
BackgroundTransparency=0.075 NotifyFrame.BorderColor3=Color3.fromRGB(0,0,0)
NotifyFrame.BorderSizePixel=0 NotifyFrame.ClipsDescendants=true NotifyFrame.
Position=UDim2.new(0,750,0,0)NotifyFrame.Size=UDim2.new(0,220,0,55)NotifyFrame.
ZIndex=130 UICorner.CornerRadius=UDim.new(0,10)UICorner.Parent=NotifyFrame
UIStroke.Transparency=0.65 UIStroke.Color=Color3.fromRGB(45,48,58)UIStroke.
Parent=NotifyFrame LogoImage.Name=NeverLose.RandomString()LogoImage.Parent=
NotifyFrame LogoImage.AnchorPoint=Vector2.new(0,0.5)LogoImage.BackgroundColor3=
Color3.fromRGB(255,255,255)LogoImage.BackgroundTransparency=1 LogoImage.
BorderColor3=Color3.fromRGB(0,0,0)LogoImage.BorderSizePixel=0 LogoImage.Position
=UDim2.new(0,10,0.5,0)LogoImage.Size=UDim2.new(0,35,0,35)LogoImage.ZIndex=131
LogoImage.Image=Config.Logo LogoImage.ImageColor3=NeverLose.IconColor UICorner_2
.CornerRadius=UDim.new(0,7)UICorner_2.Parent=LogoImage NotifyName.Name=NeverLose
.RandomString()NotifyName.Parent=NotifyFrame NotifyName.BackgroundColor3=Color3.
fromRGB(255,255,255)NotifyName.BackgroundTransparency=1 NotifyName.BorderColor3=
Color3.fromRGB(0,0,0)NotifyName.BorderSizePixel=0 NotifyName.Position=UDim2.new(
0,50,0,7)NotifyName.Size=UDim2.new(0,200,0,20)NotifyName.ZIndex=132 NotifyName.
Font=Enum.Font.GothamBold NotifyName.Text=Config.Title NotifyName.TextColor3=
Color3.fromRGB(255,255,255)NotifyName.TextSize=17 NotifyName.TextXAlignment=Enum
.TextXAlignment.Left NotifyContent.Name=NeverLose.RandomString()NotifyContent.
Parent=NotifyFrame NotifyContent.BackgroundColor3=Color3.fromRGB(255,255,255)
NotifyContent.BackgroundTransparency=1 NotifyContent.BorderColor3=Color3.
fromRGB(0,0,0)NotifyContent.BorderSizePixel=0 NotifyContent.Position=UDim2.new(0
,50,0,28)NotifyContent.Size=UDim2.new(0,200,0,15)NotifyContent.ZIndex=132
NotifyContent.Font=Enum.Font.GothamBold NotifyContent.Text=Config.Content
NotifyContent.TextColor3=Color3.fromRGB(255,255,255)NotifyContent.TextSize=12
NotifyContent.TextTransparency=0.65 NotifyContent.TextXAlignment=Enum.
TextXAlignment.Left local Size1=TextService:GetTextSize(NotifyName.Text,
NotifyName.TextSize,NotifyName.Font,Vector2.new(math.huge,math.huge))local Size2
=TextService:GetTextSize(NotifyContent.Text,NotifyContent.TextSize,NotifyContent
.Font,Vector2.new(math.huge,math.huge))local MainSize=math.max(Size1.X,Size2.X)
NotifyFrame.Size=UDim2.new(0,MainSize+65,0,55)shadow:Render(true)NeverLose.
PlayAnimate(NotifyFrame,VSlowTween,{Position=UDim2.new(1,0,0,0)})ContainerFrame.
Size=UDim2.new(0,0,0,65)task.delay(Config.Duration or 5,function()if NeverLose.
__WatermarkCache then NeverLose.PlayAnimate(Notification,SlowyTween,{Position=
UDim2.new(1,-25,0,55)})end shadow:Render(false)NeverLose.PlayAnimate(NotifyFrame
,SlowyTween,{BackgroundTransparency=1})NeverLose.PlayAnimate(UIStroke,SlowyTween
,{Transparency=1})NeverLose.PlayAnimate(LogoImage,SlowyTween,{ImageTransparency=
1})NeverLose.PlayAnimate(NotifyName,SlowyTween,{TextTransparency=1})NeverLose.
PlayAnimate(NotifyContent,SlowyTween,{TextTransparency=1})task.wait(0.125)
NeverLose.PlayAnimate(ContainerFrame,SlowyTween,{Size=UDim2.new(0,0,0,0)})task.
wait(0.125)ContainerFrame:Destroy()end)end return Notifier end function
NeverLose:CreateLogger()if NeverLose.__LogSystem then return NeverLose.
__LogSystem end local Logging={}local Log=Instance.new('Frame')local
UIListLayout=Instance.new('UIListLayout')Log.Name=NeverLose.RandomString()Log.
Parent=NeverLose.ScreenGui Log.BackgroundColor3=Color3.fromRGB(255,255,255)Log.
BackgroundTransparency=1 Log.BorderColor3=Color3.fromRGB(0,0,0)Log.
BorderSizePixel=0 Log.Position=UDim2.new(0,25,0,5+math.abs(NeverLose.ScreenGui.
AbsolutePosition.Y))Log.Size=UDim2.new(0,25,0,25)UIListLayout.Parent=Log
UIListLayout.SortOrder=Enum.SortOrder.LayoutOrder UIListLayout.Padding=UDim.new(
0,12)NeverLose.__LogSystem=Logging function Logging.new(IconStr:string,Message:
string,Duration:number)Duration=Duration or 3 Message=Message or'Log'IconStr=
IconStr or'crosshairs'local LogFrame=Instance.new('Frame')local UICorner=
Instance.new('UICorner')local UIStroke=Instance.new('UIStroke')local LogContent=
Instance.new('TextLabel')local Line=Instance.new('Frame')local UICorner_2=
Instance.new('UICorner')local Icon=Instance.new('TextLabel')local Shadow=
NeverLose:CreateShadow(LogFrame,true)LogFrame.Name=NeverLose.RandomString()
LogFrame.Parent=Log LogFrame.AnchorPoint=Vector2.new(0.5,0)LogFrame.
BackgroundColor3=Color3.fromRGB(20,22,27)LogFrame.BackgroundTransparency=1
LogFrame.BorderColor3=Color3.fromRGB(0,0,0)LogFrame.BorderSizePixel=0 LogFrame.
ClipsDescendants=true LogFrame.Position=UDim2.new(0,0,0,0)LogFrame.Size=UDim2.
new(0,0,0,20)LogFrame.ZIndex=130 UICorner.CornerRadius=UDim.new(0,4)UICorner.
Parent=LogFrame UIStroke.Transparency=1 UIStroke.Color=Color3.fromRGB(45,48,58)
UIStroke.Parent=LogFrame LogContent.Name=NeverLose.RandomString()LogContent.
Parent=LogFrame LogContent.BackgroundColor3=Color3.fromRGB(255,255,255)
LogContent.BackgroundTransparency=1 LogContent.BorderColor3=Color3.fromRGB(0,0,0
)LogContent.BorderSizePixel=0 LogContent.Position=UDim2.new(0,25,0,2)LogContent.
Size=UDim2.new(0,200,0,15)LogContent.ZIndex=132 LogContent.Font=Enum.Font.
GothamBold LogContent.Text=Message LogContent.TextColor3=Color3.fromRGB(255,255,
255)LogContent.TextSize=12 LogContent.TextTransparency=1 LogContent.
TextXAlignment=Enum.TextXAlignment.Left Line.Name=NeverLose.RandomString()Line.
Parent=LogFrame Line.AnchorPoint=Vector2.new(0,0.5)Line.BackgroundColor3=
NeverLose.AccentColor Line.BorderColor3=Color3.fromRGB(0,0,0)Line.
BackgroundTransparency=1 Line.BorderSizePixel=0 Line.Position=UDim2.new(0,-2,0.5
,0)Line.Size=UDim2.new(0,5,1,0)Line.ZIndex=131 UICorner_2.CornerRadius=UDim.new(
0,4)UICorner_2.Parent=Line Icon.Name=NeverLose.RandomString()Icon.Parent=
LogFrame Icon.BackgroundColor3=Color3.fromRGB(255,255,255)Icon.
BackgroundTransparency=1 Icon.BorderColor3=Color3.fromRGB(0,0,0)Icon.
BorderSizePixel=0 Icon.Position=UDim2.new(0,7,0,3)Icon.Size=UDim2.new(0,15,0,15)
Icon.ZIndex=133 Icon.FontFace=NeverLose.BuiltInBold Icon.Text=IconStr Icon.
TextColor3=Color3.fromRGB(223,223,223)Icon.TextSize=13 Icon.TextTransparency=1
Icon.TextWrapped=true local size=TextService:GetTextSize(LogContent.Text,
LogContent.TextSize,LogContent.Font,Vector2.new(math.huge,math.huge))NeverLose.
PlayAnimate(LogFrame,SlowyTween,{Size=UDim2.new(0,size.X+35,0,20),
BackgroundTransparency=0.075})task.delay(0.15,function()Shadow:Render(true)
NeverLose.PlayAnimate(UIStroke,SlowyTween,{Transparency=0.65})NeverLose.
PlayAnimate(LogContent,SlowyTween,{TextTransparency=0.25})NeverLose.PlayAnimate(
Line,SlowyTween,{BackgroundTransparency=0})NeverLose.PlayAnimate(Icon,SlowyTween
,{TextTransparency=0.25})task.wait(Duration+0.1)Shadow:Render(false)NeverLose.
PlayAnimate(LogFrame,SlowyTween,{BackgroundTransparency=1})NeverLose.
PlayAnimate(UIStroke,SlowyTween,{Transparency=1})NeverLose.PlayAnimate(
LogContent,SlowyTween,{TextTransparency=1})NeverLose.PlayAnimate(Line,SlowyTween
,{BackgroundTransparency=1})NeverLose.PlayAnimate(Icon,SlowyTween,{
TextTransparency=1})task.wait(0.25)LogFrame:Destroy()end)end return Logging end
function NeverLose:CreateIndicator()local IndicatorGui=Instance.new('ScreenGui')
IndicatorGui.Name='BloxStrikeIndicators'IndicatorGui.IgnoreGuiInset=true
IndicatorGui.ResetOnSpawn=false IndicatorGui.DisplayOrder=NeverLose.ScreenGui.
DisplayOrder IndicatorGui.ZIndexBehavior=Enum.ZIndexBehavior.Global IndicatorGui
.Parent=LocalPlayer:WaitForChild('PlayerGui')NeverLose.IndicatorGui=IndicatorGui
local IndicatorFrame=Instance.new('Frame')local UIListLayout=Instance.new(
'UIListLayout')IndicatorFrame.Name=NeverLose.RandomString()IndicatorFrame.Parent
=IndicatorGui IndicatorFrame.AnchorPoint=Vector2.new(0,0.5)IndicatorFrame.
BackgroundColor3=Color3.fromRGB(255,255,255)IndicatorFrame.
BackgroundTransparency=1 IndicatorFrame.BorderColor3=Color3.fromRGB(0,0,0)
IndicatorFrame.BorderSizePixel=0 IndicatorFrame.Position=UDim2.new(0,15,0.5,0)
IndicatorFrame.Size=UDim2.new(0,100,0,100)IndicatorFrame.ZIndex=15 UIListLayout.
Parent=IndicatorFrame UIListLayout.SortOrder=Enum.SortOrder.LayoutOrder
UIListLayout.Padding=UDim.new(0,10)local Indicators={}Indicators.Color={Red=
Color3.fromRGB(255,102,105),Green=Color3.fromRGB(135,255,143),White=Color3.
fromRGB(186,186,186)}Indicators.Root=IndicatorFrame function Indicators.new(
Config)Config=NeverLose:ProcessParams(Config,{Name='Indicator',Icon='crosshairs'
,Color='Red'})local Indicator={CurrentColor=Config.Color,Visible=false}local 
function indicatorColor()if typeof(Indicator.CurrentColor)=='Color3'then return
Indicator.CurrentColor end return Indicators.Color[Indicator.CurrentColor]or
Indicators.Color.Red end local IndicatorItem=Instance.new('Frame')local UICorner
=Instance.new('UICorner')local Line=Instance.new('Frame')local UICorner_2=
Instance.new('UICorner')local UIGradient=Instance.new('UIGradient')local Icon=
Instance.new('TextLabel')local Content=Instance.new('TextLabel')local Shadow=
NeverLose:CreateShadow(IndicatorItem)IndicatorItem.Name=NeverLose.RandomString()
IndicatorItem.BackgroundColor3=Color3.fromRGB(8,8,13)IndicatorItem.
BackgroundTransparency=1 IndicatorItem.BorderColor3=Color3.fromRGB(0,0,0)
IndicatorItem.BorderSizePixel=0 IndicatorItem.ClipsDescendants=true
IndicatorItem.Size=UDim2.new(0,85,0,40)IndicatorItem.ZIndex=16 IndicatorItem.
Visible=false IndicatorItem:GetPropertyChangedSignal('BackgroundTransparency'):
Connect(function()if IndicatorItem.BackgroundTransparency>0.9 then IndicatorItem
.Parent=nil IndicatorItem.Visible=false else IndicatorItem.Parent=IndicatorFrame
IndicatorItem.Visible=true end end)UICorner.CornerRadius=UDim.new(0,25)UICorner.
Parent=IndicatorItem Line.Name=NeverLose.RandomString()Line.Parent=IndicatorItem
Line.AnchorPoint=Vector2.new(0,0.5)Line.BackgroundColor3=Color3.fromRGB(186,186,
186)Line.BorderColor3=Color3.fromRGB(0,0,0)Line.BorderSizePixel=0 Line.Position=
UDim2.new(0,2,0.5,0)Line.BackgroundTransparency=1 Line.Size=UDim2.new(0,3,
0.649999976,0)Line.ZIndex=17 UICorner_2.CornerRadius=UDim.new(0,25)UICorner_2.
Parent=Line UIGradient.Rotation=90 UIGradient.Transparency=NumberSequence.new({
NumberSequenceKeypoint.new(0,1),NumberSequenceKeypoint.new(0.5,0),
NumberSequenceKeypoint.new(1,1)})UIGradient.Parent=Line Icon.Name=NeverLose.
RandomString()Icon.Parent=IndicatorItem Icon.AnchorPoint=Vector2.new(0,0.5)Icon.
BackgroundColor3=Color3.fromRGB(186,186,186)Icon.BackgroundTransparency=1 Icon.
BorderColor3=Color3.fromRGB(0,0,0)Icon.BorderSizePixel=0 Icon.Position=UDim2.
new(0,10,0.5,0)Icon.Size=UDim2.new(0,25,0,25)Icon.ZIndex=17 Icon.FontFace=
NeverLose.BuiltInBold Icon.Text=Config.Icon Icon.TextColor3=Color3.fromRGB(186,
186,186)Icon.TextSize=21 Icon.TextTransparency=1 Icon.TextWrapped=true Content.
Name=NeverLose.RandomString()Content.Parent=IndicatorItem Content.AnchorPoint=
Vector2.new(0,0.5)Content.BackgroundColor3=Color3.fromRGB(186,186,186)Content.
BackgroundTransparency=1 Content.BorderColor3=Color3.fromRGB(0,0,0)Content.
BorderSizePixel=0 Content.Position=UDim2.new(0,40,0.5,0)Content.Size=UDim2.new(1
,-40,0,25)Content.ZIndex=17 Content.Font=Enum.Font.GothamBold Content.Text=
Config.Name Content.TextColor3=Color3.fromRGB(186,186,186)Content.TextSize=20
Content.TextTransparency=1 Content.TextXAlignment=Enum.TextXAlignment.Left
Indicator.Update=function()local text=TextService:GetTextSize(Content.Text,
Content.TextSize,Content.Font,Vector2.new(math.huge,math.huge))NeverLose.
PlayAnimate(IndicatorItem,SlowyTween,{Size=UDim2.new(0,text.X+60,0,40)})end
Indicator.SetRender=function(self,value)Indicator.Visible=value if value then
NeverLose.PlayAnimate(IndicatorItem,SlowyTween,{BackgroundTransparency=0.2})
NeverLose.PlayAnimate(Line,SlowyTween,{BackgroundTransparency=0,BackgroundColor3
=indicatorColor()})NeverLose.PlayAnimate(Icon,VSlowTween,{TextTransparency=0.25,
TextColor3=indicatorColor()})NeverLose.PlayAnimate(Content,VSlowTween,{
TextTransparency=0.2,TextColor3=indicatorColor()})Shadow:Render(true)else
NeverLose.PlayAnimate(IndicatorItem,SlowyTween,{BackgroundTransparency=1})
NeverLose.PlayAnimate(Line,SlowyTween,{BackgroundTransparency=1,BackgroundColor3
=indicatorColor()})NeverLose.PlayAnimate(Icon,VSlowTween,{TextTransparency=1,
TextColor3=indicatorColor()})NeverLose.PlayAnimate(Content,VSlowTween,{
TextTransparency=1,TextColor3=indicatorColor()})Shadow:Render(false)end
Indicator.Update()end Indicator.Update()Indicator:SetRender(false)function
Indicator:SetColor(new_color)Indicator.CurrentColor=new_color if Indicator.
Visible then Indicator:SetRender(true)end end function Indicator:SetText(name)
Config.Name=name Content.Text=Config.Name Indicator.Update()end return Indicator
end return Indicators end return NeverLose