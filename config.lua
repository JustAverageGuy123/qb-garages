Config = {}
Config.AutoRespawn = true          -- true == stores cars in garage on restart | false == doesnt modify car states
Config.VisuallyDamageCars = true   -- true == damage car on spawn | false == no damage on spawn
Config.SharedGarages = false       -- true == take any car from any garage | false == only take car from garage stored in
Config.ClassSystem = false         -- true == restrict vehicles by class | false == any vehicle class in any garage
Config.FuelResource = 'lc_fuel' -- supports any that has a GetFuel() and SetFuel() export
Config.Warp = true                 -- true == warp player into vehicle | false == vehicle spawns without warping

-- https://docs.fivem.net/natives/?_0x29439776AAA00A62
Config.VehicleClass = {
    all = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22 },
    car = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 12, 13, 18, 22 },
    air = { 15, 16 },
    sea = { 14 },
    rig = { 10, 11, 17, 19, 20 }
}

Config.Garages = {
    motelgarage = {
        label = 'Motel Parking',
        takeVehicle = vector3(274.29, -334.15, 44.92),
        spawnPoint = {
            vector4(265.96, -332.3, 44.51, 250.68)
        },
        showBlip = true,
        blipName = 'Public Parking',
        blipNumber = 357,
        blipColor = 3,
        type = 'public', -- public, gang, job, depot
        category = Config.VehicleClass['car']
    },
        zancudogarage = {
        label = 'Pops Big Rig Parking',
        takeVehicle = vector3(137.67, 6632.99, 31.67),
        spawnPoint = {
            vector4(127.69, 6605.84, 31.93, 223.67)
        },
        showBlip = true,
        blipName = 'Public Parking',
        blipNumber = 357,
        blipColor = 3,
        type = 'public', -- public, gang, job, depot
        category = Config.VehicleClass['car']
    },
        sandyfd = {
        label = 'Sandy Shores Fire Department',
        takeVehicle = vector3(1703.7784, 3589.0085, 35.4998),
        spawnPoint = {
            vector4(1703.7784, 3589.0085, 35.4998, 38.0820)
        },
        showBlip = true,
        blipName = 'Sandy Shores Fire Department',
        blipNumber = 436,
        blipColor = 1,
        type = 'public', -- public, gang, job, depot
        category = Config.VehicleClass['car']
    },
        paletofd = {
        label = 'Paleto Fire Department',
        takeVehicle = vector3(-360.2897, 6145.6719, 31.4676),
        spawnPoint = {
            vector4(1-360.2897, 6145.6719, 31.4676, 137.9747)
        },
        showBlip = true,
        blipName = 'Paleto Fire Department',
        blipNumber = 436,
        blipColor = 1,
        type = 'public', -- public, gang, job, depot
        category = Config.VehicleClass['car']
    },
    casinogarage = {
        label = 'Casino Parking',
        takeVehicle = vector3(883.96, -4.71, 78.76),
        spawnPoint = {
            vector4(895.39, -4.75, 78.35, 146.85)
        },
        showBlip = true,
        blipName = 'Public Parking',
        blipNumber = 357,
        blipColor = 3,
        type = 'public',
        category = Config.VehicleClass['car']
    },
    sapcounsel = {
        label = 'San Andreas Parking',
        takeVehicle = vector3(-330.01, -780.33, 33.96),
        spawnPoint = {
            vector4(-341.57, -767.45, 33.56, 92.61)
        },
        showBlip = true,
        blipName = 'Public Parking',
        blipNumber = 357,
        blipColor = 3,
        type = 'public',
        category = Config.VehicleClass['car']
    },
    spanishave = {
        label = 'Spanish Ave Parking',
        takeVehicle = vector3(-1160.86, -741.41, 19.63),
        spawnPoint = {
            vector4(-1145.2, -745.42, 19.26, 108.22)
        },
        showBlip = true,
        blipName = 'Public Parking',
        blipNumber = 357,
        blipColor = 3,
        type = 'public',
        category = Config.VehicleClass['car']
    },
    caears24 = {
        label = 'Caears 24 Parking',
        takeVehicle = vector3(69.84, 12.6, 68.96),
        spawnPoint = {
            vector4(60.8, 17.54, 68.82, 339.7)
        },
        showBlip = true,
        blipName = 'Public Parking',
        blipNumber = 357,
        blipColor = 3,
        type = 'public',
        category = Config.VehicleClass['car']
    },
    caears242 = {
        label = 'Caears 24 Parking',
        takeVehicle = vector3(-453.7, -786.78, 30.56),
        spawnPoint = {
            vector4(-472.39, -787.71, 30.14, 180.52)
        },
        showBlip = true,
        blipName = 'Public Parking',
        blipNumber = 357,
        blipColor = 3,
        type = 'public',
        category = Config.VehicleClass['car']
    },
    lagunapi = {
        label = 'Laguna Parking',
        takeVehicle = vector3(364.37, 297.83, 103.49),
        spawnPoint = {
            vector4(375.09, 294.66, 102.86, 164.04)
        },
        showBlip = true,
        blipName = 'Public Parking',
        blipNumber = 357,
        blipColor = 3,
        type = 'public',
        category = Config.VehicleClass['car']
    },
    airportp = {
        label = 'Airport Parking',
        takeVehicle = vector3(-773.12, -2033.04, 8.88),
        spawnPoint = {
            vector4(-779.77, -2040.18, 8.47, 315.34)
        },
        showBlip = true,
        blipName = 'Public Parking',
        blipNumber = 357,
        blipColor = 3,
        type = 'public',
        category = Config.VehicleClass['car']
    },
    beachp = {
        label = 'Beach Parking',
        takeVehicle = vector3(-1185.32, -1500.64, 4.38),
        spawnPoint = {
            vector4(-1188.14, -1487.95, 3.97, 124.06)
        },
        showBlip = true,
        blipName = 'Public Parking',
        blipNumber = 357,
        blipColor = 3,
        type = 'public',
        category = Config.VehicleClass['car']
    },
    themotorhotel = {
        label = 'The Motor Hotel Parking',
        takeVehicle = vector3(1137.77, 2663.54, 37.9),
        spawnPoint = {
            vector4(1127.7, 2647.84, 37.58, 1.41)
        },
        showBlip = true,
        blipName = 'Public Parking',
        blipNumber = 357,
        blipColor = 3,
        type = 'public',
        category = Config.VehicleClass['car']
    },
    liqourparking = {
        label = 'Liqour Parking',
        takeVehicle = vector3(883.99, 3649.67, 32.87),
        spawnPoint = {
            vector4(898.38, 3649.41, 32.36, 90.75)
        },
        showBlip = true,
        blipName = 'Public Parking',
        blipNumber = 357,
        blipColor = 3,
        type = 'public',
        category = Config.VehicleClass['car']
    },
    shoreparking = {
        label = 'Shore Parking',
        takeVehicle = vector3(1737.03, 3718.88, 34.05),
        spawnPoint = {
            vector4(1725.4, 3716.78, 34.15, 20.54)
        },
        showBlip = true,
        blipName = 'Public Parking',
        blipNumber = 357,
        blipColor = 3,
        type = 'public',
        category = Config.VehicleClass['car']
    },
    haanparking = {
        label = 'Bell Farms Parking',
        takeVehicle = vector3(76.88, 6397.3, 31.23),
        spawnPoint = {
            vector4(62.15, 6403.41, 30.81, 211.38)
        },
        showBlip = true,
        blipName = 'Public Parking',
        blipNumber = 357,
        blipColor = 3,
        type = 'public',
        category = Config.VehicleClass['car']
    },
    dumbogarage = {
        label = 'Dumbo Private Parking',
        takeVehicle = vector3(165.75, -3227.2, 5.89),
        spawnPoint = {
            vector4(168.34, -3236.1, 5.43, 272.05)
        },
        showBlip = true,
        blipName = 'Public Parking',
        blipNumber = 357,
        blipColor = 3,
        type = 'public',
        category = Config.VehicleClass['car']
    },
    pillboxgarage = {
        label = 'Pillbox Garage Parking',
        takeVehicle = vector3(213.2, -796.05, 30.86),
        spawnPoint = {
            vector4(222.02, -804.19, 30.26, 248.19),
            vector4(223.93, -799.11, 30.25, 248.53),
            vector4(226.46, -794.33, 30.24, 248.29),
            vector4(232.33, -807.97, 30.02, 69.17),
            vector4(234.42, -802.76, 30.04, 67.2)
        },
        showBlip = true,
        blipName = 'Public Parking',
        blipNumber = 357,
        blipColor = 3,
        type = 'public',
        category = Config.VehicleClass['car']
    },
    grapeseedgarage = {
        label = 'Grapeseed Parking',
        takeVehicle = vector3(2552.68, 4671.8, 33.95),
        spawnPoint = {
            vector4(2550.17, 4681.96, 33.81, 17.05)
        },
        showBlip = true,
        blipName = 'Public Parking',
        blipNumber = 357,
        blipColor = 3,
        type = 'public',
        category = Config.VehicleClass['car']
    },
    depotLot = {
        label = 'Depot Lot',
        takeVehicle = vector3(401.76, -1632.57, 29.29),
        spawnPoint = {
            vector4(396.55, -1643.93, 28.88, 321.91)
        },
        showBlip = true,
        blipName = 'Depot Lot',
        blipNumber = 68,
        blipColor = 3,
        type = 'depot',
        category = Config.VehicleClass['car']
    },
    ballas = {
        label = 'Ballas',
        takeVehicle = vector3(87.51, -1969.1, 20.75),
        spawnPoint = {
            vector4(93.78, -1961.73, 20.34, 319.11)
        },
        showBlip = false,
        blipName = 'Ballas',
        blipNumber = 357,
        blipColor = 3,
        type = 'gang',
        category = Config.VehicleClass['car'], --car, air, sea, rig
        job = 'ballas',
        jobType = 'ballas'
    },
    families = {
        label = 'Families',
        takeVehicle = vector3(-23.89, -1436.03, 30.65),
        spawnPoint = {
            vector4(-25.47, -1445.76, 30.24, 178.5)
        },
        showBlip = false,
        blipName = 'Families',
        blipNumber = 357,
        blipColor = 3,
        type = 'gang',
        category = Config.VehicleClass['car'], --car, air, sea, rig
        job = 'families',
        jobType = 'families'
    },
    lostmc = {
        label = 'Lost MC',
        takeVehicle = vector3(985.83, -138.14, 73.09),
        spawnPoint = {
            vector4(977.65, -133.02, 73.34, 59.39)
        },
        showBlip = false,
        blipName = 'Lost MC',
        blipNumber = 357,
        blipColor = 3,
        type = 'gang',
        category = Config.VehicleClass['car'], --car, air, sea, rig
        job = 'lostmc',
        jobType = 'lostmc'
    },
    cartel = {
        label = 'Cartel',
        takeVehicle = vector3(1411.67, 1117.8, 114.84),
        spawnPoint = {
            vector4(1403.01, 1118.25, 114.84, 88.69)
        },
        showBlip = false,
        blipName = 'Cartel',
        blipNumber = 357,
        blipColor = 3,
        type = 'gang',
        category = Config.VehicleClass['car'],
        job = 'cartel',
        jobType = 'cartel'
    },
    police = {
        label = 'Police',
        takeVehicle = vector3(462.83, -1019.52, 28.1),
        spawnPoint = {
            vector4(446.16, -1025.79, 28.23, 6.59)
        },
        showBlip = false,
        blipName = 'Police',
        blipNumber = 357,
        blipColor = 3,
        type = 'job',
        category = Config.VehicleClass['car'], --car, air, sea, rig
        job = 'police',
        jobType = 'leo'
    },
}
