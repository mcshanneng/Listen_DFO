// THINGS FOR AUDIO
//
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
//Sea Audio
AudioPlayer waves;
AudioPlayer gulls1;
AudioPlayer gulls2;
AudioPlayer underwater;
AudioPlayer whales;
//Forest Audio
AudioPlayer brook;
AudioPlayer cicada;
AudioPlayer dove;
AudioPlayer owl;
//Bog Audio
AudioPlayer crickets1;
AudioPlayer crickets2;
AudioPlayer crow1;
AudioPlayer crow2;
AudioPlayer fly;
AudioPlayer frogs;
AudioPlayer mosquito;
//
//Button Locations
//
int bHeights= 1060;
int bWidths= 50;
//Images
//
PImage SeaPic;
PImage ForestPic;
PImage BogPic;
//
// BUTTON CLASSES
//
Buttons Sea;
Buttons Forest;
Buttons Bog;

// Button Booleans to check the button states
Boolean seaButton=false;
Boolean forestButton=false;
Boolean bogButton=false;
//
// Things start actually happening
//
void setup() {
fullScreen(P2D,2);
//Button Declarations
  Sea= new Buttons();
  Forest= new Buttons();
  Bog= new Buttons();
 // Button locations

  //Sound stuff, Sea
  minim = new Minim(this);
  waves =minim.loadFile("seaWaves.mp3", 2048); // http://soundbible.com/grab.php?id=885&type=mp3

  minim= new Minim(this);
  gulls1=minim.loadFile("seaGulls1.mp3", 2048); // https://retired.sounddogs.com/previews/108/mp3/891144_SOUNDDOGS__bi.mp3

  minim= new Minim(this);
  gulls2=minim.loadFile("seaGulls2.mp3", 2048); // https://retired.sounddogs.com/previews/36/mp3/423364_SOUNDDOGS__se.mp3

  minim= new Minim(this);
  underwater=minim.loadFile("seaUnderwater.mp3", 2048); // http://soundbible.com/grab.php?id=1660&type=mp3

  minim= new Minim(this);
  whales=minim.loadFile("seaWhaleSongs.mp3", 2048); //   https://www.nps.gov/glba/learn/nature/upload/HWsong_60sec_10_12_2005_16_23_48.mp3

  //Sound stuff, Forest
/*
  minim = new Minim(this);
  brook =minim.loadFile("forestBrook.mp3", 2048); // http://www.orangefreesounds.com/wp-content/uploads/2016/05/Babbling-brook-sounds.zip
*/
  minim= new Minim(this);
  cicada=minim.loadFile("forestCicadas-E.mp3", 2048); // https://www.cicadamania.com/audio/cm/M-sp-princeton2004.mp3

  minim= new Minim(this);
  dove=minim.loadFile("forestDoveMourning.mp3", 2048); // https://journeynorth.org/sounds/Dove_Mourning.mp3

  minim= new Minim(this);
  owl=minim.loadFile("forestOwl.mp3", 2048); // https://journeynorth.org/sounds/Owl_GreatHorned_Duet.mp3
    
  minim= new Minim(this);
  crickets1=minim.loadFile("bogCrickets1.mp3", 2048); //http://soundbible.com/grab.php?id=365&type=mp3


  //Sound stuff, Bog

 /*
  minim= new Minim(this);
  crickets2=minim.loadFile("bogCrickets2.mp3", 2048); //http://soundbible.com/grab.php?id=2083&type=mp3

  minim= new Minim(this);
  crow1=minim.loadFile("bogCrow1.mp3", 2048); //https://retired.sounddogs.com/previews/2106/mp3/274521_SOUNDDOGS__bi.mp3

 */

  minim= new Minim(this);
  crow2=minim.loadFile("bogCrow2.mp3", 2048); //https://retired.sounddogs.com/previews/36/mp3/302564_SOUNDDOGS__ho.mp3

  minim= new Minim(this);
  fly=minim.loadFile("bogFly.mp3", 2048); // https://retired.sounddogs.com/previews/25/mp3/326553_SOUNDDOGS__in.mp3

  minim= new Minim(this);
  frogs=minim.loadFile("bogFrogs.mp3", 2048); //http://soundbible.com/grab.php?id=2033&type=mp3

  minim= new Minim(this);
  mosquito=minim.loadFile("bogMosquito.mp3", 2048); //http://soundbible.com/grab.php?id=398&type=mp3
}
void draw() {

  //button displays 
  Sea.display(50, bHeights, (#5349EA));
  Forest.display(85, bHeights, (#3C7C53));
  Bog.display(120, bHeights, (#A5A738));

  //changes volume of different sounds according to cursor location
  // (variable name of sound file).setGain(map(MouseLocation(thing to be mapped), higher value (width/height),0, max/min volume, max/min volume))
  // Sea
  waves.setGain(map(mouseY, height, 0, -50, 0));

  gulls1.setGain(map(mouseY, height, 0, -45, 10));

  gulls2.setGain(map(mouseY, height, 0, -40, 5));

  underwater.setGain(map(mouseY, height, 0, -5, -20));

  whales.setGain(map(mouseY, height, 0, 120, -15));

  //volume change Forest
  //brook.setGain(map(mouseX, width, 0, 5, -15));

  dove.setGain(map(mouseY, height, 0, -15, 1));

  owl.setGain(map(mouseY, height, 0, -15, 5));
  
 // cicada.setGain(map(mouseY, height,0,5,-5));
  //Volume change bog
  crickets1.setGain(map(mouseY, height, 0, 10, -15));
/*
  crickets2.setGain(map(mouseY, height, 0, 20, -15));

  crow1.setGain(map(mouseY, height, 0, -15, 20));
*/
  crow2.setGain(map(mouseX, width, 0, -15 , 7));

  frogs.setGain(map(mouseX, width, 0, 5, -5));
  
  mosquito.setGain(-5);
  fly.setGain(-15);
}
////
// Logic statements for when the mouse is clicked. first checks the condition of the button boolean
// then checks which mouse button is being pushed
//then checks the location to see which of the three buttons are being clicked

void mouseClicked() {
  if (seaButton==false) {
    if (mouseButton==LEFT) {
      if (dist(mouseX, mouseY, 50, bHeights)<=15) {
        seaOn();
      }
    }
  }
  if (forestButton==false) {
    if (mouseButton==LEFT) {
      if (dist(mouseX, mouseY, 85, bHeights)<=15) {
        forestOn();
      }
    }
  }

  if (bogButton==false) {
    if (mouseButton==LEFT) {
      if (dist(mouseX, mouseY, 120, bHeights)<=15) {
        bogOn();
      }
    }
  }
}
//
//FUNCTION FOR WHEN THE SEA BUTTON IS CLICKED
//first, it makes the boolean true
//it then checks to see if the other buttons are true, if they are, they will mute those sounds
//the variables are declared again so the sounds will play again 
//after the whole function is executed, it will change the states of the other buttons to false


void seaOn() {
  //More Conditionals
  seaButton=true;

  if (forestButton==true) {
    forestOff();
  }
  if (bogButton==true) {
    bogOff();
  }
  //Image Stuff

  loadPixels();
  SeaPic= loadImage("Listen_SeaBG.png");
  background(196, 44, 44);
  loadPixels();
  SeaPic.loadPixels();
  updatePixels();
  background(0);
  imageMode(CENTER);
  image(SeaPic, width/2, height/2);

  //Audio Stuff
  minim = new Minim(this);
  waves =minim.loadFile("seaWaves.mp3", 2048);
  waves.loop();

  minim= new Minim(this);
  gulls1=minim.loadFile("seaGulls1.mp3", 2048);
  gulls1.loop();

  minim= new Minim(this);
  gulls2=minim.loadFile("seaGulls2.mp3", 2048);
  delay(1300);
  gulls2.loop();

  minim= new Minim(this);
  underwater=minim.loadFile("seaUnderwater.mp3", 2048);
  underwater.loop();

  minim= new Minim(this);
  whales=minim.loadFile("seaWhaleSongs.mp3", 2048);
  whales.loop();
  forestButton=false;
  bogButton=false;
}
// Muting the sea sounds
void seaOff() {
  waves.mute();
  gulls1.mute();
  gulls2.mute();
  underwater.mute();
  whales.mute();
}
//
//Forest Stuff
//
//Forest Logic
void forestOn() {
  forestButton=true;
  if (seaButton==true) {
    seaOff();
  }
  if (bogButton==true) {
    bogOff();
  }
  //Forest Image
  loadPixels();
  ForestPic= loadImage("Listen_ForBG.png");
  background(196, 44, 44);
  loadPixels();
  ForestPic.loadPixels();
  updatePixels();
  background(0);
  imageMode(CENTER);
  image(ForestPic, width/2, height/2);
  //Forest Audio
  /*
  minim = new Minim(this);
  brook =minim.loadFile("forestBrook.mp3", 2048);
  brook.loop();
  */
  minim= new Minim(this);
  crickets1=minim.loadFile("bogCrickets1.mp3", 2048);
  crickets1.loop();

  minim= new Minim(this);
  cicada=minim.loadFile("forestCicadas-E.mp3", 2048);
  cicada.loop();

  minim= new Minim(this);
  dove=minim.loadFile("forestDoveMourning.mp3", 2048);
  dove.loop();

  minim= new Minim(this);
  owl=minim.loadFile("forestOwl.mp3", 2048);
  delay(200);
  owl.loop();

  seaButton= false;
  bogButton=false;
}
//Forest Mute

void forestOff() {
  crickets1.mute();
  //brook.mute();
  cicada.mute();
  dove.mute();
  owl.mute();
}
//
//Bog Stuff
//
//Bog Logic
void bogOn() {
  bogButton=true;
  if (seaButton==true) {
    seaOff();
  }
  if (forestButton==true) {
    forestOff();
  }
  //Bog Image
  loadPixels();
  BogPic= loadImage("Listen_SwampBG.png");
  background(196, 44, 44);
  loadPixels();
  BogPic.loadPixels();
  updatePixels();
  background(0);
  imageMode(CENTER);
  image(BogPic, width/2, height/2);
  //Bog Audio

/*
  minim= new Minim(this);
  crickets2=minim.loadFile("bogCrickets2.mp3", 2048);
  delay(1400);
  crickets2.loop();

  minim= new Minim(this);
  crow1=minim.loadFile("bogCrow1.mp3", 2048);
  crow1.loop();
  minim= new Minim(this);
*/

  crow2=minim.loadFile("bogCrow2.mp3", 2048);
 // delay(5000);
  crow2.loop();
  minim= new Minim(this);

  fly=minim.loadFile("bogFly.mp3", 2048);
  fly.loop();
  minim= new Minim(this);

  frogs=minim.loadFile("bogFrogs.mp3", 2048);
  frogs.loop();
  minim= new Minim(this);

  mosquito=minim.loadFile("bogMosquito.mp3", 2048);
  mosquito.loop();

  seaButton=false;
  forestButton=false;
}
//Bog Mute
void bogOff() {
  //crickets2.mute();
 // crow1.mute();
  crow2.mute();
  fly.mute();
  frogs.mute();
  mosquito.mute();
}
