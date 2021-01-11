import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//Global Variables
Minim minim;
int numberOfSongs = 3;
AudioPlayer[] song = new AudioPlayer[numberOfSongs];
AudioMetaData[] songMetaData = new AudioMetaData[numberOfSongs];
int loopIntNum = 1;
int currentSong = numberOfSongs - numberOfSongs; 

void setup() {
  size(500, 600);
  minim = new Minim(this);
  song[currentSong] = minim.loadFile("/Music/MirrorMind");
  song[currentSong+=1] = minim.loadFile("/Music/Prism - Bobby Richards");
  song[currentSong+=1] = minim.loadFile("/Music/Simple - Patrick Patrikios");
  //
  currentSong = numberOfSongs - numberOfSongs;
  for (int i=currentSong; i<numberOfSongs; i++) {
    songMetaData[i] = song[i].getMetaData();
  }//End FOR LOOP
  //
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
  }//End Console Output
  println("Start of Console");
  println("Click the Console to Finish Starting this program");
  println("Press Keyboard to test: P, ect");
}//End Void Setup

void draw() {
  //{ 
   background(0);

  // stroke(255);

  //for (int i = 0; i < groove.bufferSize() - 1; i++)
  // {
  // line(i, 50 + groove.left.get(i)*50, i+1, 50 + groove.left.get(i+1)*50);
  // line(i, 50 + groove.right.get(i)*50, i+1, 50 + groove.right.get(i+1)*50);
  //  }
  // text("The player has" + groove.loopCount() + " loops left. "
  //+ " Is playing: " + groove.isPlaying()
  // +", Is playing: " + groove.
}// End Void Draw

void keyPressed() {
  if (key == 'p' || key == 'P' ) {
    if ( song[currentSong].isPlaying() ) {
      song[currentSong].pause();
    } else if ( song[currentSong].position() == song[currentSong].length() ) {
      song[currentSong].rewind();
      song[currentSong].play();
    } else {
      song[currentSong].play();
    }
  }// End KeyPressed

  if ( key == 's' || key == 'S' ) {
    if ( song[currentSong].isPlaying() ) {
      song[currentSong].pause();
      song[currentSong].rewind();
    } else if ( song[currentSong].position() == song[currentSong].length() ) {
      song[currentSong].rewind();
    } else {
      song[currentSong].rewind();
    }
  }

  if (key == 'f' || key == 'F') song[currentSong].skip(1000);
  if (key == 'r' || key == 'R') song[currentSong].skip(-1000);
  if ( key == 'l' || key == 'L' ) song[currentSong].loop();
  //Next Button:
  if (key == 'n' || key == 'N' ) {
    if ( song[currentSong].isPlaying() ) {
    song[currentSong].isPlaying();
    song[currentSong].pause();
    song[currentSong].rewind();
    song[currentSong].play();
    } else {
      song[currentSong].rewind();
      currentSong++;
    }
  }//End Next Button
  //Prevoius Button
  if (key == 'b' || key == 'B') {
    if ( song[currentSong].isPlaying() ) {
    } else {
      currentSong++;
    }
    currentSong--;
  }//End Prevoius Button
}
