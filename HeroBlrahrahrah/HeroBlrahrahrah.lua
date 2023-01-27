local soundFile = "Interface\\AddOns\\HeroBlrahrahrah\\audio\\HeroBlrahrahrah.ogg"

local sounds = {
	569013, --sound/spells/heroism_cast.ogg
	568812,	--sound/spells/bloodlust_player_cast_head.ogg
	568451,	--sound/spells/spell_ma_timewarp_impact_01.ogg	
	568818,	--sound/spells/spell_ma_timewarp_impact_02.ogg	
	569126,	--sound/spells/spell_ma_timewarp_impact_05.ogg	
	569379,	--sound/spells/spell_ma_timewarp_impact_03.ogg	
	569578,	--sound/spells/spell_ma_timewarp_impact_04.ogg
}

local function OnLoad()
	for _, fdid in pairs(sounds) do
		MuteSoundFile(fdid)
	end
end

local function OnEvent()
	local _, event, _, _, _, _, _, _, _, _, _, spellID, spellName, _, _ = CombatLogGetCurrentEventInfo();
	if event == "SPELL_AURA_APPLIED" then 
		if spellName == "Bloodlust" or spellName == "Heroism" or spellName == "Time Warp" or spellName == "Primal Rage" then
			-- print(CombatLogGetCurrentEventInfo())
			-- print("It Worked!");
			PlaySoundFile(soundFile, "master");
		end
	end
end

local f = CreateFrame("Frame")
f:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
f:SetScript("OnEvent", OnEvent)

