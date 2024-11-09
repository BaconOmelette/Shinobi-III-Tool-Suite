local SuiteForm = forms.newform(256,256,"SIII Suite",forms.destroyall())

local PositionSpeedDisplay = forms.checkbox(SuiteForm, "Pos/Speed",2,0)
local CameraDisplay = forms.checkbox(SuiteForm, "Camera",110,0)
local PositionLines = forms.checkbox(SuiteForm, "Position Lines",2,20)
local CheckpointLines = forms.checkbox(SuiteForm, "Checkpoint",110,20)
local DoubleJumpTiming = forms.checkbox(SuiteForm, "Jump Timing",2,40)
local FastDive = forms.checkbox(SuiteForm, "Fast Divekick",2,60)
local AreaTimer = forms.checkbox(SuiteForm, "Area Timer",2,80)
local JoeVerb = forms.checkbox(SuiteForm, "Current State",2,100)
local JoeVerbList = forms.checkbox(SuiteForm, "*State List",2,120)
local MouseMove = forms.checkbox(SuiteForm, "Mouse Move",110,40)
local HideHUD = forms.checkbox(SuiteForm, "Hide HUD",110,60)
local SixButton = forms.checkbox(SuiteForm, "6 Button Mode",110,80)

local WarpCheck = forms.checkbox(SuiteForm, "Lock Warp",2,200)
local WarpText = forms.label(SuiteForm,"Round Scene Check POW",100,180,500,20)
RoundOption = {} RoundOption[0] = "1" RoundOption[1] = "2" RoundOption[2] = "3" RoundOption[3] = "4" RoundOption[4] = "5" RoundOption[5] = "6" RoundOption[6] = "7" 
local RoundSelector = forms.dropdown(SuiteForm, RoundOption,110,200,30,22)
SceneOption = {} SceneOption[0] = "1" SceneOption[1] = "2" SceneOption[2] = "3"
local SceneSelector = forms.dropdown(SuiteForm, SceneOption,140,200,30,22)
CheckpointOption = {} CheckpointOption[0] = "1" CheckpointOption[1] = "2" CheckpointOption[2] = "3" CheckpointOption[3] = "4" CheckpointOption[4] = "5" CheckpointOption[5] = "6" CheckpointOption[6] = "7" CheckpointOption[7] = "8"
local CheckpointSelector = forms.dropdown(SuiteForm, CheckpointOption,170,200,30,22)
POWOption = {} POWOption[0] = "0" POWOption[1] = "1"
local POWSelector = forms.dropdown(SuiteForm, POWOption,200,200,30,22)

ActionName = {} ActionName[0] = " " ActionName[1] = "Standing" ActionName[2] = "Walking" ActionName[3] = "Stand Blocking" ActionName[4] = "Walk Blocking" ActionName[5] = "Stand Meleeing" ActionName[6] = "POW Stand Meleeing" ActionName[7] = "Stand Kunai Throwing" ActionName[8] = "Crouching" ActionName[9] = "Crouch Walking" ActionName[10] = "Crouch Blocking" ActionName[11] = "Crouch Walk Blocking" ActionName[12] = "Crouch Meleeing" ActionName[13] = "POW Crouch Meleeing" ActionName[14] = "Crouch Kunai Throwing" ActionName[15] = "POW Crouch Blocking" ActionName[16] = "Jumping/Airborne" ActionName[17] = "Double Jump Rolling" ActionName[18] = "Airborne Meleeing" ActionName[19] = "POW Airborne Meleeing" ActionName[20] = "Dive Kicking" ActionName[21] = "POW Dive Slashing" ActionName[22] = "Airborne Kunai Throwing" ActionName[23] = "??? Game Crash ???" ActionName[24] = "Stand Meleeing 2" ActionName[25] = "Wall Jumping" ActionName[26] = "POW Walking" ActionName[27] = "POW Walk Blocking" ActionName[28] = "Running" ActionName[29] = "Run Slashing" ActionName[30] = "Mijin Death Surfing" ActionName[31] = "??? Game Crash ???" ActionName[32] = "Hanging" ActionName[33] = "??? Game Crash ???" ActionName[34] = "Hang Meleeing" ActionName[35] = "POW Hang Meleeing"  ActionName[36] = "Hang Kunai Throwing" ActionName[37] = "Wall Jump Meleeing" ActionName[38] = "POW Wall Jump Meleeing" ActionName[39] = "Wall Jump Kunai Throwing" ActionName[40] = "Hit Knockback" ActionName[41] = "Death" ActionName[42] = "Mijin Death" ActionName[43] = "Falling Death" ActionName[44] = "Major Hit Knockback" ActionName[45] = "Unique Hit Knockback?" ActionName[46] = "Slow Death?" ActionName[47] = "Zap Hit Knockback" ActionName[48] = "Horse Riding" ActionName[49] = "Horse Ride Kunai Throwing" ActionName[50] = "Horse Ride Damage" ActionName[51] = "Horse Ride Airborne" ActionName[52] = "Horse Ride Meleeing" ActionName[53] = "Horse Ride Dive Kicking" ActionName[54] = "Horse Ride Death" ActionName[55] = "Horse Ride POW Meleeing" ActionName[56] = "Surfing" ActionName[57] = "Surf Kunai Throwing" ActionName[58] = "Surf Hit Knockback" ActionName[59] = "Surf Airborne" ActionName[60] = "Surf Dive Kicking" ActionName[61] = "Surf Meleeing" ActionName[62] = "Surf Death" ActionName[63] = "Surf POW Meleeing" ActionName[64] = "Ikazuchi Casting" ActionName[65] = "Karui Casting" ActionName[66] = "Fushin Casting" ActionName[67] = "Mijin Casting" ActionName[68] = "Horse Ride Ikazuchi Casting" ActionName[69] = "Horse Ride Karui Casting" ActionName[70] = "Horse Ride Fushin Casting" ActionName[71] = "Horse Ride Mijin Casting" ActionName[72] = "Surf Ikazuchi Casting" ActionName[73] = "Surf Karui Casting" ActionName[74] = "Surf Fushin Casting" ActionName[75] = "Surf Mijin Casting" ActionName[76] = "??? Game Crash ???"

JoeXOld = memory.read_u32_be(0xFF414D) / 256
JoeYOld = memory.read_u32_be(0xFF4151) / 256
DiveInputFrame = 0
Pass = 0
GapFrameCount = 0
DiveActiveFrames = 0
GradeTimer = 0
CurrentRound = memory.readbyte(0xFF37A6)
CurrentScene = memory.readbyte(0xFF37A8)
CurrentCheckpoint = memory.readbyte(0xFF37AA)
RoundFrameCount = 0
SceneFrameCount = 0
CheckpointFrameCount = 0
PreviousRound = 0
PreviousScene = 0
PreviousCheckpoint = 0

FrameCount = 1
FrameCountPast1 = 0
JoePastState1 = 0
FrameCountPast2 = 0
JoePastState2 = 0
FrameCountPast3 = 0
JoePastState3 = 0
FrameCountPast4 = 0
JoePastState4 = 0
FrameCountPast5 = 0
JoePastState5 = 0
FrameCountPast6 = 0
JoePastState6 = 0
FrameCountPast7 = 0
JoePastState7 = 0
FrameCountPast8 = 0
JoePastState8 = 0
FrameCountPast9 = 0
JoePastState9 = 0
FrameCountPast10 = 0
JoePastState10 = 0

xmouse = 0
ymouse = 0
xmousegame = 0
ymousegame = 0

function PositionSpeedDisplayScript()
	gui.drawText(0,25,"X " .. JoeX,0xFFFFFFFF,null,10,"Arial")
	gui.drawText(10,33,JoeXCompare,0xFFFFFFFF,null,10,"Arial")
	gui.drawText(0,41,"Y " .. JoeY,0xFFFFFFFF,null,10,"Arial")
	gui.drawText(10,49,JoeYCompare,0xFFFFFFFF,null,10,"Arial")
end

function CameraDisplayScript()
	gui.drawText(55,25,"CX " .. CamX,0xFFFFFFFF,null,10,"Arial")
	gui.drawText(55,33,"CY " .. CamYOffset,0xFFFFFFFF,null,10,"Arial")
end

function PositionLinesScript()
	--Lines on Joe
	JoeCamX = PosX - CamX
	JoeCamY = PosY - CamY
	gui.drawLine(JoeCamX, JoeCamY, 0, JoeCamY) --X Left
	gui.drawLine(JoeCamX, JoeCamY, 1000, JoeCamY) --X Right
	gui.drawLine(JoeCamX, JoeCamY, JoeCamX, 0) --Y Up
	gui.drawLine(JoeCamX, JoeCamY, JoeCamX, 1000) --Y Down

	--Box on Joe
	gui.drawBox((JoeCamX-1), (JoeCamY-1), (JoeCamX+1), (JoeCamY+1))
	gui.drawPixel(JoeCamX,JoeCamY,"red")
end

function CheckpointLinesScript()
	CheckpointX = memory.read_u16_be(0xFF0166)
	CheckpointY = memory.read_u16_be(0xFF0168)
	CheckpointCamX = CheckpointX - CamX
	CheckpointCamY = CheckpointY - CamY
	
	gui.drawLine(CheckpointCamX, 0, CheckpointCamX, 1000, "red")
	gui.drawBox((CheckpointCamX-23), 0, (CheckpointCamX+23), 1000, nul, 0x44FFFF00)
	gui.drawBox((CheckpointCamX-23), (CheckpointCamY-47), (CheckpointCamX+23), (CheckpointCamY+47), nul, 0x5500FF00)
end

function DoubleJumpTimingScript()
	JoeYVelo = memory.read_u32_be(0xFF414A)
	if JoeYVelo == 0xFFFFCC00 or JoeYVelo == 0x00000000 then
		JumpDelay = 0
	else
		JumpDelay = 1
	end
	if memory.readbyte(0xFF415B) == 16 or memory.readbyte(0xFF415B) == 25 then
		AirborneState = 1
	else
		AirborneState = 0
	end
	if JoeYVelo > 0xFFFE9000 and JumpDelay == 1 and AirborneState == 1 or JoeYVelo < 0x00017000 and JumpDelay == 1 and AirborneState == 1 then
		gui.drawText(PosX - CamX,PosY - CamY,"OK",0xFFFFFFFF,null,10,"Arial")
	else
		gui.drawText(0,0,"")
	end
end

function JoeStateScript()
	gui.drawText(0,210,(ActionName[JoeState]),0xFFFFFFFF,null,10,"Arial")
end

function JoeStateListScript()
	FrameCount = FrameCount + 1
	JoeState = memory.readbyte(0xFF415B)
	
	if JoeCurrentState ~= JoeState then
		JoePastState10 = JoePastState9
		JoePastState9 = JoePastState8
		JoePastState8 = JoePastState7
		JoePastState7 = JoePastState6
		JoePastState6 = JoePastState5
		JoePastState5 = JoePastState4
		JoePastState4 = JoePastState3
		JoePastState3 = JoePastState2
		JoePastState2 = JoePastState1
		JoePastState1 = JoeCurrentState
		
		FrameCountPast10 = FrameCountPast9
		FrameCountPast9 = FrameCountPast8
		FrameCountPast8 = FrameCountPast7
		FrameCountPast7 = FrameCountPast6
		FrameCountPast6 = FrameCountPast5
		FrameCountPast5 = FrameCountPast4
		FrameCountPast4 = FrameCountPast3
		FrameCountPast3 = FrameCountPast2
		FrameCountPast2 = FrameCountPast1
		FrameCountPast1 = FrameCount - 1
		
		JoeCurrentState = JoeState
		
		FrameCount = 1
	end
	
	gui.drawText(0,95,(FrameCount .. " " .. ActionName[JoeCurrentState]),0xFFFFFFFF,null,10,"Arial")
	gui.drawText(0,105,(FrameCountPast1 .. " " .. ActionName[JoePastState1]),0xFFFFFFFF,null,10,"Arial")
	gui.drawText(0,115,(FrameCountPast2 .. " " .. ActionName[JoePastState2]),0xFFFFFFFF,null,10,"Arial")
	gui.drawText(0,125,(FrameCountPast3 .. " " .. ActionName[JoePastState3]),0xFFFFFFFF,null,10,"Arial")
	gui.drawText(0,135,(FrameCountPast4 .. " " .. ActionName[JoePastState4]),0xFFFFFFFF,null,10,"Arial")
	gui.drawText(0,145,(FrameCountPast5 .. " " .. ActionName[JoePastState5]),0xFFFFFFFF,null,10,"Arial")
	gui.drawText(0,155,(FrameCountPast6 .. " " .. ActionName[JoePastState6]),0xFFFFFFFF,null,10,"Arial")
	gui.drawText(0,165,(FrameCountPast7 .. " " .. ActionName[JoePastState7]),0xFFFFFFFF,null,10,"Arial")
	gui.drawText(0,175,(FrameCountPast8 .. " " .. ActionName[JoePastState8]),0xFFFFFFFF,null,10,"Arial")
	gui.drawText(0,185,(FrameCountPast9 .. " " .. ActionName[JoePastState9]),0xFFFFFFFF,null,10,"Arial")
	gui.drawText(0,195,(FrameCountPast10 .. " " .. ActionName[JoePastState10]),0xFFFFFFFF,null,10,"Arial")
end

function FastDiveScript()
	if memory.read_u8(0xFF415B) == 20 then --Check for divekick state
		if JoeXCompare == 3.75 then --Fast dive Speed going right
			Pass = 1
		end
		if JoeXCompare == 3 then --Normal dive speed going right
			Pass = 0
		end
		if JoeXCompare == -2.75 then --Fast dive Speed going left is SLOWER
			Pass = 0
		end
		if JoeXCompare == -3 then --Normal dive Speed going left is the FASTER option
			Pass = 1
		end
	end

	-- Fast Dive Grade Frames Between Releasing Forward and Dive
		if memory.read_u8(0xFF415B) == 16 then --Check for normal airborne state
			GradeTimer = 0
			if JoeXCompare < 3 and JoeXCompare > -0.1 then -- Slower than run speed requirement
				GapFrameCount = GapFrameCount + 1
			else
				GapFrameCount = 0
			end
		else
			if memory.read_u8(0xFF415B) ~= 20 then
				GapFrameCount = 0
			end
		end
		if memory.read_u8(0xFF415B) == 20 then
			GapFrameCountDisplay = GapFrameCount
			DiveActiveFrames = DiveActiveFrames + 1
			if Pass == 1 then
				gui.drawImage("yes.png",150,25)
				gui.drawText(143,50,"Gap: " .. GapFrameCountDisplay,0xFFFFFFFF,null,10,"Arial")
				gui.drawText(134,60,"Active: " .. DiveActiveFrames,0xFFFFFFFF,null,10,"Arial")
			end
			GradeTimer = 120
			if Pass == 0 then
				gui.drawImage("no.png",150,25)
				gui.drawText(134,50,"Active: " .. DiveActiveFrames,0xFFFFFFFF,null,10,"Arial")
			end
		else
			DiveInputFrame = 0
			if GradeTimer > 0 and GradeTimer < 121 then
				if Pass == 1 then
					gui.drawImage("yes.png",150,25)
					gui.drawText(143,50,"Gap: " .. GapFrameCountDisplay,0xFFFFFFFF,null,10,"Arial")
					gui.drawText(134,60,"Active: " .. DiveActiveFrames,0xFFFFFFFF,null,10,"Arial")
				end
				if Pass == 0 then
					gui.drawImage("no.png",150,25)
					gui.drawText(134,50,"Active: " .. DiveActiveFrames,0xFFFFFFFF,null,10,"Arial")
				end
				GradeTimer = GradeTimer - 1
			else
				DiveActiveFrames = 0
			end
		end
end

function AreaTimerScript()
	RoundFrameCount = RoundFrameCount + 1
	SceneFrameCount = SceneFrameCount + 1
	CheckpointFrameCount = CheckpointFrameCount + 1
	
	gui.drawText(0,60,"R " .. RoundFrameCount,0xFFFFFFFF,null,10,"Arial")
	gui.drawText(0,69,"S " .. SceneFrameCount,0xFFFFFFFF,null,10,"Arial")
	gui.drawText(0,78,"C " .. CheckpointFrameCount,0xFFFFFFFF,null,10,"Arial")
	
	gui.drawText(150,210,"R " .. PreviousRound,0xFFFFFFFF,null,10,"Arial")
	gui.drawText(200,210,"S " .. PreviousScene,0xFFFFFFFF,null,10,"Arial")
	gui.drawText(250,210,"C " .. PreviousCheckpoint,0xFFFFFFFF,null,10,"Arial")

	if CurrentCheckpoint ~= memory.readbyte(0xFF37AA) then
		CurrentCheckpoint = memory.readbyte(0xFF37AA)
		PreviousCheckpoint = CheckpointFrameCount
		CheckpointFrameCount = 0
	else
		if CurrentScene ~= memory.readbyte(0xFF37A8) and CheckpointFrameCount > 20 then
			PreviousCheckpoint = CheckpointFrameCount
			CheckpointFrameCount = 0
		end
	end
	if CurrentScene ~= memory.readbyte(0xFF37A8) then
		CurrentScene = memory.readbyte(0xFF37A8)
		PreviousScene = SceneFrameCount
		SceneFrameCount = 0
		CheckpointFrameCount = 0
	end
	if CurrentRound == memory.readbyte(0xFF37A6) - 1 then
		CurrentRound = memory.readbyte(0xFF37A6)
		PreviousRound = RoundFrameCount
		RoundFrameCount = 0
		SceneFrameCount = 0
		CheckpointFrameCount = 0
	end

	if memory.readbyte(0xFF0028) == 1 or memory.readbyte(0xFF0028) == 3 then
		RoundFrameCount = 0
		SceneFrameCount = 0
		CheckpointFrameCount = 0
		CurrentRound = memory.readbyte(0xFF37A6)
		CurrentScene = memory.readbyte(0xFF37A8)
		CurrentCheckpoint = memory.readbyte(0xFF37AA)
	end
	
	if memory.read_u16_be(0xFF002C) == 61490 or memory.read_u16_be(0xFF002C) == 47770 then
		RoundFrameCount = 0
		SceneFrameCount = 0
		CheckpointFrameCount = 0
	end
end

function WarpScript()
	memory.writebyte(0xFF37A6,(forms.gettext(RoundSelector)-1))
	memory.writebyte(0xFF37A8,(forms.gettext(SceneSelector)-1))
	memory.writebyte(0xFF37AA,(forms.gettext(CheckpointSelector)-1))
	memory.writebyte(0xFF00E7,(forms.gettext(POWSelector)+0))
end

function MouseMoveScript()
	MouseInput = input.getmouse()
	AllInputs = input.get()
	xmouse = MouseInput["X"]
	ymouse = MouseInput["Y"]
	xmousegame = xmouse + memory.read_u16_be(0xFFE000)
	ymousegame = ymouse + memory.read_u16_be(0xFFE004)
	
	gui.drawBox((xmouse-1), (ymouse-1), (xmouse+1), (ymouse+1), 0, "yellow")
	
	if MouseInput["Left"] and AllInputs["Ctrl"] then
		poslock = 0
		memory.write_u16_be((0xFF414E), xmousegame)
		memory.write_u16_be((0xFF4152), (ymousegame+24)) 
	end
	
	if MouseInput["Right"] and AllInputs["Ctrl"] then
		poslock = 1
		xlock = xmousegame
		ylock = ymousegame
	end
	if poslock == 1 then
		memory.write_u16_be((0xFF414E), xlock)
		memory.write_u16_be((0xFF4152), (ylock+24))
		--gui.text((xmousel+3), (ymousel+3 ) , "Lock      ", "blue", "black")
	else
		poslock = 0
		xlock = 0
		ylock = 0
	end
	if MouseInput["Middle"] and AllInputs["Ctrl"] then
		poslock = 0
	end
end

function HideHUDScript()
	memory.writebyte(0xFF0066, 0)
end

function SixButtonScript()
	memory.writebyte(0xFF000A, 65)
end

function ThreeButtonScript()
	memory.writebyte(0xFF000A, 00)
end


while true do
	--Common values
	JoeX = memory.read_u32_be(0xFF414D) / 256
	JoeY = memory.read_u32_be(0xFF4151) / 256
	PosX = memory.read_u16_be(0xFF414E)
	PosY = memory.read_u16_be(0xFF4152)
	CamX = memory.read_u16_be(0xFFE000)
	CamYOffset = memory.read_u16_be(0xFFE004)
	CamY = CamYOffset + 24
	JoeState = memory.readbyte(0xFF415B)
	JoeXCompare = (JoeX) - (JoeXOld)
	JoeXOld = JoeX
	JoeYCompare = (JoeY) - (JoeYOld)
	JoeYOld = JoeY
	Round = memory.readbyte(0xFF37A6)
	Scene = memory.readbyte(0xFF37A8)
	Check = memory.readbyte(0xFF37AA)
	
	--Form Checks
	if forms.ischecked(DoubleJumpTiming) == true then
		DoubleJumpTimingScript()
	end
	if forms.ischecked(PositionSpeedDisplay) == true then
		PositionSpeedDisplayScript()
	end
	if forms.ischecked(PositionLines) == true then
		PositionLinesScript()
	end
	if forms.ischecked(FastDive) == true then
		FastDiveScript()
	end
	if forms.ischecked(AreaTimer) == true then
		AreaTimerScript()
	end
	if forms.ischecked(JoeVerb) == true then
		JoeStateScript()
	end
	if forms.ischecked(JoeVerbList) == true then
		JoeStateListScript()
	end
	if forms.ischecked(CameraDisplay) == true then
		CameraDisplayScript()
	end
	if forms.ischecked(CheckpointLines) == true then
		CheckpointLinesScript()
	end
	if memory.readbyte(0xFF0028) == 1 and forms.ischecked(WarpCheck) == true then
		WarpScript()
	end
	if forms.ischecked(MouseMove) == true then
		MouseMoveScript()
	end
	if forms.ischecked(HideHUD) == true then
		HideHUDScript()
	end
	if forms.ischecked(SixButton) == true then
		SixButtonScript()
	end
	if forms.ischecked(SixButton) == false then
		ThreeButtonScript()
	end

	gui.drawText(0,0,"") --clears text
	emu.frameadvance() --absolutely necessary
end