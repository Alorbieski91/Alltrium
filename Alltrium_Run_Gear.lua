function user_job_setup()

	state.OffenseMode:options('Normal','SomeAcc','Acc','HighAcc','FullAcc')
	state.HybridMode:options('Normal','DTLite','Tank')
	state.WeaponskillMode:options('Match','Normal','SomeAcc','Acc','HighAcc','FullAcc')
	state.CastingMode:options('Normal','SIRD')
	state.PhysicalDefenseMode:options('PDT_HP','PDT')
	state.MagicalDefenseMode:options('MDT_HP','BDT_HP','MDT','BDT')
	state.ResistDefenseMode:options('MEVA_HP','MEVA','Death','Charm','DTCharm')
	state.IdleMode:options('Normal','Tank','KiteTank','Sphere')
	state.Weapons:options('None','Aettir','DualWeapons','Montante')
	
	state.ExtraDefenseMode = M{['description']='Extra Defense Mode','None','MP'}

	gear.enmity_jse_back = {name="Ogma's cape",augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Damage taken-5%',}}
	gear.stp_jse_back = {name="Ogma's cape",augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10',}}
	gear.da_jse_back = {name="Ogma's cape",augments={'STR+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}}

	autows = 'Savage Blade'
	autowstp = 1000

	-- Additional local binds
	send_command('bind !` gs c SubJobEnmity')
	send_command('bind @` gs c cycle RuneElement')
	send_command('bind ^` gs c RuneElement')
	send_command('bind @pause gs c toggle AutoRuneMode')
	send_command('bind ^delete input /ja "Provoke" <stnpc>')
	send_command('bind !delete input /ma "Cure IV" <stal>')
	send_command('bind @delete input /ma "Flash" <stnpc>')
	send_command('bind ^\\\\ input /ma "Protect IV" <t>')
	send_command('bind @\\\\ input /ma "Shell V" <t>')
	send_command('bind !\\\\ input /ma "Crusade" <me>')
	send_command('bind ^backspace input /ja "Lunge" <t>')
	send_command('bind @backspace input /ja "Gambit" <t>')
	send_command('bind !backspace input /ja "Rayke" <t>')
	send_command('bind @f8 gs c toggle AutoTankMode')
	send_command('bind @f10 gs c toggle TankAutoDefense')
	send_command('bind ^@!` gs c cycle SkillchainMode')
	send_command('bind !r gs c weapons Aettir;gs c update')
	
	select_default_macro_book()
end

function init_gear_sets()

	sets.Enmity = {main="Aettir",sub="Refined Grip +1",ammo="Staunch Tathlum",
		head="Halitus Helm",neck="Unmoving Collar +1",ear1="Friomisi Earring",ear2="Trux Earring",
		body="Emet Harness +1",hands="Kurys Gloves",ring1="Petrov Ring",ring2="Begrudging Ring",
		back=gear.enmity_jse_back,waist="Warwolf Belt",legs="Eri. Leg Guards +1",feet="Erilaz Greaves +1"}

	sets.Enmity.SIRD = {main="Aettir",sub="Refined Grip +1",ammo="Staunch Tathlum",
		head="Halitus Helm",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Trux Earring",
		body="Emet Harness +1",hands=gear.herculean_refresh_hands,ring1="Moonbeam Ring",ring2="Defending Ring",
		back=gear.enmity_jse_back,waist="Audumbla Sash",legs="Carmine Cuisses +1",feet="Erilaz Greaves +1"}

	sets.Enmity.SIRDT = {main="Aettir",sub="Refined Grip +1",ammo="Staunch Tathlum",
		head="Halitus Helm",neck="Loricate Torque +1",ear1="Odnowa Earring",ear2="Tuisto Earring",
		body="Runeist Coat +1",hands=gear.herculean_refresh_hands,ring1="Gelatinous Ring +1",ring2="Moonlight Ring",
		back=gear.enmity_jse_back,waist="Audumbla Sash",legs="Carmine Cuisses +1",feet="Erilaz Greaves +1"}

	sets.Enmity.DT = {main="Aettir",sub="Refined Grip +1",ammo="Staunch Tathlum",
		head="Halitus Helm",neck="Loricate Torque +1",ear1="Odnowa Earring",ear2="Tuisto Earring",
		body="Runeist Coat +1",hands=gear.herculean_refresh_hands,ring1="Gelatinous Ring +1",ring2="Moonlight Ring",
		back=gear.enmity_jse_back,waist="Flume Belt +1",legs="Eri. Leg Guards +1",feet="Erilaz Greaves +1"}

	--------------------------------------
	-- Precast sets
	--------------------------------------

	-- Item sets.

	-- Precast sets to enhance JAs
	sets.precast.JA['Vallation'] = set_combine(sets.Enmity,{body="Runeist Coat +1",legs="Futhark Trousers +1"})
	sets.precast.JA['Valiance'] = sets.precast.JA['Vallation']
	sets.precast.JA['Pflug'] = set_combine(sets.Enmity,{feet="Runeist Boots"})
	sets.precast.JA['Battuta'] = set_combine(sets.Enmity,{head="Futhark Bandeau +1"})
	sets.precast.JA['Liement'] = set_combine(sets.Enmity,{body="Futhark Coat +1"})
	sets.precast.JA['Gambit'] = set_combine(sets.Enmity,{hands="Runeist Mitons +1"})
	sets.precast.JA['Rayke'] = set_combine(sets.Enmity,{feet="Futhark Boots"})
	sets.precast.JA['Elemental Sforzo'] = set_combine(sets.Enmity,{body="Futhark Coat +1"})
	sets.precast.JA['Swordplay'] = set_combine(sets.Enmity,{hands="Futhark Mitons +1"})
	sets.precast.JA['Embolden'] = set_combine(sets.Enmity,{})
	sets.precast.JA['One For All'] = set_combine(sets.Enmity,{})
	sets.precast.JA['Provoke'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Warcry'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Defender'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Berserk'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Last Resort'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Aggressor'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Animated Flourish'] = set_combine(sets.Enmity, {})

	sets.precast.JA['Vallation'].DT = set_combine(sets.Enmity.DT,{body="Runeist Coat +1", legs="Futhark Trousers +1"})
	sets.precast.JA['Valiance'].DT = sets.precast.JA['Vallation'].DT
	sets.precast.JA['Pflug'].DT = set_combine(sets.Enmity.DT,{feet="Runeist's Boots"})
	sets.precast.JA['Battuta'].DT = set_combine(sets.Enmity.DT,{head="Futhark Bandeau +1"})
	sets.precast.JA['Liement'].DT = set_combine(sets.Enmity.DT,{body="Futhark Coat +1"})
	sets.precast.JA['Gambit'].DT = set_combine(sets.Enmity.DT,{hands="Runeist Mitons +1"})
	sets.precast.JA['Rayke'].DT = set_combine(sets.Enmity.DT,{feet="Futhark Boots"})
	sets.precast.JA['Elemental Sforzo'].DT = set_combine(sets.Enmity.DT,{body="Futhark Coat +1"})
	sets.precast.JA['Swordplay'].DT = set_combine(sets.Enmity.DT,{hands="Futhark Mitons +1"})
	sets.precast.JA['Embolden'].DT = set_combine(sets.Enmity.DT,{})
	sets.precast.JA['One For All'].DT = set_combine(sets.Enmity.DT,{})
	sets.precast.JA['Provoke'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Warcry'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Defender'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Berserk'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Last Resort'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Aggressor'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Animated Flourish'].DT = set_combine(sets.Enmity.DT, {})

	sets.precast.JA['Lunge'] = {ammo="Seeth. Bomblet +1",
		head=gear.herculean_nuke_head,neck="Baetyl Pendant",ear1="Friomisi Earring",ear2="Crematio Earring",
		body="Samnuha Coat",hands="Carmine Fin. Ga. +1",ring1="Metamor. Ring +1",ring2="Shiva Ring +1",
		back="Toro Cape",waist="Eschan Stone",legs=gear.herculean_nuke_legs,feet=gear.herculean_nuke_feet}

	sets.precast.JA['Swipe'] = sets.precast.JA['Lunge']

	-- Gear for specific elemental nukes.
	sets.element.Dark = {head="Pixie Hairpin +1",ring2="Archon Ring"}

	-- Pulse sets, different stats for different rune modes, stat aligned.
	sets.precast.JA['Vivacious Pulse'] = {head="Erilaz Galea +1",neck="Incanter's Torque",ring1="Stikini Ring",ring2="Stikini Ring",legs="Rune. Trousers +1"}
	sets.precast.JA['Vivacious Pulse']['Ignis'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Gelus'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Flabra'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Tellus'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Sulpor'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Unda'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Lux'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Tenebrae'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})


	-- Waltz set (chr and vit)
	sets.precast.Waltz = {ammo="Yamarang",
		head="Carmine Mask +1",neck="Unmoving Collar +1",ear1="Enchntr. Earring +1",ear2="Handler's Earring +1",
		body=gear.herculean_waltz_body,hands=gear.herculean_waltz_hands,ring1="Defending Ring",ring2="Valseur's Ring",
		back=gear.enmity_jse_back,waist="Chaac Belt",legs="Dashing Subligar",feet=gear.herculean_waltz_feet}

	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}

	sets.precast.Step = {}

	sets.precast.JA['Violent Flourish'] = {}

	-- Fast cast sets for spells
	sets.precast.FC = {main="Malignance Sword",sub="Chanter's Shield",ammo="Impatiens",
		head="Rune. Bandeau +1",neck="Voltsurge Torque",ear1="Etiolation Earring",ear2="Loquac. Earring",
		body="Adhemar Jacket",hands="Leyline Gloves",ring1="Rahab Ring",ring2="Kishar Ring",
		back=gear.enmity_jse_back,waist="Audumbla Sash",legs="Rawhide Trousers",feet="Carmine Greaves"}
	
	sets.precast.FC.DT = {main="Malignance Sword",sub="Chanter's Shield",ammo="Impatiens",
		head="Rune. Bandeau +1",neck="Loricate Torque +1",ear1="Odnowa Earring",ear2="Tuisto Earring",
		body="Runeist Coat +1",hands="Leyline Gloves",ring1="Gelatinous Ring +1",ring2="Moonlight Ring",
		back=gear.enmity_jse_back,waist="Audumbla Sash",legs="Eri. Leg Guards +1",feet="Carmine Greaves"}

	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash", legs="Futhark Trousers +1"})
	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck='Magoraga Beads'})
	sets.precast.FC.Cure = set_combine(sets.precast.FC, {})

	-- Weaponskill sets
	sets.precast.WS = {ammo="Knobkierrie",
		head="Meghanada Visor +2",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Mache Earring +1",
		body="Adhemar Jacket +1",hands="Meg. Gloves +2",ring1="Petrov Ring",ring2="Karieyh Ring",
		back=gear.da_jse_back,waist="Fotia Belt",legs=gear.herculean_wsd_legs,feet=gear.herculean_ta_feet}
	sets.precast.WS.SomeAcc = {ammo="Voluspa Tathlum",
		head="Adhemar Bonnet +1",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Mache Earring +1",
		body="Ayanmo Corazza +2",hands="Meg. Gloves +2",ring1="Petrov Ring",ring2="Karieyh Ring",
		back=gear.da_jse_back,waist="Fotia Belt",legs="Meg. Chausses +2",feet=gear.herculean_ta_feet}
	sets.precast.WS.Acc = {ammo="Falcon Eye",
		head="Dampening Tam",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Mache Earring +1",
		body="Ayanmo Corazza +2",hands="Meg. Gloves +2",ring1="Petrov Ring",ring2="Karieyh Ring",
		back=gear.da_jse_back,waist="Fotia Belt",legs="Meg. Chausses +2",feet=gear.herculean_ta_feet}
	sets.precast.WS.HighAcc = {ammo="Falcon Eye",
		head="Meghanada Visor +2",neck="Fotia Gorget",ear1="Cessance Earring",ear2="Mache Earring +1",
		body="Ayanmo Corazza +2",hands="Meg. Gloves +2",ring1="Petrov Ring",ring2="Karieyh Ring",
		back=gear.da_jse_back,waist="Fotia Belt",legs="Meg. Chausses +2",feet=gear.herculean_acc_feet}
	sets.precast.WS.FullAcc = {ammo="Falcon Eye",
		head="Carmine Mask +1",neck="Lissome Necklace",ear1="Cessance Earring",ear2="Mache Earring +1",
		body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
		back=gear.stp_jse_back,waist="Fotia Belt",legs="Meg. Chausses +2",feet=gear.herculean_acc_feet}

	sets.precast.WS['Resolution'] = set_combine(sets.precast.WS,{})
	sets.precast.WS['Resolution'].Acc = set_combine(sets.precast.WS.Acc,{})
	sets.precast.WS['Resolution'].HighAcc = set_combine(sets.precast.WS.HighAcc,{})
	sets.precast.WS['Resolution'].FullAcc = set_combine(sets.precast.WS.FullAcc,{})

	sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS,{head=gear.herculean_wsd_head,body="Meg. Cuirie +2",feet="Meg. Jam. +2",right_ear="Ishvara Earring",ring1="Shukuyu Ring",ring2="Rufescent Ring",})
	sets.precast.WS['Savage Blade'].Acc = set_combine(sets.precast.WS.Acc,{})
	sets.precast.WS['Savage Blade'].HighAcc = set_combine(sets.precast.WS.HighAcc,{})
	sets.precast.WS['Savage Blade'].FullAcc = set_combine(sets.precast.WS.FullAcc,{})

	sets.precast.WS['Dimidiation'] = set_combine(sets.precast.WS,{legs=gear.herculean_wsd_legs,feet=gear.herculean_wsd_feet})
	sets.precast.WS['Dimidiation'].Acc = set_combine(sets.precast.WS.Acc,{head="Lilitu Headpiece",legs=gear.herculean_wsd_legs,feet=gear.herculean_wsd_feet})
	sets.precast.WS['Dimidiation'].HighAcc = set_combine(sets.precast.WS.HighAcc,{legs=gear.herculean_wsd_legs,feet=gear.herculean_wsd_feet})
	sets.precast.WS['Dimidiation'].FullAcc = set_combine(sets.precast.WS.FullAcc,{})

	sets.precast.WS['Ground Strike'] = set_combine(sets.precast.WS,{})
	sets.precast.WS['Ground Strike'].Acc = set_combine(sets.precast.WS.Acc,{})
	sets.precast.WS['Ground Strike'].HighAcc = set_combine(sets.precast.WS.HighAcc,{})
	sets.precast.WS['Ground Strike'].FullAcc = set_combine(sets.precast.WS.FullAcc,{})

	sets.precast.WS['Herculean Slash'] = set_combine(sets.precast['Lunge'], {})
	sets.precast.WS['Sanguine Blade'] = set_combine(sets.precast['Lunge'], {})

	--------------------------------------
	-- Midcast sets
	--------------------------------------

	sets.midcast.FastRecast = {ammo="Impatiens",
		head="Carmine Mask +1",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
		body="Dread Jupon",hands="Leyline Gloves",ring1="Lebeche Ring",ring2="Kishar Ring",
		back=gear.enmity_jse_back,waist="Flume Belt +1",legs="Rawhide Trousers",feet="Carmine Greaves"}

	sets.midcast.FastRecast.DT = {ammo="Staunch Tathlum",
		head="Fu. Bandeau +1",neck="Loricate Torque +1",ear1="Odnowa Earring",ear2="Tuisto Earring",
		body="Runeist Coat +1",hands=gear.herculean_refresh_hands,ring1="Gelatinous Ring +1",ring2="Moonlight Ring",
		back=gear.enmity_jse_back,waist="Flume Belt +1",legs="Eri. Leg Guards +1",feet="Erilaz Greaves +1"}

	sets.midcast.FastRecast.SIRD = {ammo="Staunch Tathlum",
		head="Fu. Bandeau +1",neck="Loricate Torque +1",ear1="Odnowa Earring",ear2="Tuisto Earring",
		body="Runeist Coat +1",hands=gear.herculean_refresh_hands,ring1="Gelatinous Ring +1",ring2="Moonlight Ring",
		back=gear.enmity_jse_back,waist="Flume Belt +1",legs="Eri. Leg Guards +1",feet="Erilaz Greaves +1"}

	sets.midcast['Enhancing Magic'] = set_combine(sets.midcast.FastRecast,{main="Pukulatmuj +1",head="Erilaz Galea +1",neck="Incanter's Torque",ear1="Andoaa Earring",ear2="Mimir Earring",hands="Runeist's Mitons +1",back="Merciful Cape",waist="Olympus Sash",legs="Futhark Trousers +1"})
	sets.midcast['Phalanx'] = set_combine(sets.midcast['Enhancing Magic'],{main="Deacon Sword",head="Futhark Bandeau +1",hands=gear.herculean_refresh_hands,legs="Carmine Cuisses +1",feet=gear.herculean_nuke_feet})
	sets.midcast['Regen'] = set_combine(sets.midcast['Enhancing Magic'],{head="Rune. Bandeau +1",neck="Sacro Gorget"}) 
	sets.midcast['Refresh'] = set_combine(sets.midcast['Enhancing Magic'],{head="Erilaz Galea +1"}) 
	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {ear2="Earthcry Earring",waist="Siegel Sash"})
	sets.midcast.Flash = set_combine(sets.Enmity, {})
	sets.midcast.Flash.DT = set_combine(sets.Enmity.DT, {})
	sets.midcast.Foil = set_combine(sets.Enmity, {})
	sets.midcast.Foil.DT = set_combine(sets.Enmity.DT, {})
	sets.midcast.Stun = set_combine(sets.Enmity, {})
	sets.midcast.Stun.DT = set_combine(sets.Enmity.DT, {})
	sets.midcast.Jettatura = set_combine(sets.Enmity, {})
	sets.midcast.Jettatura.DT = set_combine(sets.Enmity.DT, {})
	sets.midcast['Blue Magic'] = set_combine(sets.Enmity, {})
	sets.midcast['Blue Magic'].DT = set_combine(sets.Enmity.SIRDT, {})
	sets.midcast['Blue Magic'].SIRD = set_combine(sets.Enmity.SIRD, {})

	sets.midcast.Cure = {ammo="Staunch Tathlum",
		head="Carmine Mask +1",neck="Sacro Gorget",ear1="Mendi. Earring",ear2="Roundel Earring",
		body="Vrikodara Jupon",hands="Buremte Gloves",ring1="Lebeche Ring",ring2="Janniston Ring",
		back="Tempered Cape +1",waist="Luminary Sash",legs="Carmine Cuisses +1",feet="Skaoi Boots"}
		
	sets.midcast['Wild Carrot'] = set_combine(sets.midcast.Cure, {})

	sets.Self_Healing = {hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {waist="Gishdubar Sash"}
	sets.Phalanx_Received = {main="Deacon Sword",hands=gear.herculean_refresh_hands,feet=gear.herculean_nuke_feet}

	sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
	sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})

	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------

	sets.resting = {}

	sets.idle = {
		main="Aettir",sub="Refined Grip +1",ammo="Homiliary",
		head="Rawhide Mask",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
		body="Runeist Coat +1",hands=gear.herculean_refresh_hands,ring1="Gelatinous Ring +1",ring2="Defending Ring",
		back=gear.enmity_jse_back,waist="Flume Belt +1",legs=gear.herculean_refresh_legs,feet=gear.herculean_refresh_feet}

	sets.idle.Sphere = set_combine(sets.idle,{body="Mekosu. Harness"})

	sets.idle.Tank = {
		main="Aettir",sub="Refined Grip +1",ammo="Staunch Tathlum",
		head="Fu. Bandeau +1",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
		body="Runeist Coat +1",hands=gear.herculean_refresh_hands,ring1="Gelatinous Ring +1",ring2="Defending Ring",
		back="Shadow Mantle",waist="Flume Belt +1",legs="Eri. Leg Guards +1",feet="Erilaz Greaves +1"}

	sets.idle.KiteTank = {
		main="Aettir",sub="Refined Grip +1",ammo="Staunch Tathlum",
		head="Fu. Bandeau +1",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
		body="Futhark Coat +1",hands=gear.herculean_refresh_hands,ring1="Gelatinous Ring +1",ring2="Defending Ring",
		back=gear.enmity_jse_back,waist="Flume Belt +1",legs="Carmine Cuisses +1",feet="Hippo. Socks +1"}

	sets.idle.Weak = {
		main="Aettir",sub="Refined Grip +1",ammo="Homiliary",
		head="Rawhide Mask",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
		body="Runeist Coat +1",hands=gear.herculean_refresh_hands,ring1="Gelatinous Ring +1",ring2="Defending Ring",
		back=gear.enmity_jse_back,waist="Flume Belt +1",legs=gear.herculean_refresh_legs,feet="Erilaz Greaves +1"}

	sets.Kiting = {legs="Carmine Cuisses +1"}

	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.latent_refresh_grip = {sub="Oneiros Grip"}
	sets.DayIdle = {}
	sets.NightIdle = {}

	-- Extra defense sets.  Apply these on top of melee or defense sets.
	sets.Knockback = {}
	sets.MP = {ear2="Ethereal Earring",waist="Flume Belt +1"} --body="Erilaz Surcoat +1",
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})

	-- Weapons sets
	sets.weapons.Aettir = {main="Aettir",sub="Refined Grip +1"}
	sets.weapons.Montante = {main="Montante +1",sub="Refined Grip +1"}
	sets.weapons.DualWeapons = {main="Naegling",sub="Malignance Sword"}

	-- Defense Sets
	
	sets.defense.PDT = {main="Aettir",sub="Refined Grip +1",ammo="Staunch Tathlum",
		head="Meghanada Visor +2",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
		body="Futhark Coat +1",hands=gear.herculean_refresh_hands,ring1="Gelatinous Ring +1",ring2="Defending Ring", --ring2="Moonlight Ring",
		back="Shadow Mantle",waist="Flume Belt +1",legs="Eri. Leg Guards +1",feet="Erilaz Greaves +1"}
	sets.defense.PDT_HP = {main="Aettir",sub="Refined Grip +1",ammo="Staunch Tathlum",
		head="Fu. Bandeau +1",neck="Loricate Torque +1",ear1="Odnowa Earring",ear2="Tuisto Earring",
		body="Runeist Coat +1",hands=gear.herculean_refresh_hands,ring1="Gelatinous Ring +1",ring2="Defending Ring", --ring2="Moonlight Ring",
		back=gear.enmity_jse_back,waist="Flume Belt +1",legs="Eri. Leg Guards +1",feet="Erilaz Greaves +1"}
	sets.defense.MDT = {main="Aettir",sub="Refined Grip +1",ammo="Staunch Tathlum",
		head="Erilaz Galea +1",neck="Warder's Charm +1",ear1="Odnowa Earring",ear2="Sanare Earring",
		body="Runeist Coat +1",hands=gear.herculean_refresh_hands,ring1="Shadow Ring",ring2="Defending Ring",
		back=gear.enmity_jse_back,waist="Engraved Belt",legs=gear.herculean_dt_legs,feet="Erilaz Greaves +1"}
	sets.defense.MDT_HP = {main="Aettir",sub="Refined Grip +1",ammo="Staunch Tathlum",
		head="Erilaz Galea +1",neck="Loricate Torque +1",ear1="Odnowa Earring",ear2="Tuisto Earring",
		body="Runeist Coat +1",hands=gear.herculean_refresh_hands,ring1="Gelatinous Ring +1",ring2="Defending Ring", --ring2="Moonlight Ring",
		back=gear.enmity_jse_back,waist="Engraved Belt",legs="Eri. Leg Guards +1",feet="Erilaz Greaves +1"}

	sets.defense.BDT = {main="Aettir",sub="Refined Grip +1",ammo="Staunch Tathlum",
		head="Erilaz Galea +1",neck="Warder's Charm +1",ear1="Odnowa Earring",ear2="Sanare Earring",
		body="Runeist Coat +1",hands=gear.herculean_refresh_hands,ring1="Shadow Ring",ring2="Defending Ring",
		back=gear.enmity_jse_back,waist="Engraved Belt",legs=gear.herculean_dt_legs,feet="Erilaz Greaves +1"}
	sets.defense.BDT_HP = {main="Aettir",sub="Refined Grip +1",ammo="Staunch Tathlum",
		head="Erilaz Galea +1",neck="Loricate Torque +1",ear1="Odnowa Earring",ear2="Tuisto Earring",
		body="Runeist Coat +1",hands=gear.herculean_refresh_hands,ring1="Gelatinous Ring +1",ring2="Defending Ring", --ring2="Moonlight Ring",
		back=gear.enmity_jse_back,waist="Engraved Belt",legs="Eri. Leg Guards +1",feet="Erilaz Greaves +1"}

	sets.defense.MEVA = {main="Aettir",sub="Refined Grip +1",ammo="Staunch Tathlum",
		head="Erilaz Galea +1",neck="Warder's Charm +1",ear1="Odnowa Earring",ear2="Sanare Earring",
		body="Runeist Coat +1",hands="Erilaz Gauntlets +1",ring1="Purity Ring",ring2="Vengeful Ring",
		back=gear.enmity_jse_back,waist="Engraved Belt",legs="Rune. Trousers +1",feet="Erilaz Greaves +1"}
	sets.defense.MEVA_HP = {main="Aettir",sub="Refined Grip +1",ammo="Staunch Tathlum",
		head="Erilaz Galea +1",neck="Warder's Charm +1",ear1="Odnowa Earring",ear2="Tuisto Earring",
		body="Runeist Coat +1",hands="Erilaz Gauntlets +1",ring1="Gelatinous Ring +1",ring2="Defending Ring", --ring2="Moonlight Ring",
		back=gear.enmity_jse_back,waist="Engraved Belt",legs="Rune. Trousers +1",feet="Erilaz Greaves +1"}

	sets.defense.Death = {main="Aettir",sub="Refined Grip +1",ammo="Staunch Tathlum",
		head="Erilaz Galea +1",neck="Warder's Charm +1",ear1="Odnowa Earring",ear2="Sanare Earring",
		body="Runeist Coat +1",hands="Erilaz Gauntlets +1",ring1="Purity Ring",ring2="Vengeful Ring",
		back=gear.enmity_jse_back,waist="Engraved Belt",legs="Rune. Trousers +1",feet="Erilaz Greaves +1"}

	sets.defense.DTCharm = {main="Aettir",sub="Refined Grip +1",ammo="Staunch Tathlum",
		head="Erilaz Galea +1",neck="Unmoving Collar +1",ear1="Odnowa Earring",ear2="Sanare Earring",
		body="Runeist Coat +1",hands="Erilaz Gauntlets +1",ring1="Defending Ring",ring2="Dark Ring",
		back=gear.enmity_jse_back,waist="Engraved Belt",legs="Rune. Trousers +1",feet="Erilaz Greaves +1"}

	sets.defense.Charm = {main="Aettir",sub="Refined Grip +1",ammo="Staunch Tathlum",
		head="Erilaz Galea +1",neck="Unmoving Collar +1",ear1="Odnowa Earring",ear2="Sanare Earring",
		body="Runeist Coat +1",hands="Erilaz Gauntlets +1",ring1="Purity Ring",ring2="Vengeful Ring",
		back=gear.enmity_jse_back,waist="Engraved Belt",legs="Rune. Trousers +1",feet="Erilaz Greaves +1"}

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Brutal Earring"}
	sets.AccMaxTP = {ear1="Cessance Earring"}

	--------------------------------------
	-- Engaged sets
	--------------------------------------

	sets.engaged = {main="Aettir",sub="Refined Grip +1",ammo="Ginsen",
		head="Dampening Tam",neck="Lissome Necklace",ear1="Brutal Earring",ear2="Mache Earring +1",
		body="Adhemar Jacket +1",hands="Adhemar Wrist. +1",ring1="Petrov Ring",ring2="Epona's Ring",
		back=gear.stp_jse_back,waist="Kentarch Belt +1",legs=gear.herculean_ta_legs,feet=gear.herculean_ta_feet}
	sets.engaged.SomeAcc = {main="Aettir",sub="Refined Grip +1",ammo="Ginsen",
		head="Dampening Tam",neck="Lissome Necklace",ear1="Brutal Earring",ear2="Mache Earring +1",
		body="Ayanmo Corazza +2",hands="Adhemar Wrist. +1",ring1="Petrov Ring",ring2="Epona's Ring",
		back=gear.stp_jse_back,waist="Kentarch Belt +1",legs=gear.herculean_ta_legs,feet=gear.herculean_ta_feet}
	sets.engaged.Acc = {main="Aettir",sub="Refined Grip +1",ammo="Ginsen",
		head="Dampening Tam",neck="Lissome Necklace",ear1="Cessance Earring",ear2="Mache Earring +1",
		body="Ayanmo Corazza +2",hands="Adhemar Wrist. +1",ring1="Petrov Ring",ring2="Epona's Ring",
		back=gear.stp_jse_back,waist="Kentarch Belt +1",legs="Meg. Chausses +2",feet=gear.herculean_ta_feet}
	sets.engaged.HighAcc = {main="Aettir",sub="Refined Grip +1",ammo="Falcon Eye",
		head="Aya. Zucchetto +2",neck="Lissome Necklace",ear1="Cessance Earring",ear2="Mache Earring +1",
		body="Ayanmo Corazza +2",hands="Meg. Gloves +2",ring1="Petrov Ring",ring2="Epona's Ring",
		back=gear.stp_jse_back,waist="Grunfeld Rope",legs="Meg. Chausses +2",feet=gear.herculean_acc_feet}
	sets.engaged.FullAcc = {main="Aettir",sub="Refined Grip +1",ammo="Falcon Eye",
		head="Carmine Mask +1",neck="Lissome Necklace",ear1="Cessance Earring",ear2="Mache Earring +1",
		body="Ayanmo Corazza +2",hands="Meg. Gloves +2",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
		back=gear.stp_jse_back,waist="Olseni Belt",legs="Carmine Cuisses +1",feet=gear.herculean_acc_feet}
	
	sets.engaged.DTLite = {main="Aettir",sub="Refined Grip +1",ammo="Ginsen",
		head="Meghanada Visor +2",neck="Loricate Torque +1",ear1="Brutal Earring",ear2="Mache Earring +1", --head="Aya. Zucchetto +2"
		body="Ayanmo Corazza +2",hands="Meg. Gloves +2",ring1="Shadow Ring",ring2="Defending Ring",
		back=gear.enmity_jse_back,waist="Kentarch Belt +1",legs="Meg. Chausses +2",feet=gear.herculean_ta_feet}
	sets.engaged.SomeAcc.DTLite = {main="Aettir",sub="Refined Grip +1",ammo="Falcon Eye",
		head="Meghanada Visor +2",neck="Loricate Torque +1",ear1="Cessance Earring",ear2="Mache Earring +1", --head="Aya. Zucchetto +2"
		body="Ayanmo Corazza +2",hands="Meg. Gloves +2",ring1="Shadow Ring",ring2="Defending Ring",
		back=gear.enmity_jse_back,waist="Kentarch Belt +1",legs="Meg. Chausses +2",feet=gear.herculean_ta_feet}
	sets.engaged.Acc.DTLite = {main="Aettir",sub="Refined Grip +1",ammo="Falcon Eye",
		head="Meghanada Visor +2",neck="Loricate Torque +1",ear1="Cessance Earring",ear2="Mache Earring +1", --head="Aya. Zucchetto +2"
		body="Ayanmo Corazza +2",hands="Meg. Gloves +2",ring1="Shadow Ring",ring2="Defending Ring",
		back=gear.enmity_jse_back,waist="Grunfeld Rope",legs="Meg. Chausses +2",feet=gear.herculean_ta_feet}
	sets.engaged.HighAcc.DTLite = {main="Aettir",sub="Refined Grip +1",ammo="Falcon Eye",
		head="Meghanada Visor +2",neck="Loricate Torque +1",ear1="Cessance Earring",ear2="Mache Earring +1", --head="Aya. Zucchetto +2"
		body="Ayanmo Corazza +2",hands="Meg. Gloves +2",ring1="Shadow Ring",ring2="Defending Ring",
		back=gear.enmity_jse_back,waist="Olseni Belt",legs="Meg. Chausses +2",feet=gear.herculean_ta_feet}
	sets.engaged.FullAcc.DTLite = {main="Aettir",sub="Refined Grip +1",ammo="Falcon Eye",
		head="Meghanada Visor +2",neck="Loricate Torque +1",ear1="Cessance Earring",ear2="Mache Earring +1", --head="Aya. Zucchetto +2"
		body="Ayanmo Corazza +2",hands="Meg. Gloves +2",ring1="Shadow Ring",ring2="Defending Ring",
		back=gear.enmity_jse_back,waist="Olseni Belt",legs="Meg. Chausses +2",feet=gear.herculean_ta_feet}
	
	sets.engaged.Tank = {main="Aettir",sub="Refined Grip +1",ammo="Staunch Tathlum",
		head="Meghanada Visor +2",neck="Loricate Torque +1",ear1="Odnowa Earring",ear2="Ethereal Earring",
		body="Futhark Coat +1",hands="Turms Mittens",ring1="Shadow Ring",ring2="Defending Ring",
		back=gear.enmity_jse_back,waist="Flume Belt +1",legs="Eri. Leg Guards +1",feet="Erilaz Greaves +1"}
	sets.engaged.Tank_HP = {main="Aettir",sub="Refined Grip +1",ammo="Staunch Tathlum",
		head="Fu. Bandeau +1",neck="Loricate Torque +1",ear1="Odnowa Earring",ear2="Tuisto Earring",
		body="Runeist Coat +1",hands="Turms Mittens",ring1="Gelatinous Ring +1",ring2="Moonlight Ring",
		back=gear.enmity_jse_back,waist="Flume Belt +1",legs="Eri. Leg Guards +1",feet="Erilaz Greaves +1"}
	sets.engaged.SomeAcc.Tank = sets.engaged.Tank
	sets.engaged.Acc.Tank = sets.engaged.Tank
	sets.engaged.HighAcc.Tank = sets.engaged.Tank
	sets.engaged.FullAcc.Tank = sets.engaged.Tank

	--------------------------------------
	-- Custom buff sets
	--------------------------------------
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {head="Frenzy Sallet"}
	sets.buff.Battuta = {hands="Turms Mittens"}
	sets.buff.Embolden = {back="Evasionist's Cape"}

end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	-- Default macro set/book
	if player.sub_job == 'DNC' then
		set_macro_page(1, 4)
	elseif player.sub_job == 'RDM' then
		set_macro_page(1, 4)
	elseif player.sub_job == 'SCH' then
		set_macro_page(1, 4)
	elseif player.sub_job == 'BLU' then
		set_macro_page(1, 4)
	elseif player.sub_job == 'WAR' then
		set_macro_page(1, 4)
	elseif player.sub_job == 'SAM' then
		set_macro_page(1, 4)
	elseif player.sub_job == 'DRK' then
		set_macro_page(1, 4)
	elseif player.sub_job == 'NIN' then
		set_macro_page(1, 4)
	else
		set_macro_page(1, 4)
	end
end

function user_job_lockstyle()
	if state.Weapons.value == 'Aettir' then
		windower.chat.input('/lockstyleset 004')
	else
		windower.chat.input('/lockstyleset 004')
	end
end

buff_spell_lists = {
	Auto = {--Options for When are: Always, Engaged, Idle, OutOfCombat, Combat
		{Name='Crusade',	Buff='Enmity Boost',	SpellID=476,	When='Combat'},
		{Name='Temper',		Buff='Multi Strikes',	SpellID=493,	When='Engaged'},
		{Name='Phalanx',	Buff='Phalanx',			SpellID=106,	When='Always'},
		{Name='Refresh',	Buff='Refresh',			SpellID=109,	When='Idle'},
	},

	Default = {
		{Name='Crusade',	Buff='Enmity Boost',	SpellID=476,	Reapply=false},
		{Name='Temper',		Buff='Multi Strikes',	SpellID=493,	Reapply=false},
		{Name='Haste',		Buff='Haste',			SpellID=57,		Reapply=false},
		{Name='Refresh',	Buff='Refresh',			SpellID=109,	Reapply=false},
		{Name='Phalanx',	Buff='Phalanx',			SpellID=106,	Reapply=false},
	},
	
	Tank = {
		{Name='Crusade',	Buff='Enmity Boost',	SpellID=476,	Reapply=false},
		{Name='Cocoon',		Buff='Defense Boost',	SpellID=547,	Reapply=false},
		{Name='Haste',		Buff='Haste',			SpellID=57,		Reapply=false},
		{Name='Refresh',	Buff='Refresh',			SpellID=109,	Reapply=false},
		{Name='Phalanx',	Buff='Phalanx',			SpellID=106,	Reapply=false},
	},
	
	Full = {
		{Name='Crusade',	Buff='Enmity Boost',	SpellID=476,	Reapply=false},
		{Name='Temper',		Buff='Multi Strikes',	SpellID=493,	Reapply=false},
		{Name='Haste',		Buff='Haste',			SpellID=57,		Reapply=false},
		{Name='Refresh',	Buff='Refresh',			SpellID=109,	Reapply=false},
		{Name='Aquaveil',	Buff='Aquaveil',		SpellID=55,		Reapply=false},
		{Name='Stoneskin',	Buff='Stoneskin',		SpellID=54,		Reapply=false},
		{Name='Blink',		Buff='Blink',			SpellID=53,		Reapply=false},
		{Name='Phalanx',	Buff='Phalanx',			SpellID=106,	Reapply=false},
		{Name='Regen IV',	Buff='Regen',			SpellID=477,	Reapply=false},
	},
	Melee = {
		{Name='Temper',		Buff='Multi Strikes',	SpellID=493,	Reapply=false},
		{Name='Haste',		Buff='Haste',			SpellID=57,		Reapply=false},
		{Name='Refresh',	Buff='Refresh',			SpellID=109,	Reapply=false},
		{Name='Aquaveil',	Buff='Aquaveil',		SpellID=55,		Reapply=false},
		{Name='Stoneskin',	Buff='Stoneskin',		SpellID=54,		Reapply=false},
		{Name='Blink',		Buff='Blink',			SpellID=53,		Reapply=false},
		{Name='Phalanx',	Buff='Phalanx',			SpellID=106,	Reapply=false},
		{Name='Regen IV',	Buff='Regen',			SpellID=477,	Reapply=false},
	},
}
