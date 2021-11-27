function user_job_setup()
	-- Options: Override default values
	state.OffenseMode:options('Normal','SomeAcc','Acc','FullAcc', 'Fodder')
	state.WeaponskillMode:options('Match','Normal', 'SomeAcc', 'Acc', 'FullAcc', 'Fodder')
	state.HybridMode:options('Normal','PDT')
	state.PhysicalDefenseMode:options('PDT','HP')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.IdleMode:options('Normal','PDT')
	state.Weapons:options('Karambit','Staff','ProcStaff','ProcClub','Barehanded','ProcSword','ProcGreatSword','ProcScythe','ProcPolearm','ProcGreatKatana')

	state.ExtraMeleeMode = M{['description']='Extra Melee Mode', 'None'}

	gear.str_da_jse_back = {name="Segomo's Mantle",augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}}
	gear.dex_da_jse_back = {name="Segomo's Mantle",augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10',}}

	update_melee_groups()
	
	-- Additional local binds
	send_command('bind ^` input /ja "Boost" <me>')
	send_command('bind !` input /ja "Perfect Counter" <me>')
	send_command('bind ^backspace input /ja "Mantra" <me>')
	send_command('bind @` gs c cycle SkillchainMode')

	autofood = 'Grape Daifuku'
	
	select_default_macro_book()
end

function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	
	-- Precast Sets
	
	-- Precast sets to enhance JAs on use
	sets.precast.JA['Hundred Fists'] = {legs="Hes. Hose +3"}
	sets.precast.JA['Boost'] = {} --hands="Anchorite's Gloves +1"
	sets.precast.JA['Boost'].OutOfCombat = {} --hands="Anchorite's Gloves +1", Remove Haste and Add Slow Gear.
	sets.precast.JA['Dodge'] = {feet="Anchorite's Gaiters +2"}
	sets.precast.JA['Focus'] = {head="Anchorite's Crown +1"}
	sets.precast.JA['Counterstance'] = {feet="Hesychast's Gaiters +1"}
	sets.precast.JA['Footwork'] = {feet="Bhikku Gaiters +1"}
	sets.precast.JA['Formless Strikes'] = {body="Hesychast's Cyclas"}
	sets.precast.JA['Mantra'] = {feet="Hesychast's Gaiters +1"}

	sets.precast.JA['Chi Blast'] = {head="Hes. Crown +1"}
	
	sets.precast.JA['Chakra'] = {
		head="Malignance Chapeau",
		body="Nyame Mail",hands="Hesychast's Gloves +1",
		legs="Hes. Hose +1",feet="Anch. Gaiters +1"}

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}
		
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}

	sets.precast.Step = {ammo="Coiste Bodhar",
		head="Malignance Chapeau",neck="Mnk. Nodowa +1",ear1="Mache Earring +1",ear2="Telos Earring",
		body="Nyame Mail",hands="Hesychast's Gloves +1",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
		back="Segomo's Mantle",waist="Olseni Belt",legs="Hiza. Hizayoroi +2",feet="Malignance Boots"}
		
	sets.precast.Flourish1 = {ammo="Coiste Bodhar",
		head="Malignance Chapeau",neck="Mnk. Nodowa +1",ear1="Mache Earring +1",ear2="Telos Earring",
		body="Nyame Mail",hands="Hesychast's Gloves +1",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
		back="Segomo's Mantle",waist="Olseni Belt",legs="Mummu Kecks +2",feet="Malignance Boots"}

	-- Fast cast sets for spells
	
	sets.precast.FC = {ammo="Impatiens",
		head=gear.herculean_fc_head,neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
		body="Dread Jupon",hands="Leyline Gloves",ring2="Lebeche Ring",ring2="Kishar Ring",
		legs="Rawhide Trousers"}

	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads",body="Passion Jacket"})

	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {ammo="Knobkierrie",
		head="Adhemar Bonnet +1",neck="Mnk. Nodowa +1",ear1="Schere Earring",ear2="Sherida Earring",
		body="Mpaca's Doublet",hands="Ryuo Tekko +1",ring1="Gere Ring",ring2="Niqmaddu Ring",
		back=gear.str_da_jse_back,waist="Moonbow Belt +1",legs="Samnuha Tights",feet="Mpaca's Boots"}

	sets.precast.WSSomeAcc = {ammo="Coiste Bodhar",head="Malignance Chapeau",legs="Hiza. Hizayoroi +2"}
	sets.precast.WSAcc = {ammo="Coiste Bodhar",head="Malignance Chapeau",neck="Combatant's Torque",ear1="Cessance Earring",ring2="Ramuh Ring +1",body="Nyame Mail",waist="Olseni Belt",legs="Hiza. Hizayoroi +2",feet="Malignance Boots"}
	sets.precast.WSFullAcc = {ammo="Coiste Bodhar",head="Mummu Bonnet +2",neck="Mnk. Nodowa +1",ear1="Mache Earring +1",ear2="Telos Earring",body="Nyame Mail",hands="Ryuo Tekko",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",waist="Olseni Belt",legs="Hiza. Hizayoroi +2",feet="Malignance Boots"}
	sets.precast.WSFodder = {}
	sets.precast.WS.SomeAcc = set_combine(sets.precast.WS, sets.precast.WSSomeAcc)	
	sets.precast.WS.Acc = set_combine(sets.precast.WS, sets.precast.WSAcc)
	sets.precast.WS.FullAcc = set_combine(sets.precast.WS, sets.precast.WSFullAcc)
	sets.precast.WS.Fodder = set_combine(sets.precast.WS, sets.precast.WSFodder)

	-- Specific weaponskill sets.

	sets.precast.WS['Raging Fists'] = set_combine(sets.precast.WS, {waist="Grunfeld Rope"})
	sets.precast.WS['Howling Fist'] = set_combine(sets.precast.WS, {})
	sets.precast.WS['Asuran Fists'] = set_combine(sets.precast.WS, {waist="Grunfeld Rope"})
	sets.precast.WS["Ascetic's Fury"] = set_combine(sets.precast.WS, {neck="Caro Necklace",body="Abnoba Kaftan",hands="Ryuo Tekko +1",ring2="Begrudging Ring",waist="Grunfeld Rope",feet=gear.herculean_wsd_feet})
	sets.precast.WS["Victory Smite"] = set_combine(sets.precast.WS, {legs="Mpaca's Hose",feet="Tatena. Sune. +1"})
	sets.precast.WS['Shijin Spiral'] = set_combine(sets.precast.WS, {head="Mpaca's Cap",body="Mpaca's Doublet",hands="Malignance Gloves",legs="Mpaca's Hose",feet="Mpaca's Boots",ear1="Mache Earring +1",back=gear.dex_da_jse_back})
	sets.precast.WS['Dragon Kick'] = set_combine(sets.precast.WS, {waist="Grunfeld Rope"})
	sets.precast.WS['Tornado Kick'] = set_combine(sets.precast.WS, {head="Mpaca's Cap",ear1="Moonshade Earring",hands="Tatena. Gote +1",legs="Tatena. Haidate +1"})
	sets.precast.WS['Spinning Attack'] = set_combine(sets.precast.WS, {waist="Grunfeld Rope"})

	sets.precast.WS["Raging Fists"].SomeAcc = set_combine(sets.precast.WS["Raging Fists"], sets.precast.WSSomeAcc)
	sets.precast.WS["Howling Fist"].SomeAcc = set_combine(sets.precast.WS["Howling Fist"], sets.precast.WSSomeAcc)
	sets.precast.WS["Asuran Fists"].SomeAcc = set_combine(sets.precast.WS["Asuran Fists"], sets.precast.WSSomeAcc)
	sets.precast.WS["Ascetic's Fury"].SomeAcc = set_combine(sets.precast.WS["Ascetic's Fury"], sets.precast.WSSomeAcc, {head="Mummu Bonnet +2",body="Abnoba Kaftan",hands="Ryuo Tekko",ring2="Begrudging Ring",waist="Grunfeld Rope",legs="Mummu Kecks +2",feet=gear.herculean_wsd_feet})
	sets.precast.WS["Victory Smite"].SomeAcc = set_combine(sets.precast.WS["Victory Smite"], sets.precast.WSSomeAcc, {head="Mummu Bonnet +2",ear1="Moonshade Earring",body="Abnoba Kaftan",hands="Ryuo Tekko",ring2="Begrudging Ring",legs="Mummu Kecks +2",feet="Mummu Gamash. +2"})
	sets.precast.WS["Shijin Spiral"].SomeAcc = set_combine(sets.precast.WS["Shijin Spiral"], sets.precast.WSSomeAcc, {})
	sets.precast.WS["Dragon Kick"].SomeAcc = set_combine(sets.precast.WS["Dragon Kick"], sets.precast.WSSomeAcc)
	sets.precast.WS["Tornado Kick"].SomeAcc = set_combine(sets.precast.WS["Tornado Kick"], sets.precast.WSSomeAcc)
	
	sets.precast.WS["Raging Fists"].Acc = set_combine(sets.precast.WS["Raging Fists"], sets.precast.WSAcc)
	sets.precast.WS["Howling Fist"].Acc = set_combine(sets.precast.WS["Howling Fist"], sets.precast.WSAcc)
	sets.precast.WS["Asuran Fists"].Acc = set_combine(sets.precast.WS["Asuran Fists"], sets.precast.WSAcc)
	sets.precast.WS["Ascetic's Fury"].Acc = set_combine(sets.precast.WS["Ascetic's Fury"], sets.precast.WSAcc, {head="Mummu Bonnet +2",body="Sayadio's Kaftan",hands="Ryuo Tekko",ring2="Begrudging Ring",legs="Mummu Kecks +2",feet="Mummu Gamash. +2"})
	sets.precast.WS["Victory Smite"].Acc = set_combine(sets.precast.WS["Victory Smite"], sets.precast.WSAcc, {head="Mummu Bonnet +2",ear1="Moonshade Earring",body="Sayadio's Kaftan",hands="Ryuo Tekko",ring2="Begrudging Ring",legs="Mummu Kecks +2",feet="Mummu Gamash. +2"})
	sets.precast.WS["Shijin Spiral"].Acc = set_combine(sets.precast.WS["Shijin Spiral"], sets.precast.WSAcc)
	sets.precast.WS["Dragon Kick"].Acc = set_combine(sets.precast.WS["Dragon Kick"], sets.precast.WSAcc)
	sets.precast.WS["Tornado Kick"].Acc = set_combine(sets.precast.WS["Tornado Kick"], sets.precast.WSAcc)

	sets.precast.WS["Raging Fists"].FullAcc = set_combine(sets.precast.WS["Raging Fists"], sets.precast.WSFullAcc)
	sets.precast.WS["Howling Fist"].FullAcc = set_combine(sets.precast.WS["Howling Fist"], sets.precast.WSFullAcc)
	sets.precast.WS["Asuran Fists"].FullAcc = set_combine(sets.precast.WS["Asuran Fists"], sets.precast.WSFullAcc)
	sets.precast.WS["Ascetic's Fury"].FullAcc = set_combine(sets.precast.WS["Ascetic's Fury"], sets.precast.WSFullAcc, {head="Mummu Bonnet +2",body="Mummu Jacket +2",hands="Ryuo Tekko",legs="Mummu Kecks +2",feet="Mummu Gamash. +2"})
	sets.precast.WS["Victory Smite"].FullAcc = set_combine(sets.precast.WS["Victory Smite"], sets.precast.WSFullAcc, {head="Mummu Bonnet +2",body="Mummu Jacket +2",hands="Ryuo Tekko",legs="Mummu Kecks +2",feet="Mummu Gamash. +2"})
	sets.precast.WS["Shijin Spiral"].FullAcc = set_combine(sets.precast.WS["Shijin Spiral"], sets.precast.WSFullAcc)
	sets.precast.WS["Dragon Kick"].FullAcc = set_combine(sets.precast.WS["Dragon Kick"], sets.precast.WSFullAcc)
	sets.precast.WS["Tornado Kick"].FullAcc = set_combine(sets.precast.WS["Tornado Kick"], sets.precast.WSFullAcc)
	
	sets.precast.WS["Raging Fists"].Fodder = set_combine(sets.precast.WS["Raging Fists"], sets.precast.WSFodder)
	sets.precast.WS["Howling Fist"].Fodder = set_combine(sets.precast.WS["Howling Fist"], sets.precast.WSFodder)
	sets.precast.WS["Asuran Fists"].Fodder = set_combine(sets.precast.WS["Asuran Fists"], sets.precast.WSFodder)
	sets.precast.WS["Ascetic's Fury"].Fodder = set_combine(sets.precast.WS["Ascetic's Fury"], sets.precast.WSFodder, {head="Adhemar Bonnet +1",neck="Caro Necklace",body="Abnoba Kaftan",ring1="Begrudging Ring",waist="Grunfeld Rope"})
	sets.precast.WS["Victory Smite"].Fodder = set_combine(sets.precast.WS["Victory Smite"], sets.precast.WSFodder, {ear1="Moonshade Earring",body="Abnoba Kaftan",ring1="Begrudging Ring"})
	sets.precast.WS["Shijin Spiral"].Fodder = set_combine(sets.precast.WS["Shijin Spiral"], sets.precast.WSFodder)
	sets.precast.WS["Dragon Kick"].Fodder = set_combine(sets.precast.WS["Dragon Kick"], sets.precast.WSFodder)
	sets.precast.WS["Tornado Kick"].Fodder = set_combine(sets.precast.WS["Tornado Kick"], sets.precast.WSFodder)

	sets.precast.WS['Cataclysm'] = {ammo="Knobkierrie",
		head="Pixie Hairpin +1",neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Moonshade Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Karieyh Ring",ring2="Archon Ring",
		back=gear.str_da_jse_back,waist="Eschan Stone",legs="Nyame Flanchard",feet="Nyame Sollerets"}
	
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Schere Earring",ear2="Sherida Earring",}
	sets.AccMaxTP = {ear1="Mache Earring +1",ear2="Telos Earring"}
	
	-- Midcast Sets
	sets.midcast.FastRecast = {ammo="Staunch Tathlum",
		head=gear.herculean_fc_head,neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
		body="Dread Jupon",hands="Leyline Gloves",ring1="Defending Ring",ring2="Prolix Ring",
		back="Segomo's Mantle",waist="Moonbow Belt +1",legs="Malignance Tights",feet="Malignance Boots"}
		
	-- Specific spells
	sets.midcast.Utsusemi = set_combine(sets.midcast.FastRecast, {back="Mujin Mantle"})
		
	-- Sets to return to when not performing an action.
	
	-- Resting sets
	sets.resting = {body="Hesychast's Cyclas",ring2="Sheltered Ring"}
	

	-- Idle sets
	sets.idle = {ammo="Staunch Tathlum",
		head="Nyame Helm",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Tuisto Earring",
		body="Hiza. Haramaki +2",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Sheltered Ring",
		back=gear.dex_da_jse_back,waist="Moonbow Belt +1",legs="Nyame Flanchard",feet="Nyame Sollerets"}

	sets.idle.Weak = {ammo="Staunch Tathlum",
		head="Nyame Helm",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Tuisto Earring",
		body="Hiza. Haramaki +2",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Sheltered Ring",
		back=gear.dex_da_jse_back,waist="Moonbow Belt +1",legs="Nyame Flanchard",feet="Nyame Sollerets"}

	sets.idle.PDT = {ammo="Staunch Tathlum",
		head="Nyame Helm",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Tuisto Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Gelatinous Ring +1",
		back=gear.dex_da_jse_back,waist="Moonbow Belt +1",legs="Nyame Flanchard",feet="Nyame Sollerets"}		

	-- Defense sets
	sets.defense.PDT = {ammo="Staunch Tathlum",
		head="Nyame Helm",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Tuisto Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Gelatinous Ring +1",
		back=gear.dex_da_jse_back,waist="Moonbow Belt +1",legs="Nyame Flanchard",feet="Nyame Sollerets"}
		
	-- Defense sets
	sets.defense.HP = {ammo="Staunch Tathlum",
		head="Nyame Helm",neck="Loricate Torque +1",ear1="Odnowa Earring +1",ear2="Tuisto Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Gelatinous Ring +1",
		back=gear.dex_da_jse_back,waist="Moonbow Belt +1",legs="Nyame Flanchard",feet="Nyame Sollerets"}

	sets.defense.MDT = {ammo="Staunch Tathlum",
		head="Nyame Helm",neck="Warder's Charm +1",ear1="Etiolation Earring",ear2="Tuisto Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Purity Ring",
		back=gear.dex_da_jse_back,waist="Engraved Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}
		
	sets.defense.MEVA = {ammo="Staunch Tathlum",
		head="Nyame Helm",neck="Warder's Charm +1",ear1="Etiolation Earring",ear2="Tuisto Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Purity Ring",
		back=gear.dex_da_jse_back,waist="Engraved Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}

	sets.Kiting = {feet="Hermes' Sandals"}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion

	-- Normal melee sets
	sets.engaged = {ammo="Coiste Bodhar",
		head="Adhemar Bonnet +1",neck="Mnk. Nodowa +1",ear1="Schere Earring",ear2="Sherida Earring",
		body="Ken. Samue +1",hands="Adhemar Wrist. +1",ring1="Gere Ring",ring2="Niqmaddu Ring",
		back=gear.dex_da_jse_back,waist="Moonbow Belt +1",legs="Hes. Hose +3",feet="Anch. Gaiters +2"}
	sets.engaged.SomeAcc = {ammo="Coiste Bodhar",
		head="Adhemar Bonnet +1",neck="Mnk. Nodowa +1",ear1="Schere Earring",ear2="Sherida Earring",
		body="Ken. Samue +1",hands="Adhemar Wrist. +1",ring1="Gere Ring",ring2="Niqmaddu Ring",
		back=gear.dex_da_jse_back,waist="Moonbow Belt +1",legs="Hes. Hose +3",feet="Anch. Gaiters +2"}
	sets.engaged.Acc = {ammo="Coiste Bodhar",
		head="Adhemar Bonnet +1",neck="Mnk. Nodowa +1",ear1="Cessance Earring",ear2="Sherida Earring",
		body="Ken. Samue +1",hands="Ryuo Tekko",ring1="Gere Ring",ring2="Ramuh Ring +1",
		back=gear.dex_da_jse_back,waist="Moonbow Belt +1",legs="Tatena. Haidate +1",feet="Malignance Boots"}
	sets.engaged.FullAcc = {ammo="Coiste Bodhar",
		head="Mummu Bonnet +2",neck="Mnk. Nodowa +1",ear1="Mache Earring +1",ear2="Telos Earring",
		body="Ken. Samue +1",hands="Ryuo Tekko",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
		back=gear.dex_da_jse_back,waist="Moonbow Belt +1",legs="Tatena. Haidate +1",feet="Malignance Boots"}
	sets.engaged.Fodder = {ammo="Coiste Bodhar",
		head="Adhemar Bonnet +1",neck="Mnk. Nodowa +1",ear1="Schere Earring",ear2="Sherida Earring",
		body="Ken. Samue +1",hands="Adhemar Wrist. +1",ring1="Gere Ring",ring2="Niqmaddu Ring",
		back=gear.dex_da_jse_back,waist="Moonbow Belt +1",legs="Hes. Hose +3",feet="Anch. Gaiters +2"}

	-- Defensive melee hybrid sets
	sets.engaged.PDT = {ammo="Coiste Bodhar",
		head="Malignance Chapeau",neck="Mnk. Nodowa +1",ear1="Schere Earring",ear2="Sherida Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Niqmaddu Ring",
		back=gear.dex_da_jse_back,waist="Moonbow Belt +1",legs="Malignance Tights",feet="Malignance Boots"}
	sets.engaged.SomeAcc.PDT = {ammo="Coiste Bodhar",
		head="Malignance Chapeau",neck="Mnk. Nodowa +1",ear1="Schere Earring",ear2="Sherida Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Niqmaddu Ring",
		back=gear.dex_da_jse_back,waist="Moonbow Belt +1",legs="Malignance Tights",feet="Malignance Boots"}
	sets.engaged.Acc.PDT = {ammo="Coiste Bodhar",
		head="Malignance Chapeau",neck="Mnk. Nodowa +1",ear1="Cessance Earring",ear2="Sherida Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Niqmaddu Ring",
		back=gear.dex_da_jse_back,waist="Moonbow Belt +1",legs="Malignance Tights",feet="Malignance Boots"}
	sets.engaged.FullAcc.PDT = {ammo="Coiste Bodhar",
		head="Malignance Chapeau",neck="Mnk. Nodowa +1",ear1="Mache Earring +1",ear2="Telos Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Niqmaddu Ring",
		back=gear.dex_da_jse_back,waist="Moonbow Belt +1",legs="Malignance Tights",feet="Malignance Boots"}
	sets.engaged.Fodder.PDT = {ammo="Staunch Tathlum",
		head="Malignance Chapeau",neck="Mnk. Nodowa +1",ear1="Schere Earring",ear2="Sherida Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Niqmaddu Ring",
		back=gear.dex_da_jse_back,waist="Moonbow Belt +1",legs="Malignance Tights",feet="Malignance Boots"}

	-- Hundred Fists/Impetus melee set mods
	
	sets.engaged.HF = set_combine(sets.engaged, {})
	sets.engaged.SomeAcc.HF = set_combine(sets.engaged.SomeAcc, {})
	sets.engaged.Acc.HF = set_combine(sets.engaged.Acc, {})
	sets.engaged.FullAcc.HF = set_combine(sets.engaged.FullAcc, {})
	sets.engaged.Fodder.HF = set_combine(sets.engaged.Fodder, {})

	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {head="Frenzy Sallet"}
	sets.buff.Impetus = {body="Bhikku Cyclas +1"}
	sets.buff.Footwork = {feet="Anch. Gaiters +2"}
	sets.buff.Boost = {waist="Ask Sash"}
	
	sets.FootworkWS = {feet="Anch. Gaiters +2"}
	sets.DayIdle = {}
	sets.NightIdle = {}
    sets.Knockback = {}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	sets.Skillchain = {}
	
	-- Weapons sets
	sets.weapons.Karambit = {main="Karambit"}
	sets.weapons.Barehanded = {main=empty}
	sets.weapons.Staff = {main="Blurred Staff",sub="Bloodrain Strap"}
	sets.weapons.ProcStaff = {main="Levin"}
	sets.weapons.ProcClub = {main="Soulflayer's Wand"}
	sets.weapons.ProcSword = {main="Excalipoor",sub=empty}
	sets.weapons.ProcGreatSword = {main="Ophidian Sword",sub=empty}
	sets.weapons.ProcScythe = {main="Lost Sickle",sub=empty}
	sets.weapons.ProcPolearm = {main="Tzee Xicu's Blade",sub=empty}
	sets.weapons.ProcGreatKatana = {main="Zanmato",sub=empty}
end

function user_job_lockstyle()
	windower.chat.input('/lockstyleset 008')
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	-- Default macro set/book
	if player.sub_job == 'DNC' then
		set_macro_page(1, 9)
	elseif player.sub_job == 'NIN' then
		set_macro_page(1, 9)
	elseif player.sub_job == 'THF' then
		set_macro_page(1, 9)
	elseif player.sub_job == 'RUN' then
		set_macro_page(1, 9)
	else
		set_macro_page(1, 9)
	end
end