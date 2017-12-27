
// Consts
Inch = 25.4;

// **********
// Definitions
// **********

// Total Width and Height of final cut cardboard area
totalWidth = 21 * Inch;
totalHeight = 10 * Inch;

// Width of the space for an AP
apWidth = 9 * Inch;

// Width of the slot for opposing cardboard
apSlotWidth = 0.25 * Inch;

// Width of the space for a hand tab
handTabWidth = 4 * Inch;


// Base square 
difference()
{
    square([totalWidth,totalHeight]);
//    translate([0.5*Inch,0.5*Inch,0])
//    {
//        circle(0.5 * Inch);
//    } 
    AssembleVerticalSlots();
    assembleHandTabs();
}



// Vertical slots 
module AssembleVerticalSlots()
{
    for(i = [0:2])
    {
        
        startingX = 0;
        
        // Left
        if(i == 0)
        {
            startingX = (totalWidth / 2) - (apWidth);
            makeVerticalSlots(startingX, 0);
        }
        // Middle
        else if (i == 1)
        {
            startingX = (totalWidth / 2);
            makeVerticalSlots(startingX, 0);
        }
        // Right
        else if (i == 2)
        {
            startingX = (totalWidth / 2) + (apWidth);
            makeVerticalSlots(startingX, 0);
        } 
    } 
};

// Make the vertical slots that the opposite cardboard will go into
module makeVerticalSlots(startingX)
{
    translate([startingX - (apSlotWidth/2),totalHeight-(5*Inch),0])
    {
        union()
        {
            square([0.25*Inch, 5*Inch]);
            translate([(apSlotWidth)/2,0,0])
            {
                circle(d=apSlotWidth, $fn=20);
            };
        }
        
                    translate([apSlotWidth/2,5*Inch,0])
            {
                polygon(points=[[0,0],[0,-0.5*Inch],[0.5*Inch,0]]);
                polygon(points=[[0,0],[0,-0.5*Inch],[-0.5*Inch,0]]);
            };
        
    };
}

 
module assembleHandTabs()
{
     for(i = [0:1])
    {
        
        startingX = 0;
        
        // Left
        if(i == 0)
        {
            startingX = (totalWidth - (apWidth))/2;
            makeHandTabs(startingX, 0);
        }
        // Right
        else if (i == 1)
        {
            startingX = (totalWidth + (apWidth))/2;
            makeHandTabs(startingX, 0);
        }
    } 
}


 
module makeHandTabs(startingX)
{
    
    tabHeight = 1.5*Inch;
    
    translate([startingX - (handTabWidth/2),totalHeight-tabHeight,0])
    {
        union()
        {
            square([handTabWidth, tabHeight]);
            translate([0.5*Inch,0,0])
            {
                circle(d=1*Inch, $fn=20);
            };
            translate([handTabWidth-(0.5*Inch),0,0])
            {
                circle(d=1*Inch, $fn=20);
            };
            translate([0.5*Inch,-0.5*Inch,0])
            {
                 square([handTabWidth-1*Inch, 2*Inch]);
            };
           
        }
        
    };
    
    
    
}