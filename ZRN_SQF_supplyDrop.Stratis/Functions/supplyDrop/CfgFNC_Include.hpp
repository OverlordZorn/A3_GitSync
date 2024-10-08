class ZRN_supplyDrop
{
    // tag = "TAG"; // the function will be named TAG_fnc_myOtherFunction
    class supplyDrop
    {
        //file = "Functions\supplyDrop";

        class missionSetup { preInit = 1; }; // Here, you would edit the example provided to initilize/register the individual crates

        class init_CEH { preInit = 1; };

        class register {};
        class defaultEntry {};
        class createZeusInteraction {};

        class defineTarget {};
        class getPosFromMap {};
        class dispatchAircraft {};

        class dropCrate {};
        class fillCrate {};
    };
};
