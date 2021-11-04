//Size of the exportet file in px
int sizeX = 3508;
int sizeY = 2480;

//Size Variables
int border = 128; 
int boxHeight = sizeY - 2*border;
int boxWidth = sizeX - 2*border;

//left
int left = 256;

//top
int top = 256;
String[] days = {"Montag", "Dienstag", "Mittwoch", "Donnerstag", "Freitag"};
int week = days.length;
int topSpacing = (boxWidth-left)/week;

//Time table left
int minTime = 8;
int maxTime = 20;
int timeSlots = maxTime-minTime;
int timeSpacing = (boxHeight - top)/timeSlots;


PImage logo;
PImage schraffiert;

//text
int textIndent = 12;
PFont dayFont;
PFont timeFont;
PFont lessonTimeFont;
PFont titleFont;
PFont descriptionFont;

void settings() {
    size(sizeX, sizeY);
}

void setup() {
    
    dayFont = createFont("Roboto Black", 72);
    timeFont = createFont("Roboto Light", 56);
    lessonTimeFont = createFont("Roboto", 42);
    titleFont = createFont("Roboto Medium", 52);
    descriptionFont = createFont("Roboto", 46);
    logo = loadImage("\28logo.png");
    schraffiert = loadImage("schraffiert.png");

    // draw Background
    table();
    
    /* Farben:
    * blau: #5672d6
    * rot: #d45555
    * grün: #64d658
    * lila: #b52bba
    *
    */
    
    //-------------------------------------------------------------------------------------
    
    
    
    
    //Montag
    // new Lesson("Physik", "Offenes Tutorium", 0, 10, 12, #56bfd6, 50);
    new Lesson("GBS", "Vorlesung", 0, 13.75, 15.25, #64d658, 150, true);
    
    //Dienstag
    new Lesson("Physik", "Vorlesung", 1, 8.5, 10, #56bfd6, 250);
    new Lesson("Physik", "Übung", 1, 10, 12, #56bfd6, 250);
    new Lesson("Analysis", "Vorlesung", 1, 12.25, 13.75, #5672d6, 150, true);
    
    //Mittwoch
    new Lesson("GDB", "Vorlesung", 2, 10, 13, #ff9721, 250, true);
    new Lesson("GBS", "Vorlesung", 2, 13, 14, #64d658, 250, true);
    new Lesson("GDB", "Übung", 2, 16, 18, #ff9721, 250);
    
    
    //Donnerstag
    new Lesson("Analysis", "Vorlesung", 3, 8.5, 10, #5672d6, 150, true);
    new Lesson("Analysis", "Übung", 3, 10, 12, #5672d6, 250, true);
    new Lesson("FuPro", "Übung", 3, 12, 14, #d45555, 250, true);
    new Lesson("GBS", "Übung", 3, 14.25, 16, #64d658, 250, true);
    
    //Freitag
    new Lesson("FuPro", "Vorlesung", 4, 8.5, 10, #d45555, 150, true);
    new Lesson("Physik", "Vorlesung", 4, 10, 12, #56bfd6, 250);
    new Lesson("Physik", "Mathemat. Ergänzung", 3, 16, 18, #56bfd6, 150, true);
    
    // Hausaufgaben
    
    /*
    new Lesson("DS", "Hausaufgaben", 4, 10, 12, #5672d6, 40);
    new Lesson("ERA", "Hausaufgaben", 4, 12, 13, #64d658, 40);
    new Lesson("EIDI", "Hausaufgaben", 4, 14, 15, #d45555, 40);
    */
    // new Lesson("Hausaufgaben", "und Wiederholungen\nTutor-Zeug", 4, 11, 17, #000000, 40);

    
    //Tutor
    
    new Lesson("Tutor", "Besprechung", 0, 17, 19, #b52bba, 250, true);
    new Lesson("PGdP", "Tutorium", 1, 15.5, 18.5, #b52bba, 250);
    //new Lesson("Nachmittagsbetreuung", "GRG", 1, 13, 15.5, #b52bba, 220);

    
    
    
    
    
    //-------------------------------------------------------------------------------------


    save("Stundenplan.png");
    exit();
}

void table() {
    background(255);


    // B O X 
    stroke(0);
    strokeWeight(6);
    //rect(0, 0, width, height);
    rect(border, border, width - border*2, height - border*2);


    //translate --------------------------------
    translate(border, border);


    // L E F T 
    strokeWeight(6);
    rect(0, 0, left, boxHeight);


    // T O P
    fill(200);
    strokeWeight(6);
    rect(0, 0, boxWidth, top);

    fill(0);
    textFont(dayFont);
    textAlign(CENTER);
    for (int i = 0; i < week; i++) {
        strokeWeight(2);
        text(days[i], left+i*topSpacing + topSpacing/2, top/2+ textAscent()/2);
        line(left+i*topSpacing, 0, left+i*topSpacing, boxHeight);
    }


    // I M A G E 
    fill(200);
    strokeWeight(6);
    rect(0, 0, left, top);
    image(logo, 0, 0, left, top);


    //translate down ----------------------------
    translate (0, top);


    // T I M E T A B L E  
    fill(0);
    for (int i = 1; i < timeSlots; i++) { 
        String zero = "0";
        if (minTime + i > 9)
            zero = "";
        textFont(timeFont);
        text(zero + (minTime+i) + ":00", left/2, timeSpacing*i + textAscent()/2);
        //textSize(32);
        //text("00", left/2 + 2*textWidth("00"), timeSpacing*i + textAscent()/3);
        strokeWeight(2);
        line(left, timeSpacing*i, boxWidth, timeSpacing*i);
    }
    
    translate(left, 0);
}
