/* CONTROLS IMAGE USING JAVA  javaKeyControls.pde*/
/* https://docs.oracle.com/javase/7/docs/api/java/awt/event/KeyEvent.html */

import java.awt.event.KeyEvent;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;

/*VK_0 thru VK_9 are the same as ASCII '0' thru '9' (0x30 - 0x39)  VK_TAB*/
public void keyPressed(KeyEvent e) {
	int keyCode = e.getKeyCode();
	switch( keyCode ) { 
				/* ..................................................change random_image_1 ........................................... */		
	case KeyEvent.VK_1: 
	if(e.isControlDown()){first_image = false; 	println(" img_random_1 OFF " );}
	else{String returnImageName1 = changeRandomImage1()	;
		println("New img_random_1 = " + returnImageName1);
		first_image = true; 
		}
		
		break;	
			/* ..................................................change random_image_2 ........................................... */		
	case KeyEvent.VK_2: 
	if(e.isControlDown()){second_image = false; println(" img_random_2 OFF " );	}
	else{String returnImageName2 = changeRandomImage2()	;
		println("New img_random_2 = " + returnImageName2);
		second_image = true;
		}
		
		break;	
			/* ..................................................change random_image_3 ........................................... */		
	case KeyEvent.VK_3: 
	if(e.isControlDown()){third_image = false; 	println(" img_random_3 OFF " );}
	else{String returnImageName3 = changeRandomImage3()	;
	       
		   println("New img_random_3 = " + returnImageName3);
		   third_image  = true;
		}
		break;
		
					/* ..................................................toggle splatter ........................................... */		
	case KeyEvent.VK_4: 
		if(use_splatterImages  == false){use_splatterImages  = true;
			println( "splatter ON");  
			break;
		} if(use_splatterImages  == true){use_splatterImages  = false;
			println( "splatter  0FF"); } 
		break;	
			/* ..................................................framerate + ........................................... */	
	case KeyEvent.VK_PAGE_UP:  		
		framerate=framerate+2 ; 
		println("framerate+ = "+framerate);
		break;
				/* ..................................................framerate - ........................................... */		
	case KeyEvent.VK_PAGE_DOWN:  		
		framerate=framerate-2 ;
		println("framerate- = "+framerate);
		break;
		
		/* ..................................................image scaling  KEYS  L ........................................... */
		
	case KeyEvent.VK_L:  
		if(!e.isShiftDown()){
			/* this enlarges the image  because it is resized by dividing dimentions by rd chosen between the ranges here */
			/* maybe not true because id changed the resizing process */
			if(rd_min>1.0&&rd_min<rd_max ){
				rd_min = rd_min -.5;
				rd_max =  rd_max -.5;
				println( "increasing magnification...........................................rd_min = "+rd_min + "  rd_max = "+rd_max);
			}
			else if(rd_min>1.0&&rd_max<rd_min ){
				rd_max =  rd_max -.5;
				println( "decreasing magnification...........................................rd_min = "+rd_min + "  rd_max = "+rd_max);
				
			}
			else if(e.isShiftDown()){
				if(rd_min>1.0&&rd_min<rd_max){	
					
					rd_min = rd_min +.5;
					rd_max =  rd_max +.5;
					println( "  upper case.........decreasing magnification...........................................rd_min = "+rd_min + "  rd_max = "+rd_max);
					break;
				}
			}
			else{println( "MINIMUM REACHED");}
			break;
		}
		//case KeyEvent.VK_L:/* shift not down  */
		
		/* ..................................................Quit KEYS Q ........................................... */		
	case KeyEvent.VK_Q:
	println(" Program stopped by user.");
		exit();
		break;
		/* ..................................................Quit KEYS C ........................................... */		
	case KeyEvent.VK_C:  		
		changeRandomImage();  
		break;
		/* ..................................................Stop and Start Random  or Chosen Images  KEYS  X ........................................... */		
	
	case KeyEvent.VK_X:  		
		if(write_images  == false){write_images  = true;
			println( "images on");  
			break;
		} if(write_images  == true){write_images  = false;
			println( "images off");  
			break;
		}	
				/* ..................................................Stop and Start Random TINT ON IMAGES ........................................... */		
	
	case KeyEvent.VK_P:  		
		if(use_random_tint_image  == false){use_random_tint_image = true;
			println( "RANDOM TINT ON IMAGES      ON");  
			break;
		} if(use_random_tint_image  == true){use_random_tint_image  = false;
			println( "RANDOM TINT ON IMAGES      OFF");  
			break;
		}	
		
		case KeyEvent.VK_Z:
		String pathHeading1 = "Input Image Directory = "+ image_input_dir;
 		String preference1 =getFileName(PImagePathList.get(r_1)+" \r\n") ;
		
	    String pathHeading2 = "Input Image Directory2 = "+ image_input_dir_1;
 		String preference2 = getFileName(PImagePathList.get(r_2)+" \r\n") ;
		
		String pathHeading3 = "Input Image Directory3 = "+ image_input_dir_2;
 		String preference3 = getFileName(PImagePathList.get(r_3)+" \r\n") ;
		//String preference1 =getFileName(PImagePathList.get(r_1)) +" \r\n"+getFileName(PImagePathList.get(r_2));
		       Date d = new Date();

       // display time and date using toString()
     //  System.out.println(d.toString());
		
		
		writeStringToFile("DATE ...............  "+d.toString()+"  .......................", preferenceTextFile_path);
		writeStringToFile("Random numbers = " +r_1+"  "+r_2+"  "+r_3+"  ", preferenceTextFile_path);
		writeStringToFile(pathHeading1, preferenceTextFile_path);
		writeStringToFile(preference1, preferenceTextFile_path);
		
		writeStringToFile(pathHeading2, preferenceTextFile_path);
		writeStringToFile(preference2, preferenceTextFile_path);
		
		writeStringToFile(pathHeading3, preferenceTextFile_path);
		writeStringToFile(preference3, preferenceTextFile_path);
		
		
		//writeStringToFile(preference, preferenceTextFile_path);
		writeStringToFile("Output Directory = "+time_stamp_dir +" \r\n"+" \r\n", preferenceTextFile_path);
		
		break;
		
		/*case KeyEvent.VK_X:  		
		if(!e.isShiftDown()){write_images = false;
			println( "images off");  // lower case
			break;
		} else{write_images = true;
			println( "images on");  //  upper case
			break;
		} */
		/* ..................................................Stop and Start Rectangle traces  toggle on/off  KEYS  R ........................................... */		
		
		
	case KeyEvent.VK_R:  		
		if(show_rectangles  == false){show_rectangles  = true;
			println( "rectangles on");  // lower case
			break;
		} if(show_rectangles  == true){show_rectangles  = false;
			println( "rectangles  off");  
			break;
		}	
		/* ....................use_random_trace..........Stop and Start Rectangle traces FILL toggle on/off  ........................................... */		
			case KeyEvent.VK_T:
			toggleRandomTraceFill();
			break;
/* 		if(use_random_trace  == false){use_random_trace  = true;
			println( "random trace color = on");  // lower case
			break;
		} if(use_random_trace  == true){use_random_trace  = false;
			println( "random trace color = off");  
			break;
		}	 */
		/* case KeyEvent.VK_R:  		
		if(!e.isShiftDown()){show_rectangles  = false;
			println( "rectangles off");  // lower case
			break;
		} else{show_rectangles  = true;
			println( "rectangles  on");  //  upper case
			break;
		}		 */	
		/* ..................................................HSB toggled   KEYS  B ........................................... */
		/* if(HSB_on) {} */
	case KeyEvent.VK_B:  		
		if(HSB_on  == false){HSB_on  = true;
			println( "HSB_on  ...  (HSB, 360, 100, 100)"); 
			colorMode(HSB, 360, 100, 100);
			break;
		} if(HSB_on  == true){HSB_on  = false;
			println( "HSB_off ...  (RGB, 255, 255, 255)"); 
			colorMode(RGB, 255, 255, 255);
			break;
		}	
		
		/*case KeyEvent.VK_B:  
		if(!e.isShiftDown()){
			colorMode(HSB, 360, 100, 100);
			println( "................................................HSB colorMode = ON ");  // lower case
			break;
		} else{ colorMode(RGB, 360, 100, 100);
		println( "..............................................RGB colorMode = ON ");  //  upper case
			break;
		} */
		
		
		/* ..................................................Save Images   KEYS S........................................... */
		
	case KeyEvent.VK_SPACE: 
/* Create file names */
				//String randomString = returnRandomDoubleString(100000,10000000,true);
				/* println("returnRandomDoubleString  = " + randomString); */
				// final_name = file_path + randomString+".tif";
				//final_name = file_path + randomString+ "_####.tif" ;  /* Dothis for continuous numbering but use random for SKU */
				final_name = file_path + fileNameRandomInt+".tif";     /* fileNameRandomString initialized in Global Variables */
				saveFrame (final_name);      /* 	+ "####.tif" */
				println("USER AUTO FILE SAVE = "+final_name+ " ...................sequenceNumberMuldo = " +sequenceNumberMuldo);
				save_number_examples++;  /* Used to limit number of saves in session */
	           fileNameRandomInt++;
			   Toolkit.getDefaultToolkit().beep();Toolkit.getDefaultToolkit().beep();
		/*saveFrame (file_path + "####.tif"); 
		 println("FILE SAVED = "+file_path); */
		break;		
		/* ..................................................Stop and Start - automatic save images KEYS  W ........................................... */		
	case KeyEvent.VK_W:  		
		if(automatic_save  == false){automatic_save  = true;
			println( "automatic_save = on");  
			break;
		} if(automatic_save  == true){automatic_save  = false;
			println( "automatic_save = off");  
			break;
		}	
		
		
		/* .............................................  screen alpha control   KEYS UP/DOWN ARROW  ................................... */
	case KeyEvent.VK_UP:
		float tempval;
		tempval = screen_alpha;
		if(tempval>=0.0&&tempval<=255 ){tempval= tempval+10;}  /*CONTROLS SCREEN  OVERLAY  ALPHA*/
		if(tempval<=255&&tempval>=0){screen_alpha =tempval;}
		else if(tempval>=255) {screen_alpha = 255;}
		else if(tempval<=0) {screen_alpha = 0;}
		/* Change color of fill */
		fill(changeRandomFill(),(int)screen_alpha); 
		rect(0,0,width,height);  /* DEFINE RECTANGLE AND FILL IT*/
  
  screen_alpha = 25;    /* Override for this function */
pushMatrix();
translate(width/2, height/2);
        rotate(PI/3.0);
fill(changeRandomFill(),(int)screen_alpha); 		
		rect(0,0,width/2,height/2); 
		
		quad(0, 0, width/2, height/2, 69, 63, 30, 76);
		ellipse(0, 0, width/2, width/2);
popMatrix();

 		 /* 	Tryout adding stripes */
/* 							if(use_stripes) {								
								//Load a single image at this point instead of loading huge array in setup  memory problems 
								Random Qground = new Random();
								int stripesfile_num  = nextIntInRange(0, PImageStripesPathList.size()-1, Qground);
								stripesImage =loadImage(PImageStripesPathList.get(stripesfile_num));
								tint(255, 150);  // Apply transparency without changing color
								image(stripesImage,0,0);
								 tint(255, 255);  // Reset  transparency without changing color   
								} 
							//PImage */
							
			 /* 	Tryout adding stripes --  See utility.pde */
			 
	/* 						if(use_stripes) {				
			 stripesImage =	returnImage(PImageStripesPathList); 
			 tint(255, 150 );  // Apply transparency without changing color
			image(stripesImage,0,0);				   
		    tint(255, 255);  // Reset  transparency without changing color 
		}
		 */
		
	fill(changeRandomFill(),(int)screen_alpha); 		
		rect(width/2,height/2,width,height); 			

		fill(changeRandomFill(),(int)screen_alpha); 
		rect(width/2,height/2,width,0);  
	
	   fill(changeRandomFill(),(int)screen_alpha); 		
       rect(width/2,height/2,0,height); 
	   
	   fill(changeRandomFill(),(int)screen_alpha); 
		rect(width/2,height/2,width/4,height/4);  /* DEFINE RECTANGLE AND FILL IT*/
		if(show_keysdata) {
		println( "width*scale_factor= "+width*scale_factor);
		println("height*scale_factor = " +height*scale_factor );
		println( " UP screen_alpha = "+screen_alpha);}
		//println("UP = "+keyCode);

		break;
		
	case KeyEvent.VK_DOWN:
		//float tempval;
		tempval = screen_alpha;
		if(tempval>=0.0&&tempval<=255 ){tempval= tempval-10;}  /*CONTROLS SCREEN  OVERLAY  ALPHA*/
		if(tempval<=255&&tempval>=0){screen_alpha =tempval;}
		else if(tempval>=255) {screen_alpha = 255;}
		else if(tempval<=0) {screen_alpha = 0;}
		/* Change color of fill   Utility.pde*/
		//color newColor = changeRandomFill();
		fill(changeRandomFill(),(int)screen_alpha); 
		//fill(newColor,(int)screen_alpha); 
		//fill(100,20,0,(int)trace_alpha); // rgb alpha
        //rect(0,0,width*scale_factor,height*scale_factor);  /* DEFINE RECTANGLE AND FILL IT*/
		rect(0,0,width,height);  /* DEFINE RECTANGLE AND FILL IT*/
		//rect(width/2,height/2,width,height);
		if(show_keysdata) {
		println( "width*scale_factor= "+width*scale_factor);
		println( "DOWN screen_alpha= "+screen_alpha);}
		break;
		
		
		/* ............................................. TRACE ALPHA   right and left ARROWS ................................... */	
		
	case KeyEvent.VK_LEFT:
		//float tempval;
		tempval = trace_alpha;
		if(tempval>=0.0&&tempval<=255 ){tempval= tempval-10;}  /*CONTROLS TRACE ALPHA*/
		if(tempval<=255&&tempval>=0){trace_alpha =tempval;}
		else if(tempval>=255) {trace_alpha = 255;}
		else if(tempval<=0) {trace_alpha = 0;}

		if(show_keysdata) {println( " DOWN trace_alpha = "+trace_alpha);}
		break;
		
	case KeyEvent.VK_RIGHT :
		//float tempval;
		tempval = trace_alpha;
		if(tempval>=0.0&&tempval<=255 ){tempval= tempval+10;}  /*CONTROLS TRACE  ALPHA*/
		if(tempval<=255&&tempval>=0){trace_alpha =tempval;}
		else if(tempval>=255) {trace_alpha = 255;}
		else if(tempval<=0) {trace_alpha = 0;}

		if(show_keysdata) {println( " UP trace_alpha = "+trace_alpha);}
		break;
		/* ..................................................TRACE WIDTH CONTROL      KEYS  [ = UP.......   ]  = DOWN........................................... */
	case KeyEvent.VK_OPEN_BRACKET :   //[
		tempKEYval = x_rect;     /* tempKEYval global variable */

		if(tempKEYval>=0&&tempKEYval<=100 ){tempKEYval = tempKEYval+widthIncrementVal;}  /*CONTROLS TRACE width*/
		if(tempKEYval<=100&&tempKEYval>=0){x_rect=tempKEYval;}
		else if(tempKEYval>=100) {x_rect = 100;}
		else if(tempKEYval<=0) {x_rect = 0;}		
		if(show_keysdata) {println( "width x_rect = "+x_rect +"  WIDTH UP = KEY [  .. widthIncrementVal= " + widthIncrementVal );}
		break;
		
	case KeyEvent.VK_CLOSE_BRACKET :   // ]
		/* tempKEYval global variable */
		
		/* if(e.isControlDown()){
tempKEYval = y_rect; 
if(tempKEYval>=0&&tempKEYval<=100 ){tempKEYval = tempKEYval-2;}  
		if(tempKEYval<=100&&tempKEYval>=0){y_rect=tempKEYval;}
		else if(tempKEYval>=100) {y_rect = 100;}
		else if(tempKEYval<=0) {y_rect = 0;}		
		if(show_keysdata) {println( " length y_rect = "+y_rect);}
		break;}
		else{ */
		tempKEYval = x_rect; 
		/*widthIncrementVal = 1; 	 set in Global variable */
		if(tempKEYval>=0&&tempKEYval<=100 ){tempKEYval = tempKEYval-widthIncrementVal;}  /*CONTROLS TRACE width*/
		if(tempKEYval<=100&&tempKEYval>=0){x_rect=tempKEYval;}
		else if(tempKEYval>=100) {x_rect = 100;}
		else if(tempKEYval<=0) {x_rect = 0;}		
		if(show_keysdata) {println( "width x_rect = "+x_rect +"  WIDTH DOWN =  KEY ] .. widthIncrementVal = " + widthIncrementVal);}
		break;//} 
		

		
		
		
		/* ....................BEGIN FUNCTION KEYS --- SELECT 24 IMAGES USING CONTROL+F........................... */
	case KeyEvent.VK_F1:  
		
		if(!e.isControlDown()){
			int image_number =1;
			if(image_number<=PImagePathList.size()){
				img_Fkey_chosen = loadImage( PImagePathList.get(image_number)); 
				println("Right Click to insert " + imageFileNames.get(image_number)+"  at mouse position");
			}
			else
			println("image number out of range " + image_number+ ">"+ PImagePathList.size() ); 
			break;
		}
		
		else{	
			int image_number =13;
			if(image_number<=PImagePathList.size()){
				img_Fkey_chosen = loadImage( PImagePathList.get(image_number)); 
				println("Right Click to insert " + imageFileNames.get(image_number)+"  at mouse position");
			}
			else
			println("image number out of range " + image_number+ ">"+ PImagePathList.size() );
			
			break;
		}
		/* ............................................... */
	case KeyEvent.VK_F2:  
		
		if(!e.isControlDown()){
			int image_number =2;
			if(image_number<=PImagePathList.size()){
				img_Fkey_chosen = loadImage( PImagePathList.get(image_number)); 
				println("Right Click to insert " + imageFileNames.get(image_number)+"  at mouse position");
			}
			else
			println("image number out of range " + image_number+ ">"+ PImagePathList.size() ); 
			break;
		}
		
		else{	
			int image_number =14;
			if(image_number<=PImagePathList.size()){
				img_Fkey_chosen = loadImage( PImagePathList.get(image_number)); 
				println("Right Click to insert " + imageFileNames.get(image_number)+"  at mouse position");
			}
			else
			println("image number out of range " + image_number+ ">"+ PImagePathList.size() );
			
			break;
		}
		/* ............................................... */
	case KeyEvent.VK_F3:  
		
		if(!e.isControlDown()){
			int image_number =3;
			if(image_number<=PImagePathList.size()){
				img_Fkey_chosen = loadImage( PImagePathList.get(image_number)); 
				println("Right Click to insert " + imageFileNames.get(image_number)+"  at mouse position");
			}
			else
			println("image number out of range " + image_number+ ">"+ PImagePathList.size() ); 
			break;
		}
		
		else{	
			int image_number =15;
			if(image_number<=PImagePathList.size()){
				img_Fkey_chosen = loadImage( PImagePathList.get(image_number)); 
				println("Right Click to insert " + imageFileNames.get(image_number)+"  at mouse position");
			}
			else
			println("image number out of range " + image_number+ ">"+ PImagePathList.size() );
			
			break;
		}
		/* ............................................... */
	case KeyEvent.VK_F4:  
		
		if(!e.isControlDown()){
			int image_number =4;
			if(image_number<=PImagePathList.size()){
				img_Fkey_chosen = loadImage( PImagePathList.get(image_number)); 
				println("Right Click to insert " + imageFileNames.get(image_number)+"  at mouse position");
			}
			else
			println("image number out of range " + image_number+ ">"+ PImagePathList.size() ); 
			break;
		}
		
		else{	
			int image_number =16;
			if(image_number<=PImagePathList.size()){
				img_Fkey_chosen = loadImage( PImagePathList.get(image_number)); 
				println("Right Click to insert " + imageFileNames.get(image_number)+"  at mouse position");
			}
			else
			println("image number out of range " + image_number+ ">"+ PImagePathList.size() );
			
			break;
		}
		/* ............................................... */
	case KeyEvent.VK_F5:  
		
		if(!e.isControlDown()){
			int image_number =5;
			if(image_number<=PImagePathList.size()){
				img_Fkey_chosen = loadImage( PImagePathList.get(image_number)); 
				println("Right Click to insert " + imageFileNames.get(image_number)+"  at mouse position");
			}
			else
			println("image number out of range " + image_number+ ">"+ PImagePathList.size() ); 
			break;
		}
		
		else{	
			int image_number =17;
			if(image_number<=PImagePathList.size()){
				img_Fkey_chosen = loadImage( PImagePathList.get(image_number)); 
				println("Right Click to insert " + imageFileNames.get(image_number)+"  at mouse position");
			}
			else
			println("image number out of range " + image_number+ ">"+ PImagePathList.size() );
			
			break;
		}
		/* ............................................... */
	case KeyEvent.VK_F6:  
		
		if(!e.isControlDown()){
			int image_number =6;
			if(image_number<=PImagePathList.size()){
				img_Fkey_chosen = loadImage( PImagePathList.get(image_number)); 
				println("Right Click to insert " + imageFileNames.get(image_number)+"  at mouse position");
			}
			else
			println("image number out of range " + image_number+ ">"+ PImagePathList.size() ); 
			break;
		}
		
		else{	
			int image_number =18;
			if(image_number<=PImagePathList.size()){
				img_Fkey_chosen = loadImage( PImagePathList.get(image_number)); 
				println("Right Click to insert " + imageFileNames.get(image_number)+"  at mouse position");
			}
			else
			println("image number out of range " + image_number+ ">"+ PImagePathList.size() );
			
			break;
		}
		/* ............................................... */
	case KeyEvent.VK_F7:  
		
		if(!e.isControlDown()){
			int image_number =7;
			if(image_number<=PImagePathList.size()){
				img_Fkey_chosen = loadImage( PImagePathList.get(image_number)); 
				println("Right Click to insert " + imageFileNames.get(image_number)+"  at mouse position");
			}
			else
			println("image number out of range " + image_number+ ">"+ PImagePathList.size() ); 
			break;
		}
		
		else{	
			int image_number =19;
			if(image_number<=PImagePathList.size()){
				img_Fkey_chosen = loadImage( PImagePathList.get(image_number)); 
				println("Right Click to insert " + imageFileNames.get(image_number)+"  at mouse position");
			}
			else
			println("image number out of range " + image_number+ ">"+ PImagePathList.size() );
			
			break;
		}
		/* ............................................... */
	case KeyEvent.VK_F8:  
		
		if(!e.isControlDown()){
			int image_number =8;
			if(image_number<=PImagePathList.size()){
				img_Fkey_chosen = loadImage( PImagePathList.get(image_number)); 
				println("Right Click to insert " + imageFileNames.get(image_number)+"  at mouse position");
			}
			else
			println("image number out of range " + image_number+ ">"+ PImagePathList.size() ); 
			break;
		}
		
		else{	
			int image_number =20;
			if(image_number<=PImagePathList.size()){
				img_Fkey_chosen = loadImage( PImagePathList.get(image_number)); 
				println("Right Click to insert " + imageFileNames.get(image_number)+"  at mouse position");
			}
			else
			println("image number out of range " + image_number+ ">"+ PImagePathList.size() );
			
			break;
		}
		/* ............................................... */
	case KeyEvent.VK_F9:  
		
		if(!e.isControlDown()){
			int image_number =9;
			if(image_number<=PImagePathList.size()){
				img_Fkey_chosen = loadImage( PImagePathList.get(image_number)); 
				println("Right Click to insert " + imageFileNames.get(image_number)+"  at mouse position");
			}
			else
			println("image number out of range " + image_number+ ">"+ PImagePathList.size() ); 
			break;
		}
		
		else{	
			int image_number =21;
			if(image_number<=PImagePathList.size()){
				img_Fkey_chosen = loadImage( PImagePathList.get(image_number)); 
				println("Right Click to insert " + imageFileNames.get(image_number)+"  at mouse position");
			}
			else
			println("image number out of range " + image_number+ ">"+ PImagePathList.size() );
			
			break;
		}
		/* ............................................... */
	case KeyEvent.VK_F10:  
		
		if(!e.isControlDown()){
			int image_number =10;
			if(image_number<=PImagePathList.size()){
				img_Fkey_chosen = loadImage( PImagePathList.get(image_number)); 
				println("Right Click to insert " + imageFileNames.get(image_number)+"  at mouse position");
			}
			else
			println("image number out of range " + image_number+ ">"+ PImagePathList.size() ); 
			break;
		}
		
		else{	
			int image_number =22;
			if(image_number<=PImagePathList.size()){
				img_Fkey_chosen = loadImage( PImagePathList.get(image_number)); 
				println("Right Click to insert " + imageFileNames.get(image_number)+"  at mouse position");
			}
			else
			println("image number out of range " + image_number+ ">"+ PImagePathList.size() );
			
			break;
		}
		/* ............................................... */
	case KeyEvent.VK_F11:  
		
		if(!e.isControlDown()){
			int image_number =1;
			if(image_number<=PImagePathList.size()){
				img_Fkey_chosen = loadImage( PImagePathList.get(image_number)); 
				println("Right Click to insert " + imageFileNames.get(image_number)+"  at mouse position");
			}
			else
			println("image number out of range " + image_number+ ">"+ PImagePathList.size() ); 
			break;
		}
		
		else{	
			int image_number =23;
			if(image_number<=PImagePathList.size()){
				img_Fkey_chosen = loadImage( PImagePathList.get(image_number)); 
				println("Right Click to insert " + imageFileNames.get(image_number)+"  at mouse position");
			}
			else
			println("image number out of range " + image_number+ ">"+ PImagePathList.size() );
			
			break;
		}
		/* ............................................... */
	case KeyEvent.VK_F12:  
		
		if(!e.isControlDown()){
			int image_number =12;
			if(image_number<=PImagePathList.size()){
				img_Fkey_chosen = loadImage( PImagePathList.get(image_number)); 
				println("Right Click to insert " + imageFileNames.get(image_number)+"  at mouse position");
			}
			else
			println("image number out of range " + image_number+ ">"+ PImagePathList.size() ); 
			break;
		}
		
		else{	
			int image_number =24;
			if(image_number<=PImagePathList.size()){
				img_Fkey_chosen = loadImage( PImagePathList.get(image_number)); 
				println("Right Click to insert " + imageFileNames.get(image_number)+"  at mouse position");
			}
			else
			println("image number out of range " + image_number+ ">"+ PImagePathList.size() );
			
			break;
		}
		
	}   /* SWITCH CASE END  */
}   /* keyPressed END */
/* ............................................. MOUSE WHEEL CONTROLS COLOR  ................................... */

/* if(show_mousewheel) {} */
void mouseWheel(MouseEvent event) {
	float e = event.getCount();
	float interval =10;
	float tempvaluegreen = trace_green;
	float tempvalueblue = trace_blue;
	float tempvaluered = trace_red;
	//println("e = " +e);
	/* ................................... green ........................................ */
	if(event.isControlDown()){
		if(tempvaluegreen>=0&&tempvaluegreen<=255){
			tempvaluegreen = tempvaluegreen+ interval*e;
			
			//trace_green = trace_green + interval*e;
			if(tempvaluegreen<=255&&tempvaluegreen>=0){trace_green =tempvaluegreen;}
			else if(tempvaluegreen>=255) {trace_green = 255;}
			else if(tempvaluegreen<=0) {trace_green = 0;}
			
			/* */if(show_mousewheel) {
				println("(CONTROL) GREEN = " +trace_green +"");
				println("color = (" + trace_red+","+trace_green+","+ trace_blue+")  (ALT) = BLUE, (SHIFT) = RED, (CONTROL) = GREEN ");
			}
		} 
	} /*.isControlDown()*/
	/* ................................... blue ........................................ */
	if(event.isAltDown()){
		if(tempvalueblue>=0&&tempvalueblue<=255){
			tempvalueblue = tempvalueblue+ interval*e;
			
			if(tempvalueblue<=255&&tempvalueblue>=0){trace_blue =tempvalueblue;}
			else if(tempvalueblue>=255) {trace_blue = 255;}
			else if(tempvalueblue<=0) {trace_blue = 0;}
			if(show_mousewheel) {
				println("(ALT) BLUE = " +trace_blue);
				println("color = (" + trace_red+","+trace_green+","+ trace_blue+")  (ALT) = BLUE, (SHIFT) = RED, (CONTROL) = GREEN ");
			}
		}
	}     /* event.isAltDown() */
	/* ...................................  TRACE red ........................................ */
	if(event.isShiftDown()){
		if(tempvaluered>=0&&tempvaluered<=255){
			tempvaluered = tempvaluered+ interval*e;
			
			if(tempvaluered<=255&&tempvaluered>=0){trace_red =tempvaluered;}
			else if(tempvaluered>=255) {trace_red = 255;}
			else if(tempvaluered<=0) {trace_red = 0;}
			if(show_mousewheel) {
				println("(SHIFT) RED = " +trace_red);
				println("color = (" + trace_red+","+trace_green+","+ trace_blue+")  (ALT) = BLUE, (SHIFT) = RED, (CONTROL) = GREEN ");				
			}
		}
	}
	/* ...................................  SCREEN red ..................VK_CAPS_LOCK...................... */		
	/* 		if(event.isShiftDown()&&event.isCapsLockDown()){
		if(tempvaluered>=0&&tempvaluered<=255){
			tempvaluered = tempvaluered+ interval*e;
			
			if(tempvaluered<=255&&tempvaluered>=0){trace_red =tempvaluered;}
			else if(tempvaluered>=255) {trace_red = 255;}
			else if(tempvaluered<=0) {trace_red = 0;}
			if(show_mousewheel) {
				println("(SHIFT) RED = " +trace_red);
				println("color = (" + trace_red+","+trace_green+","+ trace_blue+")");				
				}
			}
			} */
}   /* END MOUSEWHEEL */


/*  */
