Config = {}

Config.Items = {
    CigarettePack = 'cigarette_pack',
    Cigarette = 'cigarette',
    SnusPack = 'snus_pack',
    Snus = 'snus'
}

Config.Amounts = {
    CigarettesPerPack = 10,
    SnusPerPack = 10
}

Config.Progress = {
    Cigarette = 12000,
    Snus = 7000
}

Config.Stress = {
    Enabled = true,
    Event = 'hud:server:RelieveStress',
    CigaretteAmount = 8,
    SnusAmount = 6
}

Config.Animations = {
    Cigarette = {
        dict = 'amb@world_human_aa_smoke@male@idle_a',
        clip = 'idle_c',
        flag = 49,
        prop = {
            model = `prop_cs_ciggy_01`,
            bone = 28422,
            pos = vec3(0.0, 0.0, 0.0),
            rot = vec3(0.0, 0.0, 0.0)
        }
    },

    Snus = {
        dict = 'mp_suicide',
        clip = 'pill',
        flag = 49
    }
}

Config.Notify = {
    OpenedCigarettePack = 'You opened a cigarette pack and got 10 cigarettes.',
    OpenedSnusPack = 'You opened a snus pack and got 10 snus.',
    NotEnoughSpace = 'You do not have enough space in your inventory.',
    MissingItem = 'Item not found.',
    Smoking = 'Smoking cigarette...',
    UsingSnus = 'Using snus...',
    Cancelled = 'Cancelled.',
    AlreadyBusy = 'You are already using something.'
}