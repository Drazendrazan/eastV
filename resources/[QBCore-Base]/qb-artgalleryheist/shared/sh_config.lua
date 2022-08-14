Config = {}

Config.MinimumPolice = 0

Config.OutsideHacks = {
    [1] = { -- DESK
        coords = vector3(15.159727, 144.60311, 93.791381),
        hit = false,
    },
}

Config.MainDoor = 50 -- Coords: vector3(17.56, 146.74, 93.8)

Config.InsideHacks = {
    [1] = { -- DOOR
        coords = vector3(20.708341, 152.99189, 93.792877),
        laptopcoords = vector4(19.714302, 153.00865, 94.092739, 73.707214),
        busy = false,
        hit = false,
        doorId = 53, -- Coords: vector3(20.33, 155.5, 93.79)
    },
    [2] = { -- SECURITY ROOM
        coords = vector3(17.491443, 153.06466, 93.790435),
        laptopcoords = vector4(16.656268, 152.8962, 94.020496, 165.34182),
        busy = false,
        hit = false,
        doorId = 53, -- Coords: vector3(20.33, 155.5, 93.79)
    },
}

Config.Code = {
    coords = vector3(15.74549, 140.19191, 93.992701),
    isOpened = false,
    taken = false,
}

Config.Egg = {
    coords = vector4(11.309403, 139.19904, 94.295333, 68.077606),
    busy = false,
    taken = false,
}

Config.ThermiteDoors = {
    [1] = {
        coords = vector3(36.773773, 144.54411, 93.792846),
        ptfx = vector3(36.223773, 146.24411, 93.992846),
        animation = vector4(36.223773, 145.34411, 93.992846, 343.00),
        doorId = 51, -- Coords: vector3(36.98, 145.23, 93.79)
        busy = false,
        hit = false,
    },
    [2] = {
        coords = vector3(33.356781, 135.80494, 93.792938),
        ptfx = vector3(32.606781, 136.48494, 93.892846),
        animation = vector4(32.656781, 135.50494, 93.892846, 163.00),
        doorId = 52, -- Coords: vector3(32.98, 135.12, 93.79)
        busy = false,
        hit = false,
    },
}

Config.Cases = {
    [1] = {
        coords = vector4(42.592405, 147.87087, 93.834838, 160.00),
        busy = false,
        hit = false,
        type = "Jewellery",
    },
    [2] = {
        coords = vector4(41.424035, 148.31617, 93.834838, 160.00),
        busy = false,
        hit = false,
        type = "Jewellery",
    },
    [3] = {
        coords = vector4(42.383654, 147.26843, 93.834838, 160.00),
        busy = false,
        hit = false,
        type = "Gems",
    },
    [4] = {
        coords = vector4(41.169186, 147.64009, 93.834838, 160.00),
        busy = false,
        hit = false,
        type = "Jewellery",
    },
    [5] = {
        coords = vector4(36.020444, 130.19235, 93.834838, 160.00),
        busy = false,
        hit = false,
        type = "Jewellery",
    },
    [6] = {
        coords = vector4(35.733113, 129.55784, 93.134838, 160.00),
        busy = false,
        hit = false,
        type = "Jewellery",
    },
    [7] = {
        coords = vector4(34.552586, 130.05612, 93.834838, 160.00),
        busy = false,
        hit = false,
        type = "Jewellery",
    },
    [8] = {
        coords = vector4(34.792967, 130.64825, 93.834838, 160.00)    ,
        busy = false,
        hit = false,
        type = "Jewellery",
    }
}

Config.Paintings = {
    [1] = {
        coords = vector4(23.51, 149.4, 93.79, 339.76),
        taken = false,
        item = 'artg_painting1'
    },
    [2] = {
        coords = vector4(23.96, 150.59, 93.79, 160.45),
        taken = false,
        item = 'artg_painting2'
    },
    [3] = {
        coords = vector4(22.0, 151.33, 93.79, 160.24),
        taken = false,
        item = 'artg_painting3'
    },
    [4] = {
        coords = vector4(19.96, 139.52, 93.79, 338.77),
        taken = false,
        item = 'artg_painting4'
    },
    [5] = {
        coords = vector4(37.62, 134.3, 93.79, 159.31),
        taken = false,
        item = 'artg_painting5'
    },
    [6] = {
        coords = vector4(41.29, 144.24, 93.79, 159.79),
        taken = false,
        item = 'artg_painting6'
    },
    [7] = {
        coords = vector4(18.44, 141.36, 93.79, 160.43),
        taken = false,
        item = 'artg_painting7'
    },
    [8] = {
        coords = vector4(39.63, 133.63, 93.79, 163.72),
        taken = false,
        item = 'artg_painting8'
    },
    [9] = {
        coords = vector4(39.13, 132.38, 93.79, 340.89),
        taken = false,
        item = 'artg_painting9'
    },
    [10] = {
        coords = vector4(40.87, 143.07, 93.79, 345.06),
        taken = false,
        item = 'artg_painting10'
    }
}

Config.MaleNoHandshoes = {
    [0] = true,
    [1] = true,
    [2] = true,
    [3] = true,
    [4] = true,
    [5] = true,
    [6] = true,
    [7] = true,
    [8] = true,
    [9] = true,
    [10] = true,
    [11] = true,
    [12] = true,
    [13] = true,
    [14] = true,
    [15] = true,
    [16] = true,
    [17] = true,
    [18] = true,
    [19] = true,
    [56] = true,
    [57] = true,
    [58] = true,
    [59] = true,
    [60] = true,
    [61] = true,
    [62] = true,
    [63] = true,
    [64] = true,
    [65] = true,
    [66] = true,
    [101] = true,
    [102] = true,
    [116] = true,
    [117] = true,
    [118] = true,
    [129] = true,
    [136] = true,
    [173] = true,
}

Config.FemaleNoHandshoes = {
    [0] = true,
    [1] = true,
    [2] = true,
    [3] = true,
    [4] = true,
    [5] = true,
    [6] = true,
    [7] = true,
    [8] = true,
    [9] = true,
    [10] = true,
    [11] = true,
    [12] = true,
    [13] = true,
    [14] = true,
    [15] = true,
    [16] = true,
    [17] = true,
    [18] = true,
    [19] = true,
    [20] = true,
    [23] = true,
    [63] = true,
    [64] = true,
    [65] = true,
    [66] = true,
    [67] = true,
    [68] = true,
    [69] = true,
    [70] = true,
    [71] = true,
    [72] = true,
    [73] = true,
    [74] = true,
    [75] = true,
    [133] = true,
    [134] = true,
    [135] = true,
    [146] = true,
    [153] = true,
    [157] = true,
    [161] = true,
    [165] = true,
    [169] = true,
}