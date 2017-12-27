
// Consts
Inch = 25.4;

// **********
// Definitions
// **********

// Total Width and Height of final cut cardboard area
totalWidth = 17 * Inch;
totalHeight = 10 * Inch;

// Width of the space for an AP
apDepth = 2.6 * Inch;

// Width of the slot for opposing cardboard
apSlotWidth = 0.25 * Inch;

// Number of slots deep.
numSlotsDeep = 6;

// Base square 
difference()
{
    square([totalWidth,totalHeight]);
//    translate([0.5*Inch,0.5*Inch,0])
//    {
//        circle(0.5 * Inch);
//    } 
    AssembleVerticalSlots();
}



// Vertical slots 
module AssembleVerticalSlots()
{
    for(i = [0:numSlotsDeep])
    {
        
        startingX = 0;
        
        startingX = (totalWidth - ((apDepth - (apSlotWidth/2))  * numSlotsDeep+1 )) + (apDepth * i);
        makeVerticalSlots(startingX, 0);
        
        
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
            
            translate([apSlotWidth/2,5*Inch,0])
            {
                polygon(points=[[0,0],[0,-0.5*Inch],[0.5*Inch,0]]);
                polygon(points=[[0,0],[0,-0.5*Inch],[-0.5*Inch,0]]);
            };
        }
        
    };
}

 
    
    
