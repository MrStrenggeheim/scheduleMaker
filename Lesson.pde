public class Lesson {

    PFont title = createFont("Roboto", 56);
    
    
    
    float textSpacing = 0;
    
    
    String lessonTime = "";
    String hour = "";
    String minute = "";
    String zero = "0";



    public Lesson (String title, String description, int day, float beginning, float end, color col, int transp, boolean online) {
        paint(title, description, day, beginning, end, col, transp, online);
    }

    public Lesson (String title, String description, int day, float beginning, float end, color col, int transp) {
        paint(title, description, day, beginning, end, col, transp, false);
    }
        
    private void paint(String title, String description, int day, float beginning, float end, color col, int transp, boolean online) {
        day = constrain(day, 0, week);
        beginning = constrain(beginning, minTime, end);
        end = constrain(end, beginning, maxTime);







        //set String for Time 
        zero = "0";
        if (floor(beginning) > 9)
            zero = "";
        hour = zero + floor(beginning);
        zero = "0";
        if ((beginning - floor(beginning))*60 > 9)
            zero = "";
        minute =zero + (int)((beginning - floor(beginning))*60);
        lessonTime = hour + ":" + minute + " - ";

        zero = "0";
        if (floor(end) > 9)
            zero = "";
        hour = zero + floor(end);
        zero = "0";
        if ((end - floor(end))*60 > 9)
            zero = "";
        minute = zero + (int)((end - floor(end))*60);

        lessonTime += hour + ":" + minute;

        float duration = end - beginning;
        beginning -= minTime;
        end -= minTime;

        //draw Rectangle
        fill(col, transp);
        stroke(0);
        strokeWeight(2);
        rectMode(CORNER);
        rect(day * topSpacing, beginning * timeSpacing, topSpacing, duration * timeSpacing);
        
        
        if (online) {
            int density = 5;
            float sizeX = topSpacing/density;
            int amountDown = (int) Math.floor((duration*timeSpacing)/sizeX);
            float sizeY = (duration*timeSpacing)/amountDown;
            
            
            for (int y = 0; y < Math.floor(amountDown); y++) {
                for (int x = 0; x < density; x++) {
                    image(schraffiert, day * topSpacing + x*sizeX, beginning * timeSpacing + y*sizeY, sizeX, sizeY);
                }
            }
            
            
            
            
                    //image(schraffiert, day * topSpacing, beginning * timeSpacing, size, size);
        }
        

        


        //draw text
        pushMatrix();
        translate(textIndent, textIndent);
        
        fill(0);
        stroke(0);

        textAlign(LEFT, TOP);

        textFont(lessonTimeFont);
        text(lessonTime, day * topSpacing, beginning * timeSpacing);
        
        translate(0, timeSpacing * duration/3 - textIndent);
        
        textFont(titleFont);
        text(title, day * topSpacing, beginning * timeSpacing);
        textSpacing += textAscent();
        
        textFont(descriptionFont);
        text(description, day * topSpacing, beginning * timeSpacing + textSpacing);
        
        popMatrix();
     }

     
}
