function user_job_setup()
	-- Options: Override default values
	state.OffenseMode:options('Normal','Acc','FullAcc','Fodder')
	state.HybridMode:options('Normal','DT')
	state.WeaponskillMode:options('Match','Normal','Acc','FullAcc','Fodder')
	state.CastingMode:options('Normal','Resistant','Fodder','Proc')
	state.IdleMode:options('Normal','Sphere','PDT','DTHippo')
	state.PhysicalDefenseMode:options('PDT', 'NukeLock')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('Tizalmace','MaccWeapons','MagicWeapons','Almace','Sequence','ProcWeapon','None','MeleeClubs','HybridWeapons')

	state.ExtraMeleeMode = M{['description']='Extra Melee Mode','None','MP','SuppaBrutal','DWEarrings','DWMax'}

	gear.da_jse_back = {name="Rosmerta's Cape",augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}}
	gear.stp_jse_back = {name="Rosmerta's Cape",augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}}
	gear.crit_jse_back = {name="Rosmerta's Cape",augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10',}}
	gear.wsd_jse_back = {name="Rosmerta's Cape",augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
	gear.nuke_jse_back = {name="Rosmerta's Cape",augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}}

	gear.obi_cure_waist = "Luminary Sash"
	gear.obi_nuke_waist = "Yamabuki-no-Obi"
	gear.obi_cure_back = "Tempered Cape +1"

	autows = 'Savage Blade'
	autofood = 'Grape Daifuku'

	-- Additional local binds
	send_command('bind ^` input /ja "Chain Affinity" <me>')
	send_command('bind @` input /ja "Efflux" <me>')
	send_command('bind !` input /ja "Burst Affinity" <me>')
	send_command('bind ^@!` gs c cycle SkillchainMode')
	send_command('bind ^backspace input /ja "Unbridled Learning" <me>;wait 1;input /ja "Diffusion" <me>;wait 2;input /ma "Mighty Guard" <me>')
	send_command('bind !backspace input /ja "Unbridled Learning" <me>;wait 1;input /ja "Diffusion" <me>;wait 2;input /ma "Carcharian Verve" <me>')
	send_command('bind @backspace input /ja "Convergence" <me>')
	send_command('bind @f10 gs c toggle LearningMode')
	send_command('bind ^@!` gs c cycle MagicBurstMode')
	send_command('bind @f8 gs c toggle AutoNukeMode')
	send_command('bind !@^f7 gs c toggle AutoWSMode')
	send_command('bind !r gs c weapons None;gs c update')
	send_command('bind @q gs c weapons MaccWeapons;gs c update')
	send_command('bind ^q gs c weapons Almace;gs c update')
	send_command('bind !q gs c weapons HybridWeapons;gs c update')

	select_default_macro_book()
end

function init_gear_sets()

	--------------------------------------
	-- Start defining the sets
	--------------------------------------

	sets.buff['Burst Affinity'] = {feet="Hashi. Basmak +1"}
	sets.buff['Chain Affinity'] = {feet="Assim. Charuqs +1"}
	sets.buff.Convergence = {head="Luh. Keffiyeh +1"}
	sets.buff.Diffusion = {feet="Luhlaza Charuqs"}
	sets.buff.Enchainment = {}
	sets.buff.Efflux = {back=gear.stp_jse_back,legs="Hashishin Tayt +1"}
	sets.buff.Doom = set_combine(sets.buff.Doom, {})

	sets.HPDown = {head="Pixie Hairpin +1",neck="Loricate Torque +1",ear1="Mendicant's Earring",ear2="Evans Earring",
		body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Mephitas's Ring +1",ring2="Mephitas's Ring",
		back="Swith Cape",waist="Flume Belt +1",legs="Shedir Seraweels",feet="Jhakri Pigaches +2"}

	-- Precast Sets

	-- Precast sets to enhance JAs
	sets.precast.JA['Azure Lore'] = {hands="Luh. Bazubands +1"}


	-- Waltz set (chr and vit)
	sets.precast.Waltz = {ammo="Staunch Tathlum +1",
		head="Carmine Mask +1",neck="Unmoving Collar +1",ear1="Enchntr. Earring +1",ear2="Handler's Earring +1",
		body=gear.herculean_waltz_body,hands=gear.herculean_waltz_hands,ring1="Defending Ring",ring2="Valseur's Ring",
		back="Moonlight Cape",waist="Chaac Belt",legs="Dashing Subligar",feet=gear.herculean_waltz_feet}

	sets.Self_Waltz = {body="Passion Jacket",ring1="Asklepian Ring"}

	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}

	sets.precast.Step = {}

	sets.precast.Flourish1 = {}

	-- Fast cast sets for spells

	sets.precast.FC = {ammo="Ginsen",
		head=gear.herculean_wsd_head,neck="Voltsurge Torque",ear1="Loquac. Earring",ear2="Etiolation Earring",
		body="Adhemar Jacket",hands="Leyline Gloves",ring1="Rahab Ring",ring2="Defending Ring",
		back="Swith Cape",waist="Witful Belt",legs="Aya. Cosciales +2",feet="Carmine Greaves"}

	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {body="Passion Jacket"})

	sets.precast.FC['Blue Magic'] = set_combine(sets.precast.FC, {body="Hashishin Mintan"})


	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {ammo="Ginsen",
		head=gear.herculean_wsd_head,neck="Mirage Stole",ear1="Ishvara Earring",ear2="Moonshade Earring",
		body="Assim. Jubbah +2",hands="Jhakri Cuffs +2",ring1="Karieyh Ring",ring2="Rufescent Ring",
		back=gear.wsd_jse_back,waist="Fotia Belt",legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"}

	sets.precast.WS.Acc = {ammo="Falcon Eye",
		head="Carmine Mask +1",neck="Fotia Gorget",ear1="Mache Earring +1",ear2="Telos Earring",
		body="Assim. Jubbah +3",hands="Assim. Bazu. +3",ring1="Epona's Ring",ring2="Ilabrat Ring",
		back=gear.da_jse_back,waist="Fotia Belt",legs="Carmine Cuisses +1",feet=gear.herculean_ta_feet}

	sets.precast.WS.FullAcc = {ammo="Falcon Eye",
		head="Carmine Mask +1",neck="Mirage Stole +2",ear1="Mache Earring +1",ear2="Odr Earring",
		body="Assim. Jubbah +3",hands="Assim. Bazu. +3",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
		back=gear.da_jse_back,waist="Olseni Belt",legs="Carmine Cuisses +1",feet="Malignance Boots"}

	sets.precast.WS.DT = {ammo="Aurgelmir Orb +1",
		head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Cessance Earring",ear2="Brutal Earring",
		body="Malignance Tabard",hands="Assim. Bazu. +3",ring1="Defending Ring",ring2="Ilabrat Ring",
		back=gear.da_jse_back,waist="Fotia Belt",legs="Malignance Tights",feet="Malignance Boots"}

	sets.precast.WS.Fodder = {ammo="Aurgelmir Orb +1",
		head="Lilitu Headpiece",neck="Fotia Gorget",ear1="Cessance Earring",ear2="Brutal Earring",
		body="Adhemar Jacket +1",hands="Jhakri Cuffs +2",ring1="Epona's Ring",ring2="Apate Ring",
		back=gear.da_jse_back,waist="Fotia Belt",legs="Samnuha Tights",feet=gear.herculean_ta_feet}

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {head="Jhakri Coronal +1",ear1="Regal Earring",body="Jhakri Robe +2",ring2="Rufescent Ring",legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"})
	sets.precast.WS['Requiescat'].Acc = set_combine(sets.precast.WS.Acc, {head="Jhakri Coronal +1",ear1="Regal Earring",ear2="Telos Earring",ring1="Rufescent Ring",legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"})
	sets.precast.WS['Requiescat'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS['Requiescat'].DT = set_combine(sets.precast.WS.DT, {})
	sets.precast.WS['Requiescat'].Fodder = set_combine(sets.precast.WS['Requiescat'], {})

	sets.precast.WS['Realmrazer'] = set_combine(sets.precast.WS, {head="Jhakri Coronal +2",ear1="Regal Earring",body="Jhakri Robe +2",ring2="Rufescent Ring",legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"})
	sets.precast.WS['Realmrazer'].Acc = set_combine(sets.precast.WS.Acc, {head="Jhakri Coronal +2",ear1="Regal Earring",ear2="Telos Earring",ring1="Rufescent Ring",legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"})
	sets.precast.WS['Realmrazer'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS['Realmrazer'].DT = set_combine(sets.precast.WS.DT, {})
	sets.precast.WS['Realmrazer'].Fodder = set_combine(sets.precast.WS['Realmrazer'], {})

	sets.precast.WS['Chant du Cygne'] = set_combine(sets.precast.WS, {ammo="Falcon Eye",
		head="Adhemar Bonnet +1",neck="Mirage Stole",ear1="Mache Earring +1",ear2="Odr Earring",
		body="Adhemar Jacket +1",hands="Adhemar Wrist. +1",ring1="Begrudging Ring",ring2="Epona's Ring",
		back=gear.crit_jse_back,waist="Fotia Belt",legs=gear.herculean_ta_legs,feet=gear.herculean_ta_feet})

	sets.precast.WS['Chant du Cygne'].Acc = set_combine(sets.precast.WS.Acc, {ammo="Falcon Eye",
		head="Adhemar Bonnet +1",neck="Mirage Stole",ear1="Mache Earring +1",ear2="Odr Earring",
		body="Adhemar Jacket +1",hands="Adhemar Wrist. +1",ring1="Begrudging Ring",ring2="Epona's Ring",
		back=gear.crit_jse_back,waist="Fotia Belt",legs=gear.herculean_ta_legs,feet="Malignance Boots"})

	sets.precast.WS['Chant du Cygne'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS['Chant du Cygne'].DT = set_combine(sets.precast.WS.DT, {back=gear.crit_jse_back})
	sets.precast.WS['Chant du Cygne'].Fodder = set_combine(sets.precast.WS['Chant du Cygne'], {})

	sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS, {ammo="Mantoptera Eye",
		head=gear.herculean_wsd_head,neck="Mirage Stole",ear1="Ishvara Earring",ear2="Moonshade Earring",
		body="Assim. Jubbah +2",hands="Jhakri Cuffs +2",ring1="Karieyh Ring",ring2="Rufescent Ring",
		back=gear.wsd_jse_back,waist="Fotia Belt",legs=gear.herculean_wsd_legs,feet="Jhakri Pigaches +2"})

	sets.precast.WS['Savage Blade'].Acc = set_combine(sets.precast.WS.Acc, {ammo="Mantoptera Eye",
		head=gear.herculean_wsd_head,neck="Mirage Stole",ear1="Ishvara Earring",ear2="Moonshade Earring",
		body="Assim. Jubbah +2",hands="Jhakri Cuffs +2",ring1="Karieyh Ring",ring2="Rufescent Ring",
		back=gear.wsd_jse_back,waist="Fotia Belt",legs=gear.herculean_wsd_legs,feet="Jhakri Pigaches +2"})

	sets.precast.WS['Savage Blade'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS['Savage Blade'].DT = set_combine(sets.precast.WS.DT, {back=gear.wsd_jse_back})
	sets.precast.WS['Savage Blade'].Fodder = set_combine(sets.precast.WS['Savage Blade'], {})

	sets.precast.WS['Vorpal Blade'] = sets.precast.WS['Chant du Cygne']
	sets.precast.WS['Vorpal Blade'].Acc = sets.precast.WS['Chant du Cygne'].Acc
	sets.precast.WS['Vorpal Blade'].FullAcc = sets.precast.WS['Chant du Cygne'].FullAcc
	sets.precast.WS['Vorpal Blade'].DT = sets.precast.WS['Chant du Cygne'].DT
	sets.precast.WS['Vorpal Blade'].Fodder = sets.precast.WS['Chant du Cygne'].Fodder

	sets.precast.WS['Expiacion'] = set_combine(sets.precast.WS, {ammo="Mantoptera Eye",
		head=gear.herculean_wsd_head,neck="Mirage Stole",ear1="Ishvara Earring",ear2="Moonshade Earring",
		body="Assim. Jubbah +2",hands="Jhakri Cuffs +2",ring1="Karieyh Ring",ring2="Rufescent Ring",
		back=gear.wsd_jse_back,waist="Fotia Belt",legs=gear.herculean_wsd_legs,feet="Jhakri Pigaches +2"})
	sets.precast.WS['Expiacion'].Acc = set_combine(sets.precast.WS.Acc, {ear1="Moonshade Earring",body="Assim. Jubbah +3",hands="Jhakri Cuffs +2",back=gear.wsd_jse_back,legs="Carmine Cuisses +1",feet=gear.herculean_wsd_feet})
	sets.precast.WS['Expiacion'].FullAcc = set_combine(sets.precast.WS.FullAcc, {body="Assim. Jubbah +3",hands="Jhakri Cuffs +2"})
	sets.precast.WS['Expiacion'].DT = set_combine(sets.precast.WS.DT, {back=gear.wsd_jse_back})
	sets.precast.WS['Expiacion'].Fodder = set_combine(sets.precast.WS['Expiacion'], {})

	sets.precast.WS['Sanguine Blade'] = {ammo="Ghastly Tathlum +1",
		head ="Pixie Hairpin +1",neck="Sanctity Necklace",ear1="Hecate's Earring",ear2="Friomisi Earring",
		body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Acumen Ring",ring2="Archon Ring",
		back=gear.nuke_jse_back,waist="Eschan Stone",legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"}

	sets.precast.WS['Sanguine Blade'].DT = set_combine(sets.precast.WS.DT, {back=gear.nuke_jse_back})

	sets.precast.WS['Flash Nova'] = {ammo="Pemphredo Tathlum",
		head="Jhakri Coronal +2",neck="Baetyl Pendant",ear1="Regal Earring",ear2="Friomisi Earring",
		body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Metamor. Ring +1",ring2="Shiva Ring +1",
		back=gear.nuke_jse_back,waist="Yamabuki-no-Obi",legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"}

	sets.precast.WS['Sanguine Blade'].DT = set_combine(sets.precast.WS.DT, {back=gear.nuke_jse_back})

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Cessance Earring",ear2="Brutal Earring"}
	sets.AccMaxTP = {ear1="Regal Earring",ear2="Telos Earring"}

	-- Midcast Sets
	sets.midcast.FastRecast = {
		--ammo="Hasty Pinion +1",
		--head="Carmine Mask +1",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
		--body="Luhlaza Jubbah +3",hands="Leyline Gloves",ring1="Kishar Ring",ring2="Prolix Ring",
		--back="Swith Cape +1",waist="Witful Belt",legs="Psycloth Lappas",feet="Carmine Greaves +1"
		ammo="Ginsen",
		head=gear.herculean_wsd_head,neck="Voltsurge Torque",ear1="Loquac. Earring",ear2="Etiolation Earring",
		body="Adhemar Jacket",hands="Leyline Gloves",ring1="Rahab Ring",ring2="Defending Ring",
		back="Swith Cape",waist="Witful Belt",legs="Aya. Cosciales +2",feet="Carmine Greaves"}

	sets.midcast['Blue Magic'] = {}

	-- Physical Spells --

	sets.midcast['Blue Magic'].Physical = {main="Vampirism",sub="Vampirism",ammo="Mavi Tathlum",
		head="Lilitu Headpiece",neck="Mirage Stole +2",ear1="Suppanomimi",ear2="Telos Earring",
		body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Ifrit Ring +1",ring2="Ilabrat Ring",
		back=gear.wsd_jse_back,waist="Grunfeld Rope",legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"}

	sets.midcast['Blue Magic'].Physical.Resistant = {main="Sequence",sub="Almace",ammo="Falcon Eye",
		head="Jhakri Coronal +2",neck="Mirage Stole +2",ear1="Regal Earring",ear2="Telos Earring",
		body="Assim. Jubbah +3",hands="Assim. Bazu. +3",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
		back=gear.da_jse_back,waist="Grunfeld Rope",legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"}

	sets.midcast['Blue Magic'].Physical.Fodder = {main="Iris",sub="Iris",ammo="Mavi Tathlum",
		head="Luh. Keffiyeh +1",neck="Mirage Stole +2",ear1="Suppanomimi",ear2="Telos Earring",
		body="Assim. Jubbah +2",hands="Jhakri Cuffs +2",ring1="Ifrit Ring +1",ring2="Ilabrat Ring",
		back="Cornflower Cape",waist="Grunfeld Rope",legs="Hashishin Tayt +1",feet="Luhlaza Charuqs"}

	sets.midcast['Blue Magic'].PhysicalAcc = {main="Sequence",sub="Almace",ammo="Falcon Eye",
		head="Jhakri Coronal +1",neck="Mirage Stole",ear1="Regal Earring",ear2="Telos Earring",
		body="Assim. Jubbah +2",hands="Jhakri Cuffs +2",ring1="Ramuh Ring +1",ring2="Ilabrat Ring",
		back=gear.da_jse_back,waist="Grunfeld Rope",legs="Jhakri Slops +2",feet="Malignance Boots"}

	sets.midcast['Blue Magic'].PhysicalAcc.Resistant = set_combine(sets.midcast['Blue Magic'].PhysicalAcc, {})
	sets.midcast['Blue Magic'].PhysicalAcc.Fodder = sets.midcast['Blue Magic'].Fodder

	sets.midcast['Blue Magic'].PhysicalStr = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalStr.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalStr.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

	sets.midcast['Blue Magic'].PhysicalDex = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalDex.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalDex.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

	sets.midcast['Blue Magic'].PhysicalVit = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalVit.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalVit.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

	sets.midcast['Blue Magic'].PhysicalAgi = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalAgi.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalAgi.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

	sets.midcast['Blue Magic'].PhysicalInt = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalInt.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalInt.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

	sets.midcast['Blue Magic'].PhysicalMnd = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalMnd.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalMnd.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

	sets.midcast['Blue Magic'].PhysicalChr = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalChr.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalChr.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

	sets.midcast['Blue Magic'].PhysicalHP = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalHP.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalHP.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

	-- Magical Spells --

	sets.midcast['Blue Magic'].Magical = {ammo="Ghastly Tathlum +1",
		head="Jhakri Coronal +1",neck="Sanctity Necklace",ear1="Hecate's Earring",ear2="Friomisi Earring",
		body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Acumen Ring",ring2="Shiva Ring",
		back=gear.nuke_jse_back,waist="Eschan Stone",legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"}

	sets.midcast['Blue Magic'].Magical.Proc = {ammo="Hasty Pinion +1",
		head="Carmine Mask +1",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
		body="Luhlaza Jubbah +3",hands="Leyline Gloves",ring1="Kishar Ring",ring2="Prolix Ring",
		back="Swith Cape",waist="Witful Belt",legs="Psycloth Lappas",feet="Carmine Greaves +1"}

	sets.midcast['Blue Magic'].Magical.Resistant = set_combine(sets.midcast['Blue Magic'].Magical, {neck="Mirage Stole",hands="Jhakri Cuffs +2",ring1="Stikini Ring +1",ring2="Stikini Ring +1",waist="Yamabuki-no-Obi"})

	sets.midcast['Blue Magic'].Magical.Fodder = {main="Nibiru Cudgel",sub="Nibiru Cudgel",ammo="Pemphredo Tathlum",
		 head="Jhakri Coronal +2",neck="Baetyl Pendant",ear1="Regal Earring",ear2="Friomisi Earring",
		 body="Jhakri Robe +2",hands="Amalric Gages +1",ring1="Metamor. Ring +1",ring2="Shiva Ring +1",
		 back=gear.ElementalCape,waist=gear.ElementalObi,legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"}

	sets.midcast['Blue Magic'].MagicalMnd = set_combine(sets.midcast['Blue Magic'].Magical, {ring2="Stikini Ring +1"})
	sets.midcast['Blue Magic'].MagicalChr = set_combine(sets.midcast['Blue Magic'].Magical, {})
	sets.midcast['Blue Magic'].MagicalVit = set_combine(sets.midcast['Blue Magic'].Magical, {})
	sets.midcast['Blue Magic'].MagicalDex = set_combine(sets.midcast['Blue Magic'].Magical, {})

	sets.midcast['Blue Magic'].MagicAccuracy = {
		--main="Iris",sub="Iris",ammo="Pemphredo Tathlum",
		--head="Jhakri Coronal +2",neck="Mirage Stole +2",ear1="Regal Earring",ear2="Digni. Earring",
		--body="Jhakri Robe +2",hands="Regal Cuffs",ring1="Metamor. Ring +1",ring2="Stikini Ring +1",
		--back="Cornflower Cape",waist="Luminary Sash",legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"
		main="Iris",sub="Iris",ammo="Ginsen",
		head="Jhakri Coronal +1",neck="Mirage Stole",ear1="Digni. Earring",ear2="Njordr Earring",
		body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Stikini Ring",ring2="Sangoma Ring",
		back="Cornflower Cape",waist="Eschan Stone",legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"}

	sets.midcast['Enfeebling Magic'] = {ammo="Ghastly Tathlum +1",
		head="Jhakri Coronal +1",neck="Sanctity Necklace",ear1="Digni. Earring",ear2="Friomisi Earring",
		body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Acumen Ring",ring2="Shiva Ring",
		back=gear.nuke_jse_back,aist="Eschan Stone",egs="Jhakri Slops +2",feet="Jhakri Pigaches +2"}

	sets.midcast['Dark Magic'] = {ammo="Ghastly Tathlum +1",
		head="Jhakri Coronal +1",neck="Sanctity Necklace",ear1="Digni. Earring",ear2="Friomisi Earring",
		body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Acumen Ring",ring2="Archon Ring",
		back=gear.nuke_jse_back,waist="Eschan Stone",legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"}

	sets.midcast['Enhancing Magic'] = {}

	sets.midcast['Phalanx'] = set_combine(sets.midcast['Enhancing Magic'],{main="Pukulatmuj +1",sub="Pukulatmuj",head="Carmine Mask +1",ear2="Mimir Earring",hands=gear.herculean_phalanx_hands,legs="Carmine Cuisses +1",feet=gear.herculean_nuke_feet})

	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif +1"})

	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif +1",hands="Regal Cuffs",waist="Emphatikos Rope",legs="Shedir Seraweels"})

	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {ear2="Earthcry Earring",waist="Siegel Sash",legs="Shedir Seraweels"})

	sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {legs="Shedir Seraweels"})

	sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
	sets.midcast.Protectra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
	sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
	sets.midcast.Shellra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})

	sets.midcast['Divine Magic'] = {ammo="Pemphredo Tathlum",
		head="Jhakri Coronal +2",neck="Incanter's Torque",ear1="Regal Earring",ear2="Digni. Earring",
		body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Metamor. Ring +1",ring2="Stikini Ring +1",
		back=gear.nuke_jse_back,waist="Luminary Sash",legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"}

	sets.midcast['Elemental Magic'] = {ammo="Ghastly Tathlum +1",
		head="Jhakri Coronal +1",neck="Sanctity Necklace",ear1="Hecate's Earring",ear2="Friomisi Earring",
		body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Acumen Ring",ring2="Shiva Ring",
		back=gear.nuke_jse_back,waist="Eschan Stone",legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"}

	sets.midcast['Elemental Magic'].Resistant = {ammo="Ghastly Tathlum +1",
		head="Jhakri Coronal +1",neck="Sanctity Necklace",ear1="Hecate's Earring",ear2="Friomisi Earring",
		body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Acumen Ring",ring2="Shiva Ring",
		back=gear.nuke_jse_back,waist="Eschan Stone",legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"}

	sets.midcast.Helix = sets.midcast['Elemental Magic']
	sets.midcast.Helix.Resistant = sets.midcast['Elemental Magic'].Resistant

	sets.element.Dark = {head="Pixie Hairpin +1",ring2="Archon Ring"}
	sets.element.Light = {}

	sets.midcast.Cure = {ammo="Ginsen",
		head="Jhakri Coronal +1",neck="Sanctity Necklace",ear1="Hecate's Earring",ear2="Mendi. Earring",
		body="Assim. Jubbah +2",hands="Telchine Gloves",ring1="Kunaji Ring",ring2="Meridian Ring",
		back=gear.nuke_jse_back,waist="Eschan Stone",legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"}

	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {neck="Debilis Medallion",hands="Hieros Mittens",
		back="Oretan. Cape +1",ring1="Haoma's Ring",ring2="Menelaus's Ring",waist="Witful Belt"})

	-- Breath Spells --

	sets.midcast['Blue Magic'].Breath = {ammo="Mavi Tathlum",
		head="Luh. Keffiyeh +1",neck="Mirage Stole +2",ear1="Regal Earring",ear2="Digni. Earring",
		body="Assim. Jubbah +3",hands="Luh. Bazubands +1",ring1="Kunaji Ring",ring2="Meridian Ring",
		back="Cornflower Cape",legs="Hashishin Tayt +1",feet="Luhlaza Charuqs"}

	-- Physical Added Effect Spells most notably "Stun" spells --

	sets.midcast['Blue Magic'].Stun = {main="Iris",sub="Iris",ammo="Pemphredo Tathlum",
		head="Malignance Chapeau",neck="Mirage Stole +2",ear1="Regal Earring",ear2="Digni. Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Metamor. Ring +1",ring2="Stikini Ring +1",
		back="Cornflower Cape",waist="Luminary Sash",legs="Malignance Tights",feet="Malignance Boots"}

	sets.midcast['Blue Magic'].Stun.Resistant = {main="Iris",sub="Iris",ammo="Falcon Eye",
		head="Malignance Chapeau",neck="Mirage Stole +2",ear1="Regal Earring",ear2="Digni. Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Metamor. Ring +1",ring2="Stikini Ring +1",
		back="Cornflower Cape",waist="Olseni Belt",legs="Malignance Tights",feet="Malignance Boots"}

	sets.midcast['Blue Magic'].Stun.Fodder = sets.midcast['Blue Magic'].Stun

	-- Other Specific Spells --

	sets.midcast['Blue Magic']['White Wind'] = {ammo="Staunch Tathlum",
		head=gear.telchine_whitewind_head,neck="Sanctity Necklace",ear1="Odnowa Earring",ear2="Mendi. Earring",
		body=gear.telchine_whitewind_body,hands=gear.telchine_whitewind_hands,ring1="Kunaji Ring",ring2="Meridian Ring",
		back="Cornflower Cape",waist="Eschan Stone",legs=gear.telchine_whitewind_legs,feet=gear.telchine_whitewind_feet}

	sets.midcast['Blue Magic']['Healing Breeze'] = sets.midcast['Blue Magic']['White Wind']

	sets.midcast['Blue Magic'].Healing = {ammo="Staunch Tathlum",
		head=gear.telchine_whitewind_head,neck="Sanctity Necklace",ear1="Hecate's Earring",ear2="Mendi. Earring",
		body=gear.telchine_whitewind_body,hands=gear.telchine_whitewind_hands,ring1="Kunaji Ring",ring2="Meridian Ring",
		back=gear.nuke_jse_back,waist="Eschan Stone",legs=gear.telchine_whitewind_legs,feet=gear.telchine_whitewind_feet}

	--Overwrite certain spells with these peices even if the day matches, because of resource inconsistancies.
	sets.NonElementalCure = {back="Tempered Cape +1",waist="Luminary Sash"}

	sets.midcast['Blue Magic'].SkillBasedBuff = {ammo="Staunch Tathlum",
		head="Telchine Cap",neck="Mirage Stole",ear1="Ethereal Earring",ear2="Mendi. Earring",
		body="Assim. Jubbah +2",hands="Jhakri Cuffs +2",ring1="Jhakri Ring",ring2="Defending Ring",
		back="Cornflower Cape",waist="Flume Belt +1",legs="Hashishin Tayt +1",feet="Carmine Greaves"}

	sets.midcast['Blue Magic'].Buff = {ammo="Staunch Tathlum",
		head="Telchine Cap",neck="Sanctity Necklace",ear1="Ethereal Earring",ear2="Mendi. Earring",
		body="Assim. Jubbah +2",hands="Telchine Gloves",ring1="Jhakri Ring",ring2="Defending Ring",
		back="Cornflower Cape",waist="Flume Belt +1",legs="Carmine Cuisses +1",feet="Carmine Greaves"}

	sets.midcast['Blue Magic']['Battery Charge'] = set_combine(sets.midcast['Blue Magic'].Buff, {
		--head="Amalric Coif +1",
		--back="Grapevine Cape",
		waist="Gishdubar Sash"
	})

	sets.midcast['Blue Magic']['Carcharian Verve'] = set_combine(sets.midcast['Blue Magic'].Buff, {
		--head="Amalric Coif +1",
		--hands="Regal Cuffs",
		--waist="Emphatikos Rope",
		--legs="Shedir Seraweels"
	})

	-- Sets to return to when not performing an action.

	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.latent_refresh_grip = {sub="Oneiros Grip"}
	sets.DayIdle = {}
	sets.NightIdle = {}

	-- Gear for learning spells: +skill and AF hands.
	sets.Learning = {hands="Assim. Bazu. +2"}

	-- Resting sets
	sets.resting = {ammo="Staunch Tathlum",
		head="Rawhide Mask",neck="Sanctity Necklace",ear1="Ethereal Earring",ear2="Etiolation Earring",
		body="Jhakri Robe +2",hands=gear.herculean_refresh_hands,ring1="Paguroidea Ring",ring2="Defending Ring",
		back=gear.stp_jse_back,waist="Flume Belt +1",legs="Malignance Tights",feet="Malignance Boots"}

	-- Idle sets
	sets.idle = {ammo="Staunch Tathlum",
		head="Rawhide Mask",neck="Sanctity Necklace",ear1="Ethereal Earring",ear2="Etiolation Earring",
		body="Jhakri Robe +2",hands=gear.herculean_refresh_hands,ring1="Gelatinous Ring +1",ring2="Defending Ring",
		back=gear.stp_jse_back,waist="Flume Belt +1",legs=gear.herculean_refresh_legs,feet=gear.herculean_refresh_feet}

	sets.idle.Sphere = set_combine(sets.idle, {body="Mekosu. Harness"})

	sets.idle.PDT = {ammo="Staunch Tathlum",
		head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Etiolation Earring",
		body="Ayanmo Corazza +2",hands="Malignance Gloves",ring1="Gelatinous Ring +1",ring2="Defending Ring",
		back=gear.stp_jse_back,waist="Flume Belt +1",legs="Malignance Tights",feet="Malignance Boots"}

	sets.idle.DTHippo = set_combine(sets.idle.PDT, {legs="Carmine Cuisses +1",feet="Hippo. Socks +1"})

	-- Defense sets
	sets.defense.PDT = {ammo="Staunch Tathlum",
		head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Etiolation Earring",
		body="Ayanmo Corazza +2",hands="Malignance Gloves",ring1="Gelatinous Ring +1",ring2="Defending Ring",
		back=gear.stp_jse_back,waist="Flume Belt +1",legs="Malignance Tights",feet="Malignance Boots"}

	sets.defense.MDT = {ammo="Staunch Tathlum",
		head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Etiolation Earring",
		body="Ayanmo Corazza +2",hands="Malignance Gloves",ring1="Paguroidea Ring",ring2="Defending Ring",
		back=gear.stp_jse_back,waist="Flume Belt +1",egs="Malignance Tights",feet="Malignance Boots"}

	sets.defense.MEVA = {ammo="Staunch Tathlum",
		head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Etiolation Earring",
		body="Assim. Jubbah +2",hands="Malignance Gloves",ring1="Paguroidea Ring",ring2="Defending Ring",
		back=gear.stp_jse_back,waist="Flume Belt +1",legs="Malignance Tights",feet="Malignance Boots"}

	sets.defense.NukeLock = sets.midcast['Blue Magic'].Magical

	sets.Kiting = {legs="Carmine Cuisses +1"}

	-- Extra Melee sets.  Apply these on top of melee sets.
	sets.Knockback = {}
	sets.MP = {waist="Flume Belt +1",ear1="Suppanomimi", ear2="Ethereal Earring"}
	sets.MP_Knockback = {}
	sets.SuppaBrutal = {ear1="Suppanomimi", ear2="Brutal Earring"}
	sets.DWEarrings = {ear1="Dudgeon Earring",ear2="Heartseeker Earring"}
	sets.DWMax = {ear1="Dudgeon Earring",ear2="Heartseeker Earring",body="Adhemar Jacket +1",waist="Reiki Yotai",legs="Carmine Cuisses +1"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})

	-- Weapons sets
	sets.weapons.Tizalmace = {main="Naegling",sub="Machaera +2"}
	sets.weapons.Tizbron = {main="Tizona",sub="Machaera +2"}
	sets.weapons.MeleeClubs = {main="Nehushtan",sub="Nehushtan"}
	sets.weapons.ProcWeapon = {main="Machaera +2",sub="Gramk's Axe"}
	sets.weapons.Almace = {main="Tanmogayi +1",sub="Machaera +2"}
	sets.weapons.Sequence = {main="Sequence",sub="Almace"}
	sets.weapons.Kaja = {main="Naegling",sub="Colada"}
	sets.weapons.MagicWeapons = {main="Kaja Rod",sub="Nibiru Cudgel"}
	sets.weapons.MaccWeapons = {main="Iris",sub="Iris"}
	sets.weapons.HybridWeapons = {main="Vampirism",sub="Vampirism"}

	-- Engaged sets

	sets.engaged = {ammo="Ginsen",
		head="Adhemar Bonnet +1",neck="Mirage Stole",ear1="Brutal Earring",ear2="Suppanomimi",
		body="Adhemar Jacket +1",hands="Adhemar Wrist. +1",ring1="Petrov Ring",ring2="Epona's Ring",
		back=gear.stp_jse_back,waist="Kentarch Belt +1",legs=gear.herculean_ta_legs,feet=gear.herculean_ta_feet}

	sets.engaged.AM = {ammo="Ginsen",
		head="Adhemar Bonnet +1",neck="Mirage Stole",ear1="Brutal Earring",ear2="Suppanomimi",
		body="Adhemar Jacket +1",hands="Adhemar Wrist. +1",ring1="Petrov Ring",ring2="Epona's Ring",
		back=gear.stp_jse_back,waist="Kentarch Belt +1",legs=gear.herculean_ta_legs,feet=gear.herculean_ta_feet}


	sets.engaged.Acc = {ammo="Ginsen",
		head="Adhemar Bonnet +1",neck="Mirage Stole",ear1="Brutal Earring",ear2="Suppanomimi",
		body="Adhemar Jacket +1",hands="Adhemar Wrist. +1",ring1="Petrov Ring",ring2="Epona's Ring",
		back=gear.stp_jse_back,waist="Kentarch Belt +1",legs=gear.herculean_ta_legs,feet="Malignance Boots"}

	sets.engaged.Acc.AM = {ammo="Ginsen",
		head="Adhemar Bonnet +1",neck="Mirage Stole",ear1="Brutal Earring",ear2="Suppanomimi",
		body="Adhemar Jacket +1",hands="Adhemar Wrist. +1",ring1="Petrov Ring",ring2="Epona's Ring",
		back=gear.stp_jse_back,waist="Kentarch Belt +1",legs=gear.herculean_ta_legs,feet="Malignance Boots"}

	sets.engaged.FullAcc = {ammo="Ginsen",
		head="Adhemar Bonnet +1",neck="Mirage Stole",ear1="Brutal Earring",ear2="Suppanomimi",
		body="Adhemar Jacket +1",hands="Adhemar Wrist. +1",ring1="Petrov Ring",ring2="Epona's Ring",
		back=gear.stp_jse_back,waist="Kentarch Belt +1",legs="Carmine Cuisses +1",feet="Malignance Boots"}

	sets.engaged.FullAcc.AM = {ammo="Ginsen",
		head="Adhemar Bonnet +1",neck="Mirage Stole",ear1="Brutal Earring",ear2="Suppanomimi",
		body="Adhemar Jacket +1",hands="Adhemar Wrist. +1",ring1="Petrov Ring",ring2="Epona's Ring",
		back=gear.stp_jse_back,waist="Kentarch Belt +1",legs="Carmine Cuisses +1",feet="Malignance Boots"}

	sets.engaged.Fodder = {ammo="Ginsen",
		head="Adhemar Bonnet +1",neck="Mirage Stole",ear1="Brutal Earring",ear2="Suppanomimi",
		body="Adhemar Jacket +1",hands="Adhemar Wrist. +1",ring1="Petrov Ring",ring2="Epona's Ring",
		back=gear.stp_jse_back,waist="Kentarch Belt +1",legs=gear.herculean_ta_legs,feet=gear.herculean_ta_feet}

	sets.engaged.Fodder.AM = {ammo="Ginsen",
		head="Adhemar Bonnet +1",neck="Mirage Stole",ear1="Brutal Earring",ear2="Suppanomimi",
		body="Adhemar Jacket +1",hands="Adhemar Wrist. +1",ring1="Petrov Ring",ring2="Epona's Ring",
		back=gear.stp_jse_back,waist="Kentarch Belt +1",legs=gear.herculean_ta_legs,feet=gear.herculean_ta_feet}

	sets.engaged.DT = {ammo="Ginsen",
		head="Malignance Chapeau",neck="Mirage Stole",ear1="Brutal Earring",ear2="Suppanomimi",
		body="Ayanmo Corazza +2",hands="Malignance Gloves",ring1="Petrov Ring",ring2="Defending Ring",
		back=gear.stp_jse_back,waist="Kentarch Belt +1",legs="Malignance Tights",feet="Malignance Boots"}

	sets.engaged.DT.AM = {main="Tizona",sub="Almace",ammo="Aurgelmir Orb +1",
		head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Cessance Earring",ear2="Brutal Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Petrov Ring",
		back=gear.stp_jse_back,waist="Reiki Yotai",legs="Malignance Tights",feet="Malignance Boots"}

	sets.engaged.Acc.DT = {main="Tizona",sub="Almace",ammo="Falcon Eye",
		head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Cessance Earring",ear2="Telos Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Ilabrat Ring",
		back=gear.da_jse_back,waist="Reiki Yotai",legs="Malignance Tights",feet="Malignance Boots"}

	sets.engaged.Acc.DT.AM = {main="Tizona",sub="Almace",ammo="Falcon Eye",
		head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Digni. Earring",ear2="Telos Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Ilabrat Ring",
		back=gear.stp_jse_back,waist="Reiki Yotai",legs="Malignance Tights",feet="Malignance Boots"}

	sets.engaged.FullAcc.DT = {main="Tizona",sub="Almace",ammo="Falcon Eye",
		head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Mache Earring +1",ear2="Odr Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Ramuh Ring +1",
		back=gear.da_jse_back,waist="Reiki Yotai",legs="Malignance Tights",feet="Malignance Boots"}

	sets.engaged.Fodder.DT = {
		--main="Tizona",sub="Almace",ammo="Aurgelmir Orb +1",
		--head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Cessance Earring",ear2="Brutal Earring",
		--body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Petrov Ring",
		--back=gear.da_jse_back,waist="Reiki Yotai",legs="Malignance Tights",feet="Malignance Boots"
		ammo="Ginsen",
		head="Malignance Chapeau",neck="Mirage Stole",ear1="Brutal Earring",ear2="Suppanomimi",
		body="Ayanmo Corazza +2",hands="Adhemar Wrist. +1",ring1="Petrov Ring",ring2="Defending Ring",
		back=gear.stp_jse_back,waist="Kentarch Belt +1",legs="Malignance Tights",feet="Malignance Boots"}

	sets.engaged.Fodder.DT.AM = {main="Tizona",sub="Almace",ammo="Aurgelmir Orb +1",
		head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Cessance Earring",ear2="Telos Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Petrov Ring",
		back=gear.stp_jse_back,waist="Reiki Yotai",legs="Malignance Tights",feet="Malignance Boots"}

	sets.Self_Healing = {
		--neck="Phalaina Locket",
		--hands="Buremte Gloves",
		--legs="Gyve Trousers",
		ring2="Kunaji Ring",
		waist="Gishdubar Sash"
	}
	sets.Cure_Received = {
		--neck="Phalaina Locket",
		--hands="Buremte Gloves",
		ring2="Kunaji Ring",
		waist="Gishdubar Sash"
	}
	sets.Self_Refresh = {
		--back="Grapevine Cape",
		waist="Gishdubar Sash"
	}
	sets.MagicBurst = {
		body="Samnuha Coat",
		--hands="Amalric Gages +1",
		--ring1="Mujin Band",
		--ring2="Locus Ring"
	}
	sets.Phalanx_Received = {hands=gear.herculean_phalanx_hands,feet=gear.herculean_nuke_feet}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	-- Default macro set/book
	if player.sub_job == 'DNC' then
		set_macro_page(1, 3)
	elseif player.sub_job == 'NIN' then
		set_macro_page(1, 3)
	elseif player.sub_job == 'WAR' then
		set_macro_page(1, 3)
	elseif player.sub_job == 'RUN' then
		set_macro_page(1, 3)
	elseif player.sub_job == 'THF' then
		set_macro_page(1, 3)
	elseif player.sub_job == 'RDM' then
		set_macro_page(1, 3)
	else
		set_macro_page(1, 3)
	end
end

function user_job_lockstyle()
	if player.sub_job == 'NIN' or player.sub_job == 'DNC' then
		if player.equipment.main == nil or player.equipment.main == 'empty' then
			windower.chat.input('/lockstyleset 2')
		elseif res.items[item_name_to_id(player.equipment.main)].skill == 3 then --Sword in main hand.
			if res.items[item_name_to_id(player.equipment.sub)].skill == 3 then --Sword/Sword.
				windower.chat.input('/lockstyleset 2')
			elseif res.items[item_name_to_id(player.equipment.sub)].skill == 2 then --Sword/Dagger.
				windower.chat.input('/lockstyleset 2')
			elseif res.items[item_name_to_id(player.equipment.sub)].skill == 11 then --Sword/Club.
				windower.chat.input('/lockstyleset 2')
			else
				windower.chat.input('/lockstyleset 2') --Catchall
			end
		elseif res.items[item_name_to_id(player.equipment.main)].skill == 2 then --Dagger in main hand.
			if res.items[item_name_to_id(player.equipment.sub)].skill == 3 then --Dagger/Sword.
				windower.chat.input('/lockstyleset 2')
			elseif res.items[item_name_to_id(player.equipment.sub)].skill == 2 then --Dagger/Dagger.
				windower.chat.input('/lockstyleset 2')
			elseif res.items[item_name_to_id(player.equipment.sub)].skill == 11 then --Dagger/Club.
				windower.chat.input('/lockstyleset 2')
			else
				windower.chat.input('/lockstyleset 2') --Catchall
			end
		elseif res.items[item_name_to_id(player.equipment.main)].skill == 11 then --Club in main hand.
			if res.items[item_name_to_id(player.equipment.sub)].skill == 3 then --Club/Sword.
				windower.chat.input('/lockstyleset 2')
			elseif res.items[item_name_to_id(player.equipment.sub)].skill == 2 then --Club/Dagger.
				windower.chat.input('/lockstyleset 2')
			elseif res.items[item_name_to_id(player.equipment.sub)].skill == 11 then --Club/Club.
				windower.chat.input('/lockstyleset 2')
			else
				windower.chat.input('/lockstyleset 2') --Catchall
			end
		end
	elseif player.sub_job == 'WHM' or state.Buff['Light Arts'] or state.Buff['Addendum: White'] then
		windower.chat.input('/lockstyleset 2')
	elseif player.sub_job == 'BLM' or state.Buff['Dark Arts'] or state.Buff['Addendum: Black'] then
		windower.chat.input('/lockstyleset 2')
	else
		windower.chat.input('/lockstyleset 2')
	end
end

buff_spell_lists = {
	Auto = {--Options for When are: Always, Engaged, Idle, OutOfCombat, Combat
		{Name='Erratic Flutter',	Buff='Haste',			SpellID=710,	When='Always'},
		{Name='Battery Charge',		Buff='Refresh',			SpellID=662,	When='Idle'},
		{Name='Refresh',			Buff='Refresh',			SpellID=109,	When='Idle'},
		{Name='Nat. Meditation',	Buff='Attack Boost',	SpellID=700,	When='Engaged'},
		--{Name='Mighty Guard',		Buff='Mighty Guard',	SpellID=750,	When='Combat'},
	},
	
	Default = {
		{Name='Erratic Flutter',	Buff='Haste',			SpellID=710,	Reapply=false},
		{Name='Battery Charge',		Buff='Refresh',			SpellID=662,	Reapply=false},
		{Name='Refresh',			Buff='Refresh',			SpellID=109,	Reapply=false},
		{Name='Phalanx',			Buff='Phalanx',			SpellID=106,	Reapply=false},
		{Name='Barrier Tusk',		Buff='Phalanx',			SpellID=685,	Reapply=false},
		{Name='Stoneskin',			Buff='Stoneskin',		SpellID=54,		Reapply=false},
		{Name='Occultation',		Buff='Blink',			SpellID=679,	Reapply=false},
		{Name='Blink',				Buff='Blink',			SpellID=53,		Reapply=false},
		{Name='Mighty Guard',		Buff='Mighty Guard',	SpellID=750,	Reapply=false},
		{Name='Nat. Meditation',	Buff='Attack Boost',	SpellID=700,	Reapply=false},
	},
	
	Cleave = {
		{Name='Erratic Flutter',	Buff='Haste',			SpellID=710,	Reapply=false},
		{Name='Battery Charge',		Buff='Refresh',			SpellID=662,	Reapply=false},
		{Name='Barrier Tusk',		Buff='Phalanx',			SpellID=685,	Reapply=true},
		{Name='Diamondhide',		Buff='Stoneskin',		SpellID=632,	Reapply=true},
		{Name='Occultation',		Buff='Blink',			SpellID=679,	Reapply=true},
		{Name='Carcharian Verve',	Buff='Aquaveil',		SpellID=745,	Reapply=false},
		{Name='Reactor Cool',		Buff='Defense Boost',	SpellID=613,	Reapply=true},
	},

	Lilith = {
		{Name='Erratic Flutter',	Buff='Haste',				SpellID=710,	Reapply=true},
		{Name='Battery Charge',		Buff='Refresh',				SpellID=662,	Reapply=true},
		{Name='Saline Coat',		Buff='Magic Def. Boost',	SpellID=614,	Reapply=false},
		{Name='Barrier Tusk',		Buff='Phalanx',				SpellID=685,	Reapply=false},
		{Name='Cocoon',				Buff='Defense Boost',		SpellID=547,	Reapply=false},
	},
}
