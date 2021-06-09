-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_job_setup()
    state.OffenseMode:options('Normal','Acc')
    state.RangedMode:options('Normal', 'Acc')
    state.WeaponskillMode:options('Match','Normal', 'Acc','Proc')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT', 'Refresh')
    state.HybridMode:options('Normal','DT')
    state.ExtraMeleeMode = M{['description']='Extra Melee Mode', 'None', 'DWMax'}
    state.Weapons:options('Default','DualWeapons','DualSavageWeapons','DualLeadenRanged','DualLeadenMelee','DualAeolian','DualLeadenMeleeAcc','DualRanged','None')
    state.CompensatorMode:options('Always','300','1000','Never')

    autows = 'Savage Blade'
    autofood = 'Grape Daifuku'

    gear.RAbullet = "Chrono Bullet"
    gear.WSbullet = "Chrono Bullet"
    gear.MAbullet = "Orichalc. Bullet" --For MAB WS, do not put single-use bullets here.
    gear.QDbullet = "Animikii Bullet"
    options.ammo_warning_limit = 10

    gear.tp_ranger_jse_back = {name="Camulus's Mantle",augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','"Store TP"+10'}}
    gear.snapshot_jse_back = {name="Camulus's Mantle", augments={'INT+20','Eva.+20 /Mag. Eva.+20','"Snapshot"+10'}}
    gear.tp_jse_back = {name="Camulus's Mantle",augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%'}}
    gear.ranger_wsd_jse_back = {name="Camulus's Mantle",augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%'}}
    gear.magic_wsd_jse_back = {name="Camulus's Mantle",augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%'}}
    gear.str_wsd_jse_back = {name="Camulus's Mantle",augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Mag. Evasion+15'}}

    -- Additional local binds
    send_command('bind ^` gs c cycle ElementalMode')
    send_command('bind !` gs c elemental quickdraw')

    send_command('bind ^backspace input /ja "Double-up" <me>')
    send_command('bind @backspace input /ja "Snake Eye" <me>')
    send_command('bind !backspace input /ja "Fold" <me>')
    send_command('bind ^@!backspace input /ja "Crooked Cards" <me>')

    send_command('bind ^\\\\ input /ja "Random Deal" <me>')
    send_command('bind !\\\\ input /ja "Bolter\'s Roll" <me>')
    send_command('bind ^@!\\\\ gs c toggle LuzafRing')
    send_command('bind @f7 gs c toggle RngHelper')

    send_command('bind !r gs c weapons DualSavageWeapons;gs c update')
    send_command('bind ^q gs c weapons DualAeolian;gs c update')
    send_command('bind @q gs c weapons DualKustawi;gs c update')
    send_command('bind !q gs c weapons DualLeadenRanged;gs c update')
    send_command('bind @pause roller roll')

    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    -- Precast Sets

    -- Precast sets to enhance JAs

    sets.precast.JA['Triple Shot'] = {body="Chasseur's Frac +1"}
    sets.precast.JA['Snake Eye'] = {legs="Lanun Trews"}
    sets.precast.JA['Wild Card'] = {feet="Lanun Bottes +2"}
    sets.precast.JA['Random Deal'] = {body="Lanun Frac +3"}
    sets.precast.FoldDoubleBust = {hands="Lanun Gants +1"}

    sets.precast.CorsairRoll = {main="Lanun Knife",
        head="Lanun Tricorne +1",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Odnowa Earring",
        body="Meg. Cuirie +2",hands="Chasseur's Gants +1",ring1="Barataria Ring",ring2="Defending Ring",
        back=gear.snapshot_jse_back,waist="Flume Belt +1",legs="Malignance Tights",feet="Malignance Boots"}

    sets.precast.LuzafRing = {ring2="Luzaf's Ring"}

    sets.precast.CorsairRoll["Caster's Roll"] = set_combine(sets.precast.CorsairRoll, {legs="Chas. Culottes"})
    sets.precast.CorsairRoll["Courser's Roll"] = set_combine(sets.precast.CorsairRoll, {feet="Chass. Bottes +1"})
    sets.precast.CorsairRoll["Blitzer's Roll"] = set_combine(sets.precast.CorsairRoll, {head="Chass. Tricorne"})
    sets.precast.CorsairRoll["Tactician's Roll"] = set_combine(sets.precast.CorsairRoll, {body="Chasseur's Frac +1"})
    sets.precast.CorsairRoll["Allies' Roll"] = set_combine(sets.precast.CorsairRoll, {hands="Chasseur's Gants +1"})

    sets.precast.CorsairShot = {ammo=gear.QDbullet,
        head="Mummu Bonnet +1",neck="Comm. Charm +1",ear1="Friomisi Earring",ear2="Hecate's Earring",
        body="Lanun Frac +3",hands="Carmine Fin. Ga. +1",ring1="Mummu Ring",ring2="Dingir Ring",
        back=gear.magic_wsd_jse_back,waist="K. Kachina Belt +1",legs=gear.herculean_nuke_legs,feet="Chass. Bottes +1"}

    sets.precast.CorsairShot.Damage = {ammo=gear.QDbullet,
        head="Mummu Bonnet +1",neck="Comm. Charm +1",ear1="Friomisi Earring",ear2="Hecate's Earring",
        body="Lanun Frac +3",hands="Carmine Fin. Ga. +1",ring1="Mummu Ring",ring2="Dingir Ring",
        back=gear.magic_wsd_jse_back,waist="K. Kachina Belt +1",legs=gear.herculean_nuke_legs,feet="Chass. Bottes +1"}

    sets.precast.CorsairShot.Proc = {ammo=gear.RAbullet,
        head="Wh. Rarab Cap +1",neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Sanare Earring",
        body="Emet Harness +1",hands="Malignance Gloves",ring1="Defending Ring",ring2="Dark Ring",
        back="Moonlight Cape",waist="Flume Belt +1",legs="Carmine Cuisses +1",feet="Chass. Bottes +1"}

    sets.precast.CorsairShot['Light Shot'] = {ammo=gear.QDbullet,
        head="Malignance Chapeau",neck="Comm. Charm +1",ear1="Digni. Earring",ear2="Gwati Earring",
        body="Mummu Jacket +2",hands="Laksa. Gants +2",ring1="Mummu Ring",ring2="Stikini Ring",
        back=gear.magic_wsd_jse_back,waist="K. Kachina Belt +1",legs="Malignance Tights",feet="Laksa. Bottes  +2"}

    sets.precast.CorsairShot['Dark Shot'] = set_combine(sets.precast.CorsairShot['Light Shot'], {feet="Chass. Bottes +1"})

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {
        head="Carmine Mask +1",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Sanare Earring",
        body=gear.herculean_waltz_body,hands=gear.herculean_waltz_hands,ring1="Defending Ring",ring2="Valseur's Ring",
        back="Moonlight Cape",waist="Flume Belt +1",legs="Dashing Subligar",feet=gear.herculean_waltz_feet}

    sets.Self_Waltz = {head="Mummu Bonnet +2",body="Passion Jacket",ring1="Asklepian Ring"}

    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Fast cast sets for spells

    sets.precast.FC = {
        head=gear.herculean_wsd_head,neck="Voltsurge Torque",ear1="Etiolation Earring",ear2="Loquac. Earring",
        body="Adhemar Jacket",hands="Leyline Gloves",ring1="Rahab Ring",ring2="Kishar Ring",
        legs="Rawhide Trousers",feet="Carmine Greaves"}

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads",body="Passion Jacket"})

    sets.precast.FC.Cure = set_combine(sets.precast.FC, {ear2="Mendi. Earring"})

    sets.precast.RA = {ammo=gear.RAbullet,
        head="Chass. Tricorne",neck="Comm. Charm +1",ear1="Neritic Earring",ear2="Odnowa Earring",
        body="Oshosi Vest",hands="Carmine Fin. Ga. +1",ring1="Paguroidea Ring",ring2="Dingir Ring",
        back=gear.snapshot_jse_back,waist="Impulse Belt",legs="Adhemar Kecks",feet="Meg. Jam. +2"}

    sets.precast.RA.Flurry = set_combine(sets.precast.RA, {body="Laksa. Frac +2"})
    sets.precast.RA.Flurry2 = set_combine(sets.precast.RA, {})


    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {ammo=gear.WSbullet,
        head="Meghanada Visor +2",neck="Comm. Charm +1",ear1="Ishvara Earring",ear2="Moonshade Earring",
        body="Laksa. Frac +2",hands="Meg. Gloves +2",ring1="Karieyh Ring",ring2="Dingir Ring",
        back=gear.tp_ranger_jse_back,waist="Fotia Belt",legs="Meg. Chausses +2",feet="Lanun Bottes +2"}

    sets.precast.WS.Acc = {ammo=gear.WSbullet,
        head="Meghanada Visor +2",neck="Comm. Charm +1",ear1="Neritic Earring",ear2="Moonshade Earring",
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Mummu Ring",ring2="Dingir Ring",
        back=gear.tp_ranger_jse_back,waist="K. Kachina Belt +1",legs="Meg. Chausses +2",feet="Meg. Jam. +2"}

    sets.precast.WS.Proc = {
        head="Carmine Mask +1",neck="Combatant's Torque",ear1="Digni. Earring",ear2="Mache Earring +1",
        body="Mummu Jacket +2",hands="Floral Gauntlets",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
        back=gear.tp_jse_back,waist="Olseni Belt",legs="Carmine Cuisses +1",feet="Malignance Boots"}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.

    sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {
        head="Meghanada Visor +2",neck="Lissome Necklace",ear1="Lifestorm Earring",ear2="Moonshade Earring",
        body="Lanun Frac +3",hands="Meg. Gloves +2",ring1="Karieyh Ring",ring2="Rufescent Ring",
        back=gear.str_wsd_jse_back,waist="Fotia Belt",legs="Meg. Chausses +2",feet="Carmine Greaves"})

    sets.precast.WS['Savage Blade'] = {
        head=gear.herculean_wsd_head,neck="Comm. Charm +1",ear1="Ishvara Earring",ear2="Moonshade Earring",
        body="Laksa. Frac +2",hands="Meg. Gloves +2",ring1="Karieyh Ring",ring2="Rufescent Ring",
        back=gear.str_wsd_jse_back,waist="Fotia Belt",legs=gear.herculean_wsd_legs,feet="Lanun Bottes +2"}

    sets.precast.WS['Savage Blade'].Acc = {
        head=gear.herculean_wsd_head,neck="Comm. Charm +1",ear1="Ishvara Earring",ear2="Moonshade Earring",
        body="Laksa. Frac +2",hands="Meg. Gloves +2",ring1="Karieyh Ring",ring2="Rufescent Ring",
        back=gear.str_wsd_jse_back,waist="Fotia Belt",legs=gear.herculean_wsd_legs,feet="Lanun Bottes +2"}

    sets.precast.WS['Last Stand'] = {ammo=gear.WSbullet,
        head="Meghanada Visor +2",neck="Comm. Charm +1",ear1="Ishvara Earring",ear2="Moonshade Earring",
        body="Laksa. Frac +2",hands="Meg. Gloves +2",ring1="Karieyh Ring",ring2="Dingir Ring",
        back=gear.ranger_wsd_jse_back,waist="Fotia Belt",legs="Meg. Chausses +2",feet="Lanun Bottes +2"}

    sets.precast.WS['Last Stand'].Acc = {ammo=gear.WSbullet,
        head="Meghanada Visor +2",neck="Comm. Charm +1",ear1="Ishvara Earring",ear2="Moonshade Earring",
        body="Laksa. Frac +2",hands="Meg. Gloves +2",ring1="Mummu Ring",ring2="Dingir Ring",
        back=gear.ranger_wsd_jse_back,waist="Fotia Belt",legs="Meg. Chausses +2",feet="Lanun Bottes +2"}

    sets.precast.WS['Detonator'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Detonator'].Acc = sets.precast.WS['Last Stand'].Acc
    sets.precast.WS['Slug Shot'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Slug Shot'].Acc = sets.precast.WS['Last Stand'].Acc
    sets.precast.WS['Numbing Shot'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Numbing Shot'].Acc = sets.precast.WS['Last Stand'].Acc
    sets.precast.WS['Sniper Shot'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Sniper Shot'].Acc = sets.precast.WS['Last Stand'].Acc
    sets.precast.WS['Split Shot'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Split Shot'].Acc = sets.precast.WS['Last Stand'].Acc

    sets.precast.WS['Leaden Salute'] = {ammo=gear.MAbullet,
        head="Pixie Hairpin +1",neck="Comm. Charm +1",ear1="Friomisi Earring",ear2="Moonshade Earring",
        body="Lanun Frac +3",hands="Carmine Fin. Ga. +1",ring1="Archon Ring",ring2="Dingir Ring",
        back=gear.magic_wsd_jse_back,waist="Svelt. Gouriz +1",legs=gear.herculean_nuke_legs,feet="Lanun Bottes +2"}

    sets.precast.WS['Aeolian Edge'] = {ammo="Animikii Bullet",
        head="Mummu Bonnet +1",neck="Comm. Charm +1",ear1="Friomisi Earring",ear2="Moonshade Earring",
        body="Lanun Frac +3",hands="Carmine Fin. Ga. +1",ring1="Mummu Ring",ring2="Dingir Ring",
        back=gear.magic_wsd_jse_back,waist="Svelt. Gouriz +1",legs=gear.herculean_nuke_legs,feet="Lanun Bottes +2"}

    sets.precast.WS['Wildfire'] = {ammo=gear.MAbullet,
        head=gear.herculean_wsd_head,neck="Comm. Charm +1",ear1="Friomisi Earring",ear2="Moonshade Earring",
        body="Lanun Frac +3",hands="Carmine Fin. Ga. +1",ring1="Mummu Ring",ring2="Dingir Ring",
        back=gear.magic_wsd_jse_back,waist="Svelt. Gouriz +1",legs=gear.herculean_nuke_legs,feet="Lanun Bottes +2"}

    sets.precast.WS['Wildfire'].Acc = {ammo=gear.MAbullet,
        head=gear.herculean_wsd_head,neck="Comm. Charm +1",ear1="Friomisi Earring",ear2="Moonshade Earring",
        body="Lanun Frac +3",hands="Carmine Fin. Ga. +1",ring1="Mummu Ring",ring2="Dingir Ring",
        back=gear.magic_wsd_jse_back,waist="Svelt. Gouriz +1",legs=gear.herculean_nuke_legs,feet="Lanun Bottes +2"}

    sets.precast.WS['Hot Shot'] = sets.precast.WS['Wildfire']
    sets.precast.WS['Hot Shot'].Acc = sets.precast.WS['Wildfire'].Acc

    --Because omen skillchains.
    sets.precast.WS['Burning Blade'] = {ammo=gear.RAbullet,
        head="Meghanada Visor +2",neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Sanare Earring",
        body="Meg. Cuirie +2",hands="Malignance Gloves",ring1="Defending Ring",ring2="Dark Ring",
        back="Moonlight Cape",waist="Flume Belt +1",legs="Meg. Chausses +2",feet="Meg. Jam. +2"}

    -- Swap to these on Moonshade using WS if at 3000 TP
    sets.MaxTP = {}
    sets.AccMaxTP = {}

    -- Midcast Sets
    sets.midcast.FastRecast = {
        head="Carmine Mask +1",neck="Baetyl Pendant",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
        body="Dread Jupon",hands="Leyline Gloves",ring1="Kishar Ring",ring2="Lebeche Ring",
        back="Moonlight Cape",waist="Flume Belt +1",legs="Rawhide Trousers",feet="Carmine Greaves"}

    -- Specific spells

    sets.midcast.Cure = {
        head="Carmine Mask +1",neck="Phalaina Locket",ear1="Enchntr. Earring +1",ear2="Mendi. Earring",
        body="Dread Jupon",hands="Leyline Gloves",ring1="Janniston Ring",ring2="Lebeche Ring",
        back="Solemnity Cape",waist="Flume Belt +1",legs="Carmine Cuisses +1",feet="Carmine Greaves +1"}

    sets.Self_Healing = {
        --neck="Phalaina Locket",
        --hands="Buremte Gloves",
        ring2="Kunaji Ring",
        waist="Gishdubar Sash"
    }
    sets.Cure_Received = {
        --neck="Phalaina Locket",
        --hands="Buremte Gloves",
        ring2="Kunaji Ring",
        waist="Gishdubar Sash"
    }
    sets.Self_Refresh = {waist="Gishdubar Sash"}

    sets.midcast.Utsusemi = sets.midcast.FastRecast

    -- Ranged gear
    sets.midcast.RA = {
        head="Malignance Chapeau",neck="Ocachi Gorget",ear1="Neritic Earring",ear2="Enervating Earring",
        body="Laksa. Frac +2",hands="Malignance Gloves",ring1="Mummu Ring",ring2="Dingir Ring",
        back=gear.tp_ranger_jse_back,waist="K. Kachina Belt +1",legs="Malignance Tights",feet="Malignance Boots"}

    sets.midcast.RA.Acc = {neck="Comm. Charm +1"}

    sets.buff['Triple Shot'] = {
        head="Oshosi Mask",neck="Ocachi Gorget",ear1="Neritic Earring",ear2="Enervating Earring",
        body="Chasseur's Frac +1",hands="Oshosi Gloves",ring1="Mummu Ring",ring2="Dingir Ring",
        back=gear.tp_ranger_jse_back,waist="K. Kachina Belt +1",legs="Oshosi Trousers",feet="Oshosi Leggings"}

    -- Sets to return to when not performing an action.

    sets.DayIdle = {}
    sets.NightIdle = {}

    sets.buff.Doom = set_combine(sets.buff.Doom, {})

    -- Resting sets
    sets.resting = {}


    -- Idle sets
    sets.idle = {
        head="Meghanada Visor +2",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Odnowa Earring",
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Paguroidea Ring",ring2="Defending Ring",
        back=gear.tp_jse_back,waist="Flume Belt +1",legs="Malignance Tights",feet="Malignance Boots"}

    sets.idle.PDT = {
        head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Odnowa Earring",
        body="Meg. Cuirie +2",hands="Malignance Gloves",ring1="Gelatinous Ring +1",ring2="Defending Ring",
        back=gear.tp_jse_back,waist="Flume Belt +1",legs="Malignance Tights",feet="Malignance Boots"}

    sets.idle.Refresh = {}

    -- Defense sets
    sets.defense.PDT = {
        head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Odnowa Earring",
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Paguroidea Ring",ring2="Defending Ring",
        back=gear.tp_jse_back,waist="Flume Belt +1",legs="Malignance Tights",feet="Malignance Boots"}

    sets.defense.MDT = {
        head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Odnowa Earring",
        body="Meg. Cuirie +2",hands="Malignance Gloves",ring1="Gelatinous Ring +1",ring2="Defending Ring",
        back=gear.tp_jse_back,waist="Flume Belt +1",legs="Malignance Tights",feet="Malignance Boots"}

    sets.defense.MEVA = {
        head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Odnowa Earring",
        body="Meg. Cuirie +2",hands="Malignance Gloves",ring1="Paguroidea Ring",ring2="Defending Ring",
        back=gear.tp_jse_back,waist="Flume Belt +1",legs="Malignance Tights",feet="Malignance Boots"}

    sets.Kiting = {legs="Carmine Cuisses +1"}
    sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
    sets.DWMax = {
        --ear1="Dudgeon Earring",
        --ear2="Heartseeker Earring",
        body="Adhemar Jacket +1",
        hands="Floral Gauntlets",
        --waist="Reiki Yotai"
    }

    -- Weapons sets
    sets.weapons.Default = {main="Naegling",sub="Blurred Knife +1",range="Anarchy +2"}
    sets.weapons.DualWeapons = {main="Naegling",sub="Blurred Knife +1",range="Fomalhaut"}
    sets.weapons.DualSavageWeapons = {main="Naegling",sub="Blurred Knife +1",range="Anarchy +2"}
    sets.weapons.DualLeadenRanged = {main="Naegling",sub="Tauret",range="Molybdosis"}
    sets.weapons.DualLeadenMelee = {main="Naegling",sub="Blurred Knife +1",range="Fomalhaut"}
    sets.weapons.DualAeolian = {main="Lanun Knife",sub="Tauret",range="Anarchy +2"}
    sets.weapons.DualLeadenMeleeAcc = {main="Naegling",sub="Blurred Knife +1",range="Fomalhaut"}
    sets.weapons.DualRanged = {main="Kustawi +1",sub="Nusku Shield",range="Fomalhaut"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- Normal melee group
    sets.engaged = {
        head="Adhemar Bonnet +1",neck="Lissome Necklace",ear1="Brutal Earring",ear2="Suppanomimi",
        body="Adhemar Jacket +1",hands="Adhemar Wrist. +1",ring1="Petrov Ring",ring2="Epona's Ring",
        back=gear.tp_jse_back,waist="Kentarch Belt +1",legs="Carmine Cuisses +1",feet=gear.herculean_ta_feet}

    sets.engaged.Acc = {
        head="Carmine Mask +1",neck="Combatant's Torque",ear1="Cessance Earring",ear2="Telos Earring",
        body="Meg. Cuirie +2",hands="Adhemar Wrist. +1",ring1="Epona's Ring",ring2="Ramuh Ring +1",
        back=gear.tp_jse_back,waist="Olseni Belt",legs="Carmine Cuisses +1",feet="Malignance Boots"}

    sets.engaged.DT = {
        head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Brutal Earring",ear2="Suppanomimi",
        body="Meg. Cuirie +2",hands="Malignance Gloves",ring1="Petrov Ring",ring2="Defending Ring",
        back=gear.tp_jse_back,waist="Kentarch Belt +1",legs="Malignance Tights",feet="Malignance Boots"}

    sets.engaged.Acc.DT = {
        head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Cessance Earring",ear2="Telos Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Ramuh Ring +1",
        back=gear.tp_jse_back,waist="Olseni Belt",legs="Malignance Tights",feet="Malignance Boots"}

    sets.engaged.DW = {
        head="Adhemar Bonnet +1",neck="Lissome Necklace",ear1="Brutal Earring",ear2="Suppanomimi",
        body="Adhemar Jacket +1",hands="Adhemar Wrist. +1",ring1="Petrov Ring",ring2="Epona's Ring",
        back=gear.tp_jse_back,waist="Kentarch Belt +1",legs="Carmine Cuisses +1",feet=gear.herculean_ta_feet}

    sets.engaged.DW.Acc = {
        --head="Carmine Mask +1",neck="Combatant's Torque",ear1="Digni. Earring",ear2="Telos Earring",
        --body="Malignance Tabard",hands="Floral Gauntlets",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
        --back=gear.tp_jse_back,waist="Olseni Belt",legs="Carmine Cuisses +1",feet="Malignance Boots"
        head="Adhemar Bonnet +1",neck="Lissome Necklace",ear1="Brutal Earring",ear2="Suppanomimi",
        body="Adhemar Jacket +1",hands="Adhemar Wrist. +1",ring1="Petrov Ring",ring2="Epona's Ring",
        back=gear.tp_jse_back,waist="Kentarch Belt +1",legs="Carmine Cuisses +1",feet="Malignance Boots"}

    sets.engaged.DW.DT = {
        head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Brutal Earring",ear2="Suppanomimi",
        body="Meg. Cuirie +2",hands="Malignance Gloves",ring1="Petrov Ring",ring2="Defending Ring",
        back=gear.tp_jse_back,waist="Kentarch Belt +1",legs="Malignance Tights",feet="Malignance Boots"}

    sets.engaged.DW.Acc.DT = {
        head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Suppanomimi",ear2="Telos Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Ramuh Ring +1",
        back=gear.tp_jse_back,waist="Reiki Yotai",legs="Malignance Tights",feet="Malignance Boots"}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    if player.sub_job == 'NIN' then
        set_macro_page(1, 5)
    elseif player.sub_job == 'DNC' then
        set_macro_page(1, 5)
    elseif player.sub_job == 'RNG' then
        set_macro_page(1, 5)
    elseif player.sub_job == 'DRG' then
        set_macro_page(1, 5)
    else
        set_macro_page(1, 5)
    end
end

function user_job_lockstyle()
    if player.equipment.main == nil or player.equipment.main == 'empty' then
        windower.chat.input('/lockstyleset 1')
    elseif res.items[item_name_to_id(player.equipment.main)].skill == 3 then --Sword in main hand.
        if player.equipment.sub == nil or player.equipment.sub == 'empty' then --Sword/Nothing.
            windower.chat.input('/lockstyleset 1')
        elseif res.items[item_name_to_id(player.equipment.sub)].shield_size then --Sword/Shield
            windower.chat.input('/lockstyleset 1')
        elseif res.items[item_name_to_id(player.equipment.sub)].skill == 3 then --Sword/Sword.
            windower.chat.input('/lockstyleset 1')
        elseif res.items[item_name_to_id(player.equipment.sub)].skill == 2 then --Sword/Dagger.
            windower.chat.input('/lockstyleset 1')
        else
            windower.chat.input('/lockstyleset 1') --Catchall just in case something's weird.
        end
    elseif res.items[item_name_to_id(player.equipment.main)].skill == 2 then --Dagger in main hand.
        if player.equipment.sub == nil or player.equipment.sub == 'empty' then --Dagger/Nothing.
            windower.chat.input('/lockstyleset 1')
        elseif res.items[item_name_to_id(player.equipment.sub)].shield_size then --Dagger/Shield
            windower.chat.input('/lockstyleset 1')
        elseif res.items[item_name_to_id(player.equipment.sub)].skill == 3 then --Dagger/Sword.
            windower.chat.input('/lockstyleset 1')
        elseif res.items[item_name_to_id(player.equipment.sub)].skill == 2 then --Dagger/Dagger.
            windower.chat.input('/lockstyleset 1')
        else
            windower.chat.input('/lockstyleset 1') --Catchall just in case something's weird.
        end
    end
end
