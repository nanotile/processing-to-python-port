/* CONTROLS IMAGE */
import java.awt.event.KeyEvent;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;


void mousePressed() {

	if(mouseButton == LEFT){
		//Color new_color = 
		//background(100,20,0);
		// fill( random(255), random(255), random(255), random(255));
		/* Change color of fill */
		color newColor = changeRandomFill1();
		fill(newColor,(int)screen_alpha); 
		println("LEFT1 MOUSE "+ mouseX + " : " + mouseY);
		//fill( random(100), random(100), random(2), random(50)); //CHECK THIS OUT 30F /* this changes opacity and fill */
		//fill( random(100), random(100), random(100));// no alpha change
		rectMode(CORNERS);
		//rect(0,0,width*scale_factor,height*scale_factor);   /* Full screen fill */
		rect(0,0,width,height);   /* Full screen fill */
		//rect(width/2,height/2,width,height);   /* this changes opacity and fill */
		alpha(0); //reset alpha after fill
	}
	if (mouseButton == RIGHT){
	
	 /* float offset = PI/24.0;
	 pushMatrix();
	 float angle =random(rd_min,rd_max);
     rotateY(a + offset*i);
     rotateX(a/2 + offset*i);
     popMatrix(); */
	
		println("RIGHT MOUSE "+ mouseX + " : " + mouseY);
		float rd =random(rd_min,rd_max);     // setup in setup() 
		float i_width = (int)(img_Fkey_chosen.width*rd); 
		float i_height = (int)(img_Fkey_chosen.height*rd); 
		image(img_Fkey_chosen ,mouseX,mouseY,i_width,i_height );
		
  	/* println("RIGHT MOUSE "+ mouseX + " : " + mouseY);
		float rd =random(rd_min,rd_max);     // setup in setup() 
		int i_width = (int)(img_Fkey_chosen.width/ rd); 
		int i_height = (int)(img_Fkey_chosen.height/ rd); 
		image(img_Fkey_chosen ,mouseX,mouseY,(int)i_width,(int)i_height ); */


	}
}

void mouseReleased() {
	int value=0;
	if (value == 0) {
		value = 255;
	} else {
		value = 0;
	}
}

/* Syntax	

fill(rgb)
fill(rgb, alpha)
fill(gray)
fill(gray, alpha)
fill(v1, v2, v3)
fill(v1, v2, v3, alpha)

Parameters	
rgb 	int: color variable or hex value
alpha 	float: opacity of the fill
gray 	float: number specifying value between white and black
v1 	float: red or hue value (depending on current color mode)
v2 	float: green or saturation value (depending on current color mode)
v3 	float: blue or brightness value (depending on current color mode) */

/* void mouseMoved() {
float x,y;
for(int i=0; i<num; i++) {
x=mouseX-particles[i].v.x;
y=mouseY-particles[i].v.y;
if(sqrt(x*x+y*y)<50 && particles[i].changeCnt<0) 
particles[i].stateCnt=1;  

println(mouseX + " : " + mouseY);	  
}
} */

void mouseClicked() {
	int value=0;
	if (value == 0) {
		value = 255;
	} else {
		value = 0;
	}
}
void mouseDragged() 
{
	int value=0;
	value = value + 5;
	if (value > 255) {
		value = 0;
	}
}



/* ........................................................ notes on keycode   .................................................................. */
/*Description  	The variable keyCode is used to detect special keys such as the
UP, DOWN, LEFT, RIGHT arrow keys and ALT, CONTROL, SHIFT. 
When checking for these keys, it's first necessary to check and see if the key is coded.
This is done with the conditional "if (key == CODED)" as shown in the example.

The keys included in the ASCII specification (BACKSPACE, TAB, ENTER, RETURN, ESC, and DELETE)
do not require checking to see if they key is coded, and you should simply use the 
key variable instead of keyCode If you're making cross-platform projects, note that 
the ENTER key is commonly used on PCs and Unix and the RETURN key is used instead on
Macintosh. Check for both ENTER and RETURN to make sure your program will work for 
all platforms.

For users familiar with Java, the values for UP and DOWN are simply shorter versions
of Java's KeyEvent.VK_UP and KeyEvent.VK_DOWN. Other keyCode values can be found in 
the Java KeyEvent reference.*/