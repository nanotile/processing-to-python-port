// /* Particle class */
// class Particle {
	// Vec2D v,vD;
	// float dir,dirD,speed;
	// int index,cnt,changeCnt,stateCnt;
	// int TRIANGLES=100;
	// int CROSSES=101;  /* index values */
	// int SHAPES = 102;
	// int image_count = 0; // added by kb

	// Particle() {
		// cnt=0;
		// dir=int(random(10))*36+15;
		// speed=random(2000)+0.75f; //kb  20->>2000
		//speed=1.25f;  orginal
		// v=new Vec2D(random(width),random(height));
		// vD=new Vec2D(0,0);
		// initMove();
	// }
	// /* ..........................................  Motion controls      ................................................................................. */
	// void initMove() {
	// /* 		Random Mground = new Random();
			// shapeNumber  = nextIntInRange(0, shapeNumberList.size()-1, Mground);	 
	        // pshape = loadShape(SahpePathList.get(shapeNumber)); */
		
		// float dirMod=0;
		
		// if(index==TRIANGLES) {dirMod=60;} //println( "index = TRIANGLES");}    /* TRIANGLES = 100 DEFINED IN PARTICLES    CROSSES = 101 */
		// else if(index==CROSSES) dirMod=0;
		// else dirMod=90;

		// if(random(100)>50) dirMod=-dirMod;
		// dir+=dirMod;
		
		// dirD=random(.75)+0.1;  // change 0.1 to 0.9 reduce the circle size
		// if(random(100)>50) dirD=-dirD;
		// if(index<2) dirD*=0.5;

		// vD.set(speed,0);
		// vD.rotate(radians(dir+90));
		vD.rotate(radians(dir+45));
		println( "f called");
		// changeCnt=20;
		// if(index==TRIANGLES) stateCnt=60+int(random(60));
		// else stateCnt=100+int(random(250));
		// if(random(100)>90) stateCnt+=250;

		// if(cnt>0 && index==TRIANGLES) {
			// fill(255,255,255,50);
			ellipse(v.x,v.y,30,30);
			// if(show_particle_statistics) {
				// println( " (ParticleClass) WRITE ellipse -- index = " + index);}
			image(img2, 0,0,50,50);
		// }
		// else if(cnt>0 && index==CROSSES) {
			fill(255,255,255,50);
			// fill(0,255,0,100);
			// if(show_particle_statistics) {
				// println( " (ParticleClass) cnt>0 && index==CROSSES  = " + index);}
			ellipse(v.x,v.y,30,30);
			image(img2, 0,0,50,50);
		// }
		// else if(index%freq_muldo_detail ==1) {    /* if(use_detailImages){} */
			
			
			// if(use_detailImages){
		// /* Load a single image at this point instead of loading huge array in setup  memory problems */
			// Random Gground = new Random();
			// int detailfile_num  = nextIntInRange(0, PImageDetailPathList.size()-1, Gground);/* */
			// detailImage =loadImage(PImageDetailPathList.get(detailfile_num));
			
            // /*  This PImage Array is loaded in setup  no longer */
			detailImage =PImageDetailList.get(detailfile_num);
			
			// float rd =random(detail_rd_min,detail_rd_max);  /* See global variables */
			float rd =random(0,.5);
			detailImage = loadImage(detail_dir_path+"14.png");
			// if(show_particle_statistics){
			// println("(Particle.pde) detailImage.width*rd = " +detailImage.width*rd + "  rd = "+rd);
			// }
	        // image(detailImage,v.x,v.y,detailImage.width*rd,detailImage.height*rd);
			image(detailImage,v.x,v.y,rd,rd);
			// }  
			// if(dots_crosses){
			// fill(255,255,255,160);
			// ellipse(v.x,v.y,index*1.5+2,index*1.5+2);  // dot circles inserted here
			// float rd =random(rd_min,rd_max); 
			// }
			String detail_dir_path = code_dir+"/"+detail_dir_name+"/";
          int freq_muldo_detail = 100;  /* SeeParticles.pde   dots_crosses */
			detailImage = loadImage(detail_dir_path+"14.png");
	        image(detailImage,v.x,v.y,width,height);
			image(detailImage,v.x,v.y,rd,rd);
			image(img_random_2,0,0,rd,rd);
			image(img2,0,0,rd,rd); places image at 0,0
		// }
		// else {
			// fill(255,255,255,160);
			// pushMatrix();
			// translate(v.x,v.y);
			// rotate(radians(dir+90));
			rect(0,0,14,4);  // crosses
			rect(0,0,4,14);
			// if(dots_crosses)
			// rect(0,0,28,4);  // crosses
			rect(0,0,4,28);
			// /* Used to turn images on and off  see keyControl */
			// if(write_images == true)
			// {
				
				// imageMode(CENTER);
				insert image
				// image_count++;
				
				// if(show_data) {
					// println( "(ParticleClass)(write_images) images on inside section ");
					// println("(ParticleClass)(write_images) image_count  = " +image_count);
					// println( " image_count ="+ image_count);
					// } 
// /* if(image_count%4==0) */
				// if(image_count% freq_image_count_image_1==0)
				// {
				println("Particles.pde image_count%4 = " +image_count%4+ "  image_count = " +image_count );
				
					// if( p.contains(v.x,v.y) ) // if point of drawing image is inside poly
					// { 
						println("(ParticleClass)(write_images) rd = " + rd);
						// /* Resize the image to a new width and height. To make the image scale proportionally,
					// use 0 as the value for the wide or high parameter. For instance, to make the width of an
					// image 150 pixels, and change the height using the same proportion, use resize(150, 0). 
					// img.resize(w, h)
					// */
					if(use_shapes){
						shape(pshape,0,0,random(0,1),random(0,1));  /* display shape */
		                shape(pshape,0,0);  /* display shape */
						} 
						// float rd =random(rd_min,rd_max);     // setup in setup() 
						// int i_width = (int)(img_random_1.width*rd); 
						// int i_height = (int)(img_random_1.height*rd); 
						// image(img_random_1,0,0,(int)i_width,(int)i_height);  // image loaded here	
						// if(show_data) {
							// println("(ParticleClass)(write_images) img_random_1... x = "+v.x+"  y = "+v.y);
							// println("(ParticleClass)(write_images) rd = " + rd);
							// println("(ParticleClass)(write_images) i_width = " + i_width);
							// println("(ParticleClass)(write_images) i_height = " + i_height);
							// println("img_random_2 = "+ imageFileNames.get(r_2) +"  image_count ="+ image_count);
							// } 
						
						img_random_1.resize((int)i_width/2,0);
						img_random_1.resize((int)rd,0);
						image(img_random_1,0,0);  // image loaded here										
						image(img_random_1,0,0,rd,rd);  // image loaded here
					// }
				// }
// /* else if(image_count%2==0 && two_images == true)  //using two images	 */			
				// else if(image_count%freq_image_count_image_2==0 && two_images == true)  //using two images
				// {
				
				 println("Particles.pde image_count%3 = " +image_count%3+ "  image_count = " +image_count );
					
					// if( p.contains(v.x,v.y) ) // if point of drawing image is inside poly
					// { 

						// float rd2 =random(rd_min,rd_max);     // setup in setup() 
						// int i_width2  = (int)(img_random_2.width*rd2); /* Careful divide by integer when using value less than 1 */
						// int i_height2 = (int)(img_random_2.height*rd2); 
						// image(img_random_2,0,0,(int)i_width2,(int)i_height2);  // image loaded here
						// if(show_data) {
							// println("(ParticleClass)(show_image2) img_random_2... x = "+v.x+"  y = "+v.y);
							// println("(ParticleClass)(show_image2) rd2 = " + rd2);
							// println("(ParticleClass)(show_image2) i_width2   = " + i_width2);
							// println("(ParticleClass)(show_image2) i_height2  = " + i_height2);
							 // println("two_images  = "+ two_images );
							 // println("img_random_2 = "+ imageFileNames.get(r_2) +"  image_count ="+ image_count);
						// } 
						
						
	
					// }
				// } 
				
			// } // image off 
			// popMatrix();
		// }
	// }   /* End void initMove()  */
	// /* ..........................................  Motion controls   End   ................................................................................. */

	// /* ..........................................  Update()  ................................................................................. */

	// void update() {
		// cnt++;
		// changeCnt--;
		
		// if(index==CROSSES) {
			// dir+=int(random(5))*5-10;
			// vD.set(speed,0);
			// vD.rotate(radians(dir));
		// }
		// else if(index!=TRIANGLES) {
			// dir+=dirD;
			// vD.set(speed,0);
			// vD.rotate(radians(dir));
		// }

		// v.add(vD);
		// if(v.x<0) v.x+=width;
		// else if(v.x>width) v.x-=width;
		// if(v.y<0) v.y+=height;
		// else if(v.y>height) v.y-=height;
		// stateCnt--;
		// if(stateCnt==0) initMove();
	// } 
	// /*  .............................. part of particle class ............................................. */
	// void draw() {
	// if(use_shapes){
			// Random Gground = new Random();
			// shapeNumber  = nextIntInRange(0, shapeNumberList.size()-1, Gground);/* */		 
	        // pshape = loadShape(SahpePathList.get(shapeNumber));
	// } 
		println("index in draw = " + index);
		// if(index==TRIANGLES && cnt%10!=0){
		// println("index in TRIANGLES return = " + index);
		// return;
		// }
		// else if(index==CROSSES && cnt%10!=0) return;
		// /* int TRIANGLES=100,CROSSES=101 */
		if(i%2==0) fill(100,100,120,10);
		// /* ..............................traces color  ..................................*/
		float trace_alpha = 0; //control the traces
		// if(index==TRIANGLES)   /* int TRIANGLES=100,CROSSES=101 */
		// {
			fill(12,245,37,trace_alpha);//fill(186,214,22,150);   fill(v1, v2, v3, alpha)  alpha == opacity  dashes fill(255,152,0);
			// /* fill(0,35,232,trace_alpha)  blue */
			// /* fill(12,245,37,trace_alpha)  green */
			// /* fill(245,164,12,trace_alpha)  orange */
			// if(show_particle_statistics) {
				// println( "(ParticleClass) changes fill-- index =TRIANGLES=100");}
		// }
		// else if(index==CROSSES) { 
			fill(255,50,100,trace_alpha);//, 150);  fill(255,50,100);
			// /* fill(255,50,100,trace_alpha)   pink-red*/ 
			// if(show_particle_statistics) {
				// println( " (ParticleClass) changes fill-- index =CROSSES=101");}
		// }
		// else if(index%2==0) {
			fill(204,204,206,trace_alpha);  //fill(240,10,100,50);fill(255,220,0,70);  fill(0,0,0,70);    red
			// /* fill(255,0,0,trace_alpha)  red */
			// /* fill(204,204,206,trace_alpha)  LIGHT GREY */
			println( "function_ 5 fill(255,0,0,trace_alpha)   RED ");
			// if(show_particle_statistics) {
				// println( " (ParticleClass) changes fill-- index = " + index);}
		// }
		// else {
		fill(162,157,159,trace_alpha);  //fill(255,0,180,50)  one trace  blue
			// /* fill(0,35,232,trace_alpha)  blue */
			// /* fill(0,255,0,trace_alpha) GREEN */ 			  /*   5 6 controls trace colors*/
			// /* fill(162,157,159,trace_alpha)  REDGRAY */
			println( "function_6 fill(0,255,0,trace_alpha)  GREEN");
		// }

		// pushMatrix();
		// translate(v.x,v.y);

		// if(kb_image_trail == true)
		// {
			// image(img_random_2,0,0,trail_x,trail_y); //flower trails
		// }
		// rotate(radians(dir));
		// /* if(show_rectangles) {} */
		 kbdots but no trails
		
		// if(index==TRIANGLES) {
			// triangle(-3.5,-3.5, 3.5,-3.5, 0,3.5);			
				// if(show_particle_statistics) {
				// println( " (ParticleClass) WRITES triangle -- index = " + index);}
			
		// }

		// else if(index==CROSSES) {
			// if(show_rectangles) { 
				// rect(0,0,8,200); 
				// rect(0,0,2,8);
				// if(show_particle_statistics) {
				// println( " (ParticleClass) index==CROSSES -- index = " + index);}
				/println( " (ParticleClass) index==CROSSES -- index = " + index);
			// }
			
			// }
		
		// else {
			// if(show_rectangles) {
			// if(use_shapes){
			// if(show_particle_statistics) {
			// println(" (Particles.pde) universal_counter = " + universal_counter +"  freq_muldo_shapes ="+freq_muldo_shapes);
			// }
			if(index==SHAPES) 
			freq_muldo_shapes = 1000;
			if(index%freq_muldo_shapes==0){
			// if(universal_counter%freq_muldo_shapes==0){
	        // /*  Random Gground = new Random();
			// shapeNumber  = nextIntInRange(0, shapeNumberList.size()-1, Gground); */
	       shape(pshape,0,0,(int)random(0,1),(int)random(0,1));  /* display shape */
		shape(pshape,0,0,random(0,1),random(0,1));  /* display shape */
		   // shape(pshape,0,0);  /* display shape */
		   // /*  shape(shape)
			// shape(shape, x, y)
			// shape(shape, a, b, c, d)  c= width, d height */
		  
		  // }
		  // universal_counter++;
			// }
				// /*   controls size and shape of  traces   float x_rect,y_rect; */
				// /* DEFINED A GLOGAL VARIABLE */   /* if(show_particle_statistics) {} */
				x_rect = 20;  see brackets to control size
				// y_rect = index*1.5+2;
				// /* These trace variables are controled with mousewheel   lenght and width controled with [  ] keys*/
				// trace_color = color(trace_red,trace_green,trace_blue,trace_alpha); 
				fill(trace_red,trace_green,trace_blue,trace_alpha);  /* red */
				// fill(trace_color );  /* red */
				// rect(0,0,x_rect,y_rect);

				// if(show_particle_statistics) { 
					// println("(ParticleClass) Particle number value = index  =  "+ index);
					// println(" (ParticleClass)   trace color = " + hex(trace_color,6));
					// println(" (ParticleClass)   trace_alpha = " + trace_alpha);
					// println("x_rect   =  "+x_rect+ " y_rect   =  "+y_rect);
					
				// }}
		// }

		// popMatrix();   
		................................... primitaves .............................
		// /*Syntax  	
// A triangle is a plane created by connecting three points.
// The first two arguments specify the first point, the middle
// two arguments specify the second point, and the last two
// arguments specify the third point.

// triangle(x1, y1, x2, y2, x3, y3);

// Parameters 	
// x1 	int or float: x-coordinate of the first point
// y1 	int or float: y-coordinate of the first point
// x2 	int or float: x-coordinate of the second point
// y2 	int or float: y-coordinate of the second point
// x3 	int or float: x-coordinate of the third point
// y3 	int or float: y-coordinate of the third point*/

		................................... end primitaves .............................   
	// } /* End draw in particle class */
// }  //..............  End Parricles class................................................
