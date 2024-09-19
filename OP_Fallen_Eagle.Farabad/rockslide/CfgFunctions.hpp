class zrn
{
    tag = "zrn_rockslide";
    class zrn_rockslide
    {
        file = "rockslide\functions";
        
        class init_cba_eh { postInit = 1; };
        
        class define { postInit = 1; };

        class prep {};

        class global_effects {};
        class local_effects {};
        class local_smoke {};
        class local_rocks {};
    };
};