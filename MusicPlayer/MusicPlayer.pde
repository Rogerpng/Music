import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//Global Variables
Minim minim;
AudioPlayer song1;

void setup() {
  size(500, 600);
  minim = new Minim(this);
  song1 = minim.loadFile("../Music/MirrorMind.mp3");
  song1.play();
}//End Void Setup

void draw() {
}// End Void Draw
