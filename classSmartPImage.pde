/* Wrapper class to store image names put into PImage */

class SmartPImage {
  PImage img;
  String filename;
 
  SmartPImage(String filename) {
    //Load the image and set the filename
    this.filename = filename;
    img = loadImage(filename);
  }
}


/* Sample usage  - PImage only stores image

SmartPImage img;  // Declare variable of type SmartPImage
 
void setup() {
  size(640, 360);
  img = new SmartPImage("moonlight.jpg");  // Load the image into the program  
}
 
void draw() {
  image(img.img, 0, 0);
  println(img.filename);// Print the filename
} */