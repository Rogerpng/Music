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

void keyPressed() {
  if (key == 'p' || key == 'P' ) {
    if ( song1.isPlaying() ) {
      song1.pause();
    } else if ( song1.position() == song1.length() ) {
      song1.rewind();
      song1.play();
    } else {
      song1.play();
    }
  }// End KeyPressed

  if ( key == 's' || key == 'S' ) {
    if ( song1.isPlaying() ) {
      song1.pause();
      song1.rewind();
    } else if ( song1.position() == song1.length() ) {
      song1.rewind();
    } else {
      song1.rewind();
    }
  }

  if (key == 'f' || key == 'F') song1.skip(1000);
  if (key == 'r' || key == 'R') song1.skip(-1000);
}
