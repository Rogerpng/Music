import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//Global Variables
int buttonX, buttonY, buttonWidth, buttonHeight;
color buttonColour, red=#E30505, yellow=#FFFB7E, resetWhite=#FFFFFF;
Minim minim;
int numberOfSongs = 3;
AudioPlayer[] song = new AudioPlayer[numberOfSongs];
AudioMetaData[] songMetaData = new AudioMetaData[numberOfSongs];
int loopIntNum = 1;
int currentSong = numberOfSongs - numberOfSongs; 
color purple = #D614F5, black = #050505;

void setup() {
  size (600, 400);
  //population
  buttonX = width*1/4;
  buttonY = height*1/4;
  buttonWidth = width*1/2;
  buttonHeight = height*1/2;

  minim = new Minim(this);
  song[currentSong] = minim.loadFile("/Music/MirrorMind");

  currentSong = numberOfSongs - numberOfSongs;
  for (int i=currentSong; i<numberOfSongs; i++) {
    songMetaData[i] = song[i].getMetaData();
  }
  for ( int i=currentSong; i<numberOfSongs; i++) {
    println("file Name: ", songMetaData[i].fileName() );
    println("Song Length (in milliseconds; ", songMetaData[i].length() );
    println("Song Length (in Seconds): ", songMetaData[i].length()/1000 );
    println( "Length (in minutes & seconds): ", (songMetaData[i].length()/1000)/60, " minute", (songMetaData[i].length()/1000)-((songMetaData[i].length()/1000)/60 * 60), " seconds" );
    println("Song Title", songMetaData[i].title() );
    println("Author: ", songMetaData[i].author() );
    println("Composer: ", songMetaData[i].composer() );
    println("Orchestra: ", songMetaData[i].orchestra() );
    println("Albums", songMetaData[i].album() );
    println("Disk: ", songMetaData[i].disc() );
    println("Publisher: ", songMetaData[i].publisher() );
    println("Date Release: ", songMetaData[i].date() );
    println("Copyright: ", songMetaData[i].copyright() );
    println("Comments: ", songMetaData[i].comment() );
    println("Lyrics: ", songMetaData[i].lyrics() );
    println("Track: ", songMetaData[i].track() );
    println("Genre: ", songMetaData[i].genre() );
    println("Encoded", songMetaData[i].encoded() );
  }
}//End Void setup

void draw() {
  //  println(mouseX, mouseY);
  if (mouseX>buttonX && mouseX<buttonX+buttonWidth && mouseY>buttonY && mouseY<buttonY+buttonHeight) {
    buttonColour = yellow;
  } else {
    buttonColour = red;
  } // End If

  buttonColour = red;
  fill(buttonColour);
  rect(buttonX, buttonY, buttonWidth, buttonHeight);
  fill(resetWhite);
}//End Void draw

void keyPressed() {
  if (key == 'p' || key == 'P' )  exit();
}//End keyPressed

void mousePressed() {
  if (mouseX>buttonX && mouseX<buttonX+buttonWidth && mouseY>buttonY && mouseY<buttonY+buttonHeight)
  if ( song[currentSong].isPlaying() ) {
    song[currentSong].pause();
  } else if ( song[currentSong].position() == song[currentSong].length() ) {
    song[currentSong].rewind();
    song[currentSong].play();
  } else {
    song[currentSong].play();
  }
}
