local Players=game:GetService('Players')local GuiService=game:GetService(
'GuiService')local HttpService=game:GetService('HttpService')local Stats=game:
GetService('Stats')local TextService=game:GetService('TextService')local
TweenService=game:GetService('TweenService')local UserInputService=game:
GetService('UserInputService')local IsA=game.IsA local GetChildren=game.
GetChildren local GetDescendants=game.GetDescendants local FindFirstChild=game.
FindFirstChild local GetPropertyChangedSignal=game.GetPropertyChangedSignal
local NewUDim=UDim.new local NewUDim2=UDim2.new local NewVector2=Vector2.new
local NewInstance=Instance.new local NewColor3=Color3.new local NewRGB=Color3.
fromRGB local FromHSV=Color3.fromHSV local FromHex=Color3.fromHex local Sub=
string.sub local Format=string.format local StringFind=string.find local Wait=
task.wait local Concat=table.concat local Insert=table.insert local Find=table.
find local Clear=table.clear local Abs=math.abs local Min=math.min local Max=
math.max local Clamp=math.clamp local Floor=math.floor local Infinite=1/0 local
Type=type local Date=os.date local TypeOf=typeof local GetGuiInset=GuiService.
GetGuiInset local function MouseLocation()return UserInputService:
GetMouseLocation()end local saved={}local sessionStorage={}function
sessionStorage.read(path)return saved[path]end function sessionStorage.write(
path,text)saved[path]=text end function sessionStorage.delete(path)assert(saved[
path]~=nil,'config not found')saved[path]=nil end function sessionStorage.list(
prefix)local paths={}prefix..='/'for path in saved do if path:sub(1,#prefix)==
prefix then paths[#paths+1]=path end end table.sort(paths)return paths end local
Bbot={}function Bbot.new(storage)storage=storage or sessionStorage assert(type(
storage.read)=='function'and type(storage.write)=='function'and type(storage.
delete)=='function'and type(storage.list)=='function','Invalid Bbot storage')
local localPlayer=assert(Players.LocalPlayer,'Bbot.new must run on the client')
local guiParent=localPlayer:WaitForChild('PlayerGui')local unloaded=false local
watermarkThread local pending={}local function schedule(callback,seconds)if
unloaded then return end local thread local function run()pending[thread]=nil if
not unloaded then callback()end end thread=if seconds then task.delay(seconds,
run)else task.defer(run)pending[thread]=true end local Library={Directory=
'Moon.lua',Flags={},ConfigFlags={},Connections={},Notifications={Notifs={},
Fading={},ProgressTweens={},RefreshScheduled=false,MaxVisible=25},OpenElement={}
,KeybindPanels={},FontSizeRegistry={},FontRegistry={},EasingStyle=Enum.
EasingStyle.Quint,TweeningSpeed=0.25,IsLoadingConfig=false,BoundTogglePairs={}}
local Themes={preset={inline=NewRGB(50,50,50),gradient=NewRGB(40,40,40),outline=
NewRGB(20,20,20),accent=NewRGB(50,119,186),accent_light=NewRGB(255,255,255),
accent_dark=NewRGB(158,158,158),background=NewRGB(30,30,30),text_color=NewRGB(
239,239,239),text_muted=NewRGB(179,179,179),text_outline=NewRGB(0,0,0),
tab_background=NewRGB(26,26,26)},utility={},gradients={Selected={},Deselected={}
}}for n,NewColor3 in Themes.preset do Themes.utility[n]={BackgroundColor3={},
TextColor3={},ImageColor3={},ScrollBarImageColor3={},Color={}}end local
KEY_DISPLAY_NAMES={[Enum.KeyCode.LeftShift]='LS',[Enum.KeyCode.RightShift]='RS',
[Enum.KeyCode.LeftControl]='LC',[Enum.KeyCode.RightControl]='RC',[Enum.KeyCode.
Insert]='INS',[Enum.KeyCode.Backspace]='BS',[Enum.KeyCode.Return]='Ent',[Enum.
KeyCode.LeftAlt]='LA',[Enum.KeyCode.RightAlt]='RA',[Enum.KeyCode.CapsLock]=
'CAPS',[Enum.KeyCode.One]='1',[Enum.KeyCode.Two]='2',[Enum.KeyCode.Three]='3',[
Enum.KeyCode.Four]='4',[Enum.KeyCode.Five]='5',[Enum.KeyCode.Six]='6',[Enum.
KeyCode.Seven]='7',[Enum.KeyCode.Eight]='8',[Enum.KeyCode.Nine]='9',[Enum.
KeyCode.Zero]='0',[Enum.KeyCode.KeypadOne]='Num1',[Enum.KeyCode.KeypadTwo]=
'Num2',[Enum.KeyCode.KeypadThree]='Num3',[Enum.KeyCode.KeypadFour]='Num4',[Enum.
KeyCode.KeypadFive]='Num5',[Enum.KeyCode.KeypadSix]='Num6',[Enum.KeyCode.
KeypadSeven]='Num7',[Enum.KeyCode.KeypadEight]='Num8',[Enum.KeyCode.KeypadNine]=
'Num9',[Enum.KeyCode.KeypadZero]='Num0',[Enum.KeyCode.Minus]='-',[Enum.KeyCode.
Equals]='=',[Enum.KeyCode.Tilde]='~',[Enum.KeyCode.LeftBracket]='[',[Enum.
KeyCode.RightBracket]=']',[Enum.KeyCode.RightParenthesis]=')',[Enum.KeyCode.
LeftParenthesis]='(',[Enum.KeyCode.Semicolon]=',',[Enum.KeyCode.Quote]="'",[Enum
.KeyCode.BackSlash]='\\',[Enum.KeyCode.Comma]=',',[Enum.KeyCode.Period]='.',[
Enum.KeyCode.Slash]='/',[Enum.KeyCode.Asterisk]='*',[Enum.KeyCode.Plus]='+',[
Enum.KeyCode.Period]='.',[Enum.KeyCode.Backquote]='`',[Enum.UserInputType.
MouseButton1]='M1',[Enum.UserInputType.MouseButton2]='M2',[Enum.UserInputType.
MouseButton3]='M3',[Enum.KeyCode.Escape]='ESC',[Enum.KeyCode.Space]='SPC'}
Library.__index=Library local Flags=Library.Flags local ConfigFlags=Library.
ConfigFlags local Notifications=Library.Notifications Library.Font=Font.
fromEnum(Enum.Font.Jura)Library.TextSize=12 Library.TextSizeHeader=16 function
Library:GetTransparency(instance)if IsA(instance,'Frame')then return{
'BackgroundTransparency'}elseif IsA(instance,'TextLabel')or IsA(instance,
'TextButton')then return{'TextTransparency','BackgroundTransparency'}elseif IsA(
instance,'ImageLabel')or IsA(instance,'ImageButton')then return{
'BackgroundTransparency','ImageTransparency'}elseif IsA(instance,
'ScrollingFrame')then return{'BackgroundTransparency',
'ScrollBarImageTransparency'}elseif IsA(instance,'TextBox')then return{
'TextTransparency','BackgroundTransparency'}elseif IsA(instance,'UIStroke')then
return{'Transparency'}end return nil end function Library:Tween(instance,goals,
tweenInfo)local tween=TweenService:Create(instance,tweenInfo or TweenInfo.new(
Library.TweeningSpeed,Library.EasingStyle,Enum.EasingDirection.InOut,0,false,0),
goals)tween:Play()return tween end function Library:Fade(instance,property,show,
duration)if not(instance and property)then return end local priorValue=instance[
property]instance[property]=show and 1 or priorValue local tween=Library:Tween(
instance,{[property]=show and priorValue or 1},TweenInfo.new(duration or Library
.TweeningSpeed,Library.EasingStyle,Enum.EasingDirection.InOut,0,false,0))if not
show then tween.Completed:Once(function()schedule(function()if instance.Parent
then instance[property]=priorValue end end)end)end return tween end local 
function getAbsolutePosition(guiObject)return guiObject.AbsolutePosition end
local function isPressInput(input)local inputType=input.UserInputType return
inputType==Enum.UserInputType.MouseButton1 or inputType==Enum.UserInputType.
Touch end local function isMoveInput(input)local inputType=input.UserInputType
return inputType==Enum.UserInputType.MouseMovement or inputType==Enum.
UserInputType.Touch end local function createDragHandle(parent,size)return
Library:Create('TextButton',{Parent=parent,Text='',AutoButtonColor=false,
BackgroundTransparency=1,BorderSizePixel=0,Position=NewUDim2(0,0,0,0),Size=size
or NewUDim2(1,0,1,0),ZIndex=6,Active=true})end function Library:Resizify(parent)
local handle=Library:Create('TextButton',{Position=NewUDim2(1,-10,1,-10),
BorderColor3=NewRGB(0,0,0),Size=NewUDim2(0,10,0,10),BorderSizePixel=0,
BackgroundColor3=NewRGB(255,255,255),Parent=parent,BackgroundTransparency=1,Text
='',Active=true})local resizing=false local startSize local startInputPosition
local minSize=parent.Size handle.InputBegan:Connect(function(input)if
isPressInput(input)then resizing=true startInputPosition=input.Position
startSize=parent.Size end end)handle.InputEnded:Connect(function(input)if
isPressInput(input)then resizing=false end end)Library:Connection(
UserInputService.InputChanged,function(input)if resizing and isMoveInput(input)
then local viewport=Library.Items.AbsoluteSize parent.Size=NewUDim2(startSize.X.
Scale,Clamp(startSize.X.Offset+input.Position.X-startInputPosition.X,minSize.X.
Offset,Max(minSize.X.Offset,viewport.X)),startSize.Y.Scale,Clamp(startSize.Y.
Offset+input.Position.Y-startInputPosition.Y,minSize.Y.Offset,Max(minSize.Y.
Offset,viewport.Y)))end end)Library:Connection(UserInputService.InputEnded,
function(input)if isPressInput(input)then resizing=false end end)end function
Library:Hovering(target)if Type(target)=='table'then for U=1,#target do if
Library:Hovering(target[U])then return true end end return nil else local mouse=
MouseLocation()local inset=GetGuiInset(GuiService)local mouseX=mouse.X-inset.X
local mouseY=mouse.Y-inset.Y local insideY=target.AbsolutePosition.Y<=mouseY and
mouseY<=target.AbsolutePosition.Y+target.AbsoluteSize.Y local insideX=target.
AbsolutePosition.X<=mouseX and mouseX<=target.AbsolutePosition.X+target.
AbsoluteSize.X return insideY and insideX end end function Library:Draggify(
parent,handles,allowOffscreen,onDragEnded)local dragging=false local dragStart
local originPosition parent.Active=true local function beginDrag(input)local
absolute=getAbsolutePosition(parent)local root=parent:FindFirstAncestorWhichIsA(
'ScreenGui')if root and root.IgnoreGuiInset then absolute+=GetGuiInset(
GuiService)end parent.AnchorPoint=NewVector2(0,0)parent.Position=NewUDim2(0,
absolute.X,0,absolute.Y)dragging=true dragStart=input.Position originPosition=
absolute end local function endDrag()if not dragging then return end dragging=
false if onDragEnded then pcall(onDragEnded,parent)end end local function 
bindHandle(handle)if not handle or not IsA(handle,'GuiObject')then return end
handle.InputBegan:Connect(function(input)if isPressInput(input)then beginDrag(
input)end end)end bindHandle(parent)if handles==true then Library:Connection(
UserInputService.InputBegan,function(input)if isPressInput(input)and parent.
Visible and parent.Parent and Library:Hovering(parent)then beginDrag(input)end
end)elseif Type(handles)=='table'then for U=1,#handles do bindHandle(handles[U])
end end Library:Connection(UserInputService.InputChanged,function(input)if not(
dragging and isMoveInput(input))then return end local delta=input.Position-
dragStart local nextX=originPosition.X+delta.X local nextY=originPosition.Y+
delta.Y if not allowOffscreen then local viewport=Library.Items.AbsoluteSize
local absoluteSize=parent.AbsoluteSize nextX=Clamp(nextX,0,Max(0,viewport.X-
absoluteSize.X))nextY=Clamp(nextY,0,Max(0,viewport.Y-absoluteSize.Y))end parent.
AnchorPoint=NewVector2(0,0)parent.Position=NewUDim2(0,nextX,0,nextY)end)Library:
Connection(UserInputService.InputEnded,function(input)if isPressInput(input)then
endDrag()end end)end function Library:Convert(color)local channels={}for channel
in string.gmatch(color,'[^,]+')do Insert(channels,tonumber(channel))end if#
channels==4 then return unpack(channels)else return end end function Library:
Lerp(from,to,alpha)alpha=alpha or 1/8 return from*(1-alpha)+to*alpha end
function Library:ConvertEnum(value)if TypeOf(value)=='EnumItem'then return value
end if value==nil or value=='NONE'or value=='nil'or value==''then return'NONE'
end if Type(value)~='string'then return'NONE'end local parts={}for part in
string.gmatch(value,'[%w_]+')do Insert(parts,part)end local startIndex=1 if
parts[1]=='Enum'then startIndex=2 end if parts[startIndex]==nil then return
'NONE'end local cursor=Enum for U=startIndex,#parts do local nextValue=cursor[
parts[U] ]if nextValue==nil then return'NONE'end cursor=nextValue end if TypeOf(
cursor)=='EnumItem'then return cursor end return'NONE'end function Library:
ConvertHex(color,alpha)local red=Floor(color.R*255)local green=Floor(color.G*255
)local blue=Floor(color.B*255)local alphaByte=alpha and Floor(alpha*255)or 255
return Format('#%02X%02X%02X%02X',red,green,blue,alphaByte)end function Library:
ConvertFromHex(hex)hex=hex:gsub('#','')local red=tonumber(hex:sub(1,2),16)/255
local green=tonumber(hex:sub(3,4),16)/255 local blue=tonumber(hex:sub(5,6),16)/
255 local alpha=tonumber(hex:sub(7,8),16)and tonumber(hex:sub(7,8),16)/255 or 1
return NewColor3(red,green,blue),alpha end function Library:ParseConfigColor(
value)if TypeOf(value)=='Color3'then return value end if Type(value)=='string'
then local hex=value:gsub('#','')if#hex<6 then return nil end hex=hex:sub(1,6)
local ok,color=pcall(FromHex,hex)if ok and TypeOf(color)=='Color3'then return
color end return nil end if Type(value)~='table'then return nil end if value.
Color~=nil then return Library:ParseConfigColor(value.Color)end if Type(value.R)
=='number'and Type(value.G)=='number'and Type(value.B)=='number'then return
NewColor3(value.R,value.G,value.B)end return nil end local function 
normalizeConfigName(rawName)local name=tostring(rawName or''):gsub('\\','/')name
=name:match('([^/]+)$')or name name=name:gsub('%.cfg$','')name=name:match(
'^%s*(.-)%s*$')or name return name end local function resolveConfigPath(rawName)
local name=normalizeConfigName(rawName)if name==''then return nil,nil end return
name,Library.Directory..'/configs/'..name..'.cfg'end local CONFIG_UI_FLAG_SKIP={
config_Name_list=true,config_name_list=true,config_Name_text=true}local
OPTION_SETTINGS_SUFFIX='OPTION_SETTINGS'local function isConfigUiFlag(flagName)
if CONFIG_UI_FLAG_SKIP[flagName]then return true end return Type(flagName)==
'string'and flagName:sub(-#OPTION_SETTINGS_SUFFIX)==OPTION_SETTINGS_SUFFIX end
local function isInputActive(e)if TypeOf(e)~='EnumItem'then return false end if
e.EnumType==Enum.KeyCode then return UserInputService:IsKeyDown(e)end if e.
EnumType==Enum.UserInputType then return UserInputService:IsMouseButtonPressed(e
)end return false end local function stringifyKeybindEnum(e)if e==nil or e==
'NONE'or e=='nil'then return'NONE'end return tostring(e)end local
OVERLAY_POSITIONS_PATH=Library.Directory..'/overlay_positions.cfg'local function 
captureGuiPosition(guiObject)if not guiObject then return nil end local position
=guiObject.Position local anchorPoint=guiObject.AnchorPoint return{XScale=
position.X.Scale,XOffset=position.X.Offset,YScale=position.Y.Scale,YOffset=
position.Y.Offset,AnchorX=anchorPoint.X,AnchorY=anchorPoint.Y}end local function 
isFiniteNumber(value)return Type(value)=='number'and value==value and Abs(value)
<Infinite end local function isOverlayPositionTable(value)return Type(value)==
'table'and isFiniteNumber(value.XScale)and isFiniteNumber(value.XOffset)and
isFiniteNumber(value.YScale)and isFiniteNumber(value.YOffset)and isFiniteNumber(
value.AnchorX)and isFiniteNumber(value.AnchorY)end function Library:
SaveOverlayPositions(overlays)if unloaded or not overlays then return false end
local payload={}for name,guiObject in overlays do local captured=
captureGuiPosition(guiObject)if captured then payload[name]=captured end end
local encodeOk,encoded=pcall(HttpService.JSONEncode,HttpService,payload)if not
encodeOk then return false end local writeOk=pcall(storage.write,
OVERLAY_POSITIONS_PATH,encoded)return writeOk end function Library:
LoadOverlayPositions(overlays)if unloaded or not overlays then return false end
local readOk,raw=pcall(storage.read,OVERLAY_POSITIONS_PATH)if not readOk or
Type(raw)~='string'then return false end local decodeOk,payload=pcall(
HttpService.JSONDecode,HttpService,raw)if not decodeOk or Type(payload)~='table'
then return false end for name,guiObject in overlays do local captured=payload[
name]if guiObject and isOverlayPositionTable(captured)then guiObject.AnchorPoint
=NewVector2(captured.AnchorX,captured.AnchorY)guiObject.Position=NewUDim2(
captured.XScale,captured.XOffset,captured.YScale,captured.YOffset)end end return
true end local configNameListDropdown function Library:UpdateConfigList()if not
configNameListDropdown then return end local names={}local listedOk,listedFiles=
pcall(storage.list,Library.Directory..'/configs')if listedOk and Type(
listedFiles)=='table'then for p,aB in listedFiles do local name=
normalizeConfigName(aB)if name~=''then names[#names+1]=name end end end
configNameListDropdown.Options=names configNameListDropdown.RefreshOptions(names
)if configNameListDropdown.Current~=nil then configNameListDropdown.Set(
configNameListDropdown.Current,true)end end local function createOutlinedPanel(
parent,opts)opts=opts or{}local className=opts.className or'Frame'local
outlineProps={Parent=parent,Name='\0',Position=opts.position or NewUDim2(0,0,0,
14),BorderColor3=NewRGB(0,0,0),Size=opts.size or NewUDim2(1,0,0,18),
BorderSizePixel=0,BackgroundColor3=Themes.preset.outline}if opts.anchorPoint
then outlineProps.AnchorPoint=opts.anchorPoint end if className=='TextButton'
then outlineProps.Text=''outlineProps.AutoButtonColor=opts.autoButtonColor==true
end local outline=Library:Create(className,outlineProps)Library:Themify(outline,
'outline','BackgroundColor3')local inline=Library:Create('Frame',{Parent=outline
,Name='\0',Position=NewUDim2(0,1,0,1),BorderColor3=NewRGB(0,0,0),Size=NewUDim2(1
,-2,1,-2),BorderSizePixel=0,BackgroundColor3=Themes.preset.inline})Library:
Themify(inline,'inline','BackgroundColor3')local background=Library:Create(
'Frame',{Parent=inline,Name='\0',Position=NewUDim2(0,1,0,1),BorderColor3=NewRGB(
0,0,0),Size=NewUDim2(1,-2,1,-2),BorderSizePixel=0,BackgroundColor3=NewRGB(255,
255,255)})if opts.selectedGradient then local gradient=Library:Create(
'UIGradient',{Rotation=90,Parent=background,Color=ColorSequence.new({
ColorSequenceKeypoint.new(0,Themes.preset.inline),ColorSequenceKeypoint.new(1,
Themes.preset.gradient)})})Library:SaveGradient(gradient,'Selected')end return
outline,inline,background end function Library:Keypicker(opts)local control={
Name=opts.Name or'Color',Flag=opts.Flag or opts.Name or'Colorpicker',Callback=
opts.Callback or function()end,Color=opts.Color or NewColor3(1,1,1),Alpha=opts.
Alpha or opts.Transparency or 0,Open=false,Items={}}local draggingSatVal=false
local draggingHue=false local draggingAlpha=false local hue,saturation,value=
control.Color:ToHSV()local alpha=control.Alpha Flags[control.Flag]={Color=
control.Color,Transparency=control.Alpha}local items=control.Items do items.
ColorpickerObject=Library:Create('TextButton',{Name='\0',Text='',AutoButtonColor
=false,Parent=self.Items.Components,BorderColor3=NewRGB(0,0,0),Size=NewUDim2(0,
24,0,11),BorderSizePixel=0,BackgroundColor3=Themes.preset.inline})Library:
Themify(items.ColorpickerObject,'inline','BackgroundColor3')items.
InlineColorPicker=Library:Create('Frame',{Parent=items.ColorpickerObject,Name=
'\0',Position=NewUDim2(0,1,0,1),BorderColor3=NewRGB(0,0,0),Size=NewUDim2(1,-2,1,
-2),BorderSizePixel=0,BackgroundColor3=NewRGB(255,255,255)})Library:Create(
'UIGradient',{Color=ColorSequence.new({ColorSequenceKeypoint.new(0,NewRGB(162,
162,162)),ColorSequenceKeypoint.new(1,NewRGB(162,162,162))}),Parent=items.
InlineColorPicker})items.Inner=Library:Create('Frame',{Parent=items.
InlineColorPicker,Name='\0',Position=NewUDim2(0,2,0,2),BorderColor3=NewRGB(0,0,0
),Size=NewUDim2(1,-4,1,-4),BorderSizePixel=0,BackgroundColor3=NewRGB(255,255,255
)})items.Colorpicker=Library:Create('TextButton',{Parent=Library.Other,Text='',
AutoButtonColor=false,Name='\0',Visible=false,BorderColor3=NewRGB(0,0,0),Size=
NewUDim2(0,214,0,210),BorderSizePixel=0,BackgroundColor3=Themes.preset.inline})
Library:Themify(items.Colorpicker,'inline','BackgroundColor3')items.Fade=Library
:Create('Frame',{BorderColor3=NewRGB(0,0,0),Parent=items.Colorpicker,Name='\0',
BackgroundTransparency=1,Position=NewUDim2(0,1,0,23),Size=NewUDim2(1,-2,1,-24),
ZIndex=100,BorderSizePixel=0,BackgroundColor3=Themes.preset.gradient})Library:
Themify(items.Fade,'gradient','BackgroundColor3')items.UIStroke=Library:Create(
'UIStroke',{Color=Themes.preset.outline,LineJoinMode=Enum.LineJoinMode.Miter,
Parent=items.Colorpicker,ApplyStrokeMode=Enum.ApplyStrokeMode.Border})Library:
Themify(items.UIStroke,'outline','Color')items.ColorTab=Library:Create('Frame',{
Parent=items.Colorpicker,Name='\0',Position=NewUDim2(0,1,0,23),BorderColor3=
NewRGB(0,0,0),Size=NewUDim2(1,-2,1,-24),BorderSizePixel=0,BackgroundColor3=
Themes.preset.gradient})Library:Themify(items.ColorTab,'gradient',
'BackgroundColor3')Library:Create('UIPadding',{PaddingTop=NewUDim(0,2),
PaddingBottom=NewUDim(0,2),Parent=items.ColorTab,PaddingRight=NewUDim(0,2),
PaddingLeft=NewUDim(0,2)})items.SatValHolder=Library:Create('Frame',{Name='\0',
Parent=items.ColorTab,BorderColor3=NewRGB(0,0,0),Size=NewUDim2(1,-36,1,-41),
BorderSizePixel=0,BackgroundColor3=Themes.preset.outline})Library:Themify(items.
SatValHolder,'outline','BackgroundColor3')items.Inline=Library:Create('Frame',{
Parent=items.SatValHolder,Name='\0',Position=NewUDim2(0,1,0,1),BorderColor3=
NewRGB(0,0,0),Size=NewUDim2(1,-2,1,-2),BorderSizePixel=0,BackgroundColor3=Themes
.preset.inline})Library:Themify(items.Inline,'inline','BackgroundColor3')items.
Color=Library:Create('Frame',{Parent=items.Inline,Name='\0',Position=NewUDim2(0,
1,0,1),BorderColor3=NewRGB(0,0,0),Size=NewUDim2(1,-2,1,-2),BorderSizePixel=0,
BackgroundColor3=NewRGB(0,221,255)})items.Val=Library:Create('Frame',{Name='\0',
Parent=items.Color,BorderColor3=NewRGB(0,0,0),Size=NewUDim2(1,0,1,0),
BorderSizePixel=0,BackgroundColor3=NewRGB(255,255,255)})Library:Create(
'UIGradient',{Parent=items.Val,Transparency=NumberSequence.new({
NumberSequenceKeypoint.new(0,0),NumberSequenceKeypoint.new(1,1)})})items.
SatValPicker=Library:Create('Frame',{Name='\0',AnchorPoint=NewVector2(0.5,0),
Parent=items.Color,BorderColor3=NewRGB(0,0,0),Size=NewUDim2(0,3,0,3),
BorderSizePixel=0,ZIndex=3,BackgroundColor3=NewRGB(0,0,0)})items.inline=Library:
Create('Frame',{Parent=items.SatValPicker,Name='\0',ZIndex=3,Position=NewUDim2(0
,1,0,1),BorderColor3=NewRGB(0,0,0),Size=NewUDim2(1,-2,1,-2),BorderSizePixel=0,
BackgroundColor3=NewRGB(255,255,255)})items.Sat=Library:Create('TextButton',{
Parent=items.Color,Name='\0',Text='',AutoButtonColor=false,Size=NewUDim2(1,0,1,0
),BorderColor3=NewRGB(0,0,0),ZIndex=2,BorderSizePixel=0,BackgroundColor3=NewRGB(
255,255,255)})Library:Create('UIGradient',{Rotation=270,Transparency=
NumberSequence.new({NumberSequenceKeypoint.new(0,0),NumberSequenceKeypoint.new(1
,1)}),Parent=items.Sat,Color=ColorSequence.new({ColorSequenceKeypoint.new(0,
NewRGB(0,0,0)),ColorSequenceKeypoint.new(1,NewRGB(0,0,0))})})local function 
buildLabeledGradientTextbox(position)local shell,inline,input=
createOutlinedPanel(items.ColorTab,{position=position,size=NewUDim2(1,-36,0,18),
anchorPoint=NewVector2(0,1),selectedGradient=true})items.Inline=inline items.
Input=input local textBox=Library:Create('TextBox',{CursorPosition=-1,Parent=
input,TextColor3=Themes.preset.text_color,BorderColor3=NewRGB(0,0,0),Text=
'255, 255, 255, 0',Name='\0',ClearTextOnFocus=false,Size=NewUDim2(1,-2,1,-2),
Position=NewUDim2(0,1,0,1),BorderSizePixel=0,TextXAlignment=Enum.TextXAlignment.
Left,BackgroundTransparency=1,PlaceholderColor3=Themes.preset.text_color,
AutomaticSize=Enum.AutomaticSize.X,FontFace=Library.Font,TextSize=Library.
TextSize,BackgroundColor3=NewRGB(255,255,255)})Library:Create('UIStroke',{Parent
=textBox,LineJoinMode=Enum.LineJoinMode.Miter})Library:Create('UIPadding',{
PaddingLeft=NewUDim(0,3),Parent=textBox})return shell,textBox end items.
AlphaInputFrame,items.InputAlpha=buildLabeledGradientTextbox(NewUDim2(0,0,1,0))
items.RGBTextBox,items.RGBInput=buildLabeledGradientTextbox(NewUDim2(0,0,1,-20))
items.AlphaSlider=Library:Create('TextButton',{AnchorPoint=NewVector2(1,1),
Parent=items.ColorTab,Name='\0',AutoButtonColor=false,Text='',Position=NewUDim2(
1,0,1,0),BorderColor3=NewRGB(0,0,0),Size=NewUDim2(0,16,1,0),BorderSizePixel=0,
BackgroundColor3=Themes.preset.outline})Library:Themify(items.AlphaSlider,
'outline','BackgroundColor3')items.Inline=Library:Create('Frame',{Parent=items.
AlphaSlider,Name='\0',Position=NewUDim2(0,1,0,1),BorderColor3=NewRGB(0,0,0),Size
=NewUDim2(1,-2,1,-2),BorderSizePixel=0,BackgroundColor3=Themes.preset.inline})
Library:Themify(items.Inline,'inline','BackgroundColor3')items.Background=
Library:Create('Frame',{Parent=items.Inline,Name='\0',Position=NewUDim2(0,1,0,1)
,BorderColor3=NewRGB(0,0,0),Size=NewUDim2(1,-2,1,-2),BorderSizePixel=0,
BackgroundColor3=NewRGB(255,255,255)})Library:Create('UIGradient',{Rotation=90,
Parent=items.Background,Color=ColorSequence.new({ColorSequenceKeypoint.new(0,
NewRGB(255,255,255)),ColorSequenceKeypoint.new(1,NewRGB(9,9,9))})})items.
AlphaPicker=Library:Create('Frame',{Parent=items.Background,Name='\0',BorderMode
=Enum.BorderMode.Inset,BorderColor3=NewRGB(0,0,0),Size=NewUDim2(1,2,0,3),
Position=NewUDim2(0,-1,0,-1),BackgroundColor3=NewRGB(255,255,255)})items.
HueSlider=Library:Create('TextButton',{AnchorPoint=NewVector2(1,1),Parent=items.
ColorTab,Text='',AutoButtonColor=false,Name='\0',Position=NewUDim2(1,-18,1,0),
BorderColor3=NewRGB(0,0,0),Size=NewUDim2(0,16,1,0),BorderSizePixel=0,
BackgroundColor3=Themes.preset.outline})Library:Themify(items.HueSlider,
'outline','BackgroundColor3')items.Inline=Library:Create('Frame',{Parent=items.
HueSlider,Name='\0',Position=NewUDim2(0,1,0,1),BorderColor3=NewRGB(0,0,0),Size=
NewUDim2(1,-2,1,-2),BorderSizePixel=0,BackgroundColor3=Themes.preset.inline})
Library:Themify(items.Inline,'inline','BackgroundColor3')items.hue_drag=Library:
Create('Frame',{Parent=items.Inline,Name='\0',Position=NewUDim2(0,1,0,1),
BorderColor3=NewRGB(0,0,0),Size=NewUDim2(1,-2,1,-2),BorderSizePixel=0,
BackgroundColor3=NewRGB(255,255,255)})Library:Create('UIGradient',{Rotation=90,
Parent=items.hue_drag,Color=ColorSequence.new({ColorSequenceKeypoint.new(0,
NewRGB(255,0,0)),ColorSequenceKeypoint.new(0.17,NewRGB(255,255,0)),
ColorSequenceKeypoint.new(0.33,NewRGB(0,255,0)),ColorSequenceKeypoint.new(0.5,
NewRGB(0,255,255)),ColorSequenceKeypoint.new(0.67,NewRGB(0,0,255)),
ColorSequenceKeypoint.new(0.83,NewRGB(255,0,255)),ColorSequenceKeypoint.new(1,
NewRGB(255,0,0))})})items.HuePicker=Library:Create('Frame',{Parent=items.
hue_drag,Name='\0',BorderMode=Enum.BorderMode.Inset,BorderColor3=NewRGB(0,0,0),
Size=NewUDim2(1,2,0,3),Position=NewUDim2(0,-1,0,-1),BackgroundColor3=NewRGB(255,
255,255)})items.TabButtons=Library:Create('Frame',{Parent=items.Colorpicker,Name
='\0',Position=NewUDim2(0,0,0,0),BorderColor3=NewRGB(0,0,0),Size=NewUDim2(1,0,0,
23),BorderSizePixel=0,BackgroundColor3=NewRGB(255,255,255)})items.Accent=Library
:Create('Frame',{Name='\0',Parent=items.TabButtons,BorderColor3=NewRGB(0,0,0),
Size=NewUDim2(1,0,0,2),BorderSizePixel=0,BackgroundColor3=Themes.preset.accent})
Library:Themify(items.Accent,'accent','BackgroundColor3')Library:Create(
'UIGradient',{Rotation=90,Parent=items.Accent,Color=ColorSequence.new({
ColorSequenceKeypoint.new(0,Themes.preset.accent_light),ColorSequenceKeypoint.
new(1,Themes.preset.accent_dark)})})items.Outline=Library:Create('Frame',{Parent
=items.TabButtons,Name='\0',Position=NewUDim2(0,0,0,2),BorderColor3=NewRGB(0,0,0
),Size=NewUDim2(1,0,0,1),BorderSizePixel=0,BackgroundColor3=Themes.preset.
outline})Library:Themify(items.Outline,'outline','BackgroundColor3')local
themeGradient=Library:Create('UIGradient',{Rotation=90,Parent=items.TabButtons,
Color=ColorSequence.new({ColorSequenceKeypoint.new(0,Themes.preset.gradient),
ColorSequenceKeypoint.new(1,Themes.preset.background)})})Library:SaveGradient(
themeGradient,'Deselected')items.Buttons=Library:Create('Frame',{Parent=items.
TabButtons,BackgroundTransparency=1,Name='\0',BorderColor3=NewRGB(0,0,0),Size=
NewUDim2(1,0,1,-1),BorderSizePixel=0,BackgroundColor3=NewRGB(255,255,255)})
Library:Create('UIListLayout',{Parent=items.Buttons,FillDirection=Enum.
FillDirection.Horizontal,SortOrder=Enum.SortOrder.LayoutOrder,Padding=NewUDim(0,
-1)})Library:Create('UIPadding',{Parent=items.Buttons,PaddingTop=NewUDim(0,3)})
items.Outline=Library:Create('Frame',{BorderColor3=NewRGB(0,0,0),AnchorPoint=
NewVector2(0,1),Parent=items.TabButtons,Name='\0',Position=NewUDim2(0,0,1,0),
Size=NewUDim2(1,0,0,1),ZIndex=2,BorderSizePixel=0,BackgroundColor3=Themes.preset
.outline})Library:Themify(items.Outline,'outline','BackgroundColor3')local
colorTabNames={'ColorTab'}local selectedColorTab for tabIndex,tabName in
colorTabNames do local tabButton={}tabButton.Button=Library:Create('TextButton',
{Parent=items.Buttons,Name='\0',Size=NewUDim2(0,0,1,0),BorderColor3=NewRGB(0,0,0
),BorderSizePixel=0,Text='',AutomaticSize=Enum.AutomaticSize.X,AutoButtonColor=
false,BackgroundColor3=NewRGB(255,255,255)})tabButton.Background=Library:Create(
'TextLabel',{FontFace=Library.Font,TextColor3=Themes.preset.text_color,
BorderColor3=NewRGB(0,0,0),Text=tabName:gsub('Tab',''),Parent=tabButton.Button,
Name='\0',BackgroundTransparency=tabIndex==1 and 1 or 0,Size=NewUDim2(0,0,1,0),
BorderSizePixel=0,AutomaticSize=Enum.AutomaticSize.XY,TextSize=Library.TextSize,
BackgroundColor3=Themes.preset.tab_background})Library:Themify(tabButton.
Background,'tab_background','BackgroundColor3')tabButton.TextPadding=Library:
Create('UIPadding',{Parent=tabButton.Background,PaddingRight=NewUDim(0,6),
PaddingLeft=NewUDim(0,5)})Library:Create('UIStroke',{Parent=tabButton.Background
,LineJoinMode=Enum.LineJoinMode.Miter})tabButton.Fill=Library:Create('Frame',{
BorderColor3=NewRGB(0,0,0),AnchorPoint=NewVector2(0,1),Parent=tabButton.Button,
Name='\0',Position=NewUDim2(0,0,1,1),Size=NewUDim2(1,0,0,1),ZIndex=3,
BackgroundTransparency=tabIndex==1 and 0 or 1,BorderSizePixel=0,BackgroundColor3
=Themes.preset.gradient})Library:Themify(tabButton.Fill,'gradient',
'BackgroundColor3')local selectedGradient=Library:Create('UIGradient',{Rotation=
90,Parent=tabButton.Button,Color=ColorSequence.new({ColorSequenceKeypoint.new(0,
Themes.preset.inline),ColorSequenceKeypoint.new(1,Themes.preset.gradient)})})
Library:SaveGradient(selectedGradient,'Selected')tabButton.UIStroke=Library:
Create('UIStroke',{Color=Themes.preset.outline,LineJoinMode=Enum.LineJoinMode.
Miter,Parent=tabButton.Button,ApplyStrokeMode=Enum.ApplyStrokeMode.Border})
Library:Themify(tabButton.UIStroke,'outline','Color')if tabIndex==1 then
selectedColorTab=tabButton end tabButton.Button.MouseButton1Click:Connect(
function()for _,otherTabName in colorTabNames do items[otherTabName].Visible=
false end if selectedColorTab then Library:Tween(selectedColorTab.Fill,{
BackgroundTransparency=1})Library:Tween(selectedColorTab.Background,{
BackgroundTransparency=0})end items[tabName].Visible=true Library:Tween(
tabButton.Fill,{BackgroundTransparency=0})Library:Tween(tabButton.Background,{
BackgroundTransparency=1})items.Fade.BackgroundTransparency=0 Library:Tween(
items.Fade,{BackgroundTransparency=1})selectedColorTab=tabButton end)end end
function control.SetVisible(visible)items.Fade.BackgroundTransparency=0 Library:
Tween(items.Fade,{BackgroundTransparency=1})items.Colorpicker.Visible=visible
items.Colorpicker.Parent=visible and Library.Items or Library.Other items.
Colorpicker.Position=NewUDim2(0,items.ColorpickerObject.AbsolutePosition.X+2,0,
items.ColorpickerObject.AbsolutePosition.Y+74)end function control.Set(color,
alphaOverride)if Type(color)=='boolean'then return end if color~=nil then local
parsed=Library:ParseConfigColor(color)if not parsed then return end hue,
saturation,value=parsed:ToHSV()end if alphaOverride~=nil then alpha=tonumber(
alphaOverride)or alpha end local resolvedColor=FromHSV(hue,saturation,value)
items.SatValPicker.Position=NewUDim2(saturation,0,1-value,0)items.AlphaPicker.
Position=NewUDim2(0,-1,alpha,-1)items.HuePicker.Position=NewUDim2(0,-1,hue,-1)
items.Inner.BackgroundColor3=FromHSV(hue,saturation,value)items.
InlineColorPicker.BackgroundColor3=FromHSV(hue,saturation,value)items.Color.
BackgroundColor3=FromHSV(hue,1,1)Flags[control.Flag]={Color=resolvedColor,
Transparency=alpha}local previewColor=items.InlineColorPicker.BackgroundColor3
items.RGBInput.Text=Format('%s, %s, %s, ',Library:Round(previewColor.R*255),
Library:Round(previewColor.G*255),Library:Round(previewColor.B*255))items.
RGBInput.Text=items.RGBInput.Text..Library:Round(1-alpha,0.01)items.InputAlpha.
Text=Library:ConvertHex(previewColor,1-alpha)control.Callback(resolvedColor,
alpha)end function control.UpdateColor()local mouse=MouseLocation()-GetGuiInset(
GuiService)if draggingSatVal then local offset=mouse-items.Sat.AbsolutePosition
local size=items.Sat.AbsoluteSize saturation=Clamp(offset.X/Max(size.X,1),0,1)
value=1-Clamp(offset.Y/Max(size.Y,1),0,1)elseif draggingHue then local offset=
mouse-items.HueSlider.AbsolutePosition hue=Clamp(offset.Y/Max(items.HueSlider.
AbsoluteSize.Y,1),0,1)elseif draggingAlpha then local offset=mouse-items.
AlphaSlider.AbsolutePosition alpha=Clamp(offset.Y/Max(items.AlphaSlider.
AbsoluteSize.Y,1),0,1)end control.Set()end items.ColorpickerObject.
MouseButton1Click:Connect(function()control.Open=not control.Open control.
SetVisible(control.Open)end)Library:Connection(UserInputService.InputChanged,
function(input)if(draggingSatVal or draggingHue or draggingAlpha)and
isMoveInput(input)then control.UpdateColor()end end)Library:Connection(
UserInputService.InputEnded,function(input)if isPressInput(input)then
draggingSatVal=false draggingHue=false draggingAlpha=false end end)items.
AlphaSlider.InputBegan:Connect(function(input)if isPressInput(input)then
draggingAlpha=true end end)items.HueSlider.InputBegan:Connect(function(input)if
isPressInput(input)then draggingHue=true end end)items.Sat.InputBegan:Connect(
function(input)if isPressInput(input)then draggingSatVal=true end end)items.
RGBInput.FocusLost:Connect(function()local text=items.RGBInput.Text local red,
green,blue,alphaChannel=Library:Convert(text)if red and green and blue and
alphaChannel then control.Set(NewRGB(red,green,blue),1-alphaChannel)end end)
items.InputAlpha.FocusLost:Connect(function()local color,alphaChannel=Library:
ConvertFromHex(items.InputAlpha.Text)control.Set(color,1-alphaChannel)end)
control.Set(control.Color,control.Alpha)ConfigFlags[control.Flag]=control.Set
return setmetatable(control,Library)end function Library:GetConfig()local
payload={}for flagName,flagValue in Flags do if not isConfigUiFlag(flagName)then
if Type(flagValue)=='table'and flagValue.Color~=nil then local color=Library:
ParseConfigColor(flagValue.Color)if color then payload[flagName]={Transparency=
flagValue.Transparency or 0,Color=color:ToHex()}end elseif Type(flagValue)==
'table'and(flagValue.key~=nil or flagValue.Key~=nil or flagValue.mode or
flagValue.Mode)then payload[flagName]={Mode=flagValue.mode or flagValue.Mode or
'Toggle',Active=flagValue.active==true or flagValue.Active==true,Key=
stringifyKeybindEnum(flagValue.key or flagValue.Key)}else local valueType=
TypeOf(flagValue)if valueType=='boolean'or valueType=='number'or valueType==
'string'or valueType=='table'then payload[flagName]=flagValue end end end end
local encodeOk,encoded=pcall(HttpService.JSONEncode,HttpService,payload)if not
encodeOk then return nil end return encoded end function Library:LoadConfig(
configJson)if Type(configJson)~='string'or configJson==''then return false end
local decodeOk,payload=pcall(HttpService.JSONDecode,HttpService,configJson)if
not decodeOk or Type(payload)~='table'then return false end local function 
isColorConfigValue(value)return Type(value)=='table'and value.Color~=nil end
local function isKeybindConfigValue(value)if Type(value)~='table'then return
false end if isColorConfigValue(value)then return false end return value.Mode~=
nil or value.mode~=nil or value.Key~=nil or value.key~=nil or value.Active~=nil
or value.active~=nil end local function normalizeKeybindConfigValue(value)local
mode=value.Mode or value.mode or'Toggle'local key=value.Key or value.key or
'NONE'local active if mode=='Always'then active=true elseif mode=='Hold'then
active=isInputActive(Library:ConvertEnum(key))else local savedActive=value.
Active if savedActive==nil then savedActive=value.active end active=savedActive
==true end return{Mode=mode,Key=key,Active=active}end local function 
applyConfigFlag(flagName,value)local setter=ConfigFlags[flagName]if not setter
then return end if isColorConfigValue(value)then local color=Library:
ParseConfigColor(value)if color then setter(color,value.Transparency or 0)return
end end setter(value)end Library.IsLoadingConfig=true pcall(function()for
flagName,flagValue in payload do if not isConfigUiFlag(flagName)and not
isKeybindConfigValue(flagValue)then pcall(applyConfigFlag,flagName,flagValue)end
end for flagName,flagValue in payload do if not isConfigUiFlag(flagName)and
isKeybindConfigValue(flagValue)then pcall(applyConfigFlag,flagName,
normalizeKeybindConfigValue(flagValue))end end end)Library.IsLoadingConfig=false
return true end function Library:Round(value,step)local inverseStep=1/(step or 1
)return Floor(value*inverseStep+0.5)/inverseStep end function Library:
SetFontSize(textSize)Library.TextSize=textSize Library.TextSizeHeader=textSize+2
for p,entry in Library.FontSizeRegistry do entry.Instance.TextSize=entry.Kind==
'header'and Library.TextSizeHeader or Library.TextSize end end function Library:
SetFont(font)Library.Font=font for p,registered in Library.FontRegistry do
pcall(function()registered.FontFace=font end)end end function Library:Themify(
instance,presetKey,propertyName)Insert(Themes.utility[presetKey][propertyName],
instance)end function Library:SaveGradient(gradient,groupName)Insert(Themes.
gradients[groupName],gradient)end function Library:RefreshTheme(presetKey,color)
for propertyName,instances in Themes.utility[presetKey]do for p,instance in
instances do if instance[propertyName]==Themes.preset[presetKey]then instance[
propertyName]=color end end end Themes.preset[presetKey]=color end function
Library:Connection(signal,callback)local connection=signal:Connect(callback)
Insert(Library.Connections,connection)return connection end function Library:
CloseElement()local openElement=Library.OpenElement if not openElement then
return end if openElement.SetVisible then if not openElement.Ignore then
openElement.Open=false openElement.SetVisible(false)end Library.OpenElement={}
return end for U=1,#openElement do local entry=openElement[U]if entry and not
entry.Ignore and entry.SetVisible then entry.Open=false entry.SetVisible(false)
end end Library.OpenElement={}end function Library:Create(className,props)local
instance=NewInstance(className)for propertyName,propertyValue in props do
instance[propertyName]=propertyValue end if props.TextSize~=nil then if props.
TextSize==Library.TextSize then Insert(Library.FontSizeRegistry,{Instance=
instance,Kind='body'})elseif props.TextSize==Library.TextSizeHeader then Insert(
Library.FontSizeRegistry,{Instance=instance,Kind='header'})end end if props.
FontFace~=nil then Insert(Library.FontRegistry,instance)end if className==
'TextButton'then instance.AutoButtonColor=false end return instance end function
Library:Unload()if unloaded then return end unloaded=true for _,connection in
Library.Connections do connection:Disconnect()end Clear(Library.Connections)if
watermarkThread and watermarkThread~=coroutine.running()then task.cancel(
watermarkThread)end watermarkThread=nil for thread in pending do task.cancel(
thread)end Clear(pending)for _,progress in Notifications.ProgressTweens do
progress:Cancel()end Clear(Notifications.ProgressTweens)Clear(Notifications.
Notifs)Clear(Notifications.Fading)Notifications.RefreshScheduled=false if
Library.Items then Library.Items:Destroy()end if Library.Other then Library.
Other:Destroy()end Library.Items,Library.Other=nil,nil Library.NotifyAnchor,
Library.NotifyViewport,Library.KeybindParent=nil,nil,nil configNameListDropdown=
nil Clear(Library.OpenElement)Clear(Library.KeybindPanels)Clear(Library.
ConfigFlags)Clear(Library.Flags)Clear(Library.BoundTogglePairs)Clear(Library.
FontSizeRegistry)Clear(Library.FontRegistry)Clear(Themes.utility)Clear(Themes.
gradients.Selected)Clear(Themes.gradients.Deselected)end local
DEFAULT_SCRIPT_NAME='Moon'local DEFAULT_WATERMARK_FORMAT='%scriptname%'local
WATERMARK_CARD_HEIGHT=20 local WATERMARK_TEXT_WIDTH_PADDING=9 local
WATERMARK_REFRESH_INTERVAL=1 local ACCENT_CARD_HEIGHT=17 local
ACCENT_CARD_TEXT_PADDING=11 local ACCENT_BAR_WIDTH=2 local ACCENT_CARD_TEXT_X=6
local ACCENT_CARD_TEXT_Y=-1 local FONT_ENUM_NAMES={}do local fontEnumItems=Enum.
Font:GetEnumItems()for U=1,#fontEnumItems do FONT_ENUM_NAMES[U]=fontEnumItems[U]
.Name end end local function formatWatermarkDate()return Date('%Y/%m/%d')end
local watermarkHeartbeatStat=nil local watermarkPingStat=nil local function 
refreshWatermarkStatsRefs()local workspaceStats=FindFirstChild(Stats,'Workspace'
)watermarkHeartbeatStat=workspaceStats and FindFirstChild(workspaceStats,
'Heartbeat')or nil local networkStats=FindFirstChild(Stats,'Network')local
serverStats=networkStats and FindFirstChild(networkStats,'ServerStatsItem')or
nil watermarkPingStat=serverStats and FindFirstChild(serverStats,'Data Ping')or
nil end local function getWatermarkFps()local heartbeat=watermarkHeartbeatStat
if not heartbeat or not heartbeat.Parent then refreshWatermarkStatsRefs()
heartbeat=watermarkHeartbeatStat end if not heartbeat then return 0 end local ok
,fps=pcall(function()return Floor(heartbeat:GetValue()+0.5)end)return ok and fps
or 0 end local function getWatermarkPingMs()if localPlayer and localPlayer.
GetNetworkPing then local ok,pingMs=pcall(function()return Floor(localPlayer:
GetNetworkPing()*1000+0.5)end)if ok then return pingMs end end local dataPing=
watermarkPingStat if not dataPing or not dataPing.Parent then
refreshWatermarkStatsRefs()dataPing=watermarkPingStat end if not dataPing then
return 0 end local ok,pingMs=pcall(function()return Floor(dataPing:GetValue()+
0.5)end)return ok and pingMs or 0 end local function replaceWatermarkToken(
formatText,token,value)local needle='%'..token..'%'value=tostring(value or'')
local parts={}local cursor=1 while true do local foundAt=StringFind(formatText,
needle,cursor,true)if not foundAt then parts[#parts+1]=Sub(formatText,cursor)
break end if foundAt>cursor then parts[#parts+1]=Sub(formatText,cursor,foundAt-1
)end parts[#parts+1]=value cursor=foundAt+#needle end return Concat(parts)end
local function formatWatermarkText(formatText,scriptName)if Type(formatText)~=
'string'or formatText==''then formatText=DEFAULT_WATERMARK_FORMAT end if Type(
scriptName)~='string'or scriptName==''then scriptName=DEFAULT_SCRIPT_NAME end
local text=formatText text=replaceWatermarkToken(text,'scriptname',scriptName)
text=replaceWatermarkToken(text,'date',formatWatermarkDate())text=
replaceWatermarkToken(text,'time',Date('%H:%M'))text=replaceWatermarkToken(text,
'fps',tostring(getWatermarkFps())..' fps')text=replaceWatermarkToken(text,'ping'
,tostring(getWatermarkPingMs())..' ms')return text end local function 
measureLibraryTextWidth(text,padding)text=text or''padding=padding or 0 local ok
,bounds=pcall(function()local params=NewInstance('GetTextBoundsParams')params.
Text=text params.Font=Library.Font params.Size=Library.TextSize params.Width=
10000 return TextService:GetTextBoundsAsync(params)end)if ok and bounds then
return bounds.X+padding end local fallback=TextService:GetTextSize(text,Library.
TextSize,Enum.Font.SourceSans,NewVector2(10000,WATERMARK_CARD_HEIGHT))return
fallback.X+padding end local function createAccentCard(opts)local text=opts.Text
or''local width=opts.Width or measureLibraryTextWidth(text,
ACCENT_CARD_TEXT_PADDING)local outline=Library:Create('Frame',{Parent=opts.
Parent,Size=NewUDim2(0,width,0,ACCENT_CARD_HEIGHT),Name='\0',AnchorPoint=opts.
AnchorPoint or NewVector2(0,0),Position=opts.Position or NewUDim2(0,0,0,0),
BorderColor3=NewRGB(0,0,0),BorderSizePixel=0,BackgroundColor3=Themes.preset.
inline,Visible=opts.Visible~=false})Library:Themify(outline,'inline',
'BackgroundColor3')local stroke=Library:Create('UIStroke',{Parent=outline,Color=
Themes.preset.outline,LineJoinMode=Enum.LineJoinMode.Miter})Library:Themify(
stroke,'outline','Color')local holder=Library:Create('Frame',{Parent=outline,
Name='\0',Position=NewUDim2(0,1,0,1),BorderColor3=NewRGB(0,0,0),Size=NewUDim2(1,
-2,1,-2),BorderSizePixel=0,BackgroundColor3=NewRGB(255,255,255)})local
holderGradient=Library:Create('UIGradient',{Rotation=90,Parent=holder,Color=
ColorSequence.new({ColorSequenceKeypoint.new(0,Themes.preset.inline),
ColorSequenceKeypoint.new(1,Themes.preset.gradient)})})Library:SaveGradient(
holderGradient,'Selected')local accent=Library:Create('Frame',{Name='\0',Parent=
outline,BorderColor3=NewRGB(0,0,0),Position=NewUDim2(0,0,0,0),Size=NewUDim2(0,
ACCENT_BAR_WIDTH,1,0),BorderSizePixel=0,BackgroundColor3=Themes.preset.accent})
Library:Themify(accent,'accent','BackgroundColor3')Library:Create('UIGradient',{
Rotation=90,Parent=accent,Color=ColorSequence.new({ColorSequenceKeypoint.new(0,
Themes.preset.accent_light),ColorSequenceKeypoint.new(1,Themes.preset.
accent_dark)})})local label=Library:Create('TextLabel',{FontFace=Library.Font,
Parent=outline,TextColor3=Themes.preset.text_color,BorderColor3=NewRGB(0,0,0),
Text=text,Name='\0',AnchorPoint=NewVector2(0,0.5),Position=NewUDim2(0,
ACCENT_CARD_TEXT_X,0.5,ACCENT_CARD_TEXT_Y),Size=NewUDim2(1,-(ACCENT_CARD_TEXT_X+
4),1,0),BackgroundTransparency=1,TextXAlignment=Enum.TextXAlignment.Left,
TextYAlignment=Enum.TextYAlignment.Center,BorderSizePixel=0,ZIndex=2,TextSize=
Library.TextSize,BackgroundColor3=NewRGB(255,255,255)})Library:Themify(label,
'text_color','TextColor3')return{Outline=outline,Stroke=stroke,Holder=holder,
Accent=accent,Text=label}end local function createInlineCardChrome(opts)opts=
opts or{}local cardProps={Parent=Library.Items,Name='\0',AnchorPoint=opts.
AnchorPoint or NewVector2(0,0),Position=opts.Position,BorderColor3=NewRGB(0,0,0)
,BorderSizePixel=0,BackgroundColor3=Themes.preset.inline,Active=true}if opts.
Size then cardProps.Size=opts.Size end if opts.AutomaticSize then cardProps.
AutomaticSize=opts.AutomaticSize end local card=Library:Create('Frame',cardProps
)Library:Themify(card,'inline','BackgroundColor3')local stroke=Library:Create(
'UIStroke',{Color=Themes.preset.outline,LineJoinMode=Enum.LineJoinMode.Miter,
Parent=card})Library:Themify(stroke,'outline','Color')local holder=Library:
Create('Frame',{Parent=card,Name='\0',Position=NewUDim2(0,1,0,1),BorderColor3=
NewRGB(0,0,0),Size=NewUDim2(1,-2,1,-2),BorderSizePixel=0,BackgroundColor3=
NewRGB(255,255,255)})local holderGradient=Library:Create('UIGradient',{Rotation=
90,Parent=holder,Color=ColorSequence.new({ColorSequenceKeypoint.new(0,Themes.
preset.inline),ColorSequenceKeypoint.new(1,Themes.preset.gradient)})})Library:
SaveGradient(holderGradient,'Selected')local accent=Library:Create('Frame',{Name
='\0',Parent=card,BorderColor3=NewRGB(0,0,0),Size=NewUDim2(1,0,0,2),
BorderSizePixel=0,BackgroundColor3=Themes.preset.accent})Library:Themify(accent,
'accent','BackgroundColor3')local accentTop=Themes.preset.accent_light local
accentBottom=Themes.preset.accent_dark if opts.AccentStyle=='neutral'then
accentTop=NewRGB(255,255,255)accentBottom=NewRGB(158,158,158)end Library:Create(
'UIGradient',{Rotation=90,Parent=accent,Color=ColorSequence.new({
ColorSequenceKeypoint.new(0,accentTop),ColorSequenceKeypoint.new(1,accentBottom)
})})local separator=Library:Create('Frame',{Parent=card,Name='\0',Position=
NewUDim2(0,0,0,2),BorderColor3=NewRGB(0,0,0),Size=NewUDim2(1,0,0,1),
BorderSizePixel=0,BackgroundColor3=Themes.preset.outline})Library:Themify(
separator,'outline','BackgroundColor3')return card,holder end local function 
createDraggableInlineCard(opts)local card=createInlineCardChrome({AnchorPoint=
opts.AnchorPoint or NewVector2(0,0),Position=opts.Position,AutomaticSize=Enum.
AutomaticSize.XY,AccentStyle='neutral'})local title=Library:Create('TextLabel',{
FontFace=Library.Font,TextColor3=NewRGB(239,239,239),BorderColor3=NewRGB(0,0,0),
RichText=true,Text=opts.Name or'',Parent=card,Name='\0',BackgroundTransparency=1
,Position=NewUDim2(0,0,0,-2),BorderSizePixel=0,AutomaticSize=Enum.AutomaticSize.
XY,TextSize=Library.TextSize,BackgroundColor3=NewRGB(255,255,255)})title.Active=
false Library:Create('UIStroke',{Parent=title,LineJoinMode=Enum.LineJoinMode.
Miter})Library:Create('UIPadding',{PaddingTop=NewUDim(0,4),PaddingBottom=
NewUDim(0,4),Parent=title,PaddingRight=NewUDim(0,5),PaddingLeft=NewUDim(0,5)})if
opts.OnMoved then GetPropertyChangedSignal(card,'AbsolutePosition'):Connect(opts
.OnMoved)end Library:Draggify(card,true,false,opts.OnDragEnded)return card,title
end local function createWatermarkCard(opts)local titleText=opts.Name or
DEFAULT_SCRIPT_NAME local card=createInlineCardChrome({AnchorPoint=opts.
AnchorPoint or NewVector2(1,0),Position=opts.Position or NewUDim2(1,-23,0,23),
Size=NewUDim2(0,measureLibraryTextWidth(titleText,WATERMARK_TEXT_WIDTH_PADDING),
0,WATERMARK_CARD_HEIGHT),AccentStyle='accent'})local title=Library:Create(
'TextLabel',{FontFace=Library.Font,TextColor3=Themes.preset.text_color,
BorderColor3=NewRGB(0,0,0),RichText=true,Text=titleText,Parent=card,Name='\0',
AnchorPoint=NewVector2(0.5,0.5),Position=NewUDim2(0.5,0,0.5,0),Size=NewUDim2(1,0
,1,0),BackgroundTransparency=1,BorderSizePixel=0,TextXAlignment=Enum.
TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,TextSize=Library
.TextSize,BackgroundColor3=NewRGB(255,255,255)})title.Active=false Library:
Themify(title,'text_color','TextColor3')Library:Create('UIStroke',{Parent=title,
LineJoinMode=Enum.LineJoinMode.Miter})Library:Draggify(card,true,false,opts.
OnDragEnded)local function setText(text)text=text or''title.Text=text card.Size=
NewUDim2(0,measureLibraryTextWidth(text,WATERMARK_TEXT_WIDTH_PADDING),0,
WATERMARK_CARD_HEIGHT)end return card,title,setText end function Library:Window(
opts)assert(not unloaded and not Library.Items,
'Bbot instances support one window')opts=opts or{}local control={Name=opts.Name
or DEFAULT_SCRIPT_NAME,Size=opts.Size or NewUDim2(0,455,0,605),Items={}}Library.
Items=Library:Create('ScreenGui',{Parent=guiParent,ResetOnSpawn=false,
DisplayOrder=100,Name='Bbot',Enabled=true,ZIndexBehavior=Enum.ZIndexBehavior.
Global,IgnoreGuiInset=true,ClipToDeviceSafeArea=false})pcall(function()Library.
Items.ScreenInsets=Enum.ScreenInsets.None end)Library:Connection(Library.Items.
Destroying,function()Library:Unload()end)Library.Other=Library:Create(
'ScreenGui',{Parent=guiParent,ResetOnSpawn=false,DisplayOrder=100,Name=
'BbotPopovers',Enabled=false,ZIndexBehavior=Enum.ZIndexBehavior.Sibling,
IgnoreGuiInset=true,ClipToDeviceSafeArea=false})pcall(function()Library.Other.
ScreenInsets=Enum.ScreenInsets.None end)Library:Connection(Library.Other.
Destroying,function()Library:Unload()end)local items=control.Items do items.
Window=Library:Create('Frame',{Parent=Library.Items,Name='\0',Position=NewUDim2(
0.5,-control.Size.X.Offset/2,0.5,-control.Size.Y.Offset/2),BorderColor3=NewRGB(0
,0,0),Size=control.Size,BorderSizePixel=0,BackgroundColor3=Themes.preset.outline
})items.Window.Position=NewUDim2(0,items.Window.AbsolutePosition.X+GetGuiInset(
GuiService).X,0,items.Window.AbsolutePosition.Y+GetGuiInset(GuiService).Y)
Library:Themify(items.Window,'outline','BackgroundColor3')items.Inline=Library:
Create('Frame',{Parent=items.Window,Name='\0',Position=NewUDim2(0,1,0,4),
BorderColor3=NewRGB(0,0,0),Size=NewUDim2(1,-2,1,-5),BorderSizePixel=0,
BackgroundColor3=Themes.preset.gradient})Library:Themify(items.Inline,'gradient'
,'BackgroundColor3')items.Gradient=Library:Create('Frame',{Parent=items.Inline,
Name='\0',Position=NewUDim2(0,1,0,1),BorderColor3=NewRGB(0,0,0),Size=NewUDim2(1,
-2,0,16),BorderSizePixel=0,BackgroundColor3=NewRGB(255,255,255)})local
themeGradient=Library:Create('UIGradient',{Rotation=90,Parent=items.Gradient,
Color=ColorSequence.new({ColorSequenceKeypoint.new(0,Themes.preset.inline),
ColorSequenceKeypoint.new(1,Themes.preset.gradient)})})Library:SaveGradient(
themeGradient,'Selected')items.Inline=Library:Create('Frame',{Parent=items.
Inline,Name='\0',Position=NewUDim2(0,5,0,18),BorderColor3=NewRGB(0,0,0),Size=
NewUDim2(1,-10,1,-23),BorderSizePixel=0,BackgroundColor3=Themes.preset.inline})
Library:Themify(items.Inline,'inline','BackgroundColor3')items.Outline=Library:
Create('Frame',{Parent=items.Inline,Name='\0',Position=NewUDim2(0,1,0,1),
BorderColor3=NewRGB(0,0,0),Size=NewUDim2(1,-2,1,-2),BorderSizePixel=0,
BackgroundColor3=Themes.preset.outline})Library:Themify(items.Outline,'outline',
'BackgroundColor3')items.Background=Library:Create('Frame',{Parent=items.Outline
,Name='\0',Position=NewUDim2(0,1,0,1),BorderColor3=NewRGB(0,0,0),Size=NewUDim2(1
,-2,1,-2),BorderSizePixel=0,BackgroundColor3=Themes.preset.background})Library:
Themify(items.Background,'background','BackgroundColor3')items.PageHolder=
Library:Create('Frame',{Parent=items.Background,Name='\0',Position=NewUDim2(0,1,
0,1),BorderColor3=NewRGB(0,0,0),Size=NewUDim2(1,-2,1,-2),BorderSizePixel=0,
BackgroundColor3=Themes.preset.outline})Library:Themify(items.PageHolder,
'outline','BackgroundColor3')items.TabButtons=Library:Create('Frame',{Parent=
items.PageHolder,Name='\0',Position=NewUDim2(0,1,0,1),BorderColor3=NewRGB(0,0,0)
,Size=NewUDim2(1,-2,0,23),BorderSizePixel=0,BackgroundColor3=NewRGB(255,255,255)
})items.Accent=Library:Create('Frame',{Name='\0',Parent=items.TabButtons,
BorderColor3=NewRGB(0,0,0),Size=NewUDim2(1,0,0,2),BorderSizePixel=0,
BackgroundColor3=Themes.preset.accent})Library:Themify(items.Accent,'accent',
'BackgroundColor3')Library:Create('UIGradient',{Rotation=90,Parent=items.Accent,
Color=ColorSequence.new({ColorSequenceKeypoint.new(0,Themes.preset.accent_light)
,ColorSequenceKeypoint.new(1,Themes.preset.accent_dark)})})items.Outline=Library
:Create('Frame',{Parent=items.TabButtons,Name='\0',Position=NewUDim2(0,0,0,2),
BorderColor3=NewRGB(0,0,0),Size=NewUDim2(1,0,0,1),BorderSizePixel=0,
BackgroundColor3=Themes.preset.outline})Library:Themify(items.Outline,'outline',
'BackgroundColor3')local themeGradient=Library:Create('UIGradient',{Rotation=90,
Parent=items.TabButtons,Color=ColorSequence.new({ColorSequenceKeypoint.new(0,
Themes.preset.gradient),ColorSequenceKeypoint.new(1,Themes.preset.background)})}
)Library:SaveGradient(themeGradient,'Deselected')items.Buttons=Library:Create(
'Frame',{Parent=items.TabButtons,BackgroundTransparency=1,Name='\0',BorderColor3
=NewRGB(0,0,0),Size=NewUDim2(1,0,1,-1),BorderSizePixel=0,BackgroundColor3=
NewRGB(255,255,255)})Library:Create('UIListLayout',{Parent=items.Buttons,
FillDirection=Enum.FillDirection.Horizontal,SortOrder=Enum.SortOrder.LayoutOrder
,Padding=NewUDim(0,-1)})Library:Create('UIPadding',{Parent=items.Buttons,
PaddingTop=NewUDim(0,3)})items.Outline=Library:Create('Frame',{BorderColor3=
NewRGB(0,0,0),AnchorPoint=NewVector2(0,1),Parent=items.TabButtons,Name='\0',
Position=NewUDim2(0,0,1,0),Size=NewUDim2(1,0,0,1),ZIndex=2,BorderSizePixel=0,
BackgroundColor3=Themes.preset.outline})Library:Themify(items.Outline,'outline',
'BackgroundColor3')items.PageHolder=Library:Create('Frame',{Parent=items.
PageHolder,Name='\0',Position=NewUDim2(0,1,0,24),BorderColor3=NewRGB(0,0,0),Size
=NewUDim2(1,-2,1,-25),BorderSizePixel=0,BackgroundColor3=Themes.preset.
background})Library:Themify(items.PageHolder,'background','BackgroundColor3')
items.Fade=Library:Create('Frame',{Parent=items.PageHolder,Name='\0',
BackgroundTransparency=1,Size=NewUDim2(1,0,1,0),BorderColor3=NewRGB(0,0,0),
ZIndex=5,BorderSizePixel=0,BackgroundColor3=Themes.preset.background})Library:
Themify(items.Fade,'background','BackgroundColor3')items.FadeGradient=Library:
Create('Frame',{Name='\0',Parent=items.Fade,ZIndex=5,BorderColor3=NewRGB(0,0,0),
Size=NewUDim2(1,0,0,20),BorderSizePixel=0,BackgroundColor3=NewRGB(255,255,255)})
local themeGradient=Library:Create('UIGradient',{Rotation=90,Parent=items.
FadeGradient,Color=ColorSequence.new({ColorSequenceKeypoint.new(0,Themes.preset.
gradient),ColorSequenceKeypoint.new(1,Themes.preset.background)})})Library:
SaveGradient(themeGradient,'Deselected')items.Gradient=Library:Create('Frame',{
Name='\0',Parent=items.PageHolder,BorderColor3=NewRGB(0,0,0),Size=NewUDim2(1,0,0
,20),BorderSizePixel=0,BackgroundColor3=NewRGB(255,255,255)})local themeGradient
=Library:Create('UIGradient',{Rotation=90,Parent=items.Gradient,Color=
ColorSequence.new({ColorSequenceKeypoint.new(0,Themes.preset.gradient),
ColorSequenceKeypoint.new(1,Themes.preset.background)})})Library:SaveGradient(
themeGradient,'Deselected')items.Accent=Library:Create('Frame',{Parent=items.
Window,Name='\0',Position=NewUDim2(0,1,0,1),BorderColor3=NewRGB(0,0,0),Size=
NewUDim2(1,-2,0,2),BorderSizePixel=0,BackgroundColor3=Themes.preset.accent})
Library:Themify(items.Accent,'accent','BackgroundColor3')Library:Create(
'UIGradient',{Rotation=90,Parent=items.Accent,Color=ColorSequence.new({
ColorSequenceKeypoint.new(0,Themes.preset.accent_light),ColorSequenceKeypoint.
new(1,Themes.preset.accent_dark)})})items.Outline=Library:Create('Frame',{Parent
=items.Window,Name='\0',Position=NewUDim2(0,0,0,3),BorderColor3=NewRGB(0,0,0),
Size=NewUDim2(1,0,0,1),BorderSizePixel=0,BackgroundColor3=Themes.preset.outline}
)Library:Themify(items.Outline,'outline','BackgroundColor3')items.UITitle=
Library:Create('TextLabel',{FontFace=Library.Font,TextColor3=Themes.preset.
text_color,BorderColor3=NewRGB(0,0,0),Text=control.Name,Parent=items.Window,Name
='\0',BackgroundTransparency=1,Position=NewUDim2(0,5,0,6),BorderSizePixel=0,
AutomaticSize=Enum.AutomaticSize.XY,TextSize=Library.TextSize,BackgroundColor3=
NewRGB(255,255,255)})Library:Create('UIStroke',{Parent=items.UITitle,
LineJoinMode=Enum.LineJoinMode.Miter})local KEYBIND_HOLDER_GAP=2 local
NOTIFY_STACK_GAP=2 local function syncKeybindHolderPosition()local keybindList=
items.Keybind_List local keybindHolder=items.Keybind_Holder if not keybindList
or not keybindHolder then return end local listPosition=keybindList.Position
keybindHolder.Position=NewUDim2(0,listPosition.X.Offset,0,listPosition.Y.Offset+
keybindList.AbsoluteSize.Y+KEYBIND_HOLDER_GAP)end local function 
saveWindowOverlayPositions()Library:SaveOverlayPositions({Watermark=items.
Watermark,Notification=items.Notify,Keybinds=items.Keybind_List})end items.
Keybind_List,items.KeybindTitle=createDraggableInlineCard({Name='Keybinds',
Position=NewUDim2(0,70,0,500),OnMoved=syncKeybindHolderPosition,OnDragEnded=
saveWindowOverlayPositions})items.Keybind_Holder=Library:Create('Frame',{
BorderColor3=NewRGB(0,0,0),Parent=Library.Items,Name='\0',BackgroundTransparency
=1,Position=NewUDim2(0,70,0,500),Size=NewUDim2(0,0,0,0),BorderSizePixel=0,
AutomaticSize=Enum.AutomaticSize.XY,BackgroundColor3=NewRGB(255,255,255)})
Library.KeybindParent=items.Keybind_Holder Library:Create('UIListLayout',{Parent
=items.Keybind_Holder,Padding=NewUDim(0,2),SortOrder=Enum.SortOrder.LayoutOrder,
HorizontalAlignment=Enum.HorizontalAlignment.Left})GetPropertyChangedSignal(
items.Keybind_List,'AbsoluteSize'):Connect(syncKeybindHolderPosition)
syncKeybindHolderPosition()local setWatermarkCardText control.WatermarkFormat=
DEFAULT_WATERMARK_FORMAT items.Watermark,items.WatermarkTitle,
setWatermarkCardText=createWatermarkCard({Name=formatWatermarkText(control.
WatermarkFormat,control.Name),OnDragEnded=saveWindowOverlayPositions})control.
SetWatermarkText=setWatermarkCardText local function refreshWatermarkDisplay()if
control.SetWatermarkText then control.SetWatermarkText(formatWatermarkText(
control.WatermarkFormat,control.Name))end end refreshWatermarkStatsRefs()
refreshWatermarkDisplay()watermarkThread=task.spawn(function()while not unloaded
do Wait(WATERMARK_REFRESH_INTERVAL)if not unloaded and items.Watermark.Visible
then refreshWatermarkDisplay()end end end)items.Notify,items.NotifyTitle=
createDraggableInlineCard({Name='Notification',AnchorPoint=NewVector2(0,0),
Position=NewUDim2(0,40,0,70),OnMoved=function()if Notifications and
Notifications.RefreshNotifications then Notifications:RefreshNotifications()end
end,OnDragEnded=saveWindowOverlayPositions})Library.NotifyAnchor=items.Notify
Library.NotifyStackGap=NOTIFY_STACK_GAP Library.NotifyViewport=Library:Create(
'Frame',{Parent=Library.Items,Name='\0',Position=NewUDim2(0,0,0,0),Size=
NewUDim2(0,0,0,0),BorderSizePixel=0,BackgroundTransparency=1,ClipsDescendants=
true,ZIndex=1000,Active=false,Visible=true})Library:LoadOverlayPositions({
Watermark=items.Watermark,Notification=items.Notify,Keybinds=items.Keybind_List}
)syncKeybindHolderPosition()Library:Connection(GetPropertyChangedSignal(Library.
Items,'AbsoluteSize'),function()if Notifications and Notifications.
RefreshNotifications then Notifications:RefreshNotifications()end end)end do
Library:Draggify(items.Window,{createDragHandle(items.Window,NewUDim2(1,0,0,22))
},true)Library:Resizify(items.Window)end function control.ToggleMenu(visible)if
control.Tweening then return end if not visible then Library:CloseElement()for _
,panel in Library.KeybindPanels do local modeHolder=panel and panel.Items and
panel.Items.ModeHolder if modeHolder then panel.Open=false if panel.Items.
Dropdown then panel.Items.Dropdown.SetVisible(false)end modeHolder.Visible=false
if panel.Items.Fade then panel.Items.Fade.BackgroundTransparency=1 end end end
end control.Tweening=true if visible then items.Window.Visible=true end local
fadeTargets=GetDescendants(items.Window)Insert(fadeTargets,items.Window)local
lastTween for index=1,#fadeTargets do local instance=fadeTargets[index]local
transparencyProps=Library:GetTransparency(instance)if transparencyProps then if
Type(transparencyProps)=='table'then for _,propertyName in transparencyProps do
lastTween=Library:Fade(instance,propertyName,visible)end else lastTween=Library:
Fade(instance,transparencyProps,visible)end end end lastTween.Completed:Once(
function()if unloaded then return end control.Tweening=false items.Window.
Visible=visible end)end function control.ChangeTitle(title)if Type(title)~=
'string'or title==''then title=control.Name or DEFAULT_SCRIPT_NAME end control.
Name=title items.UITitle.Text=title if control.SetWatermarkText then control.
SetWatermarkText(formatWatermarkText(control.WatermarkFormat,control.Name))end
end function control.ToggleWatermark(visible)items.Watermark.Visible=visible if
visible and control.SetWatermarkText then control.SetWatermarkText(
formatWatermarkText(control.WatermarkFormat,control.Name))end end function
control.ChangeWatermarkTitle(formatText)control.WatermarkFormat=Type(formatText)
=='string'and formatText~=''and formatText or DEFAULT_WATERMARK_FORMAT if
control.SetWatermarkText then control.SetWatermarkText(formatWatermarkText(
control.WatermarkFormat,control.Name))end end function control.ToggleNotify(
visible)items.Notify.Visible=visible Library.NotifyViewport.Visible=visible end
function control.ToggleKeybindList(visible)items.Keybind_List.Visible=visible if
items.Keybind_Holder then items.Keybind_Holder.Visible=visible end end return
setmetatable(control,Library)end function Library:CreateTabScrollColumn(parent)
local scroll=Library:Create('ScrollingFrame',{Parent=parent,Name='\0',Active=
false,ScrollingEnabled=true,AutomaticCanvasSize=Enum.AutomaticSize.Y,
ScrollingDirection=Enum.ScrollingDirection.Y,BackgroundTransparency=1,
BorderSizePixel=0,Size=NewUDim2(0,100,0,100),CanvasSize=NewUDim2(0,0,0,0),
ScrollBarThickness=0,ScrollBarImageColor3=Themes.preset.accent,MidImage=
'rbxassetid://120496541810421',TopImage='rbxassetid://118750478739322',
BottomImage='rbxassetid://74268315755026'})Library:Themify(scroll,'accent',
'ScrollBarImageColor3')local content=Library:Create('Frame',{Parent=scroll,Name=
'\0',BackgroundTransparency=1,BorderSizePixel=0,Size=NewUDim2(1,-4,0,0),
AutomaticSize=Enum.AutomaticSize.Y})Library:Create('UIListLayout',{Parent=
content,Padding=NewUDim(0,4),SortOrder=Enum.SortOrder.LayoutOrder})local 
function syncScrollBarThickness()if scroll.AbsoluteSize.Y<content.AbsoluteSize.Y
then Library:Tween(scroll,{ScrollBarThickness=2})content.Size=NewUDim2(1,-8,0,0)
else Library:Tween(scroll,{ScrollBarThickness=0})content.Size=NewUDim2(1,-4,0,0)
end end GetPropertyChangedSignal(content,'AbsoluteSize'):Connect(
syncScrollBarThickness)GetPropertyChangedSignal(scroll,'AbsoluteSize'):Connect(
syncScrollBarThickness)return scroll,content end function Library:Tab(opts)local
control={Name=opts.name or opts.Name or'visuals',Items={}}local items=control.
Items do items.Button=Library:Create('TextButton',{Parent=self.Items.Buttons,
Name='\0',Size=NewUDim2(0,0,1,0),BorderColor3=NewRGB(0,0,0),BorderSizePixel=0,
Text='',AutomaticSize=Enum.AutomaticSize.XY,AutoButtonColor=false,
BackgroundColor3=NewRGB(255,255,255)})items.Background=Library:Create(
'TextLabel',{FontFace=Library.Font,TextColor3=Themes.preset.text_color,
BorderColor3=NewRGB(0,0,0),Text=control.Name,Parent=items.Button,Name='\0',
BackgroundTransparency=0,Size=NewUDim2(0,0,1,0),BorderSizePixel=0,AutomaticSize=
Enum.AutomaticSize.XY,TextSize=Library.TextSize,BackgroundColor3=Themes.preset.
tab_background})Library:Themify(items.Background,'tab_background',
'BackgroundColor3')items.TextPadding=Library:Create('UIPadding',{Parent=items.
Background,PaddingRight=NewUDim(0,6),PaddingLeft=NewUDim(0,5)})Library:Create(
'UIStroke',{Parent=items.Background,LineJoinMode=Enum.LineJoinMode.Miter})items.
Fill=Library:Create('Frame',{BorderColor3=NewRGB(0,0,0),AnchorPoint=NewVector2(0
,1),Parent=items.Button,Name='\0',Position=NewUDim2(0,0,1,1),Size=NewUDim2(1,-2,
0,1),ZIndex=3,BackgroundTransparency=1,BorderSizePixel=0,BackgroundColor3=Themes
.preset.gradient})Library:Themify(items.Fill,'gradient','BackgroundColor3')local
themeGradient=Library:Create('UIGradient',{Rotation=90,Parent=items.Button,Color
=ColorSequence.new({ColorSequenceKeypoint.new(0,Themes.preset.inline),
ColorSequenceKeypoint.new(1,Themes.preset.gradient)})})Library:SaveGradient(
themeGradient,'Selected')items.UIStroke=Library:Create('UIStroke',{Color=Themes.
preset.outline,LineJoinMode=Enum.LineJoinMode.Miter,Parent=items.Button,
ApplyStrokeMode=Enum.ApplyStrokeMode.Border})Library:Themify(items.UIStroke,
'outline','Color')items.Page=Library:Create('Frame',{Parent=Library.Other,Name=
'\0',Visible=false,BackgroundTransparency=1,Position=NewUDim2(0,2,0,2),
BorderColor3=NewRGB(0,0,0),Size=NewUDim2(1,-4,1,-4),BorderSizePixel=0,
BackgroundColor3=NewRGB(255,255,255)})Library:Create('UIListLayout',{
FillDirection=Enum.FillDirection.Horizontal,HorizontalFlex=Enum.UIFlexAlignment.
Fill,Parent=items.Page,Padding=NewUDim(0,4),SortOrder=Enum.SortOrder.LayoutOrder
,VerticalFlex=Enum.UIFlexAlignment.Fill})items.LeftScroll,items.Left=Library:
CreateTabScrollColumn(items.Page)items.RightScroll,items.Right=Library:
CreateTabScrollColumn(items.Page)end function control.OpenTab()local previousTab
=self.TabInfo if previousTab then Library:Tween(previousTab.Fill,{
BackgroundTransparency=1})Library:Tween(previousTab.Background,{
BackgroundTransparency=0})previousTab.Page.Visible=false previousTab.Page.Parent
=Library.Other end Library:Tween(items.Fill,{BackgroundTransparency=0})Library:
Tween(items.Background,{BackgroundTransparency=1})items.Page.Parent=self.Items.
PageHolder items.Page.Visible=true if previousTab~=items then Library:Tween(self
.Items.Fade,{BackgroundTransparency=1})Library:Tween(self.Items.FadeGradient,{
BackgroundTransparency=1})self.Items.Fade.BackgroundTransparency=0 self.Items.
FadeGradient.BackgroundTransparency=0 end self.TabInfo=control.Items end items.
Button.MouseButton1Down:Connect(function()Library:CloseElement()control.OpenTab(
)end)if not self.TabInfo then items.TextPadding.PaddingRight=NewUDim(0,8)control
.OpenTab()end return setmetatable(control,Library)end function Library:
MultiSection(opts)local control={Tabs=opts.Tabs or{'1','2','3'},Side=opts.side
or opts.Side or'Left',Size=opts.size or opts.Size or nil,Items={},Store={}}local
items=control.Items do items.Section=Library:Create('Frame',{Parent=self.Items[
control.Side],Name='\0',Size=NewUDim2(1,0,control.Size or 0,-4),BorderColor3=
NewRGB(0,0,0),BorderSizePixel=0,AutomaticSize=control.Size and Enum.
AutomaticSize.None or Enum.AutomaticSize.Y,BackgroundColor3=Themes.preset.
outline})Library:Themify(items.Section,'outline','BackgroundColor3')items.
TabButtons=Library:Create('Frame',{Parent=items.Section,Name='\0',ZIndex=2,
Position=NewUDim2(0,1,0,1),BorderColor3=NewRGB(0,0,0),Size=NewUDim2(1,-2,0,23),
BorderSizePixel=0,BackgroundColor3=NewRGB(255,255,255)})items.Accent=Library:
Create('Frame',{Name='\0',ZIndex=2,Parent=items.TabButtons,BorderColor3=NewRGB(0
,0,0),Size=NewUDim2(1,0,0,2),BorderSizePixel=0,BackgroundColor3=Themes.preset.
accent})Library:Themify(items.Accent,'accent','BackgroundColor3')Library:Create(
'UIGradient',{Rotation=90,Parent=items.Accent,Color=ColorSequence.new({
ColorSequenceKeypoint.new(0,Themes.preset.accent_light),ColorSequenceKeypoint.
new(1,Themes.preset.accent_dark)})})items.Outline=Library:Create('Frame',{Parent
=items.TabButtons,Name='\0',ZIndex=2,Position=NewUDim2(0,0,0,2),BorderColor3=
NewRGB(0,0,0),Size=NewUDim2(1,0,0,1),BorderSizePixel=0,BackgroundColor3=Themes.
preset.outline})Library:Themify(items.Outline,'outline','BackgroundColor3')local
themeGradient=Library:Create('UIGradient',{Rotation=90,Parent=items.TabButtons,
Color=ColorSequence.new({ColorSequenceKeypoint.new(0,Themes.preset.gradient),
ColorSequenceKeypoint.new(1,Themes.preset.background)})})Library:SaveGradient(
themeGradient,'Deselected')items.Buttons=Library:Create('Frame',{Parent=items.
TabButtons,BackgroundTransparency=1,ZIndex=3,Name='\0',BorderColor3=NewRGB(0,0,0
),Size=NewUDim2(1,0,1,-1),BorderSizePixel=0,BackgroundColor3=NewRGB(255,255,255)
})Library:Create('UIListLayout',{Parent=items.Buttons,FillDirection=Enum.
FillDirection.Horizontal,SortOrder=Enum.SortOrder.LayoutOrder,Padding=NewUDim(0,
-1)})Library:Create('UIPadding',{Parent=items.Buttons,PaddingTop=NewUDim(0,3)})
items.Outline=Library:Create('Frame',{BorderColor3=NewRGB(0,0,0),AnchorPoint=
NewVector2(0,1),Parent=items.TabButtons,Name='\0',Position=NewUDim2(0,0,1,0),
Size=NewUDim2(1,0,0,1),ZIndex=3,BorderSizePixel=0,BackgroundColor3=Themes.preset
.outline})Library:Themify(items.Outline,'outline','BackgroundColor3')items.
Inline=Library:Create('Frame',{Parent=items.Section,Size=NewUDim2(1,-2,control.
Size and 1 or 0,-4),Name='\0',Position=NewUDim2(0,1,0,4),BorderColor3=NewRGB(0,0
,0),BorderSizePixel=0,AutomaticSize=control.Size and Enum.AutomaticSize.None or
Enum.AutomaticSize.Y,BackgroundColor3=Themes.preset.gradient})Library:Themify(
items.Inline,'gradient','BackgroundColor3')items.Fade=Library:Create('Frame',{
Parent=items.Inline,Size=NewUDim2(1,0,1,-24),Name='\0',Position=NewUDim2(0,0,0,
24),BorderColor3=NewRGB(0,0,0),BorderSizePixel=0,ZIndex=2,BackgroundTransparency
=1,BackgroundColor3=Themes.preset.gradient})Library:Themify(items.Fade,
'gradient','BackgroundColor3')items.Gradient=Library:Create('Frame',{Parent=
items.Inline,Name='\0',Position=NewUDim2(0,1,0,1),BorderColor3=NewRGB(0,0,0),
Size=NewUDim2(1,-2,0,16),BorderSizePixel=0,BackgroundColor3=NewRGB(255,255,255)}
)local themeGradient=Library:Create('UIGradient',{Rotation=90,Parent=items.
Gradient,Color=ColorSequence.new({ColorSequenceKeypoint.new(0,Themes.preset.
inline),ColorSequenceKeypoint.new(1,Themes.preset.gradient)})})Library:
SaveGradient(themeGradient,'Selected')Library:Create('UIPadding',{PaddingBottom=
NewUDim(0,5),Parent=items.Inline})items.Accent=Library:Create('Frame',{Parent=
items.Section,Name='\0',Position=NewUDim2(0,1,0,1),BorderColor3=NewRGB(0,0,0),
Size=NewUDim2(1,-2,0,2),BorderSizePixel=0,BackgroundColor3=Themes.preset.accent}
)Library:Themify(items.Accent,'accent','BackgroundColor3')Library:Create(
'UIGradient',{Rotation=90,Parent=items.Accent,Color=ColorSequence.new({
ColorSequenceKeypoint.new(0,Themes.preset.accent_light),ColorSequenceKeypoint.
new(1,Themes.preset.accent_dark)})})items.Outline=Library:Create('Frame',{Parent
=items.Section,Name='\0',Position=NewUDim2(0,0,0,3),BorderColor3=NewRGB(0,0,0),
Size=NewUDim2(1,0,0,1),BorderSizePixel=0,BackgroundColor3=Themes.preset.outline}
)Library:Themify(items.Outline,'outline','BackgroundColor3')Library:Create(
'UIStroke',{Parent=items.UITitle,LineJoinMode=Enum.LineJoinMode.Miter})items.
Elements=Library:Create('Frame',{BorderColor3=NewRGB(0,0,0),Parent=items.Inline,
Name='\0',Visible=true,BackgroundTransparency=1,Position=NewUDim2(0,6,0,26),Size
=NewUDim2(1,12,0,0),BorderSizePixel=0,AutomaticSize=Enum.AutomaticSize.Y,
BackgroundColor3=NewRGB(255,255,255)})Library:Themify(items.Elements,
'text_outline','BackgroundColor3')Library:Create('UIListLayout',{Parent=items.
Elements,Padding=NewUDim(0,4),SortOrder=Enum.SortOrder.LayoutOrder})items.
ScrollingFrame=Library:Create('ScrollingFrame',{Active=true,ScrollingEnabled=
true,AutomaticCanvasSize=Enum.AutomaticSize.Y,ZIndex=2,BorderSizePixel=0,
CanvasSize=NewUDim2(0,0,0,0),ScrollBarImageColor3=Themes.preset.accent,MidImage=
'rbxassetid://120496541810421',BorderColor3=NewRGB(0,0,0),ScrollBarThickness=0,
Parent=items.Inline,Size=NewUDim2(1,-3,1,-21),TopImage=
'rbxassetid://118750478739322',Position=NewUDim2(0,0,0,23),BottomImage=
'rbxassetid://74268315755026',BackgroundTransparency=1,BackgroundColor3=NewRGB(
255,255,255)})Library:Themify(items.ScrollingFrame,'accent',
'ScrollBarImageColor3')items.ScrollingLine=Library:Create('Frame',{Visible=false
,BorderColor3=NewRGB(0,0,0),AnchorPoint=NewVector2(1,0),Name='\0',Position=
NewUDim2(1,-2,0,22),Parent=items.Inline,Size=NewUDim2(0,4,1,-18),BorderSizePixel
=0,BackgroundColor3=Themes.preset.outline})Library:Themify(items.ScrollingLine,
'outline','BackgroundColor3')GetPropertyChangedSignal(items.Elements,
'AbsoluteSize'):Connect(function()if items.ScrollingFrame.AbsoluteSize.Y<items.
Elements.AbsoluteSize.Y then items.ScrollingLine.Visible=true Library:Tween(
items.ScrollingFrame,{ScrollBarThickness=2})Library:Tween(items.Elements,{Size=
NewUDim2(1,-14,0,0)})else items.ScrollingLine.Visible=false Library:Tween(items.
ScrollingFrame,{ScrollBarThickness=0})Library:Tween(items.Elements,{Size=
NewUDim2(1,-10,0,0)})end end)items.Elements.Parent=items.ScrollingFrame items.
Elements.Position=NewUDim2(0,6,0,6)end for p,tabName in control.Tabs do local
page={Items={}}local pageItems=page.Items do pageItems.Button=Library:Create(
'TextButton',{Parent=items.Buttons,Name='\0',ZIndex=4,Size=NewUDim2(0,0,1,0),
BorderColor3=NewRGB(0,0,0),BorderSizePixel=0,Text='',AutomaticSize=Enum.
AutomaticSize.X,AutoButtonColor=false,BackgroundColor3=NewRGB(255,255,255)})
pageItems.Background=Library:Create('TextLabel',{FontFace=Library.Font,
TextColor3=Themes.preset.text_color,BorderColor3=NewRGB(0,0,0),Text=tabName,
ZIndex=4,Parent=pageItems.Button,Name='\0',BackgroundTransparency=control.
TabInfo and 0 or 1,Size=NewUDim2(0,0,1,0),BorderSizePixel=0,AutomaticSize=Enum.
AutomaticSize.XY,TextSize=Library.TextSize,BackgroundColor3=Themes.preset.
tab_background})Library:Themify(pageItems.Background,'tab_background',
'BackgroundColor3')pageItems.TextPadding=Library:Create('UIPadding',{Parent=
pageItems.Background,PaddingRight=NewUDim(0,6),PaddingLeft=NewUDim(0,5)})Library
:Create('UIStroke',{Parent=pageItems.Background,LineJoinMode=Enum.LineJoinMode.
Miter})pageItems.Fill=Library:Create('Frame',{BorderColor3=NewRGB(0,0,0),
AnchorPoint=NewVector2(0,1),Parent=pageItems.Button,ZIndex=5,Name='\0',Position=
NewUDim2(0,0,1,1),Size=NewUDim2(1,0,0,1),BackgroundTransparency=control.TabInfo
and 1 or 0,BorderSizePixel=0,BackgroundColor3=Themes.preset.gradient})Library:
Themify(pageItems.Fill,'gradient','BackgroundColor3')local themeGradient=Library
:Create('UIGradient',{Rotation=90,Parent=pageItems.Button,Color=ColorSequence.
new({ColorSequenceKeypoint.new(0,Themes.preset.inline),ColorSequenceKeypoint.
new(1,Themes.preset.gradient)})})Library:SaveGradient(themeGradient,'Selected')
pageItems.UIStroke=Library:Create('UIStroke',{Color=Themes.preset.outline,
LineJoinMode=Enum.LineJoinMode.Miter,Parent=pageItems.Button,ApplyStrokeMode=
Enum.ApplyStrokeMode.Border})Library:Themify(pageItems.UIStroke,'outline',
'Color')pageItems.Elements=Library:Create('Frame',{BorderColor3=NewRGB(0,0,0),
Parent=Library.Other,Name='\0',Visible=false,BackgroundTransparency=1,Position=
NewUDim2(0,6,0,26),Size=NewUDim2(1,1,0,0),BorderSizePixel=0,AutomaticSize=Enum.
AutomaticSize.Y,BackgroundColor3=NewRGB(255,255,255)})Library:Themify(pageItems.
Elements,'text_outline','BackgroundColor3')Library:Create('UIListLayout',{Parent
=pageItems.Elements,Padding=NewUDim(0,4),SortOrder=Enum.SortOrder.LayoutOrder})
end function page.OpenTab()local previousPageItems=control.TabInfo if
previousPageItems then items.Fade.BackgroundTransparency=0 Library:Tween(items.
Fade,{BackgroundTransparency=1})Library:Tween(previousPageItems.Fill,{
BackgroundTransparency=1})Library:Tween(previousPageItems.Background,{
BackgroundTransparency=0})previousPageItems.Elements.Visible=false
previousPageItems.Elements.Parent=Library.Other end Library:Tween(pageItems.Fill
,{BackgroundTransparency=0})Library:Tween(pageItems.Background,{
BackgroundTransparency=1})pageItems.Elements.Parent=items.Elements pageItems.
Elements.Visible=true control.TabInfo=pageItems end pageItems.Button.
MouseButton1Down:Connect(function()page.OpenTab()end)if not control.TabInfo then
pageItems.Fill.Size=NewUDim2(1,-2,0,1)pageItems.TextPadding.PaddingRight=
NewUDim(0,8)page.OpenTab()end control.Store[#control.Store+1]=setmetatable(page,
Library)end return unpack(control.Store)end function Library:Section(opts)local
control={Name=opts.name or opts.Name or'Section',Side=opts.side or opts.Side or
'Left',Size=opts.size or opts.Size or nil,Items={}}local items=control.Items do
items.Section=Library:Create('Frame',{Parent=self.Items[control.Side],Name='\0',
Size=NewUDim2(1,0,control.Size or 0,-4),BorderColor3=NewRGB(0,0,0),
BorderSizePixel=0,AutomaticSize=control.Size and Enum.AutomaticSize.None or Enum
.AutomaticSize.Y,BackgroundColor3=Themes.preset.outline})Library:Themify(items.
Section,'outline','BackgroundColor3')items.Inline=Library:Create('Frame',{Parent
=items.Section,Size=NewUDim2(1,-2,control.Size and 1 or 0,-4),Name='\0',Position
=NewUDim2(0,1,0,4),BorderColor3=NewRGB(0,0,0),BorderSizePixel=0,AutomaticSize=
control.Size and Enum.AutomaticSize.None or Enum.AutomaticSize.Y,
BackgroundColor3=Themes.preset.gradient})Library:Themify(items.Inline,'gradient'
,'BackgroundColor3')items.Gradient=Library:Create('Frame',{Parent=items.Inline,
Name='\0',Position=NewUDim2(0,1,0,1),BorderColor3=NewRGB(0,0,0),Size=NewUDim2(1,
-2,0,16),BorderSizePixel=0,BackgroundColor3=NewRGB(255,255,255)})local
themeGradient=Library:Create('UIGradient',{Rotation=90,Parent=items.Gradient,
Color=ColorSequence.new({ColorSequenceKeypoint.new(0,Themes.preset.inline),
ColorSequenceKeypoint.new(1,Themes.preset.gradient)})})Library:SaveGradient(
themeGradient,'Selected')items.Elements=Library:Create('Frame',{BorderColor3=
NewRGB(0,0,0),Parent=items.Inline,Name='\0',BackgroundTransparency=1,Position=
NewUDim2(0,6,0,20),Size=NewUDim2(1,-12,0,0),BorderSizePixel=0,AutomaticSize=Enum
.AutomaticSize.Y,BackgroundColor3=NewRGB(255,255,255)})if control.Size then
items.ScrollingFrame=Library:Create('ScrollingFrame',{Active=true,
ScrollingEnabled=true,AutomaticCanvasSize=Enum.AutomaticSize.Y,ZIndex=2,
BorderSizePixel=0,CanvasSize=NewUDim2(0,0,0,0),ScrollBarImageColor3=Themes.
preset.accent,MidImage='rbxassetid://120496541810421',BorderColor3=NewRGB(0,0,0)
,ScrollBarThickness=0,Parent=items.Inline,Size=NewUDim2(1,-3,1,-23),TopImage=
'rbxassetid://118750478739322',Position=NewUDim2(0,0,0,20),BottomImage=
'rbxassetid://74268315755026',BackgroundTransparency=1,BackgroundColor3=NewRGB(
255,255,255)})Library:Themify(items.ScrollingFrame,'accent',
'ScrollBarImageColor3')items.ScrollingLine=Library:Create('Frame',{Visible=false
,BorderColor3=NewRGB(0,0,0),AnchorPoint=NewVector2(1,0),Name='\0',Position=
NewUDim2(1,-2,0,19),Parent=items.Inline,Size=NewUDim2(0,4,1,-21),BorderSizePixel
=0,BackgroundColor3=Themes.preset.outline})Library:Themify(items.ScrollingLine,
'outline','BackgroundColor3')GetPropertyChangedSignal(items.Elements,
'AbsoluteSize'):Connect(function()if items.ScrollingFrame.AbsoluteSize.Y<items.
Elements.AbsoluteSize.Y then items.ScrollingLine.Visible=true Library:Tween(
items.ScrollingFrame,{ScrollBarThickness=2})Library:Tween(items.Elements,{Size=
NewUDim2(1,-14,0,0)})else items.ScrollingLine.Visible=false Library:Tween(items.
ScrollingFrame,{ScrollBarThickness=0})Library:Tween(items.Elements,{Size=
NewUDim2(1,-10,0,0)})end end)items.Elements.Parent=items.ScrollingFrame items.
Elements.Position=NewUDim2(0,6,0,0)end Library:Create('UIListLayout',{Parent=
items.Elements,Padding=NewUDim(0,4),SortOrder=Enum.SortOrder.LayoutOrder})
Library:Create('UIPadding',{PaddingBottom=NewUDim(0,5),Parent=items.Inline})
items.Accent=Library:Create('Frame',{Parent=items.Section,Name='\0',Position=
NewUDim2(0,1,0,1),BorderColor3=NewRGB(0,0,0),Size=NewUDim2(1,-2,0,2),
BorderSizePixel=0,BackgroundColor3=Themes.preset.accent})Library:Themify(items.
Accent,'accent','BackgroundColor3')Library:Create('UIGradient',{Rotation=90,
Parent=items.Accent,Color=ColorSequence.new({ColorSequenceKeypoint.new(0,Themes.
preset.accent_light),ColorSequenceKeypoint.new(1,Themes.preset.accent_dark)})})
items.Outline=Library:Create('Frame',{Parent=items.Section,Name='\0',Position=
NewUDim2(0,0,0,3),BorderColor3=NewRGB(0,0,0),Size=NewUDim2(1,0,0,1),
BorderSizePixel=0,BackgroundColor3=Themes.preset.outline})Library:Themify(items.
Outline,'outline','BackgroundColor3')items.UITitle=Library:Create('TextLabel',{
FontFace=Library.Font,TextColor3=Themes.preset.text_color,BorderColor3=NewRGB(0,
0,0),Text=control.Name,Parent=items.Section,Name='\0',BackgroundTransparency=1,
Position=NewUDim2(0,5,0,6),BorderSizePixel=0,AutomaticSize=Enum.AutomaticSize.XY
,TextSize=Library.TextSize,BackgroundColor3=NewRGB(255,255,255)})Library:
Themify(items.UITitle,'text_outline','BackgroundColor3')Library:Create(
'UIStroke',{Parent=items.UITitle,LineJoinMode=Enum.LineJoinMode.Miter})Library:
Create('UIPadding',{PaddingBottom=NewUDim(0,1),Parent=items.Section})end return
setmetatable(control,Library)end local function setElementVisible(element,
visible)local items=element.Items for _,object in{items.Object,items.Slider,
items.Dropdown,items.Textbox,items.Group}do if object then object.Visible=
visible end end element.IsVisible=visible end local function 
addElementVisibility(element,hidden)function element:Show()setElementVisible(
self,true)end function element:Hide()setElementVisible(self,false)end if hidden
then element:Hide()end return element end function Library:Toggle(opts)local
control={Name=opts.Name or'Toggle',Flag=opts.Flag or opts.Name or'Toggle',
Enabled=opts.Default or false,Callback=opts.Callback or function()end,Folding=
opts.Folding or false,Collapsable=opts.Collapsing or true,DecoupleFold=opts.
DecoupleFold~=false and(opts.Folding or false),Items={},Expanded=false}local
items=control.Items do if control.Folding then items.FoldContainer=Library:
Create('Frame',{Parent=self.Items.GroupElements or self.Items.Elements,Name='\0'
,BackgroundTransparency=1,BorderSizePixel=0,Size=NewUDim2(1,0,0,0),AutomaticSize
=Enum.AutomaticSize.Y})Library:Create('UIListLayout',{Parent=items.FoldContainer
,Padding=NewUDim(0,4),SortOrder=Enum.SortOrder.LayoutOrder})end items.Object=
Library:Create('TextButton',{FontFace=Library.Font,TextColor3=NewRGB(0,0,0),
BorderColor3=NewRGB(0,0,0),Text='',Parent=items.FoldContainer or self.Items.
GroupElements or self.Items.Elements,BackgroundTransparency=1,Name='\0',Size=
NewUDim2(1,0,0,11),BorderSizePixel=0,TextSize=Library.TextSizeHeader,
BackgroundColor3=NewRGB(255,255,255)})items.Outline=Library:Create('Frame',{Name
='\0',Parent=items.Object,BorderColor3=NewRGB(0,0,0),Size=NewUDim2(0,11,0,11),
BorderSizePixel=0,BackgroundColor3=Themes.preset.outline})Library:Themify(items.
Outline,'outline','BackgroundColor3')items.Accent=Library:Create('Frame',{Parent
=items.Outline,Name='\0',Position=NewUDim2(0,1,0,1),BorderColor3=NewRGB(0,0,0),
Size=NewUDim2(1,-2,1,-2),BorderSizePixel=0,BackgroundColor3=Themes.preset.accent
})Library:Themify(items.Accent,'accent','BackgroundColor3')Library:Themify(items
.Accent,'inline','BackgroundColor3')items.Accent.BackgroundColor3=Themes.preset.
inline Library:Create('UIGradient',{Rotation=90,Parent=items.Accent,Color=
ColorSequence.new({ColorSequenceKeypoint.new(0,Themes.preset.accent_light),
ColorSequenceKeypoint.new(1,Themes.preset.accent_dark)})})items.Name=Library:
Create('TextLabel',{FontFace=Library.Font,TextColor3=Themes.preset.text_color,
BorderColor3=NewRGB(0,0,0),Text=control.Name,Parent=items.Object,Name='\0',
BackgroundTransparency=1,Position=NewUDim2(0,15,0,-2),BorderSizePixel=0,
AutomaticSize=Enum.AutomaticSize.XY,TextSize=Library.TextSize,BackgroundColor3=
NewRGB(255,255,255)})Library:Create('UIStroke',{Parent=items.Name,LineJoinMode=
Enum.LineJoinMode.Miter})items.Components=Library:Create('Frame',{Parent=items.
Object,Name='\0',Position=NewUDim2(1,0,0,0),BorderColor3=NewRGB(0,0,0),Size=
NewUDim2(0,0,1,0),BorderSizePixel=0,BackgroundColor3=NewRGB(255,255,255)})
Library:Create('UIListLayout',{Parent=items.Components,FillDirection=Enum.
FillDirection.Horizontal,SortOrder=Enum.SortOrder.LayoutOrder,
HorizontalAlignment=Enum.HorizontalAlignment.Right,Padding=NewUDim(0,4)})if
control.Folding then items.ArrowHolder=Library:Create('TextButton',{Parent=items
.Components,AutoButtonColor=false,Text='',BackgroundTransparency=1,Name='\0',
BorderColor3=NewRGB(0,0,0),Size=NewUDim2(0,12,0,12),BorderSizePixel=0,
BackgroundColor3=NewRGB(255,255,255)})items.Arrow=Library:Create('ImageLabel',{
ScaleType=Enum.ScaleType.Fit,BorderColor3=NewRGB(0,0,0),Parent=items.ArrowHolder
,Name='\0',ResampleMode=Enum.ResamplerMode.Pixelated,BackgroundTransparency=1,
Size=NewUDim2(0,7,1,7),Image='rbxassetid://108270041153906',BorderSizePixel=0,
BackgroundColor3=NewRGB(255,255,255)})items.Group=Library:Create('Frame',{
LayoutOrder=2,BorderColor3=NewRGB(0,0,0),Parent=Library.Other,Name='\0',Visible=
false,BackgroundTransparency=1,Position=NewUDim2(0,6,0,20),Size=NewUDim2(1,-12,0
,0),BorderSizePixel=0,AutomaticSize=Enum.AutomaticSize.Y,BackgroundColor3=
NewRGB(255,255,255)})items.Fade=Library:Create('Frame',{Parent=items.Group,Name=
'\0',BackgroundTransparency=1,Active=false,Size=NewUDim2(1,12,1,0),BorderColor3=
NewRGB(0,0,0),ZIndex=5,BorderSizePixel=0,BackgroundColor3=NewRGB(40,40,40)})
Library:Themify(items.Fade,'gradient','BackgroundColor3')items.GroupElements=
Library:Create('Frame',{Parent=items.Group,Name='\0',BackgroundTransparency=1,
Size=NewUDim2(1,12,0,0),BorderColor3=NewRGB(0,0,0),BorderSizePixel=0,
AutomaticSize=Enum.AutomaticSize.Y,BackgroundColor3=NewRGB(255,255,255)})Library
:Create('UIListLayout',{Parent=items.GroupElements,Padding=NewUDim(0,4),
SortOrder=Enum.SortOrder.LayoutOrder})Library:Create('UIPadding',{PaddingLeft=
NewUDim(0,9),Parent=items.GroupElements})items.GroupLine=Library:Create('Frame',
{Parent=items.Group,Name='\0',Position=NewUDim2(0,2,0,0),BorderColor3=NewRGB(0,0
,0),Size=NewUDim2(0,3,1,0),BorderSizePixel=0,BackgroundColor3=Themes.preset.
outline})Library:Themify(items.GroupLine,'outline','BackgroundColor3')Library:
Create('UIGradient',{Rotation=90,Transparency=NumberSequence.new({
NumberSequenceKeypoint.new(0,1),NumberSequenceKeypoint.new(0.05,0),
NumberSequenceKeypoint.new(0.5,0.018750011920928955),NumberSequenceKeypoint.new(
0.95,0),NumberSequenceKeypoint.new(1,1)}),Parent=items.GroupLine})end end
function control.RefreshFolding()if not items.GroupElements or not items.
ArrowHolder then return end local nestedControlCount=0 local children=
GetChildren(items.GroupElements)for index=1,#children do local child=children[
index]if not IsA(child,'UIListLayout')and not IsA(child,'UIPadding')then
nestedControlCount=nestedControlCount+1 end end if nestedControlCount>0 then
return end items.ArrowHolder.Visible=false if items.Group then items.Group.
Visible=false items.Group.Parent=Library.Other end control.Folding=false control
.DecoupleFold=false control.Expanded=false end function control.SetExpanded(
expanded)if not control.Folding then return end control.Expanded=expanded==true
if control.Expanded and items.Object.Parent then items.Group.Parent=items.
FoldContainer items.Group.Visible=true Library:Tween(items.Arrow,{Rotation=180})
Library:Tween(items.Fade,{BackgroundTransparency=1})else items.Group.Visible=
false items.Group.Parent=Library.Other Library:Tween(items.Arrow,{Rotation=0})
items.Fade.BackgroundTransparency=0 end end function control.Set(enabled)control
.Enabled=enabled Flags[control.Flag]=enabled control.Callback(enabled)local
accentColor=enabled and Themes.preset.accent or Themes.preset.inline if Library.
IsLoadingConfig then items.Accent.BackgroundColor3=accentColor else Library:
Tween(items.Accent,{BackgroundColor3=accentColor})end if control.Folding and not
control.DecoupleFold then items.Group.Visible=enabled items.Group.Parent=enabled
and items.FoldContainer or Library.Other items.Fade.BackgroundTransparency=0
Library:Tween(items.Arrow or items.Arrow,{Rotation=enabled and 180 or 0})Library
:Tween(items.Fade,{BackgroundTransparency=1})end end if control.Folding and
control.DecoupleFold and items.ArrowHolder then local suppressToggleClick=false
items.ArrowHolder.MouseButton1Click:Connect(function()suppressToggleClick=true
control.SetExpanded(not control.Expanded)schedule(function()suppressToggleClick=
false end)end)items.Object.MouseButton1Click:Connect(function()if
suppressToggleClick then return end control.Enabled=not control.Enabled control.
Set(control.Enabled)end)else items.Object.MouseButton1Click:Connect(function()
control.Enabled=not control.Enabled control.Set(control.Enabled)end)end if
control.Folding and control.DecoupleFold then control.SetExpanded(false)end
control.Set(control.Enabled)ConfigFlags[control.Flag]=control.Set if control.
Folding then schedule(control.RefreshFolding)end setmetatable(control,Library)
local keybindOpts=opts.Keybind if keybindOpts==false then else if keybindOpts==
nil or keybindOpts==true then keybindOpts={}end if Type(keybindOpts)=='table'
then local bindingReady=false local syncingBoundState=false local
boundKeybindOpts={Name=keybindOpts.Name or control.Name,Flag=keybindOpts.Flag or
control.Flag..' Keybind',Mode=keybindOpts.Mode or'Toggle',ShowInList=keybindOpts
.ShowInList~=false,Key=keybindOpts.Key,Default=keybindOpts.Default,Callback=
keybindOpts.Callback}local userKeybindCallback=boundKeybindOpts.Callback
boundKeybindOpts.Callback=function(active)if userKeybindCallback then
userKeybindCallback(active)end if Library.IsLoadingConfig then return end if not
bindingReady or syncingBoundState or Type(active)~='boolean'then return end
syncingBoundState=true control.Set(active)syncingBoundState=false end local
boundKeybind=control:Keybind(boundKeybindOpts)local setToggle=control.Set
control.Set=function(enabled)setToggle(enabled)if Library.IsLoadingConfig then
return end if not bindingReady or syncingBoundState or Type(enabled)~='boolean'
then return end if boundKeybind.Active==enabled then return end
syncingBoundState=true boundKeybind.Set(enabled)syncingBoundState=false end
bindingReady=true control.BoundKeybind=boundKeybind Insert(Library.
BoundTogglePairs,{Toggle=control,Keybind=boundKeybind})end end return
addElementVisibility(control,opts.Hidden)end function Library:Slider(opts)local
control={Name=opts.Name,Suffix=opts.Suffix or'',Flag=opts.Flag or opts.Name or
'Slider',Callback=opts.Callback or function()end,Min=opts.Min or 0,Max=opts.Max
or 100,Intervals=opts.Decimal or 1,Value=opts.Default~=nil and opts.Default or
10,Dragging=false,Items={}}local items=control.Items do items.Slider=Library:
Create('TextButton',{FontFace=Library.Font,TextColor3=NewRGB(0,0,0),BorderColor3
=NewRGB(0,0,0),Text='',Parent=self.Items.GroupElements or self.Items.Elements,
BackgroundTransparency=1,Name='\0',Size=NewUDim2(1,0,0,25),BorderSizePixel=0,
TextSize=Library.TextSizeHeader,BackgroundColor3=NewRGB(255,255,255)})items.
Outline=Library:Create('TextButton',{Parent=items.Slider,Text='',AutoButtonColor
=false,Name='\0',Position=NewUDim2(0,0,0,14),BorderColor3=NewRGB(0,0,0),Size=
NewUDim2(1,0,0,11),BorderSizePixel=0,BackgroundColor3=Themes.preset.outline})
Library:Themify(items.Outline,'outline','BackgroundColor3')items.Accent=Library:
Create('Frame',{Parent=items.Outline,Name='\0',Position=NewUDim2(0,1,0,1),
BorderColor3=NewRGB(0,0,0),Size=NewUDim2(0.5,-2,1,-2),BorderSizePixel=0,
BackgroundColor3=Themes.preset.accent})Library:Themify(items.Accent,'accent',
'BackgroundColor3')Library:Create('UIGradient',{Rotation=90,Parent=items.Accent,
Color=ColorSequence.new({ColorSequenceKeypoint.new(0,Themes.preset.accent_light)
,ColorSequenceKeypoint.new(1,Themes.preset.accent_dark)})})items.Value=Library:
Create('TextLabel',{LayoutOrder=-1,FontFace=Library.Font,TextColor3=Themes.
preset.text_color,BorderColor3=NewRGB(0,0,0),Text='0.1',Parent=items.Outline,
Name='\0',BackgroundTransparency=1,Size=NewUDim2(1,0,1,0),BorderSizePixel=0,
AutomaticSize=Enum.AutomaticSize.XY,TextSize=Library.TextSize,BackgroundColor3=
NewRGB(255,255,255)})Library:Create('UIStroke',{Parent=items.Value,LineJoinMode=
Enum.LineJoinMode.Miter})Library:Create('UIPadding',{Parent=items.Value,
PaddingTop=NewUDim(0,-1)})items.Name=Library:Create('TextLabel',{FontFace=
Library.Font,TextColor3=Themes.preset.text_color,BorderColor3=NewRGB(0,0,0),Text
=control.Name,Parent=items.Slider,Name='\0',BackgroundTransparency=1,Position=
NewUDim2(0,1,0,0),BorderSizePixel=0,AutomaticSize=Enum.AutomaticSize.XY,TextSize
=Library.TextSize,BackgroundColor3=NewRGB(255,255,255)})Library:Create(
'UIStroke',{Parent=items.Name,LineJoinMode=Enum.LineJoinMode.Miter})items.
Components=Library:Create('Frame',{Parent=items.Slider,Name='\0',Position=
NewUDim2(1,0,0,2),BorderColor3=NewRGB(0,0,0),Size=NewUDim2(0,0,0,11),
BorderSizePixel=0,BackgroundColor3=NewRGB(255,255,255)})Library:Create(
'UIListLayout',{FillDirection=Enum.FillDirection.Horizontal,HorizontalAlignment=
Enum.HorizontalAlignment.Right,Parent=items.Components,Padding=NewUDim(0,4),
SortOrder=Enum.SortOrder.LayoutOrder})items.Minus=Library:Create('ImageButton',{
ScaleType=Enum.ScaleType.Fit,AutoButtonColor=false,BorderColor3=NewRGB(0,0,0),
Parent=items.Components,Image='rbxassetid://120056247050601',
BackgroundTransparency=1,Name='\0',Size=NewUDim2(0,7,1,0),BorderSizePixel=0,
BackgroundColor3=NewRGB(255,255,255)})items.Plus=Library:Create('ImageButton',{
ScaleType=Enum.ScaleType.Fit,AutoButtonColor=false,BorderColor3=NewRGB(0,0,0),
Parent=items.Components,Image='rbxassetid://120458671764177',
BackgroundTransparency=1,Name='\0',Size=NewUDim2(0,7,1,0),BorderSizePixel=0,
BackgroundColor3=NewRGB(255,255,255)})items.Interval=Library:Create('TextLabel',
{LayoutOrder=-1,FontFace=Library.Font,TextColor3=Themes.preset.text_color,
BorderColor3=NewRGB(0,0,0),Text=control.Intervals,Parent=items.Components,Name=
'\0',BackgroundTransparency=1,Position=NewUDim2(0,1,0,0),BorderSizePixel=0,
AutomaticSize=Enum.AutomaticSize.XY,TextSize=Library.TextSize,BackgroundColor3=
NewRGB(255,255,255)})Library:Create('UIStroke',{Parent=items.Interval,
LineJoinMode=Enum.LineJoinMode.Miter})Library:Create('UIPadding',{Parent=items.
Interval,PaddingTop=NewUDim(0,-1)})end function control.Set(value)control.Value=
Clamp(Library:Round(value,control.Intervals),control.Min,control.Max)items.
Accent.Size=NewUDim2((control.Value-control.Min)/(control.Max-control.Min),
control.Value==control.Min and 0 or-2,1,-2)items.Value.Text=tostring(control.
Value)..control.Suffix Flags[control.Flag]=control.Value control.Callback(Flags[
control.Flag])end items.Outline.InputBegan:Connect(function(input)if
isPressInput(input)then control.Dragging=true end end)items.Minus.
MouseButton1Down:Connect(function()control.Value=control.Value-control.Intervals
control.Set(control.Value)end)items.Plus.MouseButton1Down:Connect(function()
control.Value=control.Value+control.Intervals control.Set(control.Value)end)
Library:Connection(UserInputService.InputChanged,function(input)if control.
Dragging and isMoveInput(input)then local alpha=(input.Position.X-items.Outline.
AbsolutePosition.X)/items.Outline.AbsoluteSize.X local nextValue=(control.Max-
control.Min)*alpha+control.Min control.Set(nextValue)end end)Library:Connection(
UserInputService.InputEnded,function(input)if isPressInput(input)then control.
Dragging=false end end)control.Set(control.Value)ConfigFlags[control.Flag]=
control.Set return addElementVisibility(setmetatable(control,Library),opts.
Hidden)end function Library:Dropdown(opts)local control={Name=opts.Name or nil,
Flag=opts.Flag or opts.Name or'Dropdown',Options=opts.Options or{''},Callback=
opts.Callback or function()end,Multi=opts.Multi or false,Scrolling=opts.
Scrolling or false,Open=false,OptionInstances={},MultiItems={},Items={},Tweening
=false,Ignore=opts.Ignore or false}local DROPDOWN_OPEN_ZINDEX=1000 local
DROPDOWN_SEARCH_HEIGHT=22 local DROPDOWN_OPTION_HEIGHT=20 local
DROPDOWN_MAX_VISIBLE_OPTIONS=6 control.Default=opts.Default or control.Multi and
{control.Items[1]}or control.Items[1]or'None'Flags[control.Flag]=control.Default
local items=control.Items do items.Dropdown=Library:Create('TextButton',{
FontFace=Library.Font,TextColor3=NewRGB(0,0,0),BorderColor3=NewRGB(0,0,0),Text=
'',Parent=self.Items.GroupElements or self.Items.Elements,BackgroundTransparency
=1,Name='\0',Size=NewUDim2(1,0,0,32),BorderSizePixel=0,TextSize=Library.
TextSizeHeader,BackgroundColor3=NewRGB(255,255,255)})items.Outline,items.Inline,
items.Background=createOutlinedPanel(items.Dropdown,{className='TextButton',
autoButtonColor=false,selectedGradient=true})items.InnerText=Library:Create(
'TextLabel',{FontFace=Library.Font,TextColor3=Themes.preset.text_color,
BorderColor3=NewRGB(0,0,0),Text='Closest',Parent=items.Background,Name='\0',Size
=NewUDim2(0,0,1,0),BackgroundTransparency=1,Position=NewUDim2(0,3,0,0),
BorderSizePixel=0,AutomaticSize=Enum.AutomaticSize.X,TextXAlignment=Enum.
TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,TextSize=Library.
TextSize,BackgroundColor3=NewRGB(255,255,255)})Library:Create('UIStroke',{Parent
=items.InnerText,LineJoinMode=Enum.LineJoinMode.Miter})items.Icon=Library:
Create('TextLabel',{FontFace=Library.Font,TextColor3=Themes.preset.text_color,
BorderColor3=NewRGB(0,0,0),Text=control.Multi and'...'or'-',Parent=items.
Background,Name='\0',AnchorPoint=NewVector2(1,0),Size=NewUDim2(0,0,1,0),
BackgroundTransparency=1,Position=NewUDim2(1,-4,0,0),BorderSizePixel=0,
AutomaticSize=Enum.AutomaticSize.XY,TextSize=Library.TextSize,BackgroundColor3=
NewRGB(255,255,255)})Library:Create('UIStroke',{Parent=items.Icon,LineJoinMode=
Enum.LineJoinMode.Miter})items.Name=Library:Create('TextLabel',{FontFace=Library
.Font,TextColor3=Themes.preset.text_color,BorderColor3=NewRGB(0,0,0),Text=
control.Name,Parent=items.Dropdown,Name='\0',BackgroundTransparency=1,Position=
NewUDim2(0,1,0,0),BorderSizePixel=0,AutomaticSize=Enum.AutomaticSize.XY,TextSize
=Library.TextSize,BackgroundColor3=NewRGB(255,255,255)})Library:Create(
'UIStroke',{Parent=items.Name,LineJoinMode=Enum.LineJoinMode.Miter})items.
DropdownElements=Library:Create('Frame',{Parent=Library.Other,Size=NewUDim2(0,0,
0,0),Name='\0',Position=NewUDim2(0.30000001192092896,0,0.5,0),BorderColor3=
NewRGB(0,0,0),BorderSizePixel=0,ZIndex=DROPDOWN_OPEN_ZINDEX,AutomaticSize=Enum.
AutomaticSize.Y,BackgroundColor3=Themes.preset.outline})Library:Themify(items.
DropdownElements,'outline','BackgroundColor3')items.Inline=Library:Create(
'Frame',{Parent=items.DropdownElements,Name='\0',Position=NewUDim2(0,1,0,1),
BorderColor3=NewRGB(0,0,0),Size=NewUDim2(1,-2,1,-2),BorderSizePixel=0,ZIndex=
DROPDOWN_OPEN_ZINDEX+1,BackgroundColor3=Themes.preset.inline})Library:Themify(
items.Inline,'inline','BackgroundColor3')items.DropdownHolder=Library:Create(
'Frame',{Parent=items.Inline,Name='\0',Position=NewUDim2(0,1,0,1),BorderColor3=
NewRGB(0,0,0),Size=NewUDim2(1,-2,1,-2),BorderSizePixel=0,ZIndex=
DROPDOWN_OPEN_ZINDEX+2,AutomaticSize=Enum.AutomaticSize.Y,BackgroundColor3=
NewRGB(255,255,255)})local themeGradient=Library:Create('UIGradient',{Rotation=
90,Parent=items.DropdownHolder,Color=ColorSequence.new({ColorSequenceKeypoint.
new(0,Themes.preset.inline),ColorSequenceKeypoint.new(1,Themes.preset.gradient)}
)})Library:SaveGradient(themeGradient,'Selected')Library:Create('UIListLayout',{
Parent=items.DropdownHolder,SortOrder=Enum.SortOrder.LayoutOrder,Padding=
NewUDim(0,2)})Library:Create('UIPadding',{Parent=items.DropdownHolder,PaddingTop
=NewUDim(0,3),PaddingBottom=NewUDim(0,3),PaddingLeft=NewUDim(0,3),PaddingRight=
NewUDim(0,3)})items.SearchRow=Library:Create('Frame',{Parent=items.
DropdownHolder,Name='\0',LayoutOrder=1,Size=NewUDim2(1,0,0,
DROPDOWN_SEARCH_HEIGHT),BackgroundColor3=Themes.preset.outline,BorderSizePixel=0
,ZIndex=DROPDOWN_OPEN_ZINDEX+3})Library:Themify(items.SearchRow,'outline',
'BackgroundColor3')items.SearchInline=Library:Create('Frame',{Parent=items.
SearchRow,Name='\0',Position=NewUDim2(0,1,0,1),Size=NewUDim2(1,-2,1,-2),
BackgroundColor3=Themes.preset.inline,BorderSizePixel=0,ZIndex=
DROPDOWN_OPEN_ZINDEX+3})Library:Themify(items.SearchInline,'inline',
'BackgroundColor3')items.SearchBox=Library:Create('TextBox',{Parent=items.
SearchInline,Active=true,Name='\0',ClearTextOnFocus=false,Text='',
PlaceholderText='Search',PlaceholderColor3=Themes.preset.text_muted,FontFace=
Library.Font,TextColor3=Themes.preset.text_color,TextSize=Library.TextSize,
TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.
Center,BackgroundTransparency=1,Size=NewUDim2(1,-6,1,0),Position=NewUDim2(0,3,0,
0),BorderSizePixel=0,ZIndex=DROPDOWN_OPEN_ZINDEX+4})Library:Themify(items.
SearchBox,'text_color','TextColor3')items.SearchBox.PlaceholderColor3=Themes.
preset.text_muted Library:Create('UIStroke',{Parent=items.SearchBox,LineJoinMode
=Enum.LineJoinMode.Miter})items.OptionScroll=Library:Create('ScrollingFrame',{
Parent=items.DropdownHolder,Name='\0',LayoutOrder=2,Size=NewUDim2(1,0,0,
DROPDOWN_OPTION_HEIGHT),Active=true,ScrollingEnabled=true,AutomaticCanvasSize=
Enum.AutomaticSize.Y,ScrollingDirection=Enum.ScrollingDirection.Y,
BackgroundTransparency=1,BorderSizePixel=0,CanvasSize=NewUDim2(0,0,0,0),
ScrollBarThickness=0,ScrollBarImageColor3=Themes.preset.accent,MidImage=
'rbxassetid://120496541810421',TopImage='rbxassetid://118750478739322',
BottomImage='rbxassetid://74268315755026'})Library:Themify(items.OptionScroll,
'accent','ScrollBarImageColor3')items.OptionCanvas=Library:Create('Frame',{
Parent=items.OptionScroll,Name='\0',Size=NewUDim2(1,-4,0,0),AutomaticSize=Enum.
AutomaticSize.Y,BackgroundTransparency=1,BorderSizePixel=0})Library:Create(
'UIListLayout',{Parent=items.OptionCanvas,SortOrder=Enum.SortOrder.LayoutOrder})
end function control.RenderOption(optionText)local optionButton=Library:Create(
'TextButton',{FontFace=Library.Font,TextColor3=Themes.preset.text_muted,
BorderColor3=NewRGB(0,0,0),Text=optionText,Parent=items.OptionCanvas,Name='\0',
ZIndex=DROPDOWN_OPEN_ZINDEX+3,Size=NewUDim2(1,0,0,DROPDOWN_OPTION_HEIGHT),
BackgroundTransparency=1,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=
Enum.TextYAlignment.Center,BorderSizePixel=0,TextSize=Library.TextSize,
BackgroundColor3=NewRGB(255,255,255)})Library:Create('UIStroke',{Parent=
optionButton,LineJoinMode=Enum.LineJoinMode.Miter})Insert(control.
OptionInstances,optionButton)return optionButton end function control.
ReflowOptions()local optionCount=#control.OptionInstances local visibleCount=
Max(1,Min(optionCount,DROPDOWN_MAX_VISIBLE_OPTIONS))items.OptionScroll.Size=
NewUDim2(1,0,0,visibleCount*DROPDOWN_OPTION_HEIGHT)items.OptionScroll.
ScrollBarThickness=optionCount>DROPDOWN_MAX_VISIBLE_OPTIONS and 2 or 0 items.
OptionScroll.CanvasPosition=Vector2.new(0,0)if items.DropdownElements.Visible
and items.DropdownElements.Parent==Library.Items then items.DropdownElements.
Size=UDim2.fromOffset(items.Outline.AbsoluteSize.X+1,visibleCount*
DROPDOWN_OPTION_HEIGHT+DROPDOWN_SEARCH_HEIGHT+8)end end function control.
ResetSearch()if items.SearchBox and items.SearchBox.Text~=''then items.SearchBox
.Text=''end end function control.ApplyOptionSearch()local query=tostring(items.
SearchBox and items.SearchBox.Text or'')local normalizedQuery=string.lower(query
):gsub('^%s+',''):gsub('%s+$','')local filtered={}if normalizedQuery==''then for
_,optionText in control.Options do filtered[#filtered+1]=optionText end else for
_,optionText in control.Options do if string.find(string.lower(tostring(
optionText)),normalizedQuery,1,true)then filtered[#filtered+1]=optionText end
end end control.RefreshOptions(filtered)if control.Current~=nil then control.
Set(control.Current,true)end end function control.SetVisible(visible)if visible
and Library.OpenElement~=control then Library:CloseElement()end items.
DropdownElements.Position=NewUDim2(0,items.Outline.AbsolutePosition.X,0,items.
Outline.AbsolutePosition.Y+80)items.DropdownElements.Size=UDim2.fromOffset(items
.Outline.AbsoluteSize.X+1,0)items.DropdownElements.Visible=visible items.
DropdownElements.Parent=visible and Library.Items or Library.Other if visible
then control.ResetSearch()control.ReflowOptions()end if not control.Multi then
items.Icon.Text=visible and'+'or'-'end if visible then Library.OpenElement=
control elseif Library.OpenElement==control then Library.OpenElement={}end end
function control.Set(value,skipCallback)local Selected={}local requested=Type(
value)=='table'and value or{value}for i=1,#requested do local name=requested[i]
if table.find(control.Options,name)and not table.find(Selected,name)then Insert(
Selected,name)end if not control.Multi then break end end local selectedSet={}
for i=1,#Selected do selectedSet[Selected[i] ]=true end for _,optionButton in
control.OptionInstances do if selectedSet[optionButton.Text]then optionButton.
TextColor3=Themes.preset.text_color else optionButton.TextColor3=Themes.preset.
text_muted optionButton.BackgroundTransparency=1 end end if control.Multi then
control.MultiItems=Selected if#Selected==0 then items.InnerText.Text='None'
elseif#Selected==1 then items.InnerText.Text=Selected[1]else items.InnerText.
Text='Various'end Flags[control.Flag]=Selected else items.InnerText.Text=
Selected[1]or''Flags[control.Flag]=Selected[1]end control.Current=Flags[control.
Flag]if not skipCallback then control.Callback(Flags[control.Flag])end end
function control.RefreshOptions(optionsList)for _,optionButton in control.
OptionInstances do optionButton:Destroy()end control.OptionInstances={}for _,
optionText in optionsList do local optionButton=control.RenderOption(optionText)
optionButton.MouseButton1Down:Connect(function()if control.Multi then local
selectedIndex=table.find(control.MultiItems,optionButton.Text)if selectedIndex
then table.remove(control.MultiItems,selectedIndex)else Insert(control.
MultiItems,optionButton.Text)end control.Set(control.MultiItems)else control.
SetVisible(false)control.Open=false control.Set(optionButton.Text)end end)end
control.ReflowOptions()end function control.Tween(visible)if control.Tweening==
true then return end control.Tweening=true if visible then items.
DropdownElements.Visible=true items.DropdownElements.Parent=Library.Items end
local fadeTargets=GetDescendants(items.DropdownElements)Insert(fadeTargets,items
.DropdownElements)for fadeIndex=1,#fadeTargets do local fadeTarget=fadeTargets[
fadeIndex]local transparencyProps=Library:GetTransparency(fadeTarget)if
transparencyProps then if Type(transparencyProps)=='table'then for _,
propertyName in transparencyProps do Library:Fade(fadeTarget,propertyName,
visible,0.1)end else Library:Fade(fadeTarget,transparencyProps,visible,0.1)end
end end schedule(function()control.Tweening=false items.DropdownElements.Visible
=visible items.DropdownElements.Parent=visible and Library.Items or Library.
Other end,0.09)end items.Outline.MouseButton1Click:Connect(function()control.
Open=not control.Open control.SetVisible(control.Open)end)Library:Connection(
UserInputService.InputBegan,function(input,_gameProcessed)if isPressInput(input)
then if items.DropdownElements.Visible and not Library:Hovering({items.
DropdownElements,items.Dropdown})then control.SetVisible(false)control.Open=
false end end end)Flags[control.Flag]={}ConfigFlags[control.Flag]=control.Set
control.RefreshOptions(control.Options)control.Set(control.Default)
GetPropertyChangedSignal(items.SearchBox,'Text'):Connect(function()control.
ApplyOptionSearch()end)return addElementVisibility(setmetatable(control,Library)
,opts.Hidden)end function Library:Label(opts)local control={Name=opts.Name or
'Label',Items={}}local items=control.Items do items.Label=Library:Create(
'TextButton',{LayoutOrder=1,FontFace=Library.Font,TextColor3=NewRGB(0,0,0),
BorderColor3=NewRGB(0,0,0),Text='',Parent=self.Items.GroupElements or self.Items
.Elements,BackgroundTransparency=1,Name='\0',Size=NewUDim2(1,0,0,11),
BorderSizePixel=0,TextSize=Library.TextSizeHeader,BackgroundColor3=NewRGB(255,
255,255)})items.Name=Library:Create('TextLabel',{FontFace=Library.Font,
TextColor3=Themes.preset.text_color,BorderColor3=NewRGB(0,0,0),Text=control.Name
,Parent=items.Label,BackgroundTransparency=1,Name='\0',BorderSizePixel=0,
AutomaticSize=Enum.AutomaticSize.XY,TextSize=Library.TextSize,BackgroundColor3=
NewRGB(255,255,255)})Library:Create('UIStroke',{Parent=items.Name,LineJoinMode=
Enum.LineJoinMode.Miter})items.Components=Library:Create('Frame',{Parent=items.
Label,Name='\0',Position=NewUDim2(1,0,0,0),BorderColor3=NewRGB(0,0,0),Size=
NewUDim2(0,0,1,0),BorderSizePixel=0,BackgroundColor3=NewRGB(255,255,255)})
Library:Create('UIListLayout',{Parent=items.Components,SortOrder=Enum.SortOrder.
LayoutOrder,HorizontalAlignment=Enum.HorizontalAlignment.Right})end function
control.Set(text)items.Name.Text=text end return setmetatable(control,Library)
end function Library:Colorpicker(opts)local control={Name=opts.Name or'Color',
Flag=opts.Flag or opts.Name or'Colorpicker',Callback=opts.Callback or function()
end,Color=opts.Color or NewColor3(1,1,1),Alpha=opts.Alpha or opts.Transparency
or 0,Open=false,Items={}}local keypicker=self:Keypicker(control)local items=
keypicker.Items do control.Items=items control.Set=keypicker.Set end control.
Set(control.Color,control.Alpha)ConfigFlags[control.Flag]=control.Set return
setmetatable(control,Library)end function Library:Textbox(opts)local control={
Name=opts.Name or'TextBox',PlaceHolder=opts.PlaceHolder or opts.Placeholder or
opts.PlaceHolderText or opts.Holder or opts.HolderText or'Type here...',Default=
opts.Default or'',Flag=opts.Flag or opts.Name or'TextBox',Callback=opts.Callback
or function()end,Items={}}Flags[control.Flag]=control.default local items=
control.Items do items.Textbox=Library:Create('TextButton',{FontFace=Library.
Font,TextColor3=NewRGB(0,0,0),BorderColor3=NewRGB(0,0,0),Text='',Parent=self.
Items.GroupElements or self.Items.Elements,BackgroundTransparency=1,Name='\0',
Size=NewUDim2(1,0,0,32),BorderSizePixel=0,TextSize=Library.TextSizeHeader,
BackgroundColor3=NewRGB(255,255,255),Active=false,AutoButtonColor=false,
Selectable=false})items.Outline,items.Inline,items.Background=
createOutlinedPanel(items.Textbox,{className='Frame',selectedGradient=true})
items.Input=Library:Create('TextBox',{FontFace=Library.Font,ClearTextOnFocus=
false,Active=true,Selectable=false,PlaceholderColor3=Themes.preset.text_color,
PlaceholderText=control.PlaceHolder,TextSize=Library.TextSize,TextTruncate=Enum.
TextTruncate.AtEnd,Size=NewUDim2(1,0,1,0),TextColor3=Themes.preset.text_color,
BorderColor3=NewRGB(0,0,0),Text=control.Default,Parent=items.Background,
TextXAlignment=Enum.TextXAlignment.Left,Name='\0',BackgroundTransparency=1,
Position=NewUDim2(0,3,0,0),CursorPosition=-1,BorderSizePixel=0,BackgroundColor3=
NewRGB(255,255,255),ZIndex=2})Library:Create('UIStroke',{Parent=items.Input,
LineJoinMode=Enum.LineJoinMode.Miter})items.Name=Library:Create('TextLabel',{
FontFace=Library.Font,TextColor3=Themes.preset.text_color,BorderColor3=NewRGB(0,
0,0),Text=control.Name,Parent=items.Textbox,Name='\0',BackgroundTransparency=1,
Position=NewUDim2(0,1,0,0),BorderSizePixel=0,AutomaticSize=Enum.AutomaticSize.XY
,TextSize=Library.TextSize,BackgroundColor3=NewRGB(255,255,255)})Library:Create(
'UIStroke',{Parent=items.Name,LineJoinMode=Enum.LineJoinMode.Miter})if
UserInputService.TouchEnabled then local dragHandle=createDragHandle(items.
Background)dragHandle.InputBegan:Connect(function(input)if isPressInput(input)
then items.Input:CaptureFocus()end end)end end function control.Set(text)Flags[
control.Flag]=text items.Input.Text=text control.Callback(text)end
GetPropertyChangedSignal(items.Input,'Text'):Connect(function()control.Set(items
.Input.Text)end)if control.Default then control.Set(control.Default)end
ConfigFlags[control.Flag]=control.Set return addElementVisibility(setmetatable(
control,Library),opts.Hidden)end function Library:Keybind(opts)local control={
Flag=opts.Flag or opts.Name,Callback=opts.Callback or function()end,Name=opts.
Name or nil,Key=opts.Key or nil,Mode=opts.Mode or'Toggle',Active=opts.Default or
false,Show=opts.ShowInList~=false,Open=false,Ignore=false,Items={}}Flags[control
.Flag]={Mode=control.Mode,Key=control.Key,Active=control.Active}local items=
control.Items do items.KeybindOutline=Library:Create('TextButton',{Parent=self.
Items.Components,AutoButtonColor=false,Text='',Name='\0',Size=NewUDim2(0,30,0,14
),BorderColor3=NewRGB(0,0,0),BorderSizePixel=0,BackgroundColor3=Themes.preset.
inline})Library:Themify(items.KeybindOutline,'inline','BackgroundColor3')items.
Inline=Library:Create('Frame',{Parent=items.KeybindOutline,Size=NewUDim2(1,-2,1,
-2),Name='\0',Position=NewUDim2(0,1,0,1),BorderColor3=NewRGB(0,0,0),
BorderSizePixel=0,BackgroundColor3=Themes.preset.background})Library:Themify(
items.Inline,'background','BackgroundColor3')items.Key=Library:Create(
'TextLabel',{FontFace=Library.Font,TextColor3=Themes.preset.text_color,
BorderColor3=NewRGB(0,0,0),Text='MB2',Parent=items.Inline,BackgroundTransparency
=1,Name='\0',BorderSizePixel=0,Size=NewUDim2(1,0,1,0),Position=NewUDim2(0,0,0,-1
),TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.
Center,TextSize=Library.TextSize,BackgroundColor3=NewRGB(255,255,255)})Library:
Themify(items.Key,'text_color','TextColor3')Library:Create('UIStroke',{Parent=
items.Key,LineJoinMode=Enum.LineJoinMode.Miter})items.ModeHolder=Library:Create(
'Frame',{Parent=Library.Items,Size=NewUDim2(0,118,0,48),Name='\0',BorderColor3=
NewRGB(0,0,0),BorderSizePixel=0,AutomaticSize=Enum.AutomaticSize.Y,
BackgroundColor3=Themes.preset.inline,Visible=false})Library:Themify(items.
ModeHolder,'inline','BackgroundColor3')items.UIStroke=Library:Create('UIStroke',
{Color=Themes.preset.outline,LineJoinMode=Enum.LineJoinMode.Miter,Parent=items.
ModeHolder})Library:Themify(items.UIStroke,'outline','Color')items.Inline=
Library:Create('Frame',{Parent=items.ModeHolder,Name='\0',Position=NewUDim2(0,1,
0,1),BorderColor3=NewRGB(0,0,0),Size=NewUDim2(1,-2,1,-2),BorderSizePixel=0,
BackgroundColor3=NewRGB(255,255,255)})local themeGradient=Library:Create(
'UIGradient',{Rotation=90,Parent=items.Inline,Color=ColorSequence.new({
ColorSequenceKeypoint.new(0,Themes.preset.inline),ColorSequenceKeypoint.new(1,
Themes.preset.gradient)})})Library:SaveGradient(themeGradient,'Selected')items.
Elements=Library:Create('Frame',{BorderColor3=NewRGB(0,0,0),Parent=items.Inline,
AnchorPoint=NewVector2(0,0.5),Name='\0',BackgroundTransparency=1,Position=
NewUDim2(0,5,0.5,0),Size=NewUDim2(1,-10,0,0),BorderSizePixel=0,AutomaticSize=
Enum.AutomaticSize.Y,BackgroundColor3=NewRGB(255,255,255)})Library:Create(
'UIListLayout',{Parent=items.Elements,Padding=NewUDim(0,4),SortOrder=Enum.
SortOrder.LayoutOrder})items.Accent=Library:Create('Frame',{Name='\0',Parent=
items.ModeHolder,BorderColor3=NewRGB(0,0,0),Size=NewUDim2(1,0,0,2),
BorderSizePixel=0,BackgroundColor3=Themes.preset.accent})Library:Themify(items.
Accent,'accent','BackgroundColor3')Library:Create('UIGradient',{Rotation=90,
Parent=items.Accent,Color=ColorSequence.new({ColorSequenceKeypoint.new(0,Themes.
preset.accent_light),ColorSequenceKeypoint.new(1,Themes.preset.accent_dark)})})
items.Outline=Library:Create('Frame',{Parent=items.ModeHolder,Name='\0',Position
=NewUDim2(0,0,0,2),BorderColor3=NewRGB(0,0,0),Size=NewUDim2(1,0,0,1),
BorderSizePixel=0,BackgroundColor3=Themes.preset.outline})Library:Themify(items.
Outline,'outline','BackgroundColor3')items.Fade=Library:Create('Frame',{Parent=
items.ModeHolder,Name='\0',BackgroundTransparency=1,Position=NewUDim2(0,1,0,1),
BorderColor3=NewRGB(0,0,0),Size=NewUDim2(1,-2,1,-2),BorderSizePixel=0,
BackgroundColor3=NewRGB(255,255,255)})local themeGradient=Library:Create(
'UIGradient',{Rotation=90,Parent=items.Fade,Color=ColorSequence.new({
ColorSequenceKeypoint.new(0,Themes.preset.inline),ColorSequenceKeypoint.new(1,
Themes.preset.gradient)})})Library:SaveGradient(themeGradient,'Selected')items.
Dropdown=setmetatable(control,Library):Dropdown({Name='Mode',Options={'Hold',
'Toggle','Always'},Flag=control.Flag..'OPTION_SETTINGS',Callback=function(bJ)if
Library.IsLoadingConfig then return end if control.Set then control.Set(bJ)end
end})if control.Show then local keybindListCard=createAccentCard({Parent=Library
.KeybindParent,Text='',Visible=false})items.KeybindsRow=keybindListCard.Outline
items.Keybinds=keybindListCard.Text Library:Themify(items.Keybinds,'accent',
'TextColor3')end end function control.SetMode(mode)control.Mode=mode if not
Library.IsLoadingConfig then if mode=='Always'then control.Set(true)elseif mode
=='Hold'then control.Set(false)end end if Type(Flags[control.Flag])=='table'then
Flags[control.Flag].Mode=mode Flags[control.Flag].mode=mode end end function
control.Set(value)if Type(value)=='boolean'then control.Active=value if control.
Mode=='Always'then control.Active=true end elseif TypeOf(value)=='EnumItem'or
Type(value)=='string'and string.find(value,'Enum',1,true)then if TypeOf(value)==
'string'then value=Library:ConvertEnum(value)end value=TypeOf(value)=='EnumItem'
and value.Name=='Escape'and'NONE'or value control.Key=value or'NONE'elseif table
.find({'Toggle','Hold','Always'},value)then if value=='Always'then control.
Active=true end control.Mode=value control.SetMode(control.Mode)elseif Type(
value)=='table'then local mode=value.Mode or value.mode local active=value.
Active if active==nil then active=value.active end local keyValue=value.Key or
value.key if Type(keyValue)=='string'and keyValue~='NONE'and keyValue~='nil'then
keyValue=Library:ConvertEnum(keyValue)end if keyValue==Enum.KeyCode.Escape or
keyValue==nil or keyValue=='nil'or keyValue=='NONE'then keyValue='NONE'end
control.Key=keyValue or'NONE'control.Mode=mode or control.Mode or'Toggle'if
control.Mode=='Always'then control.Active=true elseif active~=nil then control.
Active=active==true end if items.Dropdown and items.Dropdown.Set then items.
Dropdown.Set(control.Mode,true)end end control.Callback(control.Active)local
rawKeyLabel=tostring(control.Key)~='Enums'and(KEY_DISPLAY_NAMES[control.Key]or
tostring(control.Key):gsub('Enum.',''))or nil local displayKey=rawKeyLabel and
tostring(rawKeyLabel):gsub('KeyCode.',''):gsub('UserInputType.','')items.Key.
Text=displayKey if items.Keybinds then local showInList=displayKey~=nil and
displayKey~=''and displayKey~='NONE'and displayKey~='nil'if items.KeybindsRow
then items.KeybindsRow.Visible=showInList else items.Keybinds.Visible=showInList
end if showInList then local listLabel=Format('[%s] %s',displayKey,control.Name
or control.Flag or'Key')items.Keybinds.Text=listLabel items.Keybinds.TextColor3=
control.Active and Themes.preset.accent or Themes.preset.text_color if items.
KeybindsRow then items.KeybindsRow.Size=NewUDim2(0,measureLibraryTextWidth(
listLabel,ACCENT_CARD_TEXT_PADDING),0,ACCENT_CARD_HEIGHT)end end end Flags[
control.Flag]={Mode=control.Mode,Key=control.Key,Active=control.Active,mode=
control.Mode,key=control.Key,active=control.Active}end function control.
SetVisible(visible)items.ModeHolder.Position=NewUDim2(0,items.KeybindOutline.
AbsolutePosition.X+2,0,items.KeybindOutline.AbsolutePosition.Y+74)if visible
then items.ModeHolder.Visible=true items.Fade.BackgroundTransparency=0 Library:
Tween(items.Fade,{BackgroundTransparency=1})return end local fadeTween=Library:
Tween(items.Fade,{BackgroundTransparency=0})Library:Connection(fadeTween.
Completed,function()if not control.Open then items.ModeHolder.Visible=false end
end)end items.KeybindOutline.MouseButton1Down:Connect(function()Wait()if
unloaded or not items.Key.Parent then return end items.Key.Text='...'control.
Binding=Library:Connection(UserInputService.InputBegan,function(input,
_gameProcessed)if input.UserInputType==Enum.UserInputType.Touch then return end
local key=input.KeyCode~=Enum.KeyCode.Unknown and input.KeyCode or input.
UserInputType if key==Enum.UserInputType.Touch then return end control.Set(key)
if control.Binding then control.Binding:Disconnect()end control.Binding=nil end)
end)items.KeybindOutline.MouseButton2Down:Connect(function()control.Open=not
control.Open control.SetVisible(control.Open)end)Library:Connection(
UserInputService.InputBegan,function(input,gameProcessed)if isPressInput(input)
then local dropdownElements=items.Dropdown.Items.DropdownElements local
hoveringMode=items.ModeHolder.Visible and Library:Hovering(items.ModeHolder)
local hoveringDropdown=dropdownElements.Visible and Library:Hovering(
dropdownElements)if items.ModeHolder.Visible and not hoveringMode and not
hoveringDropdown then control.Open=false items.Dropdown.SetVisible(false)control
.SetVisible(false)end end if not gameProcessed then local pressedKey=input.
UserInputType==Enum.UserInputType.Keyboard and input.KeyCode or input.
UserInputType if pressedKey==control.Key then if control.Mode=='Toggle'then
control.Active=not control.Active control.Set(control.Active)elseif control.Mode
=='Hold'then control.Set(true)end end end end)Library:Connection(
UserInputService.InputEnded,function(input,gameProcessed)if gameProcessed then
return end local pressedKey=input.UserInputType==Enum.UserInputType.Keyboard and
input.KeyCode or input.UserInputType if pressedKey==control.Key then if control.
Mode=='Hold'then control.Set(false)end end end)control.Set({Mode=control.Mode,
Active=control.Active,Key=control.Key})ConfigFlags[control.Flag]=control.Set
items.Dropdown.Set(control.Mode,true)Insert(Library.KeybindPanels,control)return
setmetatable(control,Library)end function Library:Button(opts)local control={
Name=opts.Name or'TextBox',Callback=opts.Callback or function()end,Items={}}
local items=control.Items do items.Button=Library:Create('TextButton',{FontFace=
Library.Font,TextColor3=NewRGB(0,0,0),BorderColor3=NewRGB(0,0,0),Text='',Parent=
self.Items.GroupElements or self.Items.Elements,Name='\0',BackgroundTransparency
=1,Size=NewUDim2(1,0,0,0),BorderSizePixel=0,AutomaticSize=Enum.AutomaticSize.Y,
TextSize=Library.TextSizeHeader,BackgroundColor3=NewRGB(255,255,255)})items.
Outline,items.Inline,items.Background=createOutlinedPanel(items.Button,{
className='Frame',position=NewUDim2(0,0,0,0),selectedGradient=true})items.Name=
Library:Create('TextLabel',{FontFace=Library.Font,TextColor3=Themes.preset.
text_color,BorderColor3=NewRGB(0,0,0),Text=control.Name,Parent=items.Background,
Name='\0',Size=NewUDim2(1,0,1,0),BackgroundTransparency=1,Position=NewUDim2(0,3,
0,0),BorderSizePixel=0,AutomaticSize=Enum.AutomaticSize.XY,TextSize=Library.
TextSize,BackgroundColor3=NewRGB(255,255,255)})Library:Create('UIStroke',{Parent
=items.Name,LineJoinMode=Enum.LineJoinMode.Miter})end items.Button.
MouseButton1Click:Connect(function()items.Name.TextColor3=NewRGB(255,255,255)
Library:Tween(items.Name,{TextColor3=Themes.preset.text_color})control.Callback(
)end)return setmetatable(control,Library)end function Library:Configs(window)
local configNameTextbox local workingConfigName local settingsTab=window:Tab({
Name='Settings'})local configSection=settingsTab:Section({Name='Config',Side=
'Left'})configNameListDropdown=configSection:Dropdown({Name='Configs',Options={}
,Callback=function(selectedName)if configNameTextbox then configNameTextbox.Set(
normalizeConfigName(selectedName))end end,Flag='config_Name_list'})Library:
UpdateConfigList()window.Tweening=true configNameTextbox=configSection:Textbox({
Name='Config Name:',Flag='config_Name_text',Callback=function(text)
workingConfigName=text end})window.Tweening=false local function 
resolveConfigTarget(action)local configName,configPath=resolveConfigPath(
workingConfigName)if not configName then Notifications:Create({Name=action..
' failed: empty config name'})return nil,nil end return configName,configPath
end local function syncConfigName(configName)workingConfigName=configName if
configNameTextbox then configNameTextbox.Set(configName)end Library:
UpdateConfigList()end configSection:Button({Name='Save',Callback=function()local
configName,configPath=resolveConfigTarget('Save')if not configName then return
end local encoded=Library:GetConfig()if Type(encoded)~='string'then
Notifications:Create({Name='Save failed: encode error'})return end local writeOk
,writeError=pcall(storage.write,configPath,encoded)if not writeOk then
Notifications:Create({Name='Save failed: '..tostring(writeError)})return end
syncConfigName(configName)Notifications:Create({Name='Saved Config ('..
configPath..')'})end})configSection:Button({Name='Load',Callback=function()local
configName,configPath=resolveConfigTarget('Load')if not configName then return
end local readOk,raw=pcall(storage.read,configPath)if not readOk or Type(raw)~=
'string'then Notifications:Create({Name='Load failed: cannot read file'})return
end if not Library:LoadConfig(raw)then Notifications:Create({Name=
'Load failed: invalid config'})return end syncConfigName(configName)
Notifications:Create({Name='Loaded Config ('..configPath..')'})end})
configSection:Button({Name='Delete',Callback=function()local configName,
configPath=resolveConfigTarget('Delete')if not configName then return end local
deleteOk,deleteError=pcall(storage.delete,configPath)if not deleteOk then
Notifications:Create({Name='Delete failed: '..tostring(deleteError)})return end
Library:UpdateConfigList()Notifications:Create({Name='Deleted Config ('..
configPath..')'})end})window.Tweening=true configSection:Label({Name='Menu Bind'
}):Keybind({Name='Menu Bind',ShowInList=false,Key=Enum.KeyCode.RightShift,
Callback=function(visible)if window.Tweening then return end window.ToggleMenu(
visible)end,Default=true})schedule(function()window.Tweening=false end,2)local
otherSection=settingsTab:Section({Name='Other',Side='Right'})local windowsToggle
local watermarkToggle local notificationToggle local keybindsToggle local
settingsFlags=Library.Flags local function refreshWindows()local visible=
settingsFlags.Windows==true local notifyOn=visible and settingsFlags.Notify==
true if window.Items.Watermark then window.Items.Watermark.Visible=visible and
settingsFlags.Watermark==true end if window.Items.Notify then window.Items.
Notify.Visible=notifyOn end if Library.NotifyViewport then Library.
NotifyViewport.Visible=notifyOn end if not notifyOn then for U=#Notifications.
Notifs,1,-1 do local toast=Notifications.Notifs[U]if toast then Notifications.
Fading[toast]=nil local progress=Notifications.ProgressTweens[toast]if progress
then progress:Cancel()Notifications.ProgressTweens[toast]=nil end if toast.
Parent then toast:Destroy()end end Notifications.Notifs[U]=nil end Notifications
.Notifs={}end if window.Items.Keybind_List then window.Items.Keybind_List.
Visible=visible and settingsFlags.KeybindList==true end if window.Items.
Keybind_Holder then window.Items.Keybind_Holder.Visible=visible and
settingsFlags.KeybindList==true end end windowsToggle=otherSection:Toggle({Name=
'Windows',Flag='Windows',Default=true,Folding=true,Callback=refreshWindows})
watermarkToggle=windowsToggle:Toggle({Name='Watermark',Flag='Watermark',Default=
false,Folding=true,Callback=refreshWindows})watermarkToggle:Dropdown({Name=
'Items',Flag='WatermarkItems',Multi=true,Options={'Fps','Ping','Time','Date'},
Default={},Callback=function(items)local parts={'%scriptname%'}if Type(items)==
'table'then if Find(items,'Fps')then parts[#parts+1]='%fps%'end if Find(items,
'Ping')then parts[#parts+1]='%ping%'end if Find(items,'Time')then parts[#parts+1
]='%time%'end if Find(items,'Date')then parts[#parts+1]='%date%'end end window.
ChangeWatermarkTitle(Concat(parts,' | '))end})notificationToggle=windowsToggle:
Toggle({Name='Notification',Flag='Notify',Default=true,Callback=refreshWindows})
notificationToggle:Slider({Name='Max Notifications',Min=3,Max=50,Decimal=1,
Suffix='',Default=Notifications.MaxVisible or 25,Flag='NotifyMaxVisible',
Callback=function(f)Notifications.MaxVisible=f Notifications:
RefreshNotifications()end})keybindsToggle=windowsToggle:Toggle({Name='Keybinds',
Flag='KeybindList',Default=false,Callback=refreshWindows})local
watermarkItemsToggle,notificationItemsToggle,keybindsItemsToggle=watermarkToggle
,notificationToggle,keybindsToggle otherSection:Dropdown({Name='Tweening Style',
Options={'Linear','Sine','Back','Quad','Quart','Quint','Bounce','Elastic',
'Exponential','Circular','Cubic'},Flag='LibraryEasingStyle',Default='Quint',
Callback=function(eB)Library.EasingStyle=Enum.EasingStyle[eB]end})otherSection:
Slider({Name='Tweening Speed',Min=0,Max=10,Decimal=0.01,Suffix='s',Default=0.25,
Flag='TweeningSpeed',Callback=function(eC)Library.TweeningSpeed=eC end})local
ThemeSection=settingsTab:Section({Name='Theme',Side='Left'})ThemeSection:Slider(
{Name='Font Size',Min=8,Max=24,Decimal=1,Suffix='',Default=Library.TextSize,Flag
='FontSize',Callback=function(eC)Library:SetFontSize(eC)end})ThemeSection:
Dropdown({Name='Menu Font',Options=FONT_ENUM_NAMES,Flag='MenuFont',Default=
'Jura',Callback=function(fontName)Library:SetFont(Font.fromEnum(Enum.Font[
fontName]))end})local function setScale(target,value,name)if not target then
return end local scale=FindFirstChild(target,name)if not scale then scale=
NewInstance('UIScale')scale.Name=name scale.Parent=target end scale.Scale=value/
100 end ThemeSection:Slider({Name='Menu Scale',Min=25,Max=200,Default=100,Suffix
='%',Flag='MenuScale',Callback=function(value)setScale(window.Items.Window,value
,'MenuScale')end})ThemeSection:Slider({Name='ESP Scale',Min=25,Max=200,Default=
100,Suffix='%',Flag='ESPScale',Callback=function(value)local esp=Library.ESP if
esp then setScale(esp.ScreenGui,value,'ESPScale')setScale(esp.CacheGui,value,
'ESPScale')end end})ThemeSection:Slider({Name='Windows Scale',Min=25,Max=200,
Default=100,Suffix='%',Flag='WindowsScale',Callback=function(value)setScale(
window.Items.Watermark,value,'WindowsScale')setScale(window.Items.Notify,value,
'WindowsScale')setScale(window.Items.Keybind_List,value,'WindowsScale')end})
local function refreshThemeGradients(refreshSelected,refreshDeselected)if
refreshSelected then local selected=ColorSequence.new({ColorSequenceKeypoint.
new(0,Themes.preset.inline),ColorSequenceKeypoint.new(1,Themes.preset.gradient)}
)for _,gradient in Themes.gradients.Selected do gradient.Color=selected end end
if refreshDeselected then local deselected=ColorSequence.new({
ColorSequenceKeypoint.new(0,Themes.preset.gradient),ColorSequenceKeypoint.new(1,
Themes.preset.background)})for _,gradient in Themes.gradients.Deselected do
gradient.Color=deselected end end end ThemeSection:Label({Name='Inline'}):
Colorpicker({Flag='Inline',Callback=function(NewColor3,ar)Library:RefreshTheme(
'inline',NewColor3)refreshThemeGradients(true,false)end,Color=Themes.preset.
inline})ThemeSection:Label({Name='Gradient'}):Colorpicker({Flag='Gradient',
Callback=function(NewColor3,ar)Library:RefreshTheme('gradient',NewColor3)
refreshThemeGradients(true,true)end,Color=Themes.preset.gradient})ThemeSection:
Label({Name='Outline'}):Colorpicker({Flag='Outline',Callback=function(NewColor3,
ar)Library:RefreshTheme('outline',NewColor3)end,Color=Themes.preset.outline})
ThemeSection:Label({Name='Accent'}):Colorpicker({Flag='Accent',Callback=function
(NewColor3,ar)Library:RefreshTheme('accent',NewColor3)end,Color=Themes.preset.
accent})ThemeSection:Label({Name='Background'}):Colorpicker({Flag='Background',
Callback=function(NewColor3,ar)Library:RefreshTheme('background',NewColor3)
refreshThemeGradients(false,true)end,Color=Themes.preset.background})
ThemeSection:Label({Name='Text Color'}):Colorpicker({Flag='Text Color',Callback=
function(NewColor3,ar)Library:RefreshTheme('text_color',NewColor3)end,Color=
Themes.preset.text_color})ThemeSection:Label({Name='Text Outline'}):Colorpicker(
{Flag='Text Outline',Callback=function(NewColor3,ar)Library:RefreshTheme(
'text_outline',NewColor3)end,Color=Themes.preset.text_outline})ThemeSection:
Label({Name='Background'}):Colorpicker({Flag='Tab Background',Callback=function(
NewColor3,ar)Library:RefreshTheme('tab_background',NewColor3)end,Color=Themes.
preset.tab_background})return watermarkItemsToggle,notificationItemsToggle,
keybindsItemsToggle end local NOTIFY_STACK_ITEM_GAP=2 local
NOTIFY_MAX_VISIBLE_MIN=3 local NOTIFY_MAX_VISIBLE_MAX=50 local
NOTIFY_MAX_VISIBLE_DEFAULT=25 local function NormalizeNotifyMaxVisible(value)
value=tonumber(value)or NOTIFY_MAX_VISIBLE_DEFAULT return Clamp(Floor(value),
NOTIFY_MAX_VISIBLE_MIN,NOTIFY_MAX_VISIBLE_MAX)end Notifications.MaxVisible=
NormalizeNotifyMaxVisible(Notifications.MaxVisible)local NOTIFY_FADE_TWEEN_INFO=
TweenInfo.new(0.15,Enum.EasingStyle.Linear,Enum.EasingDirection.Out)local 
function getNotifyStackOrigin()local notifyAnchor=Library.NotifyAnchor if
notifyAnchor and notifyAnchor.Parent then local stackGap=Library.NotifyStackGap
or NOTIFY_STACK_ITEM_GAP local anchorPosition=notifyAnchor.Position local
viewportSize=Library.Items.AbsoluteSize local anchorRight=notifyAnchor.
AbsolutePosition.X+notifyAnchor.AbsoluteSize.X/2>=viewportSize.X/2 local
anchorPoint=anchorRight and NewVector2(1,0)or NewVector2(0,0)local offsetX=
anchorPosition.X.Offset if anchorRight then offsetX=offsetX+notifyAnchor.
AbsoluteSize.X end return offsetX,anchorPosition.Y.Offset+notifyAnchor.
AbsoluteSize.Y+stackGap,anchorPoint end return 20,50,NewVector2(0,0)end function
Notifications:RefreshNotifications()local offsetX,offsetY,anchorPoint=
getNotifyStackOrigin()local maxVisible=NormalizeNotifyMaxVisible(Notifications.
MaxVisible)Notifications.MaxVisible=maxVisible local notifyViewport=Library.
NotifyViewport local maxWidth=0 local visibleCount=0 local viewportHeight=0 for
U=1,#Notifications.Notifs do local notifOutline=Notifications.Notifs[U]if
notifOutline and notifOutline.Parent then maxWidth=Max(maxWidth,notifOutline.
AbsoluteSize.X)if not Notifications.Fading[notifOutline]then local itemHeight=
Max(1,notifOutline.AbsoluteSize.Y)if visibleCount<maxVisible then if
visibleCount>0 then viewportHeight=viewportHeight+NOTIFY_STACK_ITEM_GAP end
viewportHeight=viewportHeight+itemHeight visibleCount=visibleCount+1 end end end
end if notifyViewport then notifyViewport.AnchorPoint=anchorPoint notifyViewport
.Position=UDim2.fromOffset(offsetX,offsetY)notifyViewport.Size=UDim2.fromOffset(
maxWidth,viewportHeight)end local stackedOffsetY=0 for U=1,#Notifications.Notifs
do local notifOutline=Notifications.Notifs[U]if notifOutline and notifOutline.
Parent and not Notifications.Fading[notifOutline]then local itemHeight=Max(1,
notifOutline.AbsoluteSize.Y)notifOutline.AnchorPoint=anchorPoint notifOutline.
Position=UDim2.fromOffset(anchorPoint.X*maxWidth,stackedOffsetY)stackedOffsetY=
stackedOffsetY+itemHeight+NOTIFY_STACK_ITEM_GAP end end return offsetY+
viewportHeight end function Notifications:ScheduleRefresh()if unloaded or self.
RefreshScheduled then return end self.RefreshScheduled=true schedule(function()
self.RefreshScheduled=false self:RefreshNotifications()end)end local function 
cancelNotifyProgressTween(outline)local progressTween=Notifications.
ProgressTweens[outline]if progressTween then progressTween:Cancel()Notifications
.ProgressTweens[outline]=nil end end function Notifications:Remove(outline)if
unloaded or not outline or Notifications.Fading[outline]then return end local
isLive=false for U=1,#Notifications.Notifs do local liveNotification=
Notifications.Notifs[U]if liveNotification==outline then isLive=true break end
end if not isLive then return end Notifications.Fading[outline]=true
cancelNotifyProgressTween(outline)Notifications:RefreshNotifications()
Notifications:FadeNotifs(outline,true,function()Notifications.Fading[outline]=
nil cancelNotifyProgressTween(outline)for index=1,#Notifications.Notifs do local
liveNotification=Notifications.Notifs[index]if liveNotification==outline then
table.remove(Notifications.Notifs,index)break end end if outline and outline.
Parent then outline:Destroy()end Notifications:ScheduleRefresh()end)end function
Notifications:FadeNotifs(outline,fadeOut,onCompleted)local targetTransparency=
fadeOut and 1 or 0 local fadeInfo=NOTIFY_FADE_TWEEN_INFO local activeTweens={}
local function createFadeTween(instance,props)local tween=TweenService:Create(
instance,fadeInfo,props)activeTweens[#activeTweens+1]=tween return tween end
local rootTween=createFadeTween(outline,{BackgroundTransparency=
targetTransparency})local descendants=GetDescendants(outline)for index=1,#
descendants do local instance=descendants[index]if not IsA(instance,'GuiObject')
then if IsA(instance,'UIStroke')then createFadeTween(instance,{Transparency=
targetTransparency})end else if IsA(instance,'TextLabel')then createFadeTween(
instance,{TextTransparency=targetTransparency})elseif IsA(instance,'Frame')then
createFadeTween(instance,{BackgroundTransparency=targetTransparency})end end end
if onCompleted then rootTween.Completed:Once(function()if not unloaded then
onCompleted()end end)end for U=1,#activeTweens do activeTweens[U]:Play()end
return rootTween end local function discardOldestNotification()local oldestIndex
,oldestNotification for U=1,#Notifications.Notifs do local notification=
Notifications.Notifs[U]if notification then oldestIndex=U oldestNotification=
notification break end end if not oldestIndex then return end table.remove(
Notifications.Notifs,oldestIndex)Notifications.Fading[oldestNotification]=nil
cancelNotifyProgressTween(oldestNotification)if oldestNotification.Parent then
oldestNotification:Destroy()end end function Notifications:Create(opts)local
flags=Library.Flags if unloaded or not Library.Items or flags.Windows==false or
flags.Notify==false then return end if#Notifications.Notifs>=
NormalizeNotifyMaxVisible(Notifications.MaxVisible)then
discardOldestNotification()end local NOTIFY_PROGRESS_WIDTH_DIVISOR=10.36 local
toast={Name=opts.Name or'This is a title!',Lifetime=opts.LifeTime or 3,Items={}}
local titleText=toast.Name local titleWidth=measureLibraryTextWidth(titleText,
ACCENT_CARD_TEXT_PADDING)if unloaded then return end local progressWidth=Floor(
titleWidth/NOTIFY_PROGRESS_WIDTH_DIVISOR)local items=toast.Items do local card=
createAccentCard({Parent=Library.NotifyViewport or Library.Items,Text=titleText,
AnchorPoint=NewVector2(0,0),Position=NewUDim2(0,0,0,0),Width=titleWidth})items.
Outline=card.Outline items.OutlineStroke=card.Stroke items.Holder=card.Holder
items.Accent=card.Accent items.Text=card.Text items.AccentLine=Library:Create(
'Frame',{Parent=items.Outline,Name='\0',Position=NewUDim2(0,0,1,-1),BorderColor3
=NewRGB(0,0,0),Size=NewUDim2(0,progressWidth,0,1),BorderSizePixel=0,ZIndex=100,
BackgroundColor3=Themes.preset.accent})Library:Themify(items.AccentLine,'accent'
,'BackgroundColor3')end Notifications.Notifs[#Notifications.Notifs+1]=items.
Outline Notifications:RefreshNotifications()items.Outline.BackgroundTransparency
=1 local descendants=GetDescendants(items.Outline)for index=1,#descendants do
local instance=descendants[index]if not IsA(instance,'GuiObject')then if IsA(
instance,'UIStroke')then instance.Transparency=1 end elseif IsA(instance,
'TextLabel')then instance.TextTransparency=1 elseif IsA(instance,'Frame')then
instance.BackgroundTransparency=1 end end Notifications:FadeNotifs(items.Outline
,false)Notifications.ProgressTweens[items.Outline]=Library:Tween(items.
AccentLine,{Position=NewUDim2(1,-progressWidth,1,-1)},TweenInfo.new(toast.
Lifetime,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0))schedule(
function()Notifications:Remove(items.Outline)end,toast.Lifetime)end return
Library,Notifications,Themes end return Bbot