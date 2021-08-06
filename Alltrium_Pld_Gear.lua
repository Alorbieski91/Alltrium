function user_job_setup()

	-- Options: Override default values	
	state.OffenseMode:options('Normal','Acc')
	state.HybridMode:options('Tank','DDTank','BreathTank','Dawn','NoShellTank','Normal')
	state.WeaponskillMode:options('Match','Normal', 'Acc')
	state.CastingMode:options('Normal','SIRD')
	state.Passive:options('None','AbsorbMP')
	state.PhysicalDefenseMode:options('PDT','PDT_HP','Tank')
	state.MagicalDefenseMode:options('BDT','MDT_HP','AegisMDT','AegisNoShellMDT','OchainMDT','OchainNoShellMDT','MDT_Reraise')
	state.ResistDefenseMode:options('MEVA','MEVA_HP','Death','Charm','Terror')
	state.IdleMode:options('Normal','Tank','KiteTank','PDT','MDT','Refresh','Reraise')
	state.Weapons:options('None','Savage','DeaconAegis','SequenceAegis','SequenceBlurred')

	state.ExtraDefenseMode = M{['description']='Extra Defense Mode','None','MP','Twilight'}

	gear.fastcast_jse_back = {name="Rudianos's Mantle",augments={'HP+60','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10',}}
	gear.enmity_jse_back = {name="Rudianos's Mantle",augments={'HP+60','Eva.+20 /Mag. Eva.+20','Enmity+10','Damage taken-5%',}} --'HP+20',

	-- Additional local binds
	send_command('bind !` gs c SubJobEnmity')
	send_command('bind ^backspace input /ja "Shield Bash" <t>')
	send_command('bind @backspace input /ja "Cover" <stpt>')
	send_command('bind !backspace input /ja "Sentinel" <me>')
	send_command('bind @= input /ja "Chivalry" <me>')
	send_command('bind != input /ja "Palisade" <me>')
	send_command('bind ^delete input /ja "Provoke" <stnpc>')
	send_command('bind !delete input /ma "Cure IV" <stal>')
	send_command('bind @delete input /ma "Flash" <stnpc>')
	send_command('bind !f11 gs c cycle ExtraDefenseMode')
	send_command('bind @` gs c cycle RuneElement')
	send_command('bind ^pause gs c toggle AutoRuneMode')
	send_command('bind @f8 gs c toggle AutoTankMode')
	send_command('bind @f10 gs c toggle TankAutoDefense')
	send_command('bind ^@!` gs c cycle SkillchainMode')

	select_default_macro_book()
	update_defense_mode()
end

function init_gear_sets()
	
	--------------------------------------
	-- Precast sets
	--------------------------------------

	sets.Enmity = {main="Nixxer",ammo="Staunch Tathlum",
		head="Loess Barbuta +1",neck="Unmoving Collar +1",ear1="Friomisi Earring",ear2="Tuisto Earring",
		body="Souveran Cuirass",hands="Macabre Gaunt. +1",ring1="Apeile Ring +1",ring2="Apeile Ring",
		back=gear.enmity_jse_back,waist="Creed Baudrier",legs="Souv. Diechlings +1",feet="Eschite Greaves"}
		
	sets.Enmity.SIRD = {main="Nixxer",sub="Sacro Bulwark",ammo="Staunch Tathlum",
		head="Souveran Schaller",neck="Loricate Torque +1",ear1="Friomisi Earring",ear2="Tuisto Earring",
		body="Souveran Cuirass",hands="Macabre Gaunt. +1",ring1="Defending Ring",ring2="Moonlight Ring",
		back=gear.enmity_jse_back,waist="Audumbla Sash",legs="Carmine Cuisses +1",feet=gear.odyssean_fc_feet}
		
	sets.Enmity.DT = {main="Nixxer",ammo="Staunch Tathlum",
		head="Loess Barbuta +1",neck="Unmoving Collar +1",ear1="Odnowa Earring",ear2="Tuisto Earring",
		body="Souveran Cuirass",hands="Macabre Gaunt. +1",ring1="Defending Ring",ring2="Apeile Ring +1",
		back=gear.enmity_jse_back,waist="Creed Baudrier",legs="Souv. Diechlings +1",feet="Eschite Greaves"}
		
	-- Precast sets to enhance JAs
	sets.precast.JA['Invincible'] = set_combine(sets.Enmity,{legs="Cab. Breeches +1"})
	sets.precast.JA['Holy Circle'] = set_combine(sets.Enmity,{feet="Rev. Leggings +3"})
	sets.precast.JA['Sentinel'] = set_combine(sets.Enmity,{feet="Cab. Leggings +1"})
	sets.precast.JA['Rampart'] = set_combine(sets.Enmity,{head="Cab. Coronet +1"})
	sets.precast.JA['Fealty'] = set_combine(sets.Enmity,{body="Cab. Surcoat +1"})
	sets.precast.JA['Divine Emblem'] = set_combine(sets.Enmity,{feet="Chev. Sabatons +1"})
	sets.precast.JA['Cover'] = set_combine(sets.Enmity, {body="Cab. Surcoat +1"}) --head="Rev. Coronet +1",

	sets.precast.JA['Invincible'].DT = set_combine(sets.Enmity.DT,{legs="Cab. Breeches +1"})
	sets.precast.JA['Holy Circle'].DT = set_combine(sets.Enmity.DT,{feet="Rev. Leggings +3"})
	sets.precast.JA['Sentinel'].DT = set_combine(sets.Enmity.DT,{feet="Cab. Leggings +1"})
	sets.precast.JA['Rampart'].DT = set_combine(sets.Enmity.DT,{head="Cab. Coronet +1"})
	sets.precast.JA['Fealty'].DT = set_combine(sets.Enmity.DT,{body="Cab. Surcoat +1"})
	sets.precast.JA['Divine Emblem'].DT = set_combine(sets.Enmity.DT,{feet="Chev. Sabatons +1"})
	sets.precast.JA['Cover'].DT = set_combine(sets.Enmity.DT, {body="Cab. Surcoat +1"}) --head="Rev. Coronet +1",

	-- add mnd for Chivalry
	sets.precast.JA['Chivalry'] = {
		head="Sulevia's Mask +1",neck="Phalaina Locket",ear1="Nourish. Earring",ear2="Nourish. Earring +1",
		body="Souveran Cuirass",hands="Cab. Gauntlets +1",ring1="Stikini Ring +1",ring2="Rufescent Ring",
		back=gear.enmity_jse_back,waist="Luminary Sash",legs="Carmine Cuisses +1",feet="Carmine Greaves +1"}

	sets.precast.JA['Shield Bash'] = set_combine(sets.Enmity, {hands="Cab. Gauntlets +1"})		
	sets.precast.JA['Provoke'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Warcry'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Palisade'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Intervene'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Defender'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Berserk'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Aggressor'] = set_combine(sets.Enmity, {})

	sets.precast.JA['Shield Bash'].DT = set_combine(sets.Enmity.DT, {hands="Cab. Gauntlets +1"})		
	sets.precast.JA['Provoke'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Warcry'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Palisade'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Intervene'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Defender'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Berserk'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Aggressor'].DT = set_combine(sets.Enmity.DT, {})

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {
		head="Carmine Mask +1",
		body="Souveran Cuirass",ring1="Asklepian Ring",ring2="Valseur's Ring",
		waist="Chaac Belt",legs="Sulevi. Cuisses +1"}
		
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}

	sets.precast.Step = {ammo="Aurgelmir Orb +1",
		head="Founder's Corona",neck="Combatant's Torque",ear1="Mache Earring +1",ear2="Telos Earring",
		body="Souveran Cuirass",hands="Leyline Gloves",ring1="Ramuh Ring +1",ring2="Patricius Ring",
		back="Ground. Mantle +1",waist="Olseni Belt",legs="Carmine Cuisses +1",feet="Founder's Greaves"}
		
	sets.precast.JA['Violent Flourish'] = {ammo="Aurgelmir Orb +1",
		head="Founder's Corona",neck="Erra Pendant",ear1="Gwati Earring",ear2="Digni. Earring",
		body="Found. Breastplate",hands="Leyline Gloves",ring1="Defending Ring",ring2="Stikini Ring +1",
		back="Ground. Mantle +1",waist="Olseni Belt",legs="Carmine Cuisses +1",feet="Founder's Greaves"}
		
	sets.precast.JA['Animated Flourish'] = set_combine(sets.Enmity, {})

	-- Fast cast sets for spells

	sets.precast.FC = {main="Malignance Sword",ammo="Impatiens",
		head="Carmine Mask +1",neck="Voltsurge Torque",ear1="Odnowa Earring",ear2="Tuisto Earring",
		body=gear.odyssean_fc_body,hands="Leyline Gloves",ring1="Defending Ring",ring2="Gelatinous Ring +1",
		back=gear.fastcast_jse_back,waist="Creed Baudrier",legs="Eschite Cuisses",feet=gear.odyssean_fc_feet}
		
	sets.precast.FC.DT = {ammo="Staunch Tathlum",
		head="Souveran Schaller",neck="Loricate Torque +1",ear1="Odnowa Earring",ear2="Tuisto Earring",
		body="Souveran Cuirass",hands="Souv. Handsch. +1",ring1="Defending Ring",ring2="Gelatinous Ring +1",
		back="Moonlight Cape",waist="Creed Baudrier",legs="Souv. Diechlings +1",feet="Souveran Schuhs +1"}
		
	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})

	sets.precast.FC.Cure = set_combine(sets.precast.FC, {neck="Diemer Gorget",ear1="Nourish. Earring",ear2="Nourish. Earring +1",body="Souveran Cuirass"})

	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {ammo="Paeapua",
		head="Hjarrandi Helm",neck="Lissome Necklace",ear1="Cessance Earring",ear2="Brutal Earring",
		body="Flamma Korazin +2",hands=gear.odyssean_wsd_hands,ring1="Regal Ring",ring2="Rufescent Ring",
		back="Bleating Mantle",waist="Fotia Belt",legs=gear.valorous_wsd_legs,feet="Sulev. Leggings +2"}
		
	sets.precast.WS.DT = {ammo="Staunch Tathlum",
		head="Souveran Schaller",neck="Loricate Torque +1",ear1="Odnowa Earring",ear2="Tuisto Earring",
		body="Souveran Cuirass",hands="Souv. Handsch. +1",ring1="Gelatinous Ring +1",ring2="Moonlight Ring",
		back="Moonlight Cape",waist="Creed Baudrier",legs="Souv. Diechlings +1",feet="Souveran Schuhs +1"}

	sets.precast.WS.Acc = {ammo="Hasty Pinion +1",
		head="Ynglinga Sallet",neck="Combatant's Torque",ear1="Mache Earring +1",ear2="Telos Earring",
		body="Flamma Korazin +2",hands="Sulev. Gauntlets +1",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
		back="Ground. Mantle +1",waist="Olseni Belt",legs="Carmine Cuisses +1",feet="Sulev. Leggings +2"}

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {neck="Fotia Gorget",ear1="Brutal Earring",ear2="Moonshade Earring"})
	sets.precast.WS['Requiescat'].Acc = set_combine(sets.precast.WS.Acc, {neck="Fotia Gorget",ear1="Mache Earring +1",ear2="Moonshade Earring"})

	sets.precast.WS['Chant du Cygne'] = set_combine(sets.precast.WS, {neck="Fotia Gorget",ear1="Brutal Earring",ear2="Moonshade Earring"})
	sets.precast.WS['Chant du Cygne'].Acc = set_combine(sets.precast.WS.Acc, {neck="Fotia Gorget",ear1="Mache Earring +1",ear2="Moonshade Earring"})

	sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS, {neck="Fotia Gorget",ear1="Thrud Earring",ear2="Moonshade Earring"})
	sets.precast.WS['Savage Blade'].Acc = set_combine(sets.precast.WS.Acc, {ear1="Mache Earring +1",ear2="Telos Earring"})

	sets.precast.WS['Flat Blade'] = {ammo="Aurgelmir Orb +1",
		head="Founder's Corona",neck="Voltsurge Torque",ear1="Gwati Earring",ear2="Digni. Earring",
		body="Flamma Korazin +2",hands="Leyline Gloves",ring1="Defending Ring",ring2="Stikini Ring +1",
		back="Ground. Mantle +1",waist="Olseni Belt",legs="Carmine Cuisses +1",feet="Founder's Greaves"}

	sets.precast.WS['Flat Blade'].Acc = {ammo="Aurgelmir Orb +1",
		head="Hjarrandi Helm",neck="Sanctity Necklace",ear1="Gwati Earring",ear2="Digni. Earring",
		body="Flamma Korazin +2",hands="Flam. Manopolas +2",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
		back="Ground. Mantle +1",waist="Eschan Stone",legs="Flamma Dirs +2",feet="Flam. Gambieras +2"}

	sets.precast.WS['Sanguine Blade'] = {ammo="Dosis Tathlum",
		head="Souveran Schaller",neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Crematio Earring",
		body="Souveran Cuirass",hands="Founder's Gauntlets",ring1="Metamor. Ring +1",ring2="Archon Ring",
		back="Toro Cape",waist="Fotia Belt",legs="Flamma Dirs +2",feet="Founder's Greaves"}

	sets.precast.WS['Sanguine Blade'].Acc = sets.precast.WS['Sanguine Blade']

	sets.precast.WS['Atonement'] = {ammo="Paeapua",
		head="Loess Barbuta +1",neck="Fotia Gorget",ear1="Thrud Earring",ear2="Moonshade Earring",
		body="Souveran Cuirass",hands=gear.odyssean_wsd_hands,ring1="Defending Ring",ring2="Moonlight Ring",
		back=gear.enmity_jse_back,waist="Fotia Belt",legs="Flamma Dirs +2",feet="Eschite Greaves"}

	sets.precast.WS['Atonement'].Acc = sets.precast.WS['Atonement']
	sets.precast.WS['Spirits Within'] = sets.precast.WS['Atonement']
	sets.precast.WS['Spirits Within'].Acc = sets.precast.WS['Atonement']

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Cessance Earring",ear2="Brutal Earring",}
	sets.AccMaxTP = {ear1="Mache Earring +1",ear2="Telos Earring"}

	--------------------------------------
	-- Midcast sets
	--------------------------------------

	sets.midcast.FastRecast = {main="Vampirism",ammo="Paeapua",
		head="Chev. Armet +1",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
		body="Souveran Cuirass",hands="Leyline Gloves",ring1="Defending Ring",ring2="Rahab Ring",
		back=gear.fastcast_jse_back,waist="Tempus Fugit",legs=gear.odyssean_fc_legs,feet=gear.odyssean_fc_feet}
		
	sets.midcast.FastRecast.DT = {main="Vampirism",ammo="Staunch Tathlum",
		head="Souveran Schaller",neck="Loricate Torque +1",ear1="Odnowa Earring",ear2="Tuisto Earring",
		body="Souveran Cuirass",hands="Souv. Handsch. +1",ring1="Gelatinous Ring +1",ring2="Moonlight Ring",
		back="Moonlight Cape",waist="Creed Baudrier",legs="Souv. Diechlings +1",feet="Souveran Schuhs +1"}

	sets.midcast.Flash = set_combine(sets.Enmity, {})
	sets.midcast.Flash.SIRD = set_combine(sets.Enmity.SIRD, {})
	sets.midcast.Stun = set_combine(sets.Enmity, {})
	sets.midcast.Stun.SIRD = set_combine(sets.Enmity.SIRD, {})
	sets.midcast['Blue Magic'] = set_combine(sets.Enmity, {})
	sets.midcast['Blue Magic'].SIRD = set_combine(sets.Enmity.SIRD, {})
	sets.midcast.Cocoon = set_combine(sets.Enmity.SIRD, {})

	sets.midcast.Cure = {main="Deacon Sword",sub="Sacro Bulwark",ammo="Staunch Tathlum",
		head="Loess Barbuta +1",neck="Sacro Gorget",ear1="Odnowa Earring",ear2="Tuisto Earring",
		body="Souveran Cuirass",hands="Macabre Gaunt. +1",ring1="Defending Ring",ring2="Gelatinous Ring +1",
		back="Solemnity Cape",waist="Creed Baudrier",legs="Carmine Cuisses +1",feet=gear.odyssean_fc_feet}
		
	sets.midcast.Cure.SIRD = {main="Deacon Sword",sub="Sacro Bulwark",ammo="Staunch Tathlum",
		head="Souveran Schaller",neck="Loricate Torque +1",ear1="Odnowa Earring",ear2="Tuisto Earring",
		body="Souveran Cuirass",hands="Macabre Gaunt. +1",ring1="Defending Ring",ring2="Gelatinous Ring +1",
		back="Solemnity Cape",waist="Audumbla Sash",legs="Carmine Cuisses +1",feet=gear.odyssean_fc_feet}
		
	sets.midcast.Cure.DT = {main="Deacon Sword",sub="Sacro Bulwark",ammo="Staunch Tathlum",
		head="Souveran Schaller",neck="Loricate Torque +1",ear1="Odnowa Earring",ear2="Tuisto Earring",
		body="Souveran Cuirass",hands="Souv. Handsch. +1",ring1="Defending Ring",ring2="Gelatinous Ring +1",
		back="Moonlight Cape",waist="Creed Baudrier",legs="Souv. Diechlings +1",feet="Souveran Schuhs +1"}
		
	sets.midcast.Reprisal = {ammo="Staunch Tathlum",
		head="Loess Barbuta +1",neck="Unmoving Collar +1",ear1="Odnowa Earring",ear2="Tuisto Earring",
		body="Souveran Cuirass",hands="Souv. Handsch. +1",ring1="Defending Ring",ring2="Gelatinous Ring +1",
		back="Moonlight Cape",waist="Creed Baudrier",legs="Souv. Diechlings +1",feet="Souveran Schuhs +1"}

	sets.Self_Healing = {main="Deacon Sword",sub="Sacro Bulwark",ammo="Staunch Tathlum",
		head="Souveran Schaller",neck="Sacro Gorget",ear1="Odnowa Earring",ear2="Tuisto Earring",
		body="Souv. Cuirass +1",hands="Macabre Gaunt. +1",ring1="Defending Ring",ring2="Gelatinous Ring +1",
		back="Moonlight Cape",waist="Creed Baudrier",legs="Souv. Diechlings +1",feet="Souveran Schuhs +1"}
		
	sets.Self_Healing.SIRD = {main="Deacon Sword",sub="Sacro Bulwark",ammo="Staunch Tathlum",
		head="Souveran Schaller",neck="Loricate Torque +1",ear1="Odnowa Earring",ear2="Tuisto Earring",
		body="Souv. Cuirass +1",hands="Macabre Gaunt. +1",ring1="Defending Ring",ring2="Gelatinous Ring +1",
		back="Solemnity Cape",waist="Flume Belt +1",legs="Carmine Cuisses +1",feet=gear.odyssean_fc_feet}
		
	sets.Self_Healing.DT = {main="Deacon Sword",sub="Sacro Bulwark",ammo="Staunch Tathlum",
		head="Souveran Schaller",neck="Loricate Torque +1",ear1="Odnowa Earring",ear2="Tuisto Earring",
		body="Souveran Cuirass",hands="Souv. Handsch. +1",ring1="Defending Ring",ring2="Gelatinous Ring +1",
		back="Moonlight Cape",waist="Creed Baudrier",legs="Souv. Diechlings +1",feet="Souveran Schuhs +1"}

	sets.Cure_Received = {body="Souveran Cuirass",legs="Souv. Diechlings +1",}
	sets.Self_Refresh = {waist="Gishdubar Sash"}

	sets.midcast['Enhancing Magic'] = {main="Colada",ammo="Staunch Tathlum",
		head="Carmine Mask +1",neck="Incanter's Torque",ear1="Mimir Earring",ear2="Andoaa Earring",
		body="Shab. Cuirass +1",hands="Leyline Gloves",ring1="Defending Ring",ring2="Kishar Ring",
		back="Merciful Cape",waist="Olympus Sash",legs="Carmine Cuisses +1",feet=gear.odyssean_fc_feet}
		
	sets.midcast['Enhancing Magic'].SIRD = {main="Colada",sub="Sacro Bulwark",ammo="Staunch Tathlum",
		head="Souveran Schaller",neck="Incanter's Torque",ear1="Mimir Earring",ear2="Tuisto Earring",
		body="Shab. Cuirass +1",hands="Souv. Handsch. +1",ring1="Defending Ring",ring2="Gelatinous Ring +1",
		back="Merciful Cape",waist="Audumbla Sash",legs="Carmine Cuisses +1",feet=gear.odyssean_fc_feet}

	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {waist="Siegel Sash"})

	sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
	sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})

	sets.midcast.Phalanx = set_combine(sets.midcast['Enhancing Magic'], {main="Deacon Sword",sub="Priwen",hands="Souv. Handsch. +1",back="Weard Mantle",feet="Souveran Schuhs +1"})
	sets.midcast.Phalanx.SIRD = set_combine(sets.midcast['Enhancing Magic'].SIRD, {main="Deacon Sword",sub="Priwen",hands="Souv. Handsch. +1",back="Weard Mantle",feet="Souveran Schuhs +1"})
	sets.midcast.Phalanx.DT = set_combine(sets.midcast.Phalanx.SIRD, {})	

	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------

	sets.resting = {ammo="Homiliary",
		head="Souveran Schaller",neck="Coatl Gorget +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
		body="Souveran Cuirass",hands="Souv. Handsch. +1",ring1="Defending Ring",ring2="Dark Ring",
		back=gear.enmity_jse_back,waist="Fucho-no-obi",legs="Sulevi. Cuisses +1",feet="Cab. Leggings +1"}

	-- Idle sets
	sets.idle = {main="Malignance Sword",sub="Ochain",ammo="Homiliary",
		head="Souveran Schaller",neck="Coatl Gorget +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
		body="Souveran Cuirass",hands="Souv. Handsch. +1",ring1="Defending Ring",ring2="Shadow Ring",
		back=gear.enmity_jse_back,waist="Flume Belt +1",legs="Souv. Diechlings +1",feet="Hippo. Socks +1"}
		
	sets.idle.PDT = {main="Nixxer",sub="Ochain",ammo="Staunch Tathlum",
		head="Loess Barbuta +1",neck="Loricate Torque +1",ear1="Creed Earring",ear2="Thureous Earring",
		body="Souveran Cuirass",hands="Souv. Handsch. +1",ring1="Defending Ring",ring2="Gelatinous Ring +1",
		back=gear.enmity_jse_back,waist="Flume Belt +1",legs="Souv. Diechlings +1",feet="Souveran Schuhs +1"}
		
	sets.idle.MDT = {main="Nixxer",sub="Aegis",ammo="Staunch Tathlum",
		head="Souveran Schaller",neck="Warder's Charm +1",ear1="Etiolation Earring",ear2="Eabani Earring",
		body="Souveran Cuirass",hands="Souv. Handsch. +1",ring1="Defending Ring",ring2="Shadow Ring",
		back=gear.enmity_jse_back,waist="Asklepian Belt",legs="Souv. Diechlings +1",feet="Founder's Greaves"}
		
	sets.idle.Refresh = {main="Malignance Sword",sub="Ochain",ammo="Homiliary",
		head="Souveran Schaller",neck="Coatl Gorget +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
		body="Souveran Cuirass",hands="Souv. Handsch. +1",ring1="Defending Ring",ring2="Dark Ring",
		back=gear.enmity_jse_back,waist="Flume Belt +1",legs="Souv. Diechlings +1",feet="Cab. Leggings +1"}

	sets.idle.Tank = {main="Nixxer",sub="Ochain",ammo="Staunch Tathlum",
		head="Souveran Schaller",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Thureous Earring",
		body="Souveran Cuirass",hands="Souv. Handsch. +1",ring1="Defending Ring",ring2="Gelatinous Ring +1",
		back=gear.enmity_jse_back,waist="Creed Baudrier",legs="Souv. Diechlings +1",feet="Souveran Schuhs +1"}
		
	sets.idle.KiteTank = {main="Nixxer",sub="Ochain",ammo="Staunch Tathlum",
		head="Loess Barbuta +1",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Thureous Earring",
		body="Souveran Cuirass",hands="Souv. Handsch. +1",ring1="Defending Ring",ring2="Gelatinous Ring +1",
		back=gear.enmity_jse_back,waist="Flume Belt +1",legs="Carmine Cuisses +1",feet="Hippo. Socks +1"}
		
	sets.idle.Reraise = {main="Nixxer",sub="Ochain",ammo="Staunch Tathlum",
		head="Twilight Helm",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Thureous Earring",
		body="Twilight Mail",hands="Souv. Handsch. +1",ring1="Defending Ring",ring2="Dark Ring",
		back=gear.enmity_jse_back,waist="Flume Belt +1",legs="Carmine Cuisses +1",feet="Cab. Leggings +1"}
		
	sets.idle.Weak = {main="Nixxer",sub="Ochain",ammo="Staunch Tathlum",
		head="Twilight Helm",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Thureous Earring",
		body="Twilight Mail",hands="Souv. Handsch. +1",ring1="Defending Ring",ring2="Moonlight Ring",
		back=gear.enmity_jse_back,waist="Flume Belt +1",legs="Carmine Cuisses +1",feet="Cab. Leggings +1"}
		
	sets.Kiting = {legs="Carmine Cuisses +1"}

	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.latent_refresh_grip = {sub="Oneiros Grip"}
	sets.latent_regen = {ring1="Apeile Ring +1",ring2="Apeile Ring"}
	sets.DayIdle = {}
	sets.NightIdle = {}

	--------------------------------------
	-- Defense sets
	--------------------------------------

	-- Extra defense sets.  Apply these on top of melee or defense sets.
	sets.Knockback = {}
	sets.MP = {head="Chev. Armet +1",neck="Coatl Gorget +1",ear2="Ethereal Earring",waist="Flume Belt +1",feet="Rev. Leggings +3"}
	sets.passive.AbsorbMP = {head="Chev. Armet +1",neck="Coatl Gorget +1",ear2="Ethereal Earring",waist="Flume Belt +1",feet="Rev. Leggings +3"}
	sets.MP_Knockback = {}
	sets.Twilight = {head="Twilight Helm", body="Twilight Mail"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})

	-- Weapons sets
	sets.weapons.DeaconAegis = {main="Malignance Sword",sub="Aegis"}
	sets.weapons.Savage = {main="Naegling",sub="Blurred Shield +1"}
	sets.weapons.SequenceBlurred = {main="Sequence",sub="Blurred Shield +1"}
	sets.weapons.SequenceAegis = {main="Sequence",sub="Aegis"}
	sets.weapons.DualWeapons = {main="Sequence",sub="Demersal Degen +1"}

	sets.defense.PDT = {main="Nixxer",sub="Ochain",ammo="Staunch Tathlum",
		head="Souveran Schaller",neck="Diemer Gorget",ear1="Creed Earring",ear2="Thureous Earring",
		body="Souveran Cuirass",hands="Souv. Handsch. +1",ring1="Defending Ring",ring2="Gelatinous Ring +1",
		back=gear.enmity_jse_back,waist="Flume Belt +1",legs="Souv. Diechlings +1",feet="Souveran Schuhs +1"}
		
	sets.defense.PDT_HP = {main="Nixxer",sub="Ochain",ammo="Staunch Tathlum",
		head="Souveran Schaller",neck="Loricate Torque +1",ear1="Odnowa Earring",ear2="Tuisto Earring",
		body="Souveran Cuirass",hands="Souv. Handsch. +1",ring1="Defending Ring",ring2="Gelatinous Ring +1",
		back=gear.enmity_jse_back,waist="Creed Baudrier",legs="Souv. Diechlings +1",feet="Souveran Schuhs +1"}
		
	sets.defense.MDT_HP = {main="Malignance Sword",sub="Aegis",ammo="Staunch Tathlum",
		head="Souveran Schaller",neck="Loricate Torque +1",ear1="Odnowa Earring",ear2="Tuisto Earring",
		body="Souveran Cuirass",hands="Souv. Handsch. +1",ring1="Defending Ring",ring2="Gelatinous Ring +1",
		back=gear.enmity_jse_back,waist="Creed Baudrier",legs="Souv. Diechlings +1",feet="Souveran Schuhs +1"}
		
	sets.defense.MEVA_HP = {main="Malignance Sword",sub="Aegis",ammo="Staunch Tathlum",
		head="Souveran Schaller",neck="Loricate Torque +1",ear1="Odnowa Earring",ear2="Tuisto Earring",
		body="Souveran Cuirass",hands="Souv. Handsch. +1",ring1="Defending Ring",ring2="Gelatinous Ring +1",
		back=gear.enmity_jse_back,waist="Creed Baudrier",legs="Souv. Diechlings +1",feet="Souveran Schuhs +1"}
		
	sets.defense.PDT_Reraise = {ammo="Staunch Tathlum",
		head="Twilight Helm",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Thureous Earring",
		body="Twilight Mail",hands="Macabre Gaunt. +1",ring1="Defending Ring",ring2="Gelatinous Ring +1",
		back=gear.enmity_jse_back,waist="Flume Belt +1",legs="Souv. Diechlings +1",feet="Souveran Schuhs +1"}
		
	sets.defense.MDT_Reraise = {main="Malignance Sword",sub="Aegis",ammo="Staunch Tathlum",
		head="Twilight Helm",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Eabani Earring",
		body="Twilight Mail",hands="Souv. Handsch. +1",ring1="Defending Ring",ring2="Gelatinous Ring +1",
		back="Engulfer Cape +1",waist="Flume Belt +1",legs="Souv. Diechlings +1",feet="Souveran Schuhs +1"}

	sets.defense.BDT = {main="Malignance Sword",sub="Aegis",ammo="Staunch Tathlum",
		head="Loess Barbuta +1",neck="Warder's Charm +1",ear1="Odnowa Earring",ear2="Eabani Earring",
		body="Souveran Cuirass",hands="Sulev. Gauntlets +1",ring1="Defending Ring",ring2="Shadow Ring",
		back=gear.enmity_jse_back,waist="Asklepian Belt",legs="Sulevi. Cuisses +1",feet="Amm Greaves"}
		
	sets.defense.Tank = {ammo="Staunch Tathlum",
		head="Souveran Schaller",neck="Loricate Torque +1",ear1="Creed Earring",ear2="Thureous Earring",
		body="Souveran Cuirass",hands="Souv. Handsch. +1",ring1="Defending Ring",ring2="Gelatinous Ring +1",
		back=gear.enmity_jse_back,waist="Asklepian Belt",legs="Souv. Diechlings +1",feet="Souveran Schuhs +1"}
		
	sets.defense.MEVA = {main="Malignance Sword",sub="Aegis",ammo="Staunch Tathlum",
		head="Founder's Corona",neck="Warder's Charm +1",ear1="Etiolation Earring",ear2="Eabani Earring",
		body="Souveran Cuirass",hands="Leyline Gloves",ring1="Vengeful Ring",ring2="Purity Ring",
		back=gear.enmity_jse_back,waist="Asklepian Belt",legs="Souv. Diechlings +1",feet="Hippo. Socks +1"}
		
	sets.defense.Death = {ammo="Staunch Tathlum",
		head="Carmine Mask +1",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Eabani Earring",
		body="Souveran Cuirass",hands="Leyline Gloves",ring1="Warden's Ring",ring2="Shadow Ring",
		back=gear.enmity_jse_back,waist="Asklepian Belt",legs="Souv. Diechlings +1",feet="Souveran Schuhs +1"}
		
	sets.defense.Charm = {ammo="Staunch Tathlum",
		head="Carmine Mask +1",neck="Unmoving Collar +1",ear1="Etiolation Earring",ear2="Eabani Earring",
		body="Souveran Cuirass",hands="Leyline Gloves",ring1="Vengeful Ring",ring2="Purity Ring",
		back=gear.enmity_jse_back,waist="Asklepian Belt",legs="Souv. Diechlings +1",feet="Souveran Schuhs +1"}

	sets.defense.Terror = {ammo="Staunch Tathlum",
		head="Carmine Mask +1",neck="Warder's Charm +1",ear1="Etiolation Earring",ear2="Eabani Earring",
		body="Souveran Cuirass",hands="Leyline Gloves",ring1="Vengeful Ring",ring2="Purity Ring",
		back=gear.enmity_jse_back,waist="Asklepian Belt",legs="Souv. Diechlings +1",feet="Founder's Greaves"}
		
		-- To cap MDT with Shell IV (52/256), need 76/256 in gear.
	-- Shellra V can provide 75/256, which would need another 53/256 in gear.
	sets.defense.OchainMDT = {sub="Ochain",ammo="Staunch Tathlum",
		head="Founder's Corona",neck="Warder's Charm +1",ear1="Odnowa Earring",ear2="Eabani Earring",
		body="Souveran Cuirass",hands="Souv. Handsch. +1",ring1="Defending Ring",ring2="Shadow Ring",
		back="Engulfer Cape +1",waist="Creed Baudrier",legs="Chev. Cuisses +1",feet="Chev. Sabatons +1"}
		
	sets.defense.OchainNoShellMDT = {sub="Ochain",ammo="Staunch Tathlum",
		head="Founder's Corona",neck="Warder's Charm +1",ear1="Odnowa Earring",ear2="Eabani Earring",
		body="Souveran Cuirass",hands="Souv. Handsch. +1",ring1="Defending Ring",ring2="Shadow Ring",
		back="Engulfer Cape +1",waist="Flax Sash",legs="Sulevi. Cuisses +1",feet="Chev. Sabatons +1"}
		
	sets.defense.AegisMDT = {sub="Aegis",ammo="Staunch Tathlum",
		head="Founder's Corona",neck="Warder's Charm +1",ear1="Odnowa Earring",ear2="Eabani Earring",
		body="Souveran Cuirass",hands="Leyline Gloves",ring1="Defending Ring",ring2="Shadow Ring",
		back=gear.enmity_jse_back,waist="Asklepian Belt",legs="Souv. Diechlings +1",feet=gear.odyssean_fc_feet}
		
	sets.defense.AegisNoShellMDT = {sub="Aegis",ammo="Staunch Tathlum",
		head="Founder's Corona",neck="Warder's Charm +1",ear1="Odnowa Earring",ear2="Eabani Earring",
		body="Souveran Cuirass",hands="Souv. Handsch. +1",ring1="Defending Ring",ring2="Shadow Ring",
		back=gear.enmity_jse_back,waist="Asklepian Belt",legs="Sulevi. Cuisses +1",feet="Amm Greaves"}		

	--------------------------------------
	-- Engaged sets
	--------------------------------------

	sets.engaged = {main="Nixxer",sub="Ochain",ammo="Aurgelmir Orb +1",
		head="Hjarrandi Helm",neck="Lissome Necklace",ear1="Cessance Earring",ear2="Brutal Earring",
		body="Flamma Korazin +2",hands="Sulev. Gauntlets +1",ring1="Flamma Ring",ring2="Petrov Ring",
		back="Bleating Mantle",waist="Sailfi Belt +1",legs="Sulevi. Cuisses +1",feet="Flam. Gambieras +2"}

	sets.engaged.Acc = {main="Nixxer",sub="Ochain",ammo="Hasty Pinion +1",
		head="Hjarrandi Helm",neck="Combatant's Torque",ear1="Mache Earring +1",ear2="Telos Earring",
		body="Flamma Korazin +2",hands="Sulev. Gauntlets +1",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
		back="Ground. Mantle +1",waist="Sailfi Belt +1",legs="Carmine Cuisses +1",feet="Flam. Gambieras +2"}

	sets.engaged.DW = {ammo="Paeapua",
		head="Hjarrandi Helm",neck="Lissome Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
		body="Flamma Korazin +2",hands="Sulev. Gauntlets +1",ring1="Flamma Ring",ring2="Petrov Ring",
		back="Bleating Mantle",waist="Sailfi Belt +1",legs="Carmine Cuisses +1",feet="Flam. Gambieras +2"}

	sets.engaged.DW.Acc = {ammo="Aurgelmir Orb +1",
		head="Hjarrandi Helm",neck="Lissome Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
		body="Flamma Korazin +2",hands="Sulev. Gauntlets +1",ring1="Flamma Ring",ring2="Ramuh Ring +1",
		back="Letalis Mantle",waist="Sailfi Belt +1",legs="Carmine Cuisses +1",feet="Flam. Gambieras +2"}

	sets.engaged.Tank = {main="Nixxer",sub="Ochain",ammo="Staunch Tathlum",
		head="Chev. Armet +1",neck="Loricate Torque +1",ear1="Odnowa Earring",ear2="Thureous Earring",
		body="Souveran Cuirass",hands="Souv. Handsch. +1",ring1="Defending Ring",ring2="Gelatinous Ring +1",
		back=gear.enmity_jse_back,waist="Flume Belt +1",legs="Chev. Cuisses +1",feet="Souveran Schuhs +1"}
		
	sets.engaged.Dawn = {main="Nixxer",sub="Ochain",ammo="Staunch Tathlum",
		head="Souveran Schaller",neck="Loricate Torque +1",ear1="Telos Earring",ear2="Ethereal Earring",
		body="Souveran Cuirass",hands="Souv. Handsch. +1",ring1="Defending Ring",ring2="Shadow Ring",
		back="Moonlight Cape",waist="Tempus Fugit",legs="Souv. Diechlings +1",feet="Rev. Leggings +3"}
		
	sets.engaged.BreathTank = {main="Nixxer",sub="Ochain",ammo="Staunch Tathlum",
		head="Loess Barbuta +1",neck="Loricate Torque +1",ear1="Thureous Earring",ear2="Etiolation Earring",
		body="Souveran Cuirass",hands="Sulev. Gauntlets +1",ring1="Defending Ring",ring2="Shadow Ring",
		back=gear.enmity_jse_back,waist="Creed Baudrier",legs="Sulevi. Cuisses +1",feet="Amm Greaves"}
		
	sets.engaged.DDTank = {ammo="Hasty Pinion +1",
		head="Hjarrandi Helm",neck="Loricate Torque +1",ear1="Brutal Earring",ear2="Cessance Earring",
		body="Sulevia's Plate. +1",hands="Sulev. Gauntlets +1",ring1="Defending Ring",ring2="Patricius Ring",
		back="Weard Mantle",waist="Tempus Fugit",legs="Sulevi. Cuisses +1",feet="Sulev. Leggings +2"}
		
	sets.engaged.Acc.DDTank = {ammo="Hasty Pinion +1",
		head="Hjarrandi Helm",neck="Loricate Torque +1",ear1="Mache Earring +1",ear2="Telos Earring",
		body="Sulevia's Plate. +1",hands="Sulev. Gauntlets +1",ring1="Defending Ring",ring2="Patricius Ring",
		back="Weard Mantle",waist="Tempus Fugit",legs="Sulevi. Cuisses +1",feet="Sulev. Leggings +2"}
		
	sets.engaged.NoShellTank = {main="Nixxer",sub="Ochain",ammo="Staunch Tathlum",
		head="Souveran Schaller",neck="Loricate Torque +1",ear1="Thureous Earring",ear2="Etiolation Earring",
		body="Souveran Cuirass",hands="Sulev. Gauntlets +1",ring1="Defending Ring",ring2="Moonlight Ring",
		back="Moonlight Cape",waist="Flume Belt +1",legs=gear.odyssean_fc_legs,feet="Cab. Leggings +1"}
		
	sets.engaged.Reraise = set_combine(sets.engaged.Tank, sets.Reraise)
	sets.engaged.Acc.Reraise = set_combine(sets.engaged.Acc.Tank, sets.Reraise)
		
	--------------------------------------
	-- Custom buff sets
	--------------------------------------
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {neck="Vim Torque +1"}
	sets.buff.Cover = {body="Cab. Surcoat +1"}
end

function user_job_lockstyle()
	windower.chat.input('/lockstyleset 005')
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	-- Default macro set/book
	if player.sub_job == 'NIN' then
		set_macro_page(1, 6)
	elseif player.sub_job == 'RUN' then
		set_macro_page(1, 6)
	elseif player.sub_job == 'RDM' then
		set_macro_page(1, 6)
	elseif player.sub_job == 'BLU' then
		set_macro_page(1, 6)
	elseif player.sub_job == 'DNC' then
		set_macro_page(1, 6)
	else
		set_macro_page(1, 6) --War/Etc
	end
end

buff_spell_lists = {
	Auto = {	
		{Name='Crusade',Buff='Enmity Boost',SpellID=476,When='Always'},
		{Name='Reprisal',Buff='Reprisal',SpellID=97,When='Always'},
		{Name='Phalanx',Buff='Phalanx',SpellID=106,When='Always'},
	},
	
	Default = {
		{Name='Crusade',Buff='Enmity Boost',SpellID=476,Reapply=false},
		{Name='Reprisal',Buff='Reprisal',SpellID=97,Reapply=false},
		{Name='Haste',Buff='Haste',SpellID=57,Reapply=false},
		{Name='Refresh',Buff='Refresh',SpellID=109,Reapply=false},
		{Name='Aquaveil',Buff='Aquaveil',SpellID=55,Reapply=false},
		{Name='Stoneskin',Buff='Stoneskin',SpellID=54,Reapply=false},
		{Name='Blink',Buff='Blink',SpellID=53,Reapply=false},
		{Name='Regen',Buff='Regen',SpellID=108,Reapply=false},
		{Name='Phalanx',Buff='Phalanx',SpellID=106,Reapply=false},
	},
}
