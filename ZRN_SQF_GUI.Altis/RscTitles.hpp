class RscWatch;

class RscTitles
{
	class VNRON_Display_Watch_Vanilla
	{    
		idd = -1;
        
        fadeIn = 1;
		duration = 10;
        fadeOut = 1;
        class Objects
        {
            class Watch : RscWatch
            {

                useGlobalLight = 0;
                //minGlobalLightIntensity = 0.01;
                access = 0;
                shadow = 0;
                idc = 101;
                type = 80;
                model = "\a3\UI_F_Enoch\Data\Objects\Watch.p3d";
                selectionDate1 = "date1";
                selectionDate2 = "date2";
                selectionDay = "day";
                x = 0.5;
                y = 0.5;
                z = 0.22;
                xBack = 0.7;
                yBack = 0.12;
                zBack = 0.22;
                inBack = 0;
                enableZoom = 0;
                direction[] = { 0, 0, 1 };
                up[] = { 0, 1, 0 };
                zoomDuration = 1;
                scale = 3;
                waitForLoad = 0;
                class Animations
                {
                    class WatchHour
                    {
                        type = "rotation";
                        source = "clockHour";
                        selection = "hodinova";
                        axis = "osa";
                        memory = 1;
                        animPeriod = 0;
                        angle0 = 0;
                        angle1 = "rad 360";
                    };
                    class WatchMinute
                    {
                        type = "rotation";
                        source = "clockMinute";
                        selection = "minutova";
                        axis = "osa";
                        memory = 1;
                        animPeriod = 0;
                        angle0 = 0;
                        angle1 = "rad 360";
                    };
                    class WatchSecond
                    {
                        type = "rotation";
                        source = "clockSecond";
                        selection = "vterinova";
                        axis = "osa";
                        memory = 1;
                        animPeriod = 0;
                        angle0 = 0;
                        angle1 = "rad 360";
                    };
                };
            };
        };
	};
};