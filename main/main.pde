import guicomponents.*;
//import processing.serial.*;
//Serial port;

String savePath = ("C:/Users/Stevan/Documents/SP/arduino/saves/fianl/final_without_port/data/data.txt");

int sizex= 200;
int sizey= 40;
Info[] cd;
String[] lines;
GButton[] btnsB = new GButton[24];
GButton go;
GButton rename;
GTextField text1;
GLabel title;
int tray_num;
boolean can_go;
GButton e;



void setup() {
//  println("Available serial ports:");
//  println(Serial.list());
//  port = new Serial(this, Serial.list()[0], 9600);  
  size(sizex*2+15, sizey*24+10);
  background(150);
  cd = new Info[24];
  lines = loadStrings(savePath);
  
  for(int indexa= 0; indexa < 24; indexa++) {
        if (lines.length != 0) {
      String name_read= lines[indexa];
      cd[indexa] = new Info(name_read);
    }
    else if (lines.length == 0) {
      String name_read= ("empty");
      cd[indexa] = new Info(name_read);
    }
  }

  G4P.setColorScheme(this, GCScheme.BLUE_SCHEME);
  G4P.setFont(this, "Verdana", sizey/2);

  for(int count = 0; count < 24; count++) {
    btnsB[count] = new GButton(this, cd[count].get_name(), 5, sizey*count+5, sizex, sizey);
    btnsB[count].tag = str(count+1);
    btnsB[count].setTextAlign(GAlign.MIDDLE | GAlign.CENTER);
    btnsB[count].fireAllEvents(true);
  }
  G4P.setMouseOverEnabled(true);
  

  text1 = new GTextField(this, "", sizex+10, 5+5*sizey, sizex-3, sizey);
  
  title = new GLabel(this, "", sizex+10, 5, sizex, sizey*2);
  title.setTextAlign(GAlign.MIDDLE | GAlign.CENTER);
  go= new GButton(this, "GO!", sizex+10, sizey*2+5, sizex-3, sizey*2);
  go.tag = str(100);
  rename= new GButton(this, "Rename", sizex+10, sizey*6+5, sizex-3, sizey);
  rename.tag = str(101);
 
}


void draw() {
  fill(255);
  rect(0,0,width, height);
  fill(256/2);
  rect(sizex+7.5, 5, sizex+2.5, height-10);
  
}


void handleButtonEvents(GButton button) {
  if(button.eventType == GButton.CLICKED) {
    int tag = int(button.tag);
    if(tag > 0 && tag < 25){
      title.setText(button.getText());
      tray_num = int(button.tag);
    }
    else if(tag == 100){
      println(tray_num);
//      port.write(tray_num);
    }
    else if(tag == 101){
      cd[tray_num-1].change_name(text1.getText());
      
      String[] write = new String[24];
      for (int i = 0; i < 24; i++) {
        write[i] = cd[i].get_name();
      }
      saveStrings(savePath, write);
      btnsB[tray_num-1].setText(text1.getText());
      title.setText(text1.getText());
      
    }
   
  }
}

void  handleTextFieldEvents(GTextField textfield){
  }


/*
String[] write = new String[24];
      for (int i = 0; i < 24; i++) {
        write[i] = cd[i].get_name();
      }
      saveStrings(savePath, write);
      */
      
