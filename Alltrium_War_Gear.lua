function user_job_setup()
	-- Options: Override default values
	state.OffenseMode:options('Normal','SomeAcc','Acc','FullAcc','Fodder')
	state.WeaponskillMode:options('Match','AtkCapped','Normal','SomeAcc','Acc','FullAcc','Fodder')
	state.HybridMode:options('Normal','DT')
	state.PhysicalDefenseMode:options('PDT', 'PDTReraise')
	state.MagicalDefenseMode:options('MDT', 'MDTReraise')
	state.ResistDefenseMode:options('MEVA')
	state.IdleMode:options('Normal', 'PDT','Refresh','Reraise')
	state.ExtraMeleeMode = M{['description']='Extra Melee Mode','None'}
	state.Passive = M{['description'] = 'Passive Mode','None','Twilight'}
	state.Weapons:options('Savage','ShiningOne','Chango','DualWeapons','Greatsword','Club','Staff','ProcDagger','ProcSword','ProcGreatSword','ProcScythe','ProcPolearm','ProcGreatKatana','ProcKatana','ProcClub','ProcStaff','ProcAxe')

	gear.da_jse_back = {name="Cichol's Mantle",augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
	gear.ws_jse_back = {name="Cichol's Mantle",augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}

	autows = 'Savage Blade'
	autowstp = 1250
	autofood = 'Grape Daifuku'

	-- Additional local binds
	send_command('bind ^` input /ja "Hasso" <me>')
	send_command('bind !` input /ja "Seigan" <me>')
	send_command('bind @` gs c cycle SkillchainMode')
	send_command('bind !r gs c weapons Chango;gs c update')
	send_command('bind ^r gs c weapons Savage;gs c update')

	select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	-- Precast Sets

	sets.Enmity = {ammo="Spaience Orb",
		head="Souv. Schaller +1",neck="Unmoving Collar +1",ear1="Friomisi Earring",ear2="Trux Earring",
		body="Souv. Cuirass +1",hands="Macabre Gaunt. +1",ring1="Apeile Ring +1",ring2="Apeile Ring",
		back=gear.ws_jse_back,waist="Flume Belt +1",legs="Souv. Diechlings +1",feet="Eschite Greaves"}
	sets.Knockback = {}
	sets.passive.Twilight = {head="Twilight Helm",body="Twilight Mail"}

	-- Precast sets to enhance JAs
	sets.precast.JA['Berserk'] = {body="Pumm. Lorica +2",back="Cichol's Mantle"}
	sets.precast.JA['Warcry'] = {head="Agoge Mask +3"}
	sets.precast.JA['Defender'] = {}
	sets.precast.JA['Aggressor'] = {body="Agoge Lorica +1"}
	sets.precast.JA['Mighty Strikes'] = {}
	sets.precast.JA["Warrior's Charge"] = {}
	sets.precast.JA['Tomahawk'] = {ammo="Thr. Tomahawk"}
	sets.precast.JA['Retaliation'] = {}
	sets.precast.JA['Restraint'] = {}
	sets.precast.JA['Blood Rage'] = {}
	sets.precast.JA['Brazen Rush'] = {}
	sets.precast.JA['Provoke'] = set_combine(sets.Enmity,{})
					
	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}
					
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}
			
	sets.precast.Step = {}

	sets.precast.Flourish1 = {}

	-- Fast cast sets for spells
	sets.precast.FC = {ammo="Spaience Orb",
		head="Sakpata's Helm",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
		body="Sacro Breastplate",hands="Leyline Gloves",ring1="Lebeche Ring",ring2="Prolix Ring",
		back="Moonlight Cape",waist="Flume Belt +1",legs="Eschite Cuisses",feet="Odyssean Greaves"}

	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {})

	-- Midcast Sets
	sets.midcast.FastRecast = {ammo="Staunch Tathlum",
		head="Sakpata's Helm",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
		body="Sacro Breastplate",hands="Leyline Gloves",ring1="Lebeche Ring",ring2="Prolix Ring",
		back="Moonlight Cape",waist="Tempus Fugit",legs="Eschite Cuisses",feet="Odyssean Greaves"}

	sets.midcast.Utsusemi = set_combine(sets.midcast.FastRecast, {back="Mujin Mantle"})
					
	sets.midcast.Cure = {}

	sets.Self_Healing = {legs="Souv. Diechlings +1",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {legs="Souv. Diechlings +1",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Phalanx_Received = {main="Sakpata's Sword",head=gear.yorium_phalanx_head,body="Odyss. Chestplate",hands="Souv. Handsch. +1",legs="Sakpata's Cuisses",feet="Souveran Schuhs +1"}
											
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {ammo="Knobkierrie",
		head="Agoge Mask +3",neck="War. Beads +1",ear1="Thrud Earring",ear2="Moonshade Earring",
		body="Pumm. Lorica +2",hands=gear.odyssean_wsd_hands,ring1="Karieyh Ring",ring2="Niqmaddu Ring",
		back=gear.ws_jse_back,waist="Sailfi Belt +1",legs=gear.valorous_wsd_legs,feet="Sulev. Leggings +2"}

	sets.precast.WS.SomeAcc = set_combine(sets.precast.WS, {back="Letalis Mantle",})
	sets.precast.WS.Acc = set_combine(sets.precast.WS, {neck="Combatant's Torque"})
	sets.precast.WS.FullAcc = set_combine(sets.precast.WS, {neck="Combatant's Torque"})
	sets.precast.WS.Fodder = set_combine(sets.precast.WS, {})
	sets.precast.WS.AtkCapped = set_combine(sets.precast.WS, {body="Sakpata's Plate",hands="Sakpata's Gauntlets",legs="Sakpata's Cuisses"})
	sets.precast.WS.Proc = {}

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.	
	sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS, {})
	sets.precast.WS['Savage Blade'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
	sets.precast.WS['Savage Blade'].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Savage Blade'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS['Savage Blade'].Fodder = set_combine(sets.precast.WS.Fodder, {})
	sets.precast.WS['Savage Blade'].AtkCapped = set_combine(sets.precast.WS, {body="Sakpata's Plate",hands="Sakpata's Gauntlets",legs="Sakpata's Cuisses"})

	sets.precast.WS['Upheaval'] = set_combine(sets.precast.WS, {})
	sets.precast.WS['Upheaval'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
	sets.precast.WS['Upheaval'].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Upheaval'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS['Upheaval'].Fodder = set_combine(sets.precast.WS.Fodder, {})
		
	sets.precast.WS['Resolution'] = set_combine(sets.precast.WS, {})
	sets.precast.WS['Resolution'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
	sets.precast.WS['Resolution'].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Resolution'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS['Resolution'].Fodder = set_combine(sets.precast.WS.Fodder, {})

	sets.precast.WS['Ruinator'] = set_combine(sets.precast.WS, {})
	sets.precast.WS['Ruinator'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
	sets.precast.WS['Ruinator'].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Ruinator'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS['Ruinator'].Fodder = set_combine(sets.precast.WS.Fodder, {})

	sets.precast.WS['Rampage'] = set_combine(sets.precast.WS, {})
	sets.precast.WS['Rampage'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
	sets.precast.WS['Rampage'].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Rampage'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS['Rampage'].Fodder = set_combine(sets.precast.WS.Fodder, {})

	sets.precast.WS['Raging Rush'] = set_combine(sets.precast.WS, {})
	sets.precast.WS['Raging Rush'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
	sets.precast.WS['Raging Rush'].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Raging Rush'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS['Raging Rush'].Fodder = set_combine(sets.precast.WS.Fodder, {})

	sets.precast.WS["Ukko's Fury"] = set_combine(sets.precast.WS, {})
	sets.precast.WS["Ukko's Fury"].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
	sets.precast.WS["Ukko's Fury"].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS["Ukko's Fury"].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS["Ukko's Fury"].Fodder = set_combine(sets.precast.WS.Fodder, {})

	sets.precast.WS["King's Justice"] = set_combine(sets.precast.WS, {})
	sets.precast.WS["King's Justice"].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
	sets.precast.WS["King's Justice"].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS["King's Justice"].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS["King's Justice"].Fodder = set_combine(sets.precast.WS.Fodder, {})

	sets.precast.WS['Armor Break'] = {ammo="Ghastly Tathlum +1",
		head="Flam. Zucchetto +2",neck="Sanctity Necklace",ear1="Digni. Earring",ear2="Gwati Earring",
		body="Flamma Korazin +2",hands="Flam. Manopolas +2",ring1="Karieyh Ring",ring2="Niqmaddu Ring",
		back=gear.ws_jse_back,waist="Eschan Stone",legs="Flamma Dirs +2",feet="Flam. Gambieras +2"}
	
	sets.precast.WS['Full Break'] = set_combine(sets.precast.WS['Armor Break'], {})
	sets.precast.WS['Weapon Break'] = set_combine(sets.precast.WS['Armor Break'], {})

	sets.precast.WS['Cataclysm'] = {ammo="Knobkierrie",
		head="Pixie Hairpin +1",neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Moonshade Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Karieyh Ring",ring2="Archon Ring",
		back=gear.ws_jse_back,waist="Eschan Stone",legs="Nyame Flanchard",feet="Nyame Sollerets"}
	
	sets.precast.WS['Sanguine Blade'] = set_combine(sets.precast.WS['Cataclysm'], {})
	sets.precast.WS['Seraph Blade'] = set_combine(sets.precast.WS['Cataclysm'], {head="Nyame Helm",ring2="Rufescent Ring"})

	sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {ammo="Coiste Bodhar",
		head="Hjarrandi Helm",neck="War. Beads +1",ear1="Schere Earring",ear2="Moonshade Earring",
		body="Sakpata's Plate",hands="Sakpata's Gauntlets",ring1="Karieyh Ring",ring2="Niqmaddu Ring",
		back=gear.da_jse_back,waist="Sailfi Belt +1",legs="Sakpata's Cuisses",feet="Sulev. Leggings +2"})
	
	sets.precast.WS['Tachi: Koki'] = {ear1="Schere Earring",ear2="Telos Earring",head="Kengo Hachimaki",neck="Agelast Torque"}
	sets.precast.WS['Blade: Ei'] = {ear1="Schere Earring",ear2="Telos Earring",neck="Yarak Torque"}

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Lugra Earring +1",ear2="Lugra Earring",}
	sets.AccMaxTP = {ear1="Mache Earring +1",ear2="Telos Earring"}
	sets.AccDayMaxTPWSEars = {ear1="Mache Earring +1",ear2="Telos Earring"}
	sets.DayMaxTPWSEars = {ear1="Ishvara Earring",ear2="Schere Earring",}
	sets.AccDayWSEars = {ear1="Mache Earring +1",ear2="Telos Earring"}
	sets.DayWSEars = {ear1="Schere Earring",ear2="Moonshade Earring"}

	-- Specialty WS set overwrites.
	sets.AccWSMightyCharge = {}
	sets.AccWSCharge = {}
	sets.AccWSMightyCharge = {}
	sets.WSMightyCharge = {}
	sets.WSCharge = {}
	sets.WSMighty = {}

	-- Sets to return to when not performing an action.

	-- Resting sets
	sets.resting = {}

	-- Idle sets
	sets.idle = {ammo="Staunch Tathlum",
		head="Sakpata's Helm",neck="Warder's Charm +1",ear1="Odnowa Earring +1",ear2="Tuisto Earring",
		body="Sacro Breastplate",hands="Sakpata's Gauntlets",ring1="Defending Ring",ring2="Gelatinous Ring +1",
		back=gear.da_jse_back,waist="Engraved Belt",legs="Sakpata's Cuisses",feet="Sakpata's Leggings"}

	sets.idle.Weak = set_combine(sets.idle, {head="Twilight Helm",body="Twilight Mail"})
		
	sets.idle.Reraise = set_combine(sets.idle, {head="Twilight Helm",body="Twilight Mail"})

	-- Defense sets
	sets.defense.PDT = {ammo="Staunch Tathlum",
		head="Sakpata's Helm",neck="Loricate Torque +1",ear1="Odnowa Earring +1",ear2="Tuisto Earring",
		body="Sakpata's Plate",hands="Sakpata's Gauntlets",ring1="Defending Ring",ring2="Gelatinous Ring +1",
		back=gear.da_jse_back,waist="Flume Belt +1",legs="Sakpata's Cuisses",feet="Sakpata's Leggings"}
		
	sets.defense.PDTReraise = set_combine(sets.defense.PDT, {head="Twilight Helm",body="Twilight Mail"})

	sets.defense.MDT = {ammo="Staunch Tathlum",
		head="Nyame Helm",neck="Warder's Charm +1",ear1="Odnowa Earring +1",ear2="Tuisto Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Gelatinous Ring +1",
		back=gear.da_jse_back,waist="Engraved Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}
		
	sets.defense.MDTReraise = set_combine(sets.defense.MDT, {head="Twilight Helm",body="Twilight Mail"})
		
	sets.defense.MEVA = {ammo="Staunch Tathlum",
		head="Nyame Helm",neck="Warder's Charm +1",ear1="Odnowa Earring +1",ear2="Tuisto Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Gelatinous Ring +1", 
		back="Moonlight Cape",waist="Engraved Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}

	sets.Kiting = {feet="Hermes' Sandals"}
	sets.Reraise = {head="Twilight Helm",body="Twilight Mail"}
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {neck="Vim Torque +1"}

	-- Engaged sets
	sets.engaged = {ammo="Coiste Bodhar",
		head="Flam. Zucchetto +2",neck="War. Beads +1",ear1="Schere Earring",ear2="Telos Earring",
		body="Sakpata's Plate",hands="Sakpata's Gauntlets",ring1="Petrov Ring",ring2="Niqmaddu Ring",
		back=gear.da_jse_back,waist="Sailfi Belt +1",legs="Sakpata's Cuisses",feet="Flam. Gambieras +2"}
	sets.engaged.SomeAcc = {ammo="Coiste Bodhar",
		head="Flam. Zucchetto +2",neck="Combatant's Torque",ear1="Schere Earring",ear2="Telos Earring",
		body="Sakpata's Plate",hands="Sakpata's Gauntlets",ring1="Flamma Ring",ring2="Niqmaddu Ring",
		back=gear.da_jse_back,waist="Sailfi Belt +1",legs="Sakpata's Cuisses",feet="Flam. Gambieras +2"}
	sets.engaged.Acc = {ammo="Coiste Bodhar",
		head="Flam. Zucchetto +2",neck="Combatant's Torque",ear1="Digni. Earring",ear2="Telos Earring",
		body="Sakpata's Plate",hands="Sakpata's Gauntlets",ring1="Flamma Ring",ring2="Niqmaddu Ring",
		back=gear.da_jse_back,waist="Ioskeha Belt",legs="Sakpata's Cuisses",feet="Flam. Gambieras +2"}
	sets.engaged.FullAcc = {ammo="Coiste Bodhar",
		head="Flam. Zucchetto +2",neck="Combatant's Torque",ear1="Mache Earring +1",ear2="Telos Earring",
		body="Sakpata's Plate",hands="Sakpata's Gauntlets",ring1="Flamma Ring",ring2="Ramuh Ring +1",
		back=gear.da_jse_back,waist="Ioskeha Belt",legs="Sakpata's Cuisses",feet="Flam. Gambieras +2"}
	sets.engaged.Fodder = {ammo="Coiste Bodhar",
		head="Flam. Zucchetto +2",neck="War. Beads +1",ear1="Schere Earring",ear2="Telos Earring",
		body="Sakpata's Plate",hands="Sakpata's Gauntlets",ring1="Petrov Ring",ring2="Niqmaddu Ring",
		back=gear.da_jse_back,waist="Sailfi Belt +1",legs="Sakpata's Cuisses",feet="Flam. Gambieras +2"}
	sets.engaged.DT = {ammo="Coiste Bodhar",
		head="Sakpata's Helm",neck="War. Beads +1",ear1="Schere Earring",ear2="Telos Earring",
		body="Sakpata's Plate",hands="Sakpata's Gauntlets",ring1="Chirich Ring +1",ring2="Niqmaddu Ring",
		back=gear.da_jse_back,waist="Sailfi Belt +1",legs="Sakpata's Cuisses",feet="Sakpata's Leggings"}
	sets.engaged.Chango = {ammo="Coiste Bodhar",
		head="Hjarrandi Helm",neck="Vim Torque +1",ear1="Schere Earring",ear2="Telos Earring",
		body="Sakpata's Plate",hands="Tatena. Gote +1",ring1="Chirich Ring +1",ring2="Niqmaddu Ring",
		back=gear.da_jse_back,waist="Sailfi Belt +1",legs="Tatena. Haidate +1",feet="Tatena. Sune. +1"}
	sets.engaged.Chango.DT = {ammo="Coiste Bodhar",
		head="Sakpata's Helm",neck="Vim Torque +1",ear1="Schere Earring",ear2="Telos Earring",
		body="Sakpata's Plate",hands="Sakpata's Gauntlets",ring1="Chirich Ring +1",ring2="Niqmaddu Ring",
		back=gear.da_jse_back,waist="Sailfi Belt +1",legs="Sakpata's Cuisses",feet="Sakpata's Leggings"}

	sets.engaged.ProcGreatKatana = set_combine(sets.engaged, {head="Kengo Hachimaki",neck="Agelast Torque"})
	sets.engaged.ProcKatana = set_combine(sets.engaged, {neck="Yarak Torque"})

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	--Extra Special Sets
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {neck="Vim Torque +1"}
	sets.buff.Retaliation = {}
	sets.buff.Restraint = {}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	
	-- Weapons sets
	sets.weapons.Savage = {main="Naegling",sub="Blurred Shield +1"}
	sets.weapons.Chango = {main="Chango",sub="Utu Grip"}
	sets.weapons.ShiningOne = {main="Shining One",sub="Utu Grip"}
	sets.weapons.DualWeapons = {main="Firangi",sub="Reikiko"}
	sets.weapons.Greatsword = {main="Montante +1",sub="Utu Grip"}
	sets.weapons.Club = {main="Loxotic Mace +1",sub="Blurred Shield +1"}
	sets.weapons.Staff = {main="Blurred Staff",sub="Utu Grip"}
	sets.weapons.ProcDagger = {main="Wind Knife",sub=empty}
	sets.weapons.ProcSword = {main="Twinned Blade",sub=empty}
	sets.weapons.ProcGreatSword = {main="Ophidian Sword",sub=empty}
	sets.weapons.ProcScythe = {main="Lost Sickle",sub=empty}
	sets.weapons.ProcPolearm = {main="Tzee Xicu's Blade",sub=empty}
	sets.weapons.ProcGreatKatana = {main="Zanmato",sub=empty}
	sets.weapons.ProcKatana = {main="Debahocho",sub=empty}
	sets.weapons.ProcClub = {main="Soulflayer's Wand",sub=empty}
	sets.weapons.ProcStaff = {main="Levin",sub=empty}
	sets.weapons.ProcAxe = {main="Gramk's Axe",sub=empty}

end

function user_job_lockstyle()
	windower.chat.input('/lockstyleset 006')
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	-- Default macro set/book
	if player.sub_job == 'SAM' then
		set_macro_page(1, 7)
	elseif player.sub_job == 'DNC' then
		set_macro_page(1, 7)
	elseif player.sub_job == 'THF' then
		set_macro_page(1, 7)
	else
		set_macro_page(1, 7)
	end
end

autows_list = {
	['Savage']='Savage Blade',
	['Chango']='Upheaval',
	['ShiningOne']='Impulse Drive',
	['Greatsword']='Resolution',
	['Club']='Judgment'
}
