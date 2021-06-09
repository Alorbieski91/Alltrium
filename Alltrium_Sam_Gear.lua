-- Setup vars that are user-dependent.
function user_job_setup()
    state.OffenseMode:options('Normal','SomeAcc','Acc','FullAcc','Fodder')
    state.HybridMode:options('Normal','DTLite','PDT','Reraise')
    state.WeaponskillMode:options('Match','Normal','SomeAcc','Acc','FullAcc','Fodder','Proc')
    state.RangedMode:options('Normal', 'Acc')
    state.PhysicalDefenseMode:options('PDT','PDTReraise')
    state.MagicalDefenseMode:options('MDT','MDTReraise')
    state.ResistDefenseMode:options('MEVA')
    state.IdleMode:options('Normal', 'Reraise')
    state.Weapons:options('Dojikiri','ProcWeapon','Lance')

    gear.ws_jse_back = {name="Smertrios's Mantle",augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
    gear.stp_jse_back = {name="Smertrios's Mantle",augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}}
    -- Additional local binds
    send_command('bind ^` input /ja "Hasso" <me>')
    send_command('bind !` input /ja "Seigan" <me>')
    send_command('bind !backspace input /ja "Third Eye" <me>')
    send_command('bind @` gs c cycle SkillchainMode')
    send_command('bind !@^` gs c cycle Stance')
    send_command('bind !r gs c set skipprocweapons false;gs c weapons ProcWeapon;gs c set WeaponskillMode Proc;gs c update')
    send_command('bind ^r gs c set skipprocweapons true;gs c weapons Default;gs c set WeaponskillMode Normal;gs c update')
    send_command('bind ^q gs c weapons Lance;gs c update')

    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    -- Precast Sets
    -- Precast sets to enhance JAs
    sets.precast.JA.Meditate = {head="Wakido Kabuto +1",hands="Sakonji Kote",back=gear.ws_jse_back}
    sets.precast.JA['Warding Circle'] = {head="Wakido Kabuto +1"}
    sets.precast.JA['Blade Bash'] = {hands="Sakonji Kote"}
    sets.precast.JA['Sekkanoki'] = {hands="Kasuga Kote +1"}
    sets.precast.JA['Sengikori'] = {feet="Kas. Sune-Ate +1"}

    sets.precast.Step = {
        head="Flam. Zucchetto +2",neck="Moonbeam Nodowa",ear1="Mache Earring +1",ear2="Telos Earring",
        body="Tartarus Platemail",hands="Flam. Manopolas +2",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
        back=gear.stp_jse_back,waist="Olseni Belt",legs="Wakido Haidate +3",feet="Founder's Greaves"}
    sets.precast.JA['Violent Flourish'] = {ammo="Pemphredo Tathlum",
        head="Flam. Zucchetto +2",neck="Sanctity Necklace",ear1="Digni. Earring",ear2="Moonshade Earring",
        body="Flamma Korazin +2",hands="Flam. Manopolas +2",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
        back=gear.ws_jse_back,waist="Eschan Stone",legs="Flamma Dirs +2",feet="Flam. Gambieras +2"}

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {
        head="Flam. Zucchetto +2",
        body="Tartarus Platemail",hands="Flam. Manopolas +2",ring1="Asklepian Ring",ring2="Valseur's Ring",
        waist="Chaac Belt",legs="Wakido Haidate +3",feet="Sak. Sune-Ate +1"}

    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Fast cast sets for spells
    sets.precast.FC = {neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",hands="Leyline Gloves",ring1="Lebeche Ring",ring2="Prolix Ring"}

    -- Ranged snapshot gear
    sets.precast.RA = {}

    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {ammo="Knobkierrie",
        head=gear.valorous_wsd_head,neck="Sam. Nodowa +1",ear1="Thrud Earring",ear2="Moonshade Earring",
        body="Sakonji Domaru +2",hands=gear.valorous_wsd_hands,ring1="Flamma Ring",ring2="Karieyh Ring",
        back=gear.ws_jse_back,waist="Fotia Belt",legs="Hiza. Hizayoroi +2",feet=gear.valorous_wsd_feet}

    sets.precast.WS.SomeAcc = set_combine(sets.precast.WS, {head="Flam. Zucchetto +2",feet="Flam. Gambieras +2",})
    sets.precast.WS.Acc = set_combine(sets.precast.WS, {head="Flam. Zucchetto +2",feet="Flam. Gambieras +2",ear2="Digni. Earring"})
    sets.precast.WS.FullAcc = set_combine(sets.precast.WS, {})
    sets.precast.WS.Fodder = set_combine(sets.precast.WS, {})

    sets.precast.WS.Proc = {}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Tachi: Fudo'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Tachi: Fudo'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Tachi: Fudo'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Tachi: Fudo'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Tachi: Fudo'].Fodder = set_combine(sets.precast.WS.Fodder, {})

    sets.precast.WS['Tachi: Shoha'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Tachi: Shoha'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Tachi: Shoha'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Tachi: Shoha'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Tachi: Shoha'].Fodder = set_combine(sets.precast.WS.Fodder, {})

    sets.precast.WS['Tachi: Rana'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Tachi: Rana'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Tachi: Rana'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Tachi: Rana'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Tachi: Rana'].Fodder = set_combine(sets.precast.WS.Fodder, {})

    sets.precast.WS['Tachi: Kasha'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Tachi: Kasha'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Tachi: Kasha'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Tachi: Kasha'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Tachi: Kasha'].Fodder = set_combine(sets.precast.WS.Fodder, {})

    sets.precast.WS['Tachi: Gekko'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Tachi: Gekko'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Tachi: Gekko'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Tachi: Gekko'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Tachi: Gekko'].Fodder = set_combine(sets.precast.WS.Fodder, {})

    sets.precast.WS['Tachi: Yukikaze'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Tachi: Yukikaze'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Tachi: Yukikaze'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Tachi: Yukikaze'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Tachi: Yukikaze'].Fodder = set_combine(sets.precast.WS.Fodder, {})

    sets.precast.WS['Tachi: Ageha'] = {ammo="Knobkierrie",
        head="Flam. Zucchetto +2",neck="Sanctity Necklace",ear1="Thrud Earring",ear2="Moonshade Earring",
        body="Flamma Korazin +2",hands="Flam. Manopolas +2",ring1="Flamma Ring",ring2="Karieyh Ring",
        back=gear.ws_jse_back,waist="Fotia Belt",legs="Flamma Dirs +2",feet="Flam. Gambieras +2"}

    sets.precast.WS['Tachi: Hobaku'] = {ammo="Knobkierrie",
        head="Flam. Zucchetto +2",neck="Sanctity Necklace",ear1="Thrud Earring",ear2="Moonshade Earring",
        body="Flamma Korazin +2",hands="Flam. Manopolas +2",ring1="Flamma Ring",ring2="Karieyh Ring",
        back=gear.ws_jse_back,waist="Fotia Belt",legs="Flamma Dirs +2",feet="Flam. Gambieras +2"}

    sets.precast.WS['Tachi: Jinpu'] = {ammo="Knobkierrie",
        head=gear.valorous_wsd_head,neck="Sam. Nodowa +1",ear1="Friomisi Earring",ear2="Moonshade Earring",
        body="Found. Breastplate",hands="Founder's Gauntlets",ring1="Flamma Ring",ring2="Karieyh Ring",
        back=gear.ws_jse_back,waist="Fotia Belt",legs="Hiza. Hizayoroi +2",feet="Founder's Greaves"}

    sets.precast.WS['Apex Arrow'] = {
        head="Ynglinga Sallet",neck="Fotia Gorget",ear1="Clearview Earring",ear2="Moonshade Earring",
        body="Kyujutsugi",hands="Buremte Gloves",ring1="Ilabrat Ring",ring2="Regal Ring",
        back=gear.ws_jse_back,waist="Fotia Belt",legs="Wakido Haidate +3",feet="Wakido Sune. +3"}

    sets.precast.WS['Apex Arrow'].SomeAcc = set_combine(sets.precast.WS['Apex Arrow'], {})
    sets.precast.WS['Apex Arrow'].Acc = set_combine(sets.precast.WS['Apex Arrow'], {})
    sets.precast.WS['Apex Arrow'].FullAcc = set_combine(sets.precast.WS['Apex Arrow'], {})
    sets.precast.WS['Apex Arrow'].Fodder = set_combine(sets.precast.WS['Apex Arrow'], {})

    -- Swap to these on Moonshade using WS if at 3000 TP
    sets.MaxTP = {ear1="Thrud Earring",ear2="Lugra Earring +1",}
    sets.AccMaxTP = {ear1="Mache Earring +1",ear2="Telos Earring"}
    sets.AccDayMaxTPWSEars = {ear1="Mache Earring +1",ear2="Telos Earring"}
    sets.DayMaxTPWSEars = {ear1="Thrud Earring",ear2="Brutal Earring",}
    sets.AccDayWSEars = {ear1="Mache Earring +1",ear2="Telos Earring"}
    sets.DayWSEars = {ear1="Thrud Earring",ear2="Moonshade Earring",}

    -- Midcast Sets
    sets.midcast.FastRecast = {
        head="Loess Barbuta +1",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
        body="Tartarus Platemail",hands="Leyline Gloves",ring1="Defending Ring",ring2="Prolix Ring",
        back="Moonlight Cape",waist="Tempus Fugit",legs="Wakido Haidate +3",feet="Amm Greaves"}

    -- Specific spells
    sets.midcast.Utsusemi = set_combine(sets.midcast.FastRecast, {back="Mujin Mantle"})


    -- Ranged gear
    sets.midcast.RA = {
        head="Flam. Zucchetto +2",neck="Combatant's Torque",ear1="Clearview Earring",ear2="Neritic Earring",
        body="Kyujutsugi",hands="Buremte Gloves",ring1="Ilabrat Ring",ring2="Regal Ring",
        back="Buquwik Cape",waist="Flax Sash",legs="Wakido Haidate +3",feet="Wakido Sune. +3"}

    sets.midcast.RA.Acc = {
        head="Flam. Zucchetto +2",neck="Combatant's Torque",ear1="Clearview Earring",ear2="Neritic Earring",
        body="Kyujutsugi",hands="Buremte Gloves",ring1="Ilabrat Ring",ring2="Regal Ring",
        back="Buquwik Cape",waist="Flax Sash",legs="Wakido Haidate +3",feet="Wakido Sune. +3"}


    -- Sets to return to when not performing an action.

    -- Resting sets
    sets.resting = {ammo="Staunch Tathlum",
        head="Flam. Zucchetto +2",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Odnowa Earring",
        body="Hiza. Haramaki +1",hands="Wakido Kote +2",ring1="Paguroidea Ring",ring2="Gelatinous Ring +1",
        back=gear.stp_jse_back,waist="Flume Belt +1",legs="Ryuo Hakama",feet="Flam. Gambieras +2"}


    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)

    sets.Kiting = {feet="Danzo Sune-ate"}

    sets.Reraise = {head="Twilight Helm",body="Twilight Mail"}

    sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
    sets.Skillchain = {}

    sets.idle = {ammo="Staunch Tathlum",
        head=gear.valorous_wsd_head,neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Odnowa Earring",
        body="Hiza. Haramaki +1",hands="Wakido Kote +2",ring1="Gelatinous Ring +1",ring2="Defending Ring",
        back=gear.stp_jse_back,waist="Flume Belt +1",legs="Ken. Hakama",feet="Flam. Gambieras +2"}

    sets.idle.Reraise = set_combine(sets.idle, sets.Reraise)

    sets.idle.Weak = {ammo="Staunch Tathlum",
        head="Flam. Zucchetto +2",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Odnowa Earring",
        body="Hiza. Haramaki +1",hands="Wakido Kote +2",ring1="Gelatinous Ring +1",ring2="Defending Ring",
        back=gear.stp_jse_back,waist="Flume Belt +1",legs="Ken. Hakama",feet="Flam. Gambieras +2"}

    sets.idle.Weak.Reraise = set_combine(sets.idle.Weak, sets.Reraise)

    sets.DayIdle = {}
    sets.NightIdle = {}

    -- Defense sets
    sets.defense.PDT = {ammo="Staunch Tathlum",
        head="Flam. Zucchetto +2",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Odnowa Earring",
        body="Hiza. Haramaki +1",hands="Wakido Kote +2",ring1="Gelatinous Ring +1",ring2="Defending Ring",
        back=gear.stp_jse_back,waist="Flume Belt +1",legs="Ken. Hakama",feet="Flam. Gambieras +2"}

    sets.defense.PDTReraise = set_combine(sets.defense.PDT, sets.Reraise)

    sets.defense.MDT = {ammo="Staunch Tathlum",
        head="Flam. Zucchetto +2",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Odnowa Earring",
        body="Hiza. Haramaki +1",hands="Wakido Kote +2",ring1="Gelatinous Ring +1",ring2="Defending Ring",
        back=gear.stp_jse_back,waist="Flume Belt +1",legs="Ken. Hakama",feet="Flam. Gambieras +2"}

    sets.defense.MDTReraise = set_combine(sets.defense.MDT, sets.Reraise)

    sets.defense.MEVA = {}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- Normal melee group
    -- Delay 450 GK, 25 Save TP => 65 Store TP for a 5-hit (25 Store TP in gear)
    sets.engaged = {ammo="Ginsen",
        head="Flam. Zucchetto +2",neck="Sam. Nodowa +1",ear1="Cessance Earring",ear2="Brutal Earring",
        body="Kasuga Domaru +1",hands="Wakido Kote +2",ring1="Flamma Ring",ring2="Petrov Ring",
        back=gear.stp_jse_back,waist="Ioskeha Belt",legs="Ryuo Hakama",feet="Flam. Gambieras +2"}

    sets.engaged.SomeAcc = {ammo="Ginsen",
        head="Flam. Zucchetto +2",neck="Sam. Nodowa +1",ear1="Cessance Earring",ear2="Brutal Earring",
        body="Kasuga Domaru +1",hands="Wakido Kote +2",ring1="Flamma Ring",ring2="Petrov Ring",
        back=gear.stp_jse_back,waist="Ioskeha Belt",legs="Ken. Hakama",feet="Flam. Gambieras +2"}
    sets.engaged.Acc = {
        --ammo="Aurgelmir Orb +1",
        --head="Wakido Kabuto +3",neck="Moonbeam Nodowa",ear1="Digni. Earring",ear2="Telos Earring",
        --body="Ken. Samue",hands="Wakido Kote +3",ring1="Niqmaddu Ring",ring2="Regal Ring",
        --back=gear.stp_jse_back,waist="Ioskeha Belt",legs="Wakido Haidate +3",feet="Flam. Gambieras +2"
        ammo="Ginsen",
        head="Flam. Zucchetto +2",neck="Sam. Nodowa +1",ear1="Cessance Earring",ear2="Digni. Earring",
        body="Flamma Korazin +2",hands="Wakido Kote +2",ring1="Flamma Ring",ring2="Petrov Ring",
        back=gear.stp_jse_back,waist="Ioskeha Belt",legs="Ken. Hakama",feet="Flam. Gambieras +2"}
    sets.engaged.FullAcc = {ammo="Aurgelmir Orb +1",
        head="Wakido Kabuto +3",neck="Moonbeam Nodowa",ear1="Mache Earring +1",ear2="Telos Earring",
        body="Ken. Samue",hands="Wakido Kote +3",ring1="Ramuh Ring +1",ring2="Regal Ring",
        back=gear.stp_jse_back,waist="Olseni Belt",legs="Wakido Haidate +3",feet="Wakido Sune. +3"}
    sets.engaged.Fodder = {ammo="Aurgelmir Orb +1",
        head="Flam. Zucchetto +2",neck="Moonbeam Nodowa",ear1="Dedition Earring",ear2="Brutal Earring",
        body="Kasuga Domaru +1",hands=gear.valorous_acc_hands,ring1="Niqmaddu Ring",ring2="Petrov Ring",
        back=gear.stp_jse_back,waist="Ioskeha Belt",legs="Ryuo Hakama",feet="Flam. Gambieras +2"}
    sets.engaged.PDT = {ammo="Staunch Tathlum",
        head="Loess Barbuta +1",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Sanare Earring",
        body="Tartarus Platemail",hands="Wakido Kote +3",ring1="Defending Ring",ring2="Dark Ring",
        back="Moonlight Cape",waist="Ioskeha Belt",legs="Wakido Haidate +3",feet="Amm Greaves"}
    sets.engaged.SomeAcc.PDT = {ammo="Staunch Tathlum",
        head="Loess Barbuta +1",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Sanare Earring",
        body="Tartarus Platemail",hands="Wakido Kote +3",ring1="Defending Ring",ring2="Patricius Ring",
        back="Moonlight Cape",waist="Ioskeha Belt",legs="Wakido Haidate +3",feet="Amm Greaves"}
    sets.engaged.Acc.PDT = {ammo="Staunch Tathlum",
        head="Loess Barbuta +1",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Sanare Earring",
        body="Tartarus Platemail",hands="Wakido Kote +3",ring1="Defending Ring",ring2="Patricius Ring",
        back="Moonlight Cape",waist="Ioskeha Belt",legs="Wakido Haidate +3",feet="Amm Greaves"}
    sets.engaged.FullAcc.PDT = {ammo="Staunch Tathlum",
        head="Loess Barbuta +1",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Sanare Earring",
        body="Tartarus Platemail",hands="Wakido Kote +3",ring1="Defending Ring",ring2="Patricius Ring",
        back="Moonlight Cape",waist="Ioskeha Belt",legs="Wakido Haidate +3",feet="Amm Greaves"}
    sets.engaged.Fodder.PDT = {ammo="Staunch Tathlum",
        head="Loess Barbuta +1",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Sanare Earring",
        body="Tartarus Platemail",hands="Wakido Kote +3",ring1="Defending Ring",ring2="Dark Ring",
        back="Moonlight Cape",waist="Ioskeha Belt",legs="Wakido Haidate +3",feet="Amm Greaves"}
    sets.engaged.DTLite = {
        --ammo="Staunch Tathlum",
        --head="Ynglinga Sallet",neck="Loricate Torque +1",ear1="Cessance Earring",ear2="Brutal Earring",
        --body="Tartarus Platemail",hands="Wakido Kote +3",ring1="Defending Ring",ring2="Patricius Ring",
        --back=gear.stp_jse_back,waist="Ioskeha Belt",legs="Wakido Haidate +3",feet="Amm Greaves"
        ammo="Ginsen",
        head="Flam. Zucchetto +2",neck="Loricate Torque +1",ear1="Cessance Earring",ear2="Brutal Earring",
        body="Flamma Korazin +2",hands="Wakido Kote +2",ring1="Gelatinous Ring +1",ring2="Defending Ring",
        back=gear.stp_jse_back,waist="Ioskeha Belt",legs="Ken. Hakama",feet="Flam. Gambieras +2"}
    sets.engaged.SomeAcc.DTLite = {
        --ammo="Staunch Tathlum",
        --head="Ynglinga Sallet",neck="Loricate Torque +1",ear1="Cessance Earring",ear2="Brutal Earring",
        --body="Tartarus Platemail",hands=gear.valorous_acc_hands,ring1="Defending Ring",ring2="Patricius Ring",
        --back=gear.stp_jse_back,waist="Ioskeha Belt",legs="Wakido Haidate +3",feet="Amm Greaves"
        ammo="Ginsen",
        head="Flam. Zucchetto +2",neck="Loricate Torque +1",ear1="Cessance Earring",ear2="Brutal Earring",
        body="Flamma Korazin +2",hands="Wakido Kote +2",ring1="Gelatinous Ring +1",ring2="Defending Ring",
        back=gear.stp_jse_back,waist="Ioskeha Belt",legs="Ken. Hakama",feet="Flam. Gambieras +2"}
    sets.engaged.Acc.DTLite = {
        --ammo="Staunch Tathlum",
        --head="Ynglinga Sallet",neck="Loricate Torque +1",ear1="Cessance Earring",ear2="Brutal Earring",
        --body="Tartarus Platemail",hands="Wakido Kote +3",ring1="Defending Ring",ring2="Patricius Ring",
        --back=gear.stp_jse_back,waist="Ioskeha Belt",legs="Wakido Haidate +3",feet="Amm Greaves"
        ammo="Ginsen",
        head="Flam. Zucchetto +2",neck="Loricate Torque +1",ear1="Cessance Earring",ear2="Digni. Earring",
        body="Flamma Korazin +2",hands="Wakido Kote +2",ring1="Gelatinous Ring +1",ring2="Defending Ring",
        back=gear.stp_jse_back,waist="Ioskeha Belt",legs="Ken. Hakama",feet="Flam. Gambieras +2"}
    sets.engaged.FullAcc.DTLite = {ammo="Staunch Tathlum",
        head="Ynglinga Sallet",neck="Loricate Torque +1",ear1="Cessance Earring",ear2="Brutal Earring",
        body="Tartarus Platemail",hands="Wakido Kote +3",ring1="Defending Ring",ring2="Patricius Ring",
        back=gear.stp_jse_back,waist="Ioskeha Belt",legs="Wakido Haidate +3",feet="Amm Greaves"}	
    sets.engaged.Fodder.DTLite = {ammo="Staunch Tathlum",
        head="Flam. Zucchetto +2",neck="Loricate Torque +1",ear1="Cessance Earring",ear2="Brutal Earring",
        body="Tartarus Platemail",hands="Wakido Kote +3",ring1="Defending Ring",ring2="Patricius Ring",
        back=gear.stp_jse_back,waist="Ioskeha Belt",legs="Wakido Haidate +3",feet="Amm Greaves"}

    sets.engaged.Reraise = set_combine(sets.engaged, sets.Reraise)
    sets.engaged.SomeAcc.Reraise = set_combine(sets.engaged.SomeAcc, sets.Reraise)
    sets.engaged.Acc.Reraise = set_combine(sets.engaged.Acc, sets.Reraise)
    sets.engaged.FullAcc.Reraise = set_combine(sets.engaged.FullAcc, sets.Reraise)
    sets.engaged.Fodder.Reraise = set_combine(sets.engaged.Fodder, sets.Reraise)

    -- Melee sets for in Adoulin, which has an extra 10 Save TP for weaponskills.
    -- Delay 450 GK, 35 Save TP => 89 Store TP for a 4-hit (49 Store TP in gear), 2 Store TP for a 5-hit
--[[Right now Adoulin sets are the same as non-Adoulin.
    sets.engaged.Adoulin = {
        sub="Nepenthe Grip",
        ammo="Ginsen",
        head="Flam. Zucchetto +2",
        body="Kasuga Domaru +1",hands="Wakido Kote +2",
        legs="Ryuo Hakama",feet="Flam. Gambieras +2",
        neck="Moonbeam Nodowa",
        waist="Ioskeha Belt",
        ear1="Steelflash Earring",ear2="Bladeborn Earring",
        ring1="Petrov Ring",ring2="Flamma Ring",
        back=gear.stp_jse_back}
    sets.engaged.Adoulin.SomeAcc = {}
    sets.engaged.Adoulin.Acc = {}
    sets.engaged.Adoulin.FullAcc = {}
    sets.engaged.Adoulin.Fodder = {}
    sets.engaged.Adoulin.PDT = {}
    sets.engaged.Adoulin.SomeAcc.PDT = {}
    sets.engaged.Adoulin.Acc.PDT = {}
    sets.engaged.Adoulin.FullAcc.PDT = {}
    sets.engaged.Adoulin.Fodder.PDT = {}

    sets.engaged.Adoulin.DTLite = sets.engaged.DTLite
    sets.engaged.Adoulin.SomeAcc.DTLite = sets.engaged.SomeAcc.DTLite
    sets.engaged.Adoulin.Acc.DTLite = sets.engaged.Acc.DTLite
    sets.engaged.Adoulin.FullAcc.DTLite = sets.engaged.FullAcc.DTLite
    sets.engaged.Adoulin.Fodder.DTLite = sets.engaged.Fodder.DTLite
    sets.engaged.Adoulin.Reraise = set_combine(sets.engaged.Adoulin, sets.Reraise)
    sets.engaged.Adoulin.SomeAcc.Reraise = set_combine(sets.engaged.Adoulin.SomeAcc, sets.Reraise)
    sets.engaged.Adoulin.Acc.Reraise = set_combine(sets.engaged.Adoulin.Acc, sets.Reraise)
    sets.engaged.Adoulin.FullAcc.Reraise = set_combine(sets.engaged.Adoulin.FullAcc, sets.Reraise)
    sets.engaged.Adoulin.Fodder.Reraise = set_combine(sets.engaged.Adoulin.Fodder, sets.Reraise)
]]--Right now Adoulin sets are the same as non-Adoulin.

    -- Weapons sets
    sets.weapons.Dojikiri = {main="Dojikiri Yasutsuna",sub="Nepenthe Grip"}
    sets.weapons.ProcWeapon = {main="Soboro Sukehiro",sub="Nepenthe Grip"}
    sets.weapons.Lance = {main="Kaja Lance",sub="Nepenthe Grip"}

    -- Buff sets
    sets.Cure_Received = {hands="Buremte Gloves",waist="Gishdubar Sash",legs="Flamma Dirs +2"}
    sets.buff.Doom = set_combine(sets.buff.Doom, {})
    sets.buff.Sleep = {neck="Vim Torque +1"}
    sets.buff.Hasso = {hands="Wakido Kote +2"}
    sets.buff['Third Eye'] = {} --legs="Sakonji Haidate +3"
    sets.buff.Sekkanoki = {hands="Kasuga Kote +1"}
    sets.buff.Sengikori = {feet="Kas. Sune-Ate +1"}
    sets.buff['Meikyo Shisui'] = {feet="Sak. Sune-Ate +1"}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'DNC' then
        set_macro_page(1, 2)
    elseif player.sub_job == 'WAR' then
        set_macro_page(1, 2)
    elseif player.sub_job == 'NIN' then
        set_macro_page(1, 2)
    elseif player.sub_job == 'THF' then
        set_macro_page(1, 2)
    else
        set_macro_page(1, 2)
    end
end

function user_job_lockstyle()
	if state.Weapons.value == 'Dojikiri Yasutsuna' then
		windower.chat.input('/lockstyleset 003')
	else
		windower.chat.input('/lockstyleset 003')
	end
end
