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
String preferenceTextFileName = "preferenceTextFileName.txt";
//String detail_dir_name = "details/RESIZE-5IN";
//String detail_dir_name = "marika_splatter";
//String detail_dir_name = "COMPONENTS";
String detail_dir_name = "marika_splatter/reduced/RED_AND_BLACK";
String texture_dir_name = "textures";
String stripes_dir_name = "stripes";
String candy_dir_name = "data_CANDY_IMAGES";
String squiggle_dir_name = "data_squiggle";
String geometric_dir_name = "data_geometric_matrix_png";
//String shapes_dir_name = "shapes/caligraphic";
//String shapes_dir_name = "shapes";
String shapes_dir_name = "shapes/flower";
//String image_input_dir = "data_mix/RESIZE_MIX";   
//String image_input_dir = "data_2imagetest/RESIZE-5IN"; 
//String image_input_dir = "data_used_treeimages/RESIZE-5IN/two_image_1";
String image_input_dir = "data_used_treeimages/RESIZE-5IN/glowing_edges_bright";
String image_input_dir_1 = "data_used_treeimages/RESIZE-5IN/glowing_edges_bright/COLOR_60%TRANSPARENT";
String image_input_dir_2 = "data_used_treeimages/RESIZE-5IN/glowing_edges_bright";

//String image_input_dir = "data_used_treeimages/RESIZE-5IN/COMPOSIT GLOWING EDGES 60 TRANSPARENT";

//String output_file_dir = "C:/1AAAA/AMEBA_11_30_2015/"; /*  FILE SAVING DIRECTORY */

String output_file_dir = "G:/2016_AMEBOA_PRODUCTION_TEST/"; /*  FILE SAVING DIRECTORY */
String code_dir = "C:/FAST_amoebaAbstract/amoebaAbstract_02a_interactive3inner_boundry2";
String input_file_path = code_dir+"/"+image_input_dir+"/";  
String input_file_path_1 = code_dir+"/"+image_input_dir_1+"/";
String input_file_path_2 = code_dir+"/"+image_input_dir_2+"/";
String texture_dir_path = code_dir+"/"+texture_dir_name+"/";
String detail_dir_path = code_dir+"/"+detail_dir_name+"/";
String shapes_dir_path = code_dir+"/"+shapes_dir_name+"/";
String stripes_dir_path = code_dir+"/"+stripes_dir_name+"/";
String candy_dir_path = code_dir+"/"+candy_dir_name+"/";
String squiggle_dir_path = code_dir+"/"+squiggle_dir_name+"/";
String geometric_dir_path = code_dir+"/"+geometric_dir_name+"/";
String preferenceTextFile_path = code_dir+"/"+preferenceTextFileName;

String time_stamp_dir;  /* used when saving files to time stamped directories  see boolean  use_new_dir */
String timeStamp = getCurrentTimeStamp();  /* used to create Directories in utput_file_path */
String fileNameRandomString = returnRandomDoubleString(100000,10000000,true);
int fileNameRandomInt = Integer.parseInt(fileNameRandomString);


/* -------------------- file naming------------------------------------ */
/* Create  RANDOM file names */
String image_sequence = returnRandomDoubleString(1,100,true);  /* true  returns interger string... false returns integer */
String image_file_base = "CARD_";
//String file_path = output_file_dir + image_file_base + image_sequence +"-" ;
String file_name = image_file_base+ image_sequence +"-" ;
String file_path = output_file_dir + file_name  ;
String final_name;  /* Create global variable */
String transparent_dir_name = "TRANSPARENT_6x4_400ppi/";


/* number of image files in directory...see setup()  ~~180 */
int numImageFilesDirectory;
/* ------------------------- END File Naming input  output files -------------------------- */

/* controls frameRate set in draw() */
int framerate = 24;
int scale_factor =2;   /* scaling window */
int save_number = 100;   /*  Number of examples to save  see draw() */
/* Inaialize the enlargement of images  the lower the numbers the less enlargement */
float rd_min = .2;  /* The size of the images is affected by the size rd the screen image */
float rd_max = .5;

/* ............................................Control frequencys ................................................ */
int freq_muldo_changeFillAlpha=3000;  /* Control the frequency of changeFillAlpha()  which changes alpha and color fill */
int freq_muldo_changeRandomImage = 100*save_number; /*  Control the frequency of changeRandomImage() */
int freq_muldo_lerpColor =250;  /* Control the frequency when using lerpColor for fill  */
int freq_muldo_changeEnlargement=1000;  /* Control the frequency of image size change */
int  freq_muldo_particle =105;  /* Control the frequency of fill color and alpha  not used only in save Big */
int sequenceNumberMuldo =50 ;/* Used for automatic save best setting dependent of a number of other parameters   MORE CONSECUTIVE FOR LOWER VALUES*/
int save_delay = 5; /*  prevents saving too early */
int freq_muldo_detail = 200;  /* SeeParticles.pde   dots_crosses   or use_detailImages*/
int freq_muldo_candy = 440;
int freq_muldo_squiggle = 240;
int freq_muldo_geometric = 310; 
int freq_muldo_shapes= 765;
int freq_muldo_particle_fill = 8000;   /*  The file */
int freq_image_count_image_1 = 3;  /* These frequencies cannot be the same or will get only one image */
int freq_image_count_image_2 =4;
int freq_muldo_imageCount = 10;
int freq_muldo_complexFill = 800;  /* Used with SequenceNumber */
/*................ Number Particles  ..........................*/
int num_particles = 60;

/* ............................................  End Control frequencys ................................................ */

/*................ Particle Array Declaration ..........................*/
int cnt;
Particle[] particles;
/*................ End Particles Declaration ..........................*/


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

/* use_lerpColor */
boolean use_lerpColor = false;     /* if(use_lerpColor) {} */
// boolean use_lerpColor = true;

/* use_random_chosen_images */
// boolean use_random_chosen_images = false;     /* if(use_random_chosen_images) {} */
boolean use_random_chosen_images = true;

/* use_detailImages    SEE Particles.pde */
boolean use_detailImages = true;   /* if(use_detailImages){} */
//boolean use_detailImages = false; 
/* use_shapes    SEE Particles.pde */
boolean use_shapes = true;   /* if(use_shapes){} */
//boolean use_shapes = false; 
/* use_candy    SEE Particles.pde */
boolean use_candy = true;   /* if(use_candy){} */
//boolean use_candy= false; 
/* use_squiggle    SEE Particles.pde */
boolean use_squiggle = true;   /* if(use_squiggle){} */
//boolean use_squiggle= false; 
/* use_geometric    SEE Particles.pde */
boolean use_geometric = true;   /* if(use_geometric){} */
//boolean use_geometric= false; 


/* use_backgroundImage */
boolean use_backgroundImage = false;     /* if(use_backgroundImage) {} */
//boolean use_backgroundImage = true;
/* use_stripes */
boolean use_stripes = false;     /* if(use_stripes) {} */
//boolean use_stripes = true;
/* use_specific_background*/
boolean use_specific_background = false;     /*if(use_specific_background) {} */
//boolean use_specific_background = true;
/* sound_on*/
boolean sound_on = false;     /*if(sound_on) {} */
//boolean sound_on = true;
/* ................................................Trace Fill Controls .......................................... */
/*use_random_trace    Turn traces on and off   KeyBoard   t for toggle*/
//boolean use_random_trace = false;     /* if(use_random_trace) {} */
boolean use_random_trace= true;

/* use_random_trace_fill    SEE Particles.pde */
//boolean use_random_trace_fill = true;   /* if(use_random_trace_fill){} */
boolean use_random_trace_fill = false;
/* use_random_trace_fill_1    SEE Particles.pde  When this is false then the trace color is =default color */
boolean use_random_trace_fill_1 = true;   /* if(use_random_trace_fill_1){} */
//boolean use_random_trace_fill_1= false;
/* use_random_screen_fill    SEE Particles.pde */
boolean use_random_screen_fill = true;   /* if(use_random_screen_fill){} */
//boolean use_random_screen_fill = false; 

/* dots and crosses    ellipse inserted */
boolean dots_crosses = true;
//boolean dots_crosses = false;

/* ................................................ End Trace Fill Controls .......................................... */


/* show_rectangles   SEE fileUtilities.pde and Particles.pde */
//boolean show_rectangles = false;     /* if(show_rectangles) {} */
boolean show_rectangles = true;

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


/* PenroseSnowflakeLSystem */
boolean PenroseSnowflakeLSystem = false;     /* if(PenroseSnowflakeLSystem) {} */
//boolean PenroseSnowflakeLSystem= true;
/* .........................................................................  End boolean variables   ..................................................*/

/* Declaire for use in saving very large images */
PGraphics big; 
/* .....................................................  GLOBAL VARIABLES....................................................... */
/* ................................................... File variables used to output file names.............................................*/
ArrayList<String>  fileList = new ArrayList<String>();
 
/* Detail image array */
ArrayList<PImage> PImageDetailList = new ArrayList<PImage>();
ArrayList<String> PImageDetailPathList = new ArrayList<String>();
List<Integer>  detailNumberList;  /* List of image array numbers used to choose a nonrepeating sequence of image choices */
PImage detailImage;
/* Background image array */
ArrayList<String> BackgroundPathList = new ArrayList<String>();
List<Integer>  backgroundNumberList;  /* List of image array numbers used to choose a nonrepeating sequence of image choices */
PImage backgroundImage;

/* Stripes image array */
ArrayList<String> PImageStripesPathList = new ArrayList<String>();
List<Integer>  stripesNumberList;  /* List of image array numbers used to choose a nonrepeating sequence of image choices */
PImage stripesImage;
/* Candy image array */
ArrayList<String> CandyPathList = new ArrayList<String>();
List<Integer>  candyNumberList;  /* List of image array numbers used to choose a nonrepeating sequence of image choices */
PImage candyImage;
/* Squiggle image array */
ArrayList<String>  SquigglePathList = new ArrayList<String>();
List<Integer>   squiggleNumberList;  /* List of image array numbers used to choose a nonrepeating sequence of image choices */
PImage squiggleImage;
/* Geometric image array */
ArrayList<String> GeometricPathList = new ArrayList<String>();
List<Integer>  geometricNumberList;  /* List of image array numbers used to choose a nonrepeating sequence of image choices */
PImage geometricImage;

/* Base (flowers) image arrays */
StringList imageFileNames = new StringList(); 
/* Object list 1 */
ArrayList<String> PImagePathList = new ArrayList<String>();
List<Integer>  listSequenceNumber;  /* List of image array numbers used to choose a nonrepeating sequence of image choices */
int nextSequenceNumber;
StringList imageFileNames_1 = new StringList(); 
/* Object list 2 */
ArrayList<String> PImagePathList_1 = new ArrayList<String>();
List<Integer>  listSequenceNumber_1;  /* List of image array numbers used to choose a nonrepeating sequence of image choices */
int nextSequenceNumber_1;
/* Object list 3 */
StringList imageFileNames_2 = new StringList();
ArrayList<String> PImagePathList_2 = new ArrayList<String>();
List<Integer>  listSequenceNumber_2;  /* List of image array numbers used to choose a nonrepeating sequence of image choices */
int nextSequenceNumber_2;

/*End Base (flowers) image array */


int r_1,r_2,r_3; /*  used for random numbers  -- global to use for output */
PImage img_random_1, img_random_2,img_random_3;
PImage img_Fkey_chosen; /* this image chosen using Fkeys */
float tempKEYval=0;  /* used in javaKeyControls.pde */

/* Pshape image array */
PShape  pshape;
List<Integer>   shapeNumberList ;
ArrayList<String> ShapePathList = new ArrayList<String>();
int shapeNumber;
/* ................................................. image array end ......................................*/

/* Used to set the size of the inserted detail images when using random choices */
float detail_rd_min = 0.3;  /* The size of the images is affected by the size od the screen image   Particles.pde*/
float detail_rd_max =1.0;
float trail_x = 10; // size of image trailsclx
float trail_y=10;

float x_,y_;  //window size
color fillVal = color(126); // used in key up-down ARROWS
/*................ Trace color control  -- used with mousewheel  see ParticleClass ........................*/
float trace_alpha = 150; 
float trace_red = 0;
float trace_green =0 ;
float trace_blue   = 0;
color  trace_color_default = color ( trace_red,trace_green,trace_blue,trace_alpha );
color  trace_color;

/* Screen Fill Control */
float fill_alpha = 100; //control the trace
float fill_red = 50;
float fill_green = 10 ;
float fill_blue   = 10;
color  fill_color_default = color ( fill_red,fill_green,fill_blue,fill_alpha );
color  fill_color;


color specific_background = color(0,0,0,255);
//color specific_background = color(255,255,255,255);

float screen_alpha ;
int mousewheel_count;
float widthIncrementVal = 1;   /* used in javaKeyControls.pde trace control   width of trace   CLOSE_BRACKET*/
float lengthIncrementVal = 1;   /* used in javaKeyControls.pde trace control   width of trace */

/* .................................Containing polygon  used to place images inside frame if desired -- indent from side of window............. */
Poly p; // see class at end of file
int dx = 200;   // sets distance from edge of images
int dy = 200; 
int counter =0;  /* used in big graphics*/
int cycle_counter = 0;
/* controls size and shape of  traces   in ParticleClass.pde  */
float x_rect =1;
float y_rect =1;



/* Used for automatic save */
int sequenceNumber =0;  /* Initialize variable */
int save_number_examples = 0;  /* Initialize variable   updated in save file..useful for automatic save*/
int universal_counter =0;
int image_change = 0;
int imageCount = 0;  /* Used to count how many images inserted >> controls when to make a save */

PenroseSnowflakeLSystem ps; /* if(PenroseSnowflakeLSystem) {} */

/* ......................................... Begin Setup() ............................................... */
void setup() {

	/* ...................................................  Output Image size....................................... */
	x_= 1200;
	y_= 800;/*6x4 */
	
	/* fullScreen();   use with processing 3  gives 2500x1444 pixels */
	/* Slider proportions */
	/* 	x_= 1140;
	y_= 450; */
	
	size((int)x_*scale_factor, (int)y_*scale_factor); 

	/* ................................................... End Output Image size....................................... */	
	
	
	smooth(8); // set smooth level 6 (default is 2)(can use 8)
	// The level parameter increases the level of smoothness with the P2D and P3D renderers.
	//  This is the level of over sampling applied to the graphics buffer. The value "2" will
	// double the rendering size before scaling it down to the display size. This is called "2x anti-aliasing."
	// The value 4 is used for 4x anti-aliasing and 8 is specified for 8x anti-aliasing. If level is set to 0,
	// it will disable all smoothing; it's the equivalent of the function noSmooth(). The maximum anti-aliasing
	// level is determined by the hardware of the machine that is running the software.
	noStroke();
	rectMode(CENTER);
	ellipseMode(CENTER);
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
	
	/* These values declared in Global Variables */
	if(use_specific_background){
		background(specific_background);
		//background(0,0,0); /*  Start with Black background */
		//background(255,255,255); /*  Start with White background */
	}
	else{	
		/* ............................................................. Setup lerpColor() ..................................................... */
		color from = color(204, 102, 0);
		color to = color(0, 102, 153);
		color interA = lerpColor(from, to, .33);
		color interB = lerpColor(from, to, .66);
		float	amt = random(0,1);
		background(lerpColor(from, to,amt ));
	}
	/* 	Setup Squiggle BACKGROUND */
	if(use_candy){
		CandyPathList = getPathsDirectory(candy_dir_path,"png");
		candyNumberList   = returnNonRepeatingInterger(CandyPathList.size(),CandyPathList.size()) ;/* List<Integer> return list of numbers  in this case all possible  */	
	}		
	/* 	Setup Squiggle BACKGROUND */
	if(use_squiggle){
		SquigglePathList = getPathsDirectory(squiggle_dir_path,"png");
		squiggleNumberList   = returnNonRepeatingInterger(SquigglePathList.size(),SquigglePathList.size()) ;/* List<Integer> return list of numbers  in this case all possible  */	
	}	
	
	/* 	Setup Geometric BACKGROUND */
	if(use_geometric){
		GeometricPathList = getPathsDirectory(geometric_dir_path,"png");
		geometricNumberList   = returnNonRepeatingInterger(GeometricPathList.size(),GeometricPathList.size()) ;/* List<Integer> return list of numbers  in this case all possible  */	
	}	
	/* 	Setup PShapes */
	if(use_shapes){
		ShapePathList = getPathsDirectory(shapes_dir_path,"svg");
		shapeNumberList   = returnNonRepeatingInterger(ShapePathList.size(),ShapePathList.size()) ;/* List<Integer> return list of numbers  in this case all possible  */
		
	}
	/* Load backgroundImage"); */
	if(use_backgroundImage){
		/*  LOAD ABACKGROUND TEXTURE BUT NOT PUT ON SCREEN */	
		
		BackgroundPathList = getPathsDirectory(shapes_dir_path,"png");
		backgroundNumberList  = returnNonRepeatingInterger(BackgroundPathList.size(),BackgroundPathList.size()) ;
		backgroundImage = returnImage(BackgroundPathList);
		//Random Gground = new Random();
		//int background_num  = nextIntInRange(0, BackgroundPathList.size()-1, Gground);/* */
		//backgroundImage =BackgroundPathList.get(background_num);  /* PImage */
		//backgroundImage = loadImage(BackgroundPathList.get(background_num));
		image(backgroundImage,0,0,width,height);/*  Load  image to fill image output diemnsions*/
	} 

	/*........................ Load object image file list    .......................*/
	PImagePathList = getPathsDirectory(input_file_path,"png"); 
	listSequenceNumber = returnNonRepeatingInterger(PImagePathList.size(),PImagePathList.size()) ;
	imageFileNames = returnFileNamesInDirectory(input_file_path,"png","tree images",false); /*StringList  */	

	PImagePathList_1 = getPathsDirectory(input_file_path_1,"png"); 
	listSequenceNumber_1 = returnNonRepeatingInterger(PImagePathList_1.size(),PImagePathList_1.size()) ;
	imageFileNames_1 = returnFileNamesInDirectory(input_file_path_1,"png","tree images",false); /*StringList  */	
	
	PImagePathList_2 = getPathsDirectory(input_file_path_2,"png"); 
	listSequenceNumber_2 = returnNonRepeatingInterger(PImagePathList_2.size(),PImagePathList_2.size()) ;
	imageFileNames_2 = returnFileNamesInDirectory(input_file_path_2,"png","tree images",false); /*StringList  */	
	
	
	
	
	/*........................ Load object image file list  images  .......................*/ 
	/* Load detailImages"); */
	if(use_detailImages){
		PImageDetailPathList = getPathsDirectory(detail_dir_path,"png");
		detailNumberList   = returnNonRepeatingInterger(PImageDetailPathList.size(),PImageDetailPathList.size()) ;/* List<Integer>  */
	}
	/* if(use_stripes) {}   Setup*/
	if(use_stripes) {
		PImageStripesPathList = getPathsDirectory(stripes_dir_path,"png");
		stripesNumberList   = returnNonRepeatingInterger(PImageStripesPathList.size(),PImageStripesPathList.size()) ;/* List<Integer>  */
	}
	if(use_random_chosen_images) {	
		/* Choose random images from a a non repeating random list   listSequenceNumber  */
		/*  Inatalize random images choosing the first two in the list ..... all subsequent choices will come from this list */
		//Load a single image at this point instead of loading huge array in setup  memory problems 
		Random Qground = new Random();
		r_1  = nextIntInRange(0, PImagePathList.size()-1, Qground);
		r_2  = nextIntInRange(0, PImagePathList_1.size()-1, Qground);
		r_3  = nextIntInRange(0, PImagePathList_2.size()-1, Qground);
		
		/* Make sure two images are not the same  unnecessary because
		drawing from different directories in general  but it could happen.
		
		if(r_1==r_2 && r_1 != PImagePathList.size())
		{r_2 = r_1 +1;}
		else { Random Sground = new Random(); 
			r_2  = nextIntInRange(0, PImagePathList.size()-1, Sground);}
*/
		/* Can be assigned in Particle.pde ??*/
		img_random_1 = loadImage( PImagePathList.get(r_1));
		img_random_2 = loadImage( PImagePathList_1.get(r_2));
		img_random_3 = loadImage( PImagePathList_2.get(r_3));
		println("img_random_1 = " + getFileName(PImagePathList.get(r_1)) );
		println("img_random_2 = " + getFileName(PImagePathList_1.get(r_2)) );
		println("img_random_3 = " + getFileName(PImagePathList_2.get(r_3)) );
		/* Inatilize FKey image used in image choice using Function Keys and right mouse click */
		
		img_Fkey_chosen = loadImage( PImagePathList.get( nextIntInRange(0, PImagePathList.size()-1, Qground))); 
	}
	else{
		/* Choose two images by name */
		if(show_2_chosen_images) {
			String image1 ="7.png";
			String image2 ="8.png";
			img_random_1 =  loadImage( image1);
			img_random_2 =  loadImage(image2);
			two_images = true;
			//println( "Loading "+image1+" and "+  image2);
		}
		else{
			/* Choose one images by name */
			String image3 ="8.png";
			img_random_1 =  loadImage("image3");
			//println( "Loading Single Image = "+image3);
		}
	}

	/* ......................................... End loading image  Arrays List ....................  */

	/*........................................... Setup polygon (4 sides) to narrow the image placement.................................................  */
	/* Build a rectangle within the Window to  fram images */
	int l;
	int[]x={dx,width - dx,width-dx,dx};
	int[]y={dy,dy,height-dy,height-dy};
	p=new Poly(x,y,4);
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
	
	/* ...............................................  Setup Output Directory ............................................ */
	if(use_new_dir) {
		/* CREATE OUTPUT FILE DIRECTORY FOR */
		time_stamp_dir = createOneDirectory(output_file_dir,timeStamp);
		createOneDirectory(time_stamp_dir,"/"+transparent_dir_name);
		createOneDirectory(time_stamp_dir,"/Archive");
		String randomString = returnRandomDoubleString(100000,10000000,true);	
		String production_dir =createOneDirectory(time_stamp_dir,"/TREE_production_"+randomString);
		//println("production_dir = " + production_dir);
		/* Create sub directories */
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

	println("........................ End of Setup ................................. " );  
}
/* ....................................................... End of Setup() ..................................................... */
/* ........................................................ Begin  draw() ..................................................... */
void draw() {
	//makeTubPattern(60);

	if(PenroseSnowflakeLSystem) {ps.render(); } 

	frameRate(framerate);   /* frameRate set in GLOBAL VARIABLES */
	/* Used for automatic save */
	sequenceNumber++;
	//sprintln("sequenceNumber = " + sequenceNumber ); 
	/* Output statistics of the run */
	if(save_number_examples == save_number){		
		println("Number of examples saved = " + save_number );  
		println( "cycle_counter Total = " + cycle_counter ); 
		println( "image_change Total = " + image_change ); 
		exit();}
	/* Fill Complex */
	if(sequenceNumber%freq_muldo_complexFill==0){
		addComplexFill();
	}
	
	/* Fill Complex2 */
	if(sequenceNumber%(int)(freq_muldo_complexFill*.5)==0){
		addComplexFill2();
	}
	
	if(use_candy&&sequenceNumber%freq_muldo_candy ==0){
		pushMatrix();
		translate(0,0);
		Random AAground = new Random();
		int candyfile_num  = nextIntInRange(0, candyNumberList.size()-1, AAground);/* */
		candyImage =loadImage(CandyPathList.get(candyfile_num));
		tint(255, 150);  // Apply transparency without changing color
		//image(candyImage,0,0,width,height);
		image(candyImage,width/2,height/2,width,height);
		tint(255, 255);  // Reset  transparency without changing color 
		popMatrix();
	}		  
	if(use_squiggle&&sequenceNumber%freq_muldo_squiggle ==0){
		pushMatrix();
		translate(0,0);
		Random Cground = new Random();
		int squigglefile_num  = nextIntInRange(0, squiggleNumberList.size()-1, Cground);/* */
		squiggleImage =loadImage(SquigglePathList.get(squigglefile_num));
		tint(255, 150);  // Apply transparency without changing color
		//image(candyImage,0,0,width,height);
		image(squiggleImage,width/2,height/2,width,height);
		tint(255, 255);  // Reset  transparency without changing color 
		popMatrix();  
	}	
	/* Geometric Insert */
	if(use_geometric&&sequenceNumber%freq_muldo_geometric ==0){
		pushMatrix();
		translate(0,0);
		Random Bground = new Random();
		int geometricfile_num  = nextIntInRange(0, geometricNumberList.size()-1, Bground);/* */
		geometricImage =loadImage(GeometricPathList.get(geometricfile_num));
		tint(255, 150);  // Apply transparency without changing color
		//image(geometricImage,0,0,width,height);
		image(geometricImage,width/2,height/2,width,height);
		tint(255, 255);  // Reset  transparency without changing color 
		popMatrix();
	}		  
	

	
	
	
	/* Change color and alpha   using lerpColor   int freq_muldo_lerpColor */
	if(use_lerpColor) {
		if( cycle_counter %freq_muldo_lerpColor == 0){
			/* Sets up color range */

			color from = color(204, 102, 0);
			color to = color(0, 102, 153);
			float	amt = random(0,20);
			float lepalpha  = 1;
			fill(lerpColor(from, to,amt ),lepalpha);
			//  image(backgroundImage,0,0,width,height);
			/* Adjust fill rectangle according with scale_factor */
			rect(0,0,width,height);   /* Full screen fill */
			println("(Main)Full screen(541).........screen_alpha ="+screen_alpha+"  cnt = "+cnt);
			//println("width = " + width*scale_factor +" height  = " + height*scale_factor+ " cycle_counter = " + cycle_counter );  
		}
	}   /* End if(use_lerpColor) */
	
	/* Change image size  int freq_muldo_changeEnlargement */
	if( cycle_counter %freq_muldo_changeEnlargement  == 0 &&cycle_counter != 0){
		changeEnlargement(true,1,true) ;   /* direction true = enlarge --  increment how much to change --  true to show change */
		image_change++;
	}
	/* Choose two new random  images int  freq_muldo_changeRandomImage */
	if( cycle_counter % freq_muldo_changeRandomImage== 0 && cycle_counter != 0 ){
		changeRandomImage();
		/* Update nextSequenceNumber for next sequence 
		nextSequenceNumber++;*/
		println("line 447 nextSequenceNumber = " + nextSequenceNumber + " listSequenceNumber.size()  =  "+listSequenceNumber.size());
		changeFillAlpha(false,20);   /* boolean up_alpha */
		image_change++;
	}
	/* /* Change full screen alpha images */      /*changeFillAlpha  changes fill color also   int  freq_muldo_changeFillAlpha*/ 
	if( cycle_counter %freq_muldo_changeFillAlpha == 0){ 
		println("(Main 562) full screen fillColor= " + fill_color+"  freq_muldo_changeFillAlpha = "+freq_muldo_changeFillAlpha);
		//color fillColor;
		if(screen_alpha >= 255)
		{fill_color = changeFillAlpha(false,20);  /* When alpha reaches a certain value start to decrease screen_alpha */
			image_change++;}
		else
		{
			fill_color = changeFillAlpha(true,20);
			image_change++;}
		println("(Main 562) full screen fillColor= " +fill_color+"  freq_muldo_changeFillAlpha = "+freq_muldo_changeFillAlpha);	
	}
	
	/* .....................................Begin Save Big Image .............................*/
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
			println("Main)Full screen(588).........screen_alpha ="+screen_alpha+"  cnt = "+cnt);
			
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
				println("FILE SAVED(607) = "+file_path + " ..... sequenceNumberMuldo = " +sequenceNumberMuldo);
				save_number_examples++;
			}
		}

	} 
	/* .....................................End Save Big Image .............................*/
	else{
		/* ..................Every 60 frames fill screen with random fil .............*/
		if(particles[0].cnt%freq_muldo_particle_fill==0) {
			//%40 default
			// fill(100,20,0,5); // rgb alpha
			screen_alpha= random(25 ,200);   /* random(low,high) */
			/* Change color of fill */
			fill(changeRandomFill(),(int)screen_alpha);
			rect(0,0,width,height);   /* Full screen fill */
			println("Main)Full screen(628).........screen_alpha ="+screen_alpha+"  cnt = "+cnt);
			if(show_data) {println(".............................FILL............screen_alpha ="+screen_alpha+"  cnt = "+cnt);} 
			
		}
		/* Change Direction */
		if(changeDirection){ 
			for(int i=0; i<num_particles; i++) particles[i].initMove();
			changeDirection=false;	
		}
		/*  Particles Update and Draw */
		noStroke();
		for(int i=0; i<num_particles; i++) {
			particles[i].update();
			particles[i].draw();  // draw particles called
		}

		if (automatic_save ==true){
			//	if(sequenceNumber%sequenceNumberMuldo==0&&sequenceNumber>1400 && imageCount%freq_muldo_imageCount==0)    /* sequenceNumberMuldo*2 used to bypass early unpopulated images */
			//if(sequenceNumber%sequenceNumberMuldo==0&&sequenceNumber>sequenceNumberMuldo*10)    /* sequenceNumberMuldo*2 used to bypass early unpopulated images */
			if(sequenceNumber%sequenceNumberMuldo==0&&sequenceNumber>sequenceNumberMuldo*save_delay)    /* sequenceNumberMuldo*2 used to bypass early unpopulated images */
			
			
			//Toolkit.getDefaultToolkit().beep();Toolkit.getDefaultToolkit().beep();
			//if(sequenceNumber%sequenceNumberMuldo==0&&sequenceNumber>sequenceNumberMuldo*5 && imageCount%freq_muldo_imageCount==0)    /* sequenceNumberMuldo*2 used to bypass early unpopulated images */
			//if(sequenceNumber%sequenceNumberMuldo==0&&sequenceNumber>sequenceNumberMuldo*3 && imageCount%freq_muldo_imageCount==0)    /* sequenceNumberMuldo*2 used to bypass early unpopulated images */
			//if(sequenceNumber%sequenceNumberMuldo==0&& imageCount%freq_muldo_imageCount==0)    /* sequenceNumberMuldo*2 used to bypass early unpopulated images */
			//if( imageCount%freq_muldo_imageCount==0)    /* sequenceNumberMuldo*2 used to bypass early unpopulated images */
			
			{ 
				println("(automatic_save) imageCount = " + imageCount);
				println("(automatic_save) sequenceNumber = " + sequenceNumber);
				println("(automatic_save) sequenceNumberMuldo = " + sequenceNumberMuldo);
				println("freq_image_count_image_1 = " + freq_image_count_image_1);
				println("freq_image_count_image_2 = " + freq_image_count_image_2);
				println("save_delay = " +save_delay );

				/* Create file names */
				//String randomString = returnRandomDoubleString(100000,10000000,true);
				//final_name = file_path + randomString+".tif";
				//final_name = file_path + randomString+ "####.tif";
				/* println("returnRandomDoubleString  = " + randomString); */
				final_name = file_path + fileNameRandomInt+".tif";     /* fileNameRandomString initialized in Global Variables */
				String final_name_png = file_path + fileNameRandomInt+".png";     /* fileNameRandomString initialized in Global Variables */
				//final_name = file_path + randomString+ "_####.tif" ;  /* Dothis for continuous numbering but use random for SKU */
				saveFrame(final_name);      /* 	+ "####.tif" */
				//save(final_name_png);	
				println("AUTO FILE SAVE(653) = "+final_name+ " .sequenceNumberMuldo = " +sequenceNumberMuldo+ " save_number_examples = " +save_number_examples +" of "+save_number);
				println("imageCount = " + imageCount);
				println("freq_muldo_imageCount = " +freq_muldo_imageCount );
				save_number_examples++;  /* Used to limit number of saves in session */
				
				fileNameRandomInt++; /*  Increment file number for sequence continuity */
				Toolkit.getDefaultToolkit().beep();
			}
		}
	}
	cycle_counter ++;
}/* .......................  End draw() ............................................ */

