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
    options.ammo_warning_limit = 15

    gear.tp_ranger_jse_back = {name="Camulus's Mantle",augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','"Store TP"+10',}}
    gear.snapshot_jse_back = {name="Camulus's Mantle", augments={'INT+20','Eva.+20 /Mag. Eva.+20','"Snapshot"+10',}}
    gear.tp_jse_back = {name="Camulus's Mantle",augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}}
    gear.ranger_wsd_jse_back = {name="Camulus's Mantle",augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%',}}
    gear.magic_wsd_jse_back = {name="Camulus's Mantle",augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}}
    gear.str_wsd_jse_back = {name="Camulus's Mantle",augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Mag. Evasion+15',}}

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

    sets.precast.CorsairRoll = {
        sub="Lanun Knife",
        head="Lanun Tricorne +1",
        body="Meg. Cuirie +2",
        hands="Chasseur's Gants +1",
        legs="Malignance Tights",
        feet="Malignance Boots",
        neck="Loricate Torque +1",
        waist="Flume Belt +1",
        left_ear="Etiolation Earring",
        right_ear="Odnowa Earring",
        left_ring="Barataria Ring",
        right_ring="Defending Ring",
        back=gear.snapshot_jse_back,
    }

    sets.precast.LuzafRing = {ring2="Luzaf's Ring"}

    sets.precast.CorsairRoll["Caster's Roll"] = set_combine(sets.precast.CorsairRoll, {legs="Chas. Culottes"})
    sets.precast.CorsairRoll["Courser's Roll"] = set_combine(sets.precast.CorsairRoll, {feet="Chass. Bottes +1"})
    sets.precast.CorsairRoll["Blitzer's Roll"] = set_combine(sets.precast.CorsairRoll, {head="Chass. Tricorne"})
    sets.precast.CorsairRoll["Tactician's Roll"] = set_combine(sets.precast.CorsairRoll, {body="Chasseur's Frac +1"})
    sets.precast.CorsairRoll["Allies' Roll"] = set_combine(sets.precast.CorsairRoll, {hands="Chasseur's Gants +1"})

    sets.precast.CorsairShot = {
        ammo=gear.QDbullet,
        head="Mummu Bonnet +1",
        body="Lanun Frac +3",
        hands="Carmine Fin. Ga. +1",
        legs=gear.herculean_nuke_legs,
        feet="Chass. Bottes +1",
        neck="Comm. Charm +1",
        waist="K. Kachina Belt +1",
        left_ear="Friomisi Earring",
        right_ear="Hecate's Earring",
        left_ring="Mummu Ring",
        right_ring="Dingir Ring",
        back=gear.magic_wsd_jse_back,
    }

    sets.precast.CorsairShot.Damage = {
        ammo=gear.QDbullet,
        head="Mummu Bonnet +1",
        body="Lanun Frac +3",
        hands="Carmine Fin. Ga. +1",
        legs=gear.herculean_nuke_legs,
        feet="Chass. Bottes +1",
        neck="Comm. Charm +1",
        waist="K. Kachina Belt +1",
        left_ear="Friomisi Earring",
        right_ear="Hecate's Earring",
        left_ring="Mummu Ring",
        right_ring="Dingir Ring",
        back=gear.magic_wsd_jse_back,
    }

    sets.precast.CorsairShot.Proc = {ammo=gear.RAbullet,
        head="Wh. Rarab Cap +1",neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Sanare Earring",
        body="Emet Harness +1",hands="Malignance Gloves",ring1="Defending Ring",ring2="Dark Ring",
        back="Moonlight Cape",waist="Flume Belt +1",legs="Carmine Cuisses +1",feet="Chass. Bottes +1"}

    sets.precast.CorsairShot['Light Shot'] = {
        ammo=gear.QDbullet,
        head="Malignance Chapeau",
        body="Mummu Jacket +2",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Laksa. Bottes  +2",
        neck="Comm. Charm +1",
        waist="K. Kachina Belt +1",
        left_ear="Digni. Earring",
        right_ear="Gwati Earring",
        left_ring="Mummu Ring",
        right_ring="Stikini Ring",
        back=gear.magic_wsd_jse_back,
    }

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
        --head="Carmine Mask +1", --14
        head=gear.herculean_wsd_head, --7
        body="Adhemar Jacket", --7
        hands="Leyline Gloves", --8
        legs="Rawhide Trousers", --5
        feet="Carmine Greaves", --7
        neck="Voltsurge Torque", --5
        ear1="Etiolation Earring", --2
        ear2="Loquac. Earring", --2
        ring1="Rahab Ring", --6(4)
        --ring2="Kishar Ring", --4
    }

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads",body="Passion Jacket"})

    sets.precast.FC.Cure = set_combine(sets.precast.FC, {ear2="Mendi. Earring"})

    sets.precast.RA = {
        ammo=gear.RAbullet,
        head="Chass. Tricorne",
        body="Oshosi Vest",
        hands="Carmine Fin. Ga. +1",
        legs="Adhemar Kecks",
        feet="Meg. Jam. +2",
        neck="Comm. Charm +1",
        waist="Impulse Belt",
        left_ear="Neritic Earring",
        right_ear="Odnowa Earring",
        left_ring="Paguroidea Ring",
        right_ring="Dingir Ring",
        back=gear.snapshot_jse_back,
    }

    sets.precast.RA.Flurry = set_combine(sets.precast.RA, {
        body="Laksa. Frac +2", --0/20
    })
    sets.precast.RA.Flurry2 = set_combine(sets.precast.RA, {})


    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        ammo=gear.WSbullet,
        head="Meghanada Visor +2",
        body="Laksa. Frac +2",
        hands="Meg. Gloves +2",
        legs="Meg. Chausses +2",
        feet="Lanun Bottes +2",
        neck="Comm. Charm +1",
        waist="Fotia Belt",
        left_ear="Ishvara Earring",
        right_ear="Moonshade Earring",
        left_ring="Karieyh Ring",
        right_ring="Dingir Ring",
        back=gear.tp_ranger_jse_back,
    }

    sets.precast.WS.Acc = {
        ammo=gear.WSbullet,
        head="Meghanada Visor +2",
        body="Meg. Cuirie +2",
        hands="Meg. Gloves +2",
        legs="Meg. Chausses +2",
        feet="Meg. Jam. +2",
        neck="Comm. Charm +1",
        waist="K. Kachina Belt +1",
        left_ear="Neritic Earring",
        right_ear="Moonshade Earring",
        left_ring="Mummu Ring",
        right_ring="Dingir Ring",
        back=gear.tp_ranger_jse_back,
    }

    sets.precast.WS.Proc = {
        head="Carmine Mask +1",neck="Combatant's Torque",ear1="Digni. Earring",ear2="Mache Earring +1",
        body="Mummu Jacket +2",hands="Floral Gauntlets",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
        back=gear.tp_jse_back,waist="Olseni Belt",legs="Carmine Cuisses +1",feet="Malignance Boots"}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.

    sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {
        head="Meghanada Visor +2",
        body="Lanun Frac +3",
        hands="Meg. Gloves +2",
        legs="Meg. Chausses +2",
        feet="Carmine Greaves",
        neck="Lissome Necklace",
        waist="Fotia Belt",
        left_ear="Lifestorm Earring",
        right_ear="Moonshade Earring",
        left_ring="Karieyh Ring",
        right_ring="Rufescent Ring",
        back=gear.str_wsd_jse_back,
    })

    sets.precast.WS['Savage Blade'] = {
        head=gear.herculean_wsd_head,
        body="Laksa. Frac +2",
        hands="Meg. Gloves +2",
        legs=gear.herculean_wsd_legs,
        feet="Lanun Bottes +2",
        neck="Comm. Charm +1",
        waist="Fotia Belt",
        left_ear="Ishvara Earring",
        right_ear="Moonshade Earring",
        left_ring="Karieyh Ring",
        right_ring="Rufescent Ring",
        back=gear.str_wsd_jse_back,
    }

    sets.precast.WS['Savage Blade'].Acc = {
        head=gear.herculean_wsd_head,
        body="Laksa. Frac +2",
        hands="Meg. Gloves +2",
        legs=gear.herculean_wsd_legs,
        feet="Lanun Bottes +2",
        neck="Comm. Charm +1",
        waist="Fotia Belt",
        left_ear="Ishvara Earring",
        right_ear="Moonshade Earring",
        left_ring="Karieyh Ring",
        right_ring="Rufescent Ring",
        back=gear.str_wsd_jse_back,
    }

    sets.precast.WS['Last Stand'] = {
        ammo=gear.WSbullet,
        head="Meghanada Visor +2",
        body="Laksa. Frac +2",
        hands="Meg. Gloves +2",
        legs="Meg. Chausses +2",
        feet="Lanun Bottes +2",
        neck="Comm. Charm +1",
        waist="Fotia Belt",
        left_ear="Ishvara Earring",
        right_ear="Moonshade Earring",
        left_ring="Karieyh Ring",
        right_ring="Dingir Ring",
        back=gear.ranger_wsd_jse_back,
    }

    sets.precast.WS['Last Stand'].Acc = {
        ammo=gear.WSbullet,
        head="Meghanada Visor +2",
        body="Laksa. Frac +2",
        hands="Meg. Gloves +2",
        legs="Meg. Chausses +2",
        feet="Lanun Bottes +2",
        neck="Comm. Charm +1",
        waist="Fotia Belt",
        left_ear="Ishvara Earring",
        right_ear="Moonshade Earring",
        left_ring="Mummu Ring",
        right_ring="Dingir Ring",
        back=gear.ranger_wsd_jse_back,
    }

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

    sets.precast.WS['Leaden Salute'] = {
        ammo=gear.MAbullet,
        head="Pixie Hairpin +1",
        body="Lanun Frac +3",
        hands="Carmine Fin. Ga. +1",
        legs=gear.herculean_nuke_legs,
        feet="Lanun Bottes +2",
        neck="Comm. Charm +1",
        waist="Svelt. Gouriz +1",
        left_ear="Friomisi Earring",
        right_ear="Moonshade Earring",
        left_ring="Archon Ring",
        right_ring="Dingir Ring",
        back=gear.magic_wsd_jse_back,
    }

    sets.precast.WS['Aeolian Edge'] = {
        ammo="Animikii Bullet",
        head="Mummu Bonnet +1",
        body="Lanun Frac +3",
        hands="Carmine Fin. Ga. +1",
        legs=gear.herculean_nuke_legs,
        feet="Lanun Bottes +2",
        neck="Comm. Charm +1",
        waist="Svelt. Gouriz +1",
        left_ear="Friomisi Earring",
        right_ear="Moonshade Earring",
        left_ring="Mummu Ring",
        right_ring="Dingir Ring",
        back=gear.magic_wsd_jse_back,
    }

    sets.precast.WS['Wildfire'] = {
        ammo=gear.MAbullet,
        head=gear.herculean_wsd_head,
        body="Lanun Frac +3",
        hands="Carmine Fin. Ga. +1",
        legs=gear.herculean_nuke_legs,
        feet="Lanun Bottes +2",
        neck="Comm. Charm +1",
        waist="Svelt. Gouriz +1",
        left_ear="Friomisi Earring",
        right_ear="Moonshade Earring",
        left_ring="Mummu Ring",
        right_ring="Dingir Ring",
        back=gear.magic_wsd_jse_back,
    }

    sets.precast.WS['Wildfire'].Acc = {
        ammo=gear.MAbullet,
        head=gear.herculean_wsd_head,
        body="Lanun Frac +3",
        hands="Carmine Fin. Ga. +1",
        legs=gear.herculean_nuke_legs,
        feet="Lanun Bottes +2",
        neck="Comm. Charm +1",
        waist="Svelt. Gouriz +1",
        left_ear="Friomisi Earring",
        right_ear="Moonshade Earring",
        left_ring="Mummu Ring",
        right_ring="Dingir Ring",
        back=gear.magic_wsd_jse_back,
    }

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
        head="Malignance Chapeau",
        body="Laksa. Frac +2",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Malignance Boots",
        neck="Ocachi Gorget",
        waist="K. Kachina Belt +1",
        left_ear="Neritic Earring",
        right_ear="Enervating Earring",
        left_ring="Mummu Ring",
        right_ring="Dingir Ring",
        back=gear.tp_ranger_jse_back,
    }

    sets.midcast.RA.Acc = {
        neck="Comm. Charm +1",
    }

    sets.buff['Triple Shot'] = {
        head="Oshosi Mask",
        body="Chasseur's Frac +1",
        hands="Oshosi Gloves",
        legs="Oshosi Trousers",
        feet="Oshosi Leggings",
        neck="Ocachi Gorget",
        waist="K. Kachina Belt +1",
        left_ear="Neritic Earring",
        right_ear="Enervating Earring",
        left_ring="Mummu Ring",
        right_ring="Dingir Ring",
        back=gear.tp_ranger_jse_back,
    }

    -- Sets to return to when not performing an action.

    sets.DayIdle = {}
    sets.NightIdle = {}

    sets.buff.Doom = set_combine(sets.buff.Doom, {})

    -- Resting sets
    sets.resting = {}


    -- Idle sets
    sets.idle = {
        head="Meghanada Visor +2",
        body="Meg. Cuirie +2",
        hands="Meg. Gloves +2",
        legs="Malignance Tights",
        feet="Malignance Boots",
        neck="Loricate Torque +1",
        waist="Flume Belt +1",
        left_ear="Etiolation Earring",
        right_ear="Odnowa Earring",
        left_ring="Paguroidea Ring",
        right_ring="Defending Ring",
        back=gear.tp_jse_back,
    }

    sets.idle.PDT = {
        head="Malignance Chapeau",
        body="Meg. Cuirie +2",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Malignance Boots",
        neck="Loricate Torque +1",
        waist="Flume Belt +1",
        left_ear="Etiolation Earring",
        right_ear="Odnowa Earring",
        left_ring="Gelatinous Ring +1",
        right_ring="Defending Ring",
        back=gear.tp_jse_back,
    }

    sets.idle.Refresh = {
        
    }

    -- Defense sets
    sets.defense.PDT = {
        head="Malignance Chapeau",
        body="Meg. Cuirie +2",
        hands="Meg. Gloves +2",
        legs="Malignance Tights",
        feet="Malignance Boots",
        neck="Loricate Torque +1",
        waist="Flume Belt +1",
        left_ear="Etiolation Earring",
        right_ear="Odnowa Earring",
        left_ring="Paguroidea Ring",
        right_ring="Defending Ring",
        back=gear.tp_jse_back,
    }

    sets.defense.MDT = {
        head="Malignance Chapeau",
        body="Meg. Cuirie +2",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Malignance Boots",
        neck="Loricate Torque +1",
        waist="Flume Belt +1",
        left_ear="Etiolation Earring",
        right_ear="Odnowa Earring",
        left_ring="Gelatinous Ring +1",
        right_ring="Defending Ring",
        back=gear.tp_jse_back,
    }

    sets.defense.MEVA = {
        head="Malignance Chapeau",
        body="Meg. Cuirie +2",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Malignance Boots",
        neck="Loricate Torque +1",
        waist="Flume Belt +1",
        left_ear="Etiolation Earring",
        right_ear="Odnowa Earring",
        left_ring="Paguroidea Ring",
        right_ring="Defending Ring",
        back=gear.tp_jse_back,
    }

    sets.Kiting = {legs="Carmine Cuisses +1"}
    sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
    sets.DWMax = {
        --ear1="Dudgeon Earring",
        --ear2="Heartseeker Earring",
        body="Adhemar Jacket +1",
        --hands="Floral Gauntlets",
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
        head="Adhemar Bonnet +1",
        body="Adhemar Jacket +1",
        hands="Adhemar Wrist. +1",
        legs="Carmine Cuisses +1",
        feet=gear.herculean_ta_feet,
        neck="Lissome Necklace",
        waist="Kentarch Belt +1",
        left_ear="Brutal Earring",
        right_ear="Suppanomimi",
        left_ring="Petrov Ring",
        right_ring="Epona's Ring",
        back=gear.tp_jse_back,
    }

    sets.engaged.Acc = {
        head="Carmine Mask +1",neck="Combatant's Torque",ear1="Cessance Earring",ear2="Telos Earring",
        body="Meg. Cuirie +2",hands="Adhemar Wrist. +1",ring1="Epona's Ring",ring2="Ramuh Ring +1",
        back=gear.tp_jse_back,waist="Olseni Belt",legs="Carmine Cuisses +1",feet="Malignance Boots"}

    sets.engaged.DT = {
        head="Malignance Chapeau",
        body="Meg. Cuirie +2",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Malignance Boots",
        neck="Loricate Torque +1",
        waist="Kentarch Belt +1",
        left_ear="Brutal Earring",
        right_ear="Suppanomimi",
        left_ring="Petrov Ring",
        right_ring="Defending Ring",
        back=gear.tp_jse_back,
    }

    sets.engaged.Acc.DT = {
        head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Cessance Earring",ear2="Telos Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Ramuh Ring +1",
        back=gear.tp_jse_back,waist="Olseni Belt",legs="Malignance Tights",feet="Malignance Boots"}

    sets.engaged.DW = {
        head="Adhemar Bonnet +1",
        body="Adhemar Jacket +1",
        hands="Adhemar Wrist. +1",
        legs="Carmine Cuisses +1",
        feet=gear.herculean_ta_feet,
        neck="Lissome Necklace",
        waist="Kentarch Belt +1",
        left_ear="Brutal Earring",
        right_ear="Suppanomimi",
        left_ring="Petrov Ring",
        right_ring="Epona's Ring",
        back=gear.tp_jse_back,
    }

    sets.engaged.DW.Acc = {
        --head="Carmine Mask +1",neck="Combatant's Torque",ear1="Digni. Earring",ear2="Telos Earring",
        --body="Malignance Tabard",hands="Floral Gauntlets",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
        --back=gear.tp_jse_back,waist="Olseni Belt",legs="Carmine Cuisses +1",feet="Malignance Boots"
        head="Adhemar Bonnet +1",
        body="Adhemar Jacket +1",
        hands="Adhemar Wrist. +1",
        legs="Carmine Cuisses +1",
        feet="Malignance Boots",
        neck="Lissome Necklace",
        waist="Kentarch Belt +1",
        left_ear="Brutal Earring",
        right_ear="Suppanomimi",
        left_ring="Petrov Ring",
        right_ring="Epona's Ring",
        back=gear.tp_jse_back,
    }

    sets.engaged.DW.DT = {
        head="Malignance Chapeau",
        body="Meg. Cuirie +2",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Malignance Boots",
        neck="Loricate Torque +1",
        waist="Kentarch Belt +1",
        left_ear="Brutal Earring",
        right_ear="Suppanomimi",
        left_ring="Petrov Ring",
        right_ring="Defending Ring",
        back=gear.tp_jse_back,
    }

    sets.engaged.DW.Acc.DT = {
        head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Suppanomimi",ear2="Telos Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Ramuh Ring +1",
        back=gear.tp_jse_back,waist="Reiki Yotai",legs="Malignance Tights",feet="Malignance Boots"}
end

function job_post_precast(spell, spellMap, eventArgs)
    if spell.type == 'WeaponSkill' then
        local WSset = standardize_set(get_precast_set(spell, spellMap))
        local wsacc = check_ws_acc()

        if (WSset.ear1 == "Moonshade Earring" or WSset.ear2 == "Moonshade Earring") then
            -- Replace Moonshade Earring if we're at cap TP
            if get_effective_player_tp(spell, WSset) > 3200 then
                if data.weaponskills.elemental:contains(spell.english) then
                    if wsacc:contains('Acc') and sets.MagicalAccMaxTP then
                        equip(sets.MagicalAccMaxTP[spell.english] or sets.MagicalAccMaxTP)
                    elseif sets.MagicalMaxTP then
                        equip(sets.MagicalMaxTP[spell.english] or sets.MagicalMaxTP)
                    else
                    end
                elseif spell.skill == 26 then
                    if wsacc:contains('Acc') and sets.RangedAccMaxTP then
                        equip(sets.RangedAccMaxTP[spell.english] or sets.RangedAccMaxTP)
                    elseif sets.RangedMaxTP then
                        equip(sets.RangedMaxTP[spell.english] or sets.RangedMaxTP)
                    else
                    end
                else
                    if wsacc:contains('Acc') and not buffactive['Sneak Attack'] and sets.AccMaxTP then
                        equip(sets.AccMaxTP[spell.english] or sets.AccMaxTP)
                    elseif sets.MaxTP then
                        equip(sets.MaxTP[spell.english] or sets.MaxTP)
                    else
                    end
                end
            end
        end
    elseif spell.type == 'CorsairShot' and not (spell.english == 'Light Shot' or spell.english == 'Dark Shot') then
        if (state.WeaponskillMode.value == "Proc" or state.CastingMode.value == "Proc") and sets.precast.CorsairShot.Proc then
            equip(sets.precast.CorsairShot.Proc)
        elseif state.CastingMode.value == 'Fodder' and sets.precast.CorsairShot.Damage then
            equip(sets.precast.CorsairShot.Damage)
        end
    elseif spell.action_type == 'Ranged Attack' then
        if buffactive.Flurry then
            if sets.precast.RA.Flurry and lastflurry == 1 then
                equip(sets.precast.RA.Flurry)
            elseif sets.precast.RA.Flurry2 and lastflurry == 2 then
                equip(sets.precast.RA.Flurry2)
            end
        end
    elseif spell.type == 'CorsairRoll' or spell.english == "Double-Up" then
        if state.LuzafRing.value and item_available("Luzaf's Ring") then
            equip(sets.precast.LuzafRing)
        end
        if spell.type == 'CorsairRoll' and state.CompensatorMode.value ~= 'Never' and (state.CompensatorMode.value == 'Always' or tonumber(state.CompensatorMode.value) > player.tp) then
            if item_available("Compensator") then
                enable('range')
                equip({range="Compensator"})
            end
            if sets.precast.CorsairRoll.sub and sets.precast.CorsairRoll.sub ~= player.equipment.sub then
                enable('sub')
                equip({sub=sets.precast.CorsairRoll.sub})
            end
        end
    elseif spell.english == 'Fold' and buffactive['Bust'] == 2 and sets.precast.FoldDoubleBust then
        equip(sets.precast.FoldDoubleBust)
    end
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
