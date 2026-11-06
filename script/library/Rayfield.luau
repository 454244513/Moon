local RAW_BASE=
[[https://raw.githubusercontent.com/454244513/Moon/main/script/library]]local
RAYFIELD_URL='https://sirius.menu/gen2'local function 
installDropdownLocalization(rayfield)local nativeCreateWindow=rayfield.
CreateWindow rayfield.CreateWindow=function(library,properties)properties.locale
='en'local window=nativeCreateWindow(library,properties)local function 
localizeDropdown(dropdown,settings)if not dropdown.selectedLabel or not dropdown
._optionFrames or not window._bindLocale then return dropdown end local
placeholder=settings.placeholder or settings.Placeholder or'None'local
updatingSelection=false local function updateSelection()if updatingSelection
then return end updatingSelection=true local values=dropdown.value local source=
values if type(values)=='table'then source=values[1]end source=source or
placeholder if dropdown.multiSelect and type(values)=='table'and#values>1 then
source='Various'end window:_bindLocale(dropdown.selectedLabel,'Text',source)
updatingSelection=false end local function bindOption(data)window:_bindLocale(
data.title,'Text',data.name)return data end for _,data in ipairs(dropdown.
_optionFrames)do bindOption(data)end local nativeBuildOption=dropdown.
_buildOption if nativeBuildOption then dropdown._buildOption=function(...)return
bindOption(nativeBuildOption(...))end end local nativeRebindOption=dropdown.
_rebindOption if nativeRebindOption then dropdown._rebindOption=function(self,
data,...)local result=table.pack(nativeRebindOption(self,data,...))bindOption(
data)return table.unpack(result,1,result.n)end end local nativeRefresh=dropdown.
Refresh if nativeRefresh then dropdown.Refresh=function(self,...)local result=
table.pack(nativeRefresh(self,...))for _,data in ipairs(self._optionFrames)do
bindOption(data)end updateSelection()return table.unpack(result,1,result.n)end
end local nativeUpdateSelectedLabel=dropdown._updateSelectedLabel if
nativeUpdateSelectedLabel then dropdown._updateSelectedLabel=function(...)local
result=table.pack(nativeUpdateSelectedLabel(...))updateSelection()return table.
unpack(result,1,result.n)end end window:ConnectFor(dropdown,dropdown.
selectedLabel:GetPropertyChangedSignal('Text'),updateSelection)updateSelection()
return dropdown end local function wrapContainer(container)for _,method in
ipairs({'CreateTab','CreateGroup'})do local nativeCreate=container[method]if
nativeCreate then container[method]=function(self,...)local child=nativeCreate(
self,...)wrapContainer(child)return child end end end local nativeCreateDropdown
=container.CreateDropdown if nativeCreateDropdown then container.CreateDropdown=
function(self,settings)return localizeDropdown(nativeCreateDropdown(self,
settings),settings)end end end wrapContainer(window)return window end end return
function(gameName)assert(type(gameName)=='string'and gameName~='',
'A game name is required')local rayfield=loadstring(game:HttpGet(RAYFIELD_URL))(
)local translationFile=gameName:gsub(' ','%%20')..'.luau'local ok,translations=
pcall(function()return loadstring(game:HttpGet(RAW_BASE..'/translations/'..
translationFile))()end)if not ok or type(translations)~='table'then warn(
'[Moon] Translation load failed for '..gameName..
'; continuing without translations.')translations={}end rayfield.
MoonTranslations=translations installDropdownLocalization(rayfield)return
rayfield end