return {
    -- Mercury barycenter module
    {
        Name = "MercuryBarycenter",
        Parent = "SolarSystemBarycenter",
    },
    -- Mercury module
    {   
        Name = "Mercury",
        Parent = "MercuryBarycenter",
        Renderable = {
            Type = "RenderablePlanet",
            Frame = "IAU_MERCURY",
            Body = "MERCURY",
            Geometry = {
                Type = "SimpleSphere",
                Radius = { 2.440, 6 },
                Segments = 100
            },
            Textures = {
                Type = "simple",
                Color = "textures/mercury.jpg",
            },
            Atmosphere = {
                Type = "Nishita", -- for example, values missing etc etc
                MieFactor = 1.0,
                MieColor = {1.0, 1.0, 1.0}
            }
        },
        Transform = {
            Translation = {
                Type = "SpiceTranslation",
                Body = "MERCURY",
                Observer = "SUN",
                Kernels = "${OPENSPACE_DATA}/spice/de430_1850-2150.bsp"
            },
            Rotation = {
                Type = "SpiceRotation",
                SourceFrame = "IAU_MERCURY",
                DestinationFrame = "ECLIPJ2000",
            },
            Scale = {
                Type = "StaticScale",
                Scale = 1,
            },
        }
    },
    -- MercuryTrail module
    {   
        Name = "MercuryTrail",
        Parent = "MercuryBarycenter",
        Renderable = {
            Type = "RenderableTrail",
            Body = "MERCURY",
            Frame = "GALACTIC",
            Observer = "SUN",
            RGB = {0.6, 0.5, 0.5 },
            TropicalOrbitPeriod = 87.968 ,
            EarthOrbitRatio = 0.241,
            DayLength = 4222.6,
            Textures = {
                Type = "simple",
                Color = "${COMMON_MODULE}/textures/glare_blue.png",
                -- need to add different texture
            },  
        }
    }
}
