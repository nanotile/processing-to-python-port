/*  amoebaAbstract_02a_interactive3inner_boundry2.pde */

/* https://github.com/processing/processing/wiki/Changes */

/*  NEW EDITING JANUARY 16 2016  ARIZONA */
/*
Transparent images
see transparent_eaample_without background pde 

PImage img;
img = loadImage("laDefense.jpg");
image(img, 0, 0);
tint(255, 126);  // Apply transparency without changing color
image(img, 50, 0); 

PImage img;
img = loadImage("laDefense.jpg");
image(img, 0, 0);
tint(0, 153, 204, 126);  // Tint blue and set transparency
image(img, 50, 0);

Alpha Mask.

Loads a "mask" for an image to specify the transparency in different parts of the image. The two images are blended together using the mask() method of PImage.


PImage img;
PImage imgMask;

void setup() {
size(640, 360);
img = loadImage("moonwalk.jpg");
imgMask = loadImage("mask.jpg");
img.mask(imgMask);
imageMode(CENTER);
}

void draw() {
background(0, 102, 153);
image(img, width/2, height/2);
image(img, mouseX, mouseY);

AUDIO IN PROCESSING  Tim Pulver timpulver   https://gist.github.com/timpulver

}

*/

/* ...........................file Input paths................................................. */

String detail_dir_name = "details/RESIZE-5IN";
String texture_dir_name = "textures";
String shapes_dir_name = "shapes";
//String image_input_dir = "data_mix/RESIZE_MIX";   
//String image_input_dir = "data_2imagetest/RESIZE-5IN"; 
String image_input_dir = "data_used_treeimages/RESIZE-5IN";
//String output_file_dir = "C:/1AAAA/AMEBA_11_30_2015/"; /*  FILE SAVING DIRECTORY */
String output_file_dir = "G:/2016_AMEBOA_PRODUCTION_TEST/"; /*  FILE SAVING DIRECTORY */
String code_dir = "C:/FAST_amoebaAbstract/amoebaAbstract_02a_interactive3inner_boundry2";
String input_file_path = code_dir+"/"+image_input_dir+"/";  //FILE SAVING DIRECTORY
String texture_dir_path = code_dir+"/"+texture_dir_name+"/";
String detail_dir_path = code_dir+"/"+detail_dir_name+"/";
String shapes_dir_path = code_dir+"/"+shapes_dir_name+"/";
String time_stamp_dir;  /* used when saving files to time stamped directories  see boolean  use_new_dir */
String timeStamp = getCurrentTimeStamp();  /* used to create Directories in utput_file_path */
/* -------------------- file naming------------------------------------ */
/* Create  RANDOM file names */
String image_sequence = returnRandomDoubleString(1,100,true);  /* true  returns interger string... false returns integer */
String image_file_base = "CARD_";
//String file_path = output_file_dir + image_file_base + image_sequence +"-" ;
String file_name = image_file_base+ image_sequence +"-" ;
String file_path = output_file_dir + file_name  ;
String final_name;  /* Create global variable */
String transparent_dir_name = "TRANSPARENT_6x4_400ppi/";


List<Integer>  listSequenceNumber;  /* List of image array numbers used to choose a nonrepeating sequence of image choices */
int nextSequenceNumber;
//int number_images_data = 12;  //data1=90
/* number of image files in directory...see setup()  ~~180 */
int numImageFilesDirectory;
/* ------------------------- END File Naming input  output files -------------------------- */

/* ............................................Control frequencys ................................................ */
 int  freq_muldo_changeFillAlpha=1000;  /* Control the frequency of changeFillAlpha()  which changes alpha and color fill */
 int freq_muldo_changeRandomImage = 8000; /*  Control the frequency of changeRandomImage() */
int freq_muldo_lerpColor =50;  /* Control the frequency when using lerpColor for fill  */
int freq_muldo_changeEnlargement=1000;  /* Control the frequency of image size change */
int  freq_muldo_particle =10;  /* Control the frequency of fill color and alpha */
int sequenceNumberMuldo =50 ;/* Used for automatic save best setting dependent of a number of other parameters   MORE CONSECUTIVE FOR LOWER VALUES*/
int freq_muldo_detail = 100;  /* SeeParticles.pde   dots_crosses   or use_detailImages*/
int freq_muldo_shapes= 500;
/* ............................................  End Control frequencys ................................................ */

/*................ Particles Declaration ..........................*/
int num_particles = 50;
int cnt;
Particle[] particles;
/*................ End Particles Declaration ..........................*/
/* controls frameRate set in draw() */
int framerate = 24;
int scale_factor =2;   /* scaling window */
int save_number = 50;   /*  Number of examples to save  see draw() */


/*---------------------------   boolean  variables -------------------------------------------------*/
/* SAVE images AUTOMATIC */
//boolean automatic_save = false;  
boolean automatic_save = true; 

/* show  write_images       write images to screen         turns images on and off   see  ParticlesClass.pde*/
boolean write_images = true;
//boolean  write_images =  false;

/* use ss two images */
boolean two_images = true; //
// boolean two_images = false; //turn on two images

/* show_2_chosen_images */
boolean show_2_chosen_images = false;     /* if(show_1_chosen_images) {} */
//boolean show_2_chosen_images = true;

/* use_random_chosen_images */
// boolean use_random_chosen_images = false;     /* if(use_random_chosen_images) {} */
boolean use_random_chosen_images = true;

/* dots and crosses    ellipse inserted */
//boolean dots_crosses = true;
boolean dots_crosses = false;
/* use_detailImages    SEE Particles.pde */
boolean use_detailImages = true;   /* if(use_detailImages){} */
//boolean use_detailImages = false;   if(use_shapes){
/* use_shapes    SEE Particles.pde */
boolean use_shapes = true;   /* if(use_shapes){} */
//boolean use_shapes = false;   

/* changeDirection */
//boolean changeDirection,doSave=true;
boolean changeDirection,doSave=false;

/*kb_image_trail  */
boolean kb_image_trail  = false;
//boolean kb_image_trail = true;

/* show_data */
boolean show_data = false;     /* if(show_data) {} */
//boolean show_data = true;

/* show_keysdata */
boolean show_keysdata = false;     /* if(show_keysdata) {} */
//boolean show_keysdata = true;

/* save_big_graphic */
boolean save_big_graphic = false;     /* if(save_big_graphic) {} */
//boolean save_big_graphic = true;

/* show_rectangles   SEE fileUtilities.pde and Particles.pde */
//boolean show_rectangles = false;     /* if(show_rectangles) {} */
boolean show_rectangles = true;

/* show_particle_statistics */
boolean show_particle_statistics = false;     /* if(show_particle_statistics) {} */
//boolean show_particle_statistics = true;
/* show_mousewheel */
//boolean show_mousewheel = false;     /* if(show_mousewheel) {} */
boolean show_mousewheel = true;
/* HSB_on */
boolean HSB_on = false;     /* if(HSB_on) {} */
//boolean HSB_on = true;
/* use_new_dir    for each run */
//use_new_dir = false;     /* if(use_new_dir) {} */
boolean use_new_dir= true;

/* use_backgroundImage */
boolean use_backgroundImage = false;     /* if(use_backgroundImage) {} */
//boolean use_backgroundImage = true;

/* use_specific_background*/
//boolean use_specific_background = false;     /*if(use_specific_background) {} */
boolean use_specific_background = true;

/* PenroseSnowflakeLSystem */
boolean PenroseSnowflakeLSystem = false;     /* if(PenroseSnowflakeLSystem) {} */
//boolean PenroseSnowflakeLSystem= true;
/* .........................................................................  End boolean variables   ..................................................*/



/* Declaire for use in saving very large images */
PGraphics big; 
/* .....................................................  GLOBAL VARIABLES....................................................... */
/* File variables */
ArrayList<String>  fileList = new ArrayList<String>();
//ArrayList<String> imageFileNames  = new ArrayList<String>();
/* ArrayList to hold images loaded into  */
StringList imageFileNames = new StringList(); 

/* Detail image array */
ArrayList<PImage> PImageDetailList = new ArrayList<PImage>();
ArrayList<String> PImageDetailPathList = new ArrayList<String>();
List<Integer>  detailNumberList;  /* List of image array numbers used to choose a nonrepeating sequence of image choices */
/* Detail image array */
ArrayList<PImage> PImageDBackgroundList = new ArrayList<PImage>();
List<Integer>  backgroundNumberList;  /* List of image array numbers used to choose a nonrepeating sequence of image choices */

ArrayList<PImage> PImageList = new ArrayList<PImage>();
ArrayList<String> PImagePathList = new ArrayList<String>();
//PImage[] images = new PImage[number_images_data];
//PImage img1, img2;
PImage img_random_1, img_random_2;
PImage img_Fkey_chosen; /* this image chosen using Fkeys */
PImage backgroundImage;
PImage detailImage;
/* ...................................... Pshape declarations ................................... */
PShape  pshape;
List<Integer>   shapeNumberList ;
ArrayList<String> SahpePathList = new ArrayList<String>();
int shapeNumber;

/* image array end*/
/* Inaialize the enlargement of images  the lower the numbers the more enlargement */
float rd_min = .3;  /* The size of the images is affected by the size od the screen image */
float rd_max = .8;
/* Used to set the size of the inserted detail images when using random choices */
float detail_rd_min = 0.3;  /* The size of the images is affected by the size od the screen image   Particles.pde*/
float detail_rd_max =1.0;
float trail_x = 10; // size of image trailsclx
float trail_y=10;


float x_,y_;  //window size
color fillVal = color(126); // used in key up-down ARROWS
/*................ Trace color control  -- used with mousewheel  see ParticleClass ........................*/
float trace_alpha = 200; 
float trace_red = 126;
float trace_green =126 ;
float trace_blue   = 126;
color  trace_color = color ( trace_red,trace_green,trace_blue,trace_alpha );

/* Fill Control */
float fill_alpha = 10; //control the trace
float fill_red = 50;
float fill_green = 10 ;
float fill_blue   = 10;
color  fill_color;



float screen_alpha ;
int mousewheel_count;
float tempKEYval=0;  /* used in javaKeyControls.pde */
float widthIncrementVal = 1;   /* used in javaKeyControls.pde trace control   width of trace */
float lengthIncrementVal = 1;   /* used in javaKeyControls.pde trace control   width of trace */
//................................. color stuff ..................................................
//color start=color(0,0,0);
//color finish;
//float amt = 0.0;

/* .................................Containing polygon  used to place images inside frame if desired -- indent from side of window............. */
Poly p; // see class at end of file
int dx = 10;   // sets distance from edge of images
int dy = 10; 
int counter =0;  /* used in big graphics*/
int cycle_counter = 0;
/* controls size and shape of  traces   IN ParticleClass.pde  */
float x_rect =1;
float y_rect =1;

int r_1,r_2; /*  used for random numbers  -- global to use for output */

/* Used for automatic save */
int sequenceNumber =0;  /* Initialize variable */
//int sequenceNumberMuldo =100;/* Used for automatic save */
int save_number_examples = 0;  /* Initialize variable   updated in save file..useful for automatic save*/
int universal_counter =0;
int image_change = 0;
PenroseSnowflakeLSystem ps; /* if(PenroseSnowflakeLSystem) {} */

/* ......................................... setup() ............................................... */
void setup() {

	/* fullScreen();   use with processing 3  gives 2500x1444 pixels */
	/* ...................................................  Output Image size....................................... */
	x_= 1200;
	y_= 800;/*6x4 */
	
	/* Slider proportions */
	/* 	x_= 1140;
	y_= 450; */
	
	size((int)x_*scale_factor, (int)y_*scale_factor); 
	/* println("width = " + width);
	println("height = " + height); */
	/* ................................................... End Output Image size....................................... */	
	
	smooth(8);   /*  8x anti-aliasing   MAX  2 DEFAULT*/
	noStroke();

	/* .................... Setup for big graphics..................... */
	if(save_big_graphic) {
		big = createGraphics(5000, 5000, JAVA2D); // Create a new PGraphics object 5000x5000px  
		big.beginDraw(); // Start drawing to the PGraphics object  
		size(500, 500, P2D); //size of the on-screen display  
		/* 
		example transparancy also
		PGraphics pg;

void setup(){
size(800,800);
pg = createGraphics(400,400,JAVA2D); //create the off-screen graphics
pg.smooth();
pg.beginDraw();
float diameter = 150;
pg.noStroke();
pg.fill(0,128);
pg.ellipse(pg.width/2,pg.height/2,diameter,diameter);
pg.fill(255,196);
pg.ellipse(pg.width/2,pg.height/2,diameter*0.9,diameter*0.9);
pg.endDraw();
pg.save("transparent.png");
} */
		
	} 

	
/* ............................................................. Setup lerpColor() ..................................................... */
	color from = color(204, 102, 0);
	color to = color(0, 102, 153);
	color interA = lerpColor(from, to, .33);
	color interB = lerpColor(from, to, .66);
	//float	amt = .5;
	float	amt = random(0,1);
	background(lerpColor(from, to,amt ));
	if(use_specific_background){
	background(0,0,0); /*  Start with Black background */
	//background(255,255,255); /*  Start with Black background */
	
	}
	if(use_shapes){
	SahpePathList = getPathsDirectory(shapes_dir_path,"svg");
	 shapeNumberList   = returnNonRepeatingInterger(SahpePathList.size(),SahpePathList.size()) ;/* List<Integer> return list of numbers  in this case all possible  */
	  //pshape = loadShape(SahpePathList(shapeNumber));
	  //shape(pshape );  /* display shape */
	 
	}
	
	
	
	/*  LOAD ABACKGROUND TEXTURE BUT NOT PUT ON SCREEN */	
	if(use_backgroundImage){
		/* Load backgroundImage"); */
	PImageDBackgroundList = returnPImagesInDirectory(texture_dir_path,"png","texture images",true);
	 backgroundNumberList  = returnNonRepeatingInterger(PImageDBackgroundList.size(),PImageDBackgroundList.size()) ;
	Random Gground = new Random();
	int background_num  = nextIntInRange(0, PImageDBackgroundList.size()-1, Gground);/* */
	backgroundImage =PImageDBackgroundList.get(background_num);  /* PImage */
	//backgroundImage = loadImage(PImageDBackgroundList.get(background_num));
	 image(backgroundImage,0,0,width,height);/*  Load  image to fill image output diemnsions*/
	} 
	noStroke();
	rectMode(CENTER);
	ellipseMode(CENTER);
	/* Get Image ArrayList and File Names List */
	PImagePathList = getPathsDirectory(input_file_path,"png"); 
	/* Returns a random non repeating list to avoid duplicates. */
	listSequenceNumber = returnNonRepeatingInterger(PImagePathList.size(),PImagePathList.size()) ;
	
	PImageList = returnPImagesInDirectory(input_file_path,"png","tree images",false);
	imageFileNames = returnFileNamesInDirectory(input_file_path,"png","tree images",false);
	/* Returns a random non repeating list to avoid duplicates. */
	listSequenceNumber = returnNonRepeatingInterger(PImageList.size(),PImageList.size()) ;
	
	/* Load detailImages"); */
	if(use_detailImages){
	PImageDetailPathList = getPathsDirectory(detail_dir_path,"png");
	 detailNumberList   = returnNonRepeatingInterger(PImageDetailPathList.size(),PImageDetailPathList.size()) ;/* List<Integer>  */
	//exitWithComment("getPathsDir");
	//PImageDetailList = returnPImagesInDirectory(detail_dir_path,"png","detail images",false);
	// detailNumberList   = returnNonRepeatingInterger(PImageDetailList.size(),PImageDetailList.size()) ;  /* List<Integer>  */
	}


	if(use_random_chosen_images) {	
		/* Choose random images from a a non repeating random list   listSequenceNumber  */
		/*  Inatalize random images choosing the first two in the list ..... all subsequent choices will come from this list */
		r_1 = listSequenceNumber.get(0);
		r_2 = listSequenceNumber.get(1);
		/* Set next image for random select  */
		nextSequenceNumber =2;
		// println("................................................................r_1 = "+ r_1 + " r_2 = "+ r_2);
		
		img_random_1 = loadImage( PImagePathList.get(r_1));
		img_random_2 = loadImage( PImagePathList.get(r_2));
		
		/* img_random_1 =  PImageList.get(r_1);
		img_random_2 = PImageList.get(r_2); */
		
		/* Inatilize FKey image used in image choice using Function Keys and right mouse click */
		
		img_Fkey_chosen = loadImage( PImagePathList.get(0)); 
		//img_Fkey_chosen =PImageList.get(0); 
		
		println( "Inititalize two images   run img_1 = "+ imageFileNames.get(r_1)+"  ["+  r_1 +"]   img_2 = "+ imageFileNames.get(r_2)+"  ["+  r_2+"]" );

	}
	else{
		/* Choose two images by name */
		if(show_2_chosen_images) {
			String image1 ="7.png";
			String image2 ="8.png";
			img_random_1 =  loadImage( image1);
			img_random_2 =  loadImage(image2);
			two_images = true;
			println( "Loading "+image1+" and "+  image2);
		}
		else{
			/* Choose one images by name */
			String image3 ="8.png";
			img_random_1 =  loadImage("image3");
			println( "Loading Single Image = "+image3);}
	}

	/* ......................................... End loading array of images ....................  */

	/*........................................... setup polygon (4 sides) to narrow the image placement.................................................  */
	//build a rectangle within the frame
	// dx and dy defined in setup
	int l;
	int[]x={dx,width - dx,width-dx,dx};
	int[]y={dy,dy,height-dy,height-dy};
	p=new Poly(x,y,4);
	//println("boundries");
	for(l=0;l<4;l++)
	{
		//println("boundries = x  = " + x[l]+".... y  =" + y[l]);
	}
	

	/*  ...............................................  Setup Particle system........................................ */
	
	//num_particles=10;     /* Defined Global variables*/
	particles= new Particle[num_particles];  /* particles[]  Defined Global variables     See Particles.pde */
	for(int i=0; i<num_particles; i++) {
		particles[i]=new Particle();
		particles[i].index=i;  // each particle has index
		if(i<2) {
			particles[i].speed=1;
			particles[i].initMove();
		}
	}
	/*  ............................................... End  Setup Particle system........................................ */

	
	
	/* .....................  Setup Output Directory ............................... */
	if(use_new_dir) {
		/* CREATE OUTPUT FILE DIRECTORY FOR */
		String time_stamp_dir = createOneDirectory(output_file_dir,timeStamp);
		createOneDirectory(time_stamp_dir,"/"+transparent_dir_name);
        createOneDirectory(time_stamp_dir,"/Archive");
		String randomString = returnRandomDoubleString(100000,10000000,true);
		
		String production_dir =createOneDirectory(time_stamp_dir,"/TREE_production_"+randomString);
		println("production_dir = " + production_dir);
		
		createOneDirectory(production_dir,"/CARD_4x6PSD_"+randomString);
		createOneDirectory(production_dir,"/CARD_PRINT_READY_"+randomString);
		createOneDirectory(production_dir,"/ETSY_THUMB_"+randomString);
		/* Change output full path  which is set up in Globals to new directory */
		file_path = time_stamp_dir +"/"+ file_name;
		
	}
	
	
	/* Report boolean settings */	
	/* Show setup variables */
	writeBooleanValues();
	/* Penrose Snoflake */
	if(PenroseSnowflakeLSystem) {
		ps = new PenroseSnowflakeLSystem();
		ps.simulate(4);} 
	
	smooth(8); // set smooth level 6 (default is 2)(can use 8)
	// The level parameter increases the level of smoothness with the P2D and P3D renderers.
	//  This is the level of over sampling applied to the graphics buffer. The value "2" will
	// double the rendering size before scaling it down to the display size. This is called "2x anti-aliasing."
	// The value 4 is used for 4x anti-aliasing and 8 is specified for 8x anti-aliasing. If level is set to 0,
	// it will disable all smoothing; it's the equivalent of the function noSmooth(). The maximum anti-aliasing
	// level is determined by the hardware of the machine that is running the software.
	println("........................ End of Setup .................................  \n" );  
}
/* ................................................................................  draw() ............................................................................... */
void draw() {
//makeTubPattern(60);

	if(PenroseSnowflakeLSystem) {ps.render(); } 

	frameRate(framerate);   /* frameRate set in GLOBAL VARIABLES */
	/* Used for automatic save */
	sequenceNumber++;
	/* Output statistics of the run */
	if(save_number_examples == save_number){		
		println("Number of examples saved = " + save_number );  
		println( "cycle_counter Total = " + cycle_counter ); 
		println( "image_change Total = " + image_change ); 
		exit();}
	/* Change color and alpha   using lerpColor   int freq_muldo_lerpColor */		
	if( cycle_counter %freq_muldo_lerpColor == 0){
		/* Sets up color range */
		//color interA = lerpColor(from, to, .33);
		//color interB = lerpColor(from, to, .66);
		//float	amt = .5;
		color from = color(204, 102, 0);
		color to = color(0, 102, 153);
		float	amt = random(0,20);
		float lepalpha  = 1;
		fill(lerpColor(from, to,amt ),lepalpha);
		//  image(backgroundImage,0,0,width,height);
		/* Adjust fill rectangle according with scale_factor */
		rect(0,0,width,height);   /* Full screen fill */
		//println("width = " + width*scale_factor +" height  = " + height*scale_factor+ " cycle_counter = " + cycle_counter );  
	}
	/* Change image size  int freq_muldo_changeEnlargement */
	if( cycle_counter %freq_muldo_changeEnlargement  == 0 &&cycle_counter != 0){
		changeEnlargement(true,1,true) ;   /* direction true = enlarge --  increment how much to change --  true to show change */
		image_change++;
	}
	/* Choose two new random  images int  freq_muldo_changeRandomImage */
	if( cycle_counter % freq_muldo_changeRandomImage== 0){
		changeRandomImage();
		/* Update nextSequenceNumber for next sequence 
		nextSequenceNumber++;*/
		println("line 447 nextSequenceNumber = " + nextSequenceNumber + " listSequenceNumber.size()  =  "+listSequenceNumber.size());
		changeFillAlpha(false,20);   /* boolean up_alpha */
		image_change++;
	}
	/* /* Change full screen alpha images */      /*changeFillAlpha  changes fill color also   int  freq_muldo_changeFillAlpha*/ 
	if( cycle_counter %freq_muldo_changeFillAlpha == 0){    
		if(screen_alpha >= 255)
		{changeFillAlpha(false,20);  /* When alpha reaches a certain value start to decrease screen_alpha */
			image_change++;}
		else
		{
			changeFillAlpha(true,20);
			image_change++;}
	}


	

	if(save_big_graphic) {
		counter++; // add 1 to counter  
		if(counter%freq_muldo_particle == 0) { // every 10th frame we snap a preview and draws it  
			PImage img = big.get(0, 0, big.width, big.height); //snap an image from the off-screen graphics  
			img.resize(width,height); // resize to fit the on-screen display  
			image(img,0,0); // display the resized image on screen 
		}
		/* ...................................................  */
		//if(show_data) {println("write triangle............screen_alpha ="+screen_alpha+"  cnt = "+cnt);
		if(particles[0].cnt% freq_muldo_particle==0) {   /* int  freq_muldo_particle */
			//%40 default
			// fill(100,20,0,5); // rgb alpha
			// fill( random(255), random(255), random(255), random(255)); 
			float screen_alpha= random(5,100);
			fill(100,20,0,(int)screen_alpha); // rgb alpha
			if(show_data) {println("write triangle............screen_alpha ="+screen_alpha+"  cnt = "+cnt);
				
			} 
			rect(0,0,width,height);   /* Full screen fill */
		}

		if(changeDirection){ 
			for(int i=0; i<num_particles; i++) particles[i].initMove();
			changeDirection=false;
			
		}

	/* 	noStroke();
		for(int i=0; i<num_particles; i++) {
			particles[i].update();
			particles[i].draw();  // draw particles called
		} */

		if (automatic_save ==true){
			
			if(sequenceNumber%sequenceNumberMuldo==0)
			{ 
				/* Create file names */
				String randomString = returnRandomDoubleString(100000,10000000,true);
				/* println("returnRandomDoubleString  = " + randomString); */
				saveFrame (file_path + randomString+".tif");
				println("FILE SAVED = "+file_path + " sequenceNumberMuldo = " +sequenceNumberMuldo);
				save_number_examples++;
			}
		}

	} /*END SAVE BIG*/

	else{
		/* every 60 frames fill screen with random fil */
		if(particles[0].cnt%300==0) {
			//%40 default
			// fill(100,20,0,5); // rgb alpha
			float screen_alpha= random(5,20);   /* random(low,high) */
			float _red = random(20,100);
			float _green = random(20,100);
			float _blue = random(20,100);
			color c1 = color(_red,_green,_blue);
			//fill( random(100,20), random(100,20), random(100,20), screen_alpha);
			fill(c1,screen_alpha);

			
			// fill(100,20,0,(int)screen_alpha); // rgb alpha
			if(show_data) {println(".............................FILL............screen_alpha ="+screen_alpha+"  cnt = "+cnt);} 
			rect(0,0,width,height);   /* Full screen fill */
			//rect(width/2,height/2,width,height);//700,400); // this changes opacity and fill  lower quardent
		}

		if(changeDirection){ 
			for(int i=0; i<num_particles; i++) particles[i].initMove();
			changeDirection=false;
			
		}

		noStroke();
		for(int i=0; i<num_particles; i++) {
			particles[i].update();
			particles[i].draw();  // draw particles called
		}

		if (automatic_save ==true){
			
			if(sequenceNumber%sequenceNumberMuldo==0&&sequenceNumber>sequenceNumberMuldo*2)    /* sequenceNumberMuldo*2 used to bypass early unpopulated images */
			{ 
				/* Create file names */
				String randomString = returnRandomDoubleString(100000,10000000,true);
				/* println("returnRandomDoubleString  = " + randomString); */
				final_name = file_path + randomString+".tif";
				//final_name = file_path + randomString+ "_####.tif" ;  /* Dothis for continuous numbering but use random for SKU */
				saveFrame (final_name);      /* 	+ "####.tif" */
				println("AUTO FILE SAVE = "+final_name+ " .sequenceNumberMuldo = " +sequenceNumberMuldo+ " save_number_examples = " +save_number_examples +" of "+save_number);
				save_number_examples++;  /* Used to limit number of saves in session */
			}
		}
	}
	cycle_counter ++;
}// end draw

