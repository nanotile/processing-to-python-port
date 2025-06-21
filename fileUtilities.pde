/* fileUtilities.pde fromScribble */
import org.apache.commons.io.comparator.*;
import org.apache.commons.io.filefilter.*;
import org.apache.commons.io.output.*;
import org.apache.commons.io.monitor.*;
import org.apache.commons.io.input.*;
import org.apache.commons.io.*; 
import java.io.*;
import java.util.*;
import java.util.Collections;
import java.text.SimpleDateFormat ;
/* ..................................................................getPltFiles()................................................................................... */
ArrayList <File> getPltFiles(String input_file_directory)
{
	ArrayList <File> file_kb = new ArrayList();
	File[] fileList = new File(input_file_directory).listFiles();
	for(File file : fileList){
		if(file.isFile() & (file.getName()).endsWith(".plt")){
			//println("....................."+file);
			//files_kb.add(file.getName());
			file_kb.add(file);
			/* Check if any plt files are in the directory */
			// if(files_kb.size() ==0)
			//println("No files found in this directory = "+ input_file_directory);
			
			/*      for (int ii=0;ii < files_kb.size();ii++)
		{
		
		println( " files = " + file_kb.get(ii).getName()             );
		println( " path = " + file_kb.get(ii).getPath()             );
		}
	*/  
		}}

	return file_kb;
}// end function




ArrayList <String> getPathsDirectory(String dirPath,String fileExtension)
{
ArrayList <String> fileListDir = new ArrayList();
File[] fileList = new File(dirPath).listFiles();
		for (int i=0;i < fileList.length;i++) {
		//println(fileList[i]);
			}
for(File file : fileList){
			if(file.isFile() & (file.getName()).endsWith("."+fileExtension)){
			//println("........filePath............."+file.getAbsolutePath());
			fileListDir.add(file.getAbsolutePath()); 
			//fileListDir.add(file.getName());  
		}}

return fileListDir;}
/*
ArrayList <File> file_kb = new ArrayList();


		for(File file : fileList){
			if(file.isFile() & (file.getName()).endsWith(".plt")){
			println("....................."+file);
			fileListDir.add(file.getName());
			fileListDir.add(file);
		}}
		
		for (int ii=0;ii < files_kb.size();ii++)
		{
		println( " files_kb = " + files_kb.get(ii));
			println( " files = " + file_kb.get(ii).getName()             );
			println( " path = " + file_kb.get(ii).getPath()             );
	}
		
//  return files.toArray(new String[]{});
*/
/* .....................................................................getFiles()....................................................................................... */
ArrayList <File> getFiles(String input_file_directory,String file_extension)
{
	ArrayList <File> file_kb = new ArrayList();
	File[] fileList = new File(input_file_directory).listFiles();
	for(File file : fileList){
		if(file.isFile() & (file.getName()).endsWith("."+file_extension)){
			//println("....................."+file);
			//files_kb.add(file.getName());
			file_kb.add(file);
			
			/*      for (int ii=0;ii < files_kb.size();ii++)
		{
		
		println( " files = " + file_kb.get(ii).getName()             );
		println( " path = " + file_kb.get(ii).getPath()             );
		}
	*/  
		}}

	return file_kb;
}// end function



/*

ArrayList <String> files_kb = new ArrayList();
ArrayList <File> file_kb = new ArrayList();
File[] fileList = new File(input_file_directory).listFiles();
		for (int i=0;i < fileList.length;i++) {

		println(fileList[i]);
			}

		for(File file : fileList){
			if(file.isFile() & (file.getName()).endsWith(".plt")){
			println("....................."+file);
			files_kb.add(file.getName());
			file_kb.add(file);
		}}
		
		for (int ii=0;ii < files_kb.size();ii++)
		{
		println( " files_kb = " + files_kb.get(ii));
			println( " files = " + file_kb.get(ii).getName()             );
			println( " path = " + file_kb.get(ii).getPath()             );
	}
		
//  return files.toArray(new String[]{});
*/
/* ..................................................................readFileAsString ....................................................................................... */
String readFileAsString(String filePath)  throws IOException  {
	StringBuffer fileData = new StringBuffer();
	BufferedReader reader = new BufferedReader(
	new FileReader(filePath));
	char[] buf = new char[1024];
	int numRead=0;
	while ((numRead=reader.read(buf)) != -1) {
		String readData = String.valueOf(buf, 0, numRead);
		fileData.append(readData);
	}
	reader.close();
	return fileData.toString();
}
/* ..................................................................getfileParent ....................................................................................... */
String getfileParent(String file_path)
{
	String inputFileDirectory = new File(file_path).getParentFile().getName();
	return inputFileDirectory;

}
/* ......................................................................getPathfromFile................................................................................... */
String getPathfromFile(File input_file)
{
	String file_path ="";
	/*
	println("ParrentDirectory  =   "+input_file.getParent());
	println("getAbsoluteFile =  "+input_file.getAbsoluteFile().getParent());
	println("File name = "+input_file.getName());
	println(" input_file.getPath()  =  "+input_file.getPath());*/
	file_path=	input_file.getPath();
	return file_path;
}

/* ..................................................................renoveNewLineFromFile ....................................................................................... */

String removeNewLineFromFile_path (String path_file)
{
	//println("(removeNewLineFromFile_path)  Path : " + path_file);
	// String path_file =  file.getAbsolutePath();
	String text = "";
	try {
		text = readFileAsString(path_file);
		//println("(removeNewLineFromFile_path) text: " + text);
	}
	catch (IOException ex)
	{
		//println("(removeNewLineFromFile_path)  Path : " + path_file);
	}
	//text = text.replace("\n", " ").replace("\r", " ");
	text = text.replace(System.getProperty("line.separator"), " ");
	return text;
}

/* .....................................................................replaceStringInFile.................................................................................... */

public static void replaceStringInFile(String input_file_path,String str_old,String str_new)
{
	try
	{
		File file = new File(input_file_path);
		BufferedReader reader = new BufferedReader(new FileReader(file));
		String line = "", oldtext = "";
		while ((line = reader.readLine()) != null)
		{
			oldtext += line + "\r\n";
		}
		reader.close();
		// replace a word in a file

		String newtext = oldtext.replaceAll(str_old, str_new);

		//To replace a line in a file
		//String newtext = oldtext.replaceAll("This is test string 20000", "blah blah blah");

		FileWriter writer = new FileWriter(input_file_path);
		writer.write(newtext);
		writer.close();
	}
	catch (IOException ioe)
	{
		ioe.printStackTrace();
	}
}
/* ..........................................................................replaceSelected............................................................................................... */

/* not used */
public static void replaceSelected(String file_path, String replaceWith, String type) {
	try {
		// input the file content to the String "input"
		BufferedReader file = new BufferedReader(new FileReader(file_path));
		String line;
		String input = "";

		while ((line = file.readLine()) != null) input += line + '\n';

		//System.out.println(input); // check that it's inputted right

		// this if structure determines whether or not to replace "0" or "1"
		if (Integer.parseInt(type) == 0) {
			input = input.replace(replaceWith + "1", replaceWith + "0");
		}
		else if (Integer.parseInt(type) == 1) {
			input = input.replace(replaceWith + "0", replaceWith + "1");
		}

		// check if the new input is right
		System.out.println("----------------------------------"  + '\n' + input);

		// write the new String with the replaced line OVER the same file
		FileOutputStream File = new FileOutputStream(file_path);
		File.write(input.getBytes());

	} catch (Exception e) {
		System.out.println("Problem reading file.");
	}
}
/* ..................................................................renameFile ()..................................................................... */
String renameFile (String input_file_path , String rename,boolean returnFullPath)
{
	String newFileName;
	String output_file_path; 
	File input_file = new File(input_file_path);
	// returnRandomInteger
	// println("File name = "+input_file.getName());
	// println("ParrentDirectory  =   "+input_file.getParent());
	// println("getAbsoluteFile =  "+input_file.getAbsoluteFile().getParent());
	// println("File name = "+input_file.getName());
	//println(" input_file.getPath()  =  "+input_file.getPath());
	
	String fileNameWithOutExt = FilenameUtils.removeExtension(input_file.getName());
	//println(" fileNameWithOutExt =  "+fileNameWithOutExt);
	String ext = FilenameUtils.getExtension(input_file_path);
	newFileName =fileNameWithOutExt+rename+"."+ext;
	output_file_path = input_file.getParent()+File.separator+ newFileName ;


	if(returnFullPath)
	{//println("(renameFile) output_file _path =  "+output_file_path);
		return  output_file_path;
	}
	else
	{//println("(renameFile) newFileName =  "+newFileName);
		return  newFileName;
	}
}

/* ..................................................................renameFileRandom ()..................................................................... */
String renameFileRandom (String input_file_path ,boolean returnFullPath)
{
	String newFileName;
	String output_file_path; 
	File input_file = new File(input_file_path);
	int rand = returnRandomInteger(1,300);
	String fileNameWithOutExt = FilenameUtils.removeExtension(input_file.getName());
	//println(" fileNameWithOutExt =  "+fileNameWithOutExt);
	String ext = FilenameUtils.getExtension(input_file_path);
	newFileName = fileNameWithOutExt+"_"+rand+"."+ext;
	output_file_path = input_file.getParent()+File.separator+ newFileName ;

	/* Return paths */
	if(returnFullPath)
	{//println("(renameFile) output_file _path =  "+output_file_path);
		return  output_file_path;
	}
	else
	{//println("(renameFile) newFileName =  "+newFileName);
		return  newFileName;
	}
}



/* ..................................................................getPathWithoutFile()..................................................................... */
String getPathWithoutFile(File file)
{
	String absolutePath = file.getAbsolutePath();
	String filePath = absolutePath.substring(0,absolutePath.lastIndexOf(File.separator));
	return filePath;
}
//copyFiles





/* copyAllFilesToDirectory2 this works but using second file for this application */
/* Input file path list, output file to copy files to */

ArrayList <String> copyAllFilesToDirectory2(ArrayList <String> dxf_file_list,String output_directory)
{
	ArrayList <String>return_file_paths = new ArrayList();
	for (int i=0;i<dxf_file_list.size();i++)
	{
		String file_path = dxf_file_list.get(i);	
		String inputFileName = new File(file_path).getName();
		String output_file = output_directory+File.separator+inputFileName;		
		File file1 = new File(dxf_file_list.get(i));
		File file2 = new File( output_file);
		//IOUtils.copy(new FileInputStream(file), new FileOutputStream(file2));
		// copy file and preserve the time stamp. the sourceFile and destFile are of type java.io.File
		try{
			FileUtils.copyFile(file1,file2);
		}catch (IOException e) {

			System.err.println("(FileUtils.copyFile)--An IOException was caught :"+e.getMessage());
			//System.err.println("Reason :"+e.getReason());
			System.out.println (e.toString());
			// e.printStackTrace();
		}  

		return_file_paths.add(output_file);
	} /*end for()*/
	return return_file_paths;
}

/*........................................................................... copyAllFilesToDirectory..................................................................... */
/* ................ */
/* using java.nio */
import java.io.IOException;
import java.nio.file.CopyOption;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.nio.file.NoSuchFileException;
import java.nio.file.DirectoryNotEmptyException;
import java.nio.file.FileAlreadyExistsException;

/* Input file path list, output file to copy files to */

ArrayList <String> copyAllFilesToDirectory(ArrayList <String> dxf_file_list,String output_directory)
{
	ArrayList <String>return_file_paths = new ArrayList();

	for (int i=0;i<dxf_file_list.size();i++)
	{
		String file_path = dxf_file_list.get(i);
		String inputFileName = new File(file_path).getName();
		String output_file = output_directory+File.separator+inputFileName;
		File file = new File(dxf_file_list.get(i));
		// get the java.nio.file.path from this
		Path FROM  = file.toPath();
		Path TO = Paths.get(output_file);
		//overwrite existing file, if exists
		CopyOption[] options = new CopyOption[] {
			StandardCopyOption.REPLACE_EXISTING,
			StandardCopyOption.COPY_ATTRIBUTES
		};
		try {
			Files.copy(FROM, TO, options);
			//Files.copy(FROM, TO);
		}  catch (FileAlreadyExistsException faee)
		{
			System.err.printf("%s: file already exists%n", TO);
		}
		catch (DirectoryNotEmptyException dnee)
		{
			System.err.printf("%s: not empty%n", TO);
		}
		catch (NoSuchFileException x) {
			System.err.format("No such file: %s", x.getFile());
		}
		catch (IOException e) {

			System.err.println("An IOException was caught :"+e.getMessage());
			//System.err.println("Reason :"+e.getReason());
			System.out.println (e.toString());
			// e.printStackTrace();
		}  /*  both methods work */
		return_file_paths.add(output_file);
	} /*end for()*/
	printArrayListString(return_file_paths,"return_file_paths");
	return return_file_paths;
}

/* ...................................................................copyOneFile............................................................................... */
/*  
import org.apache.commons.io.comparator.*;
import org.apache.commons.io.filefilter.*;
import org.apache.commons.io.output.*;
import org.apache.commons.io.monitor.*;
import org.apache.commons.io.input.*;
import org.apache.commons.io.*;  
*/
static public void copyOneFile(String file_path,String output_directory_path)
{
	
	String inputFileName = new File(file_path).getName();
	File file1 = new File(file_path);
	String output_file = output_directory_path+File.separator+inputFileName;
	File file2 = new File( output_file);
	//IOUtils.copy(new FileInputStream(file), new FileOutputStream(file2));
	// copy file and preserve the time stamp. the sourceFile and destFile are of type java.io.File
	try {
		FileUtils.copyFile(file1,file2);
	} catch (IOException e) {

		println("(FileUtils.copyOneFile)--An IOException was caught :"+e.getMessage());
		//System.err.println("Reason :"+e.getReason());
		println (e.toString());
		// e.printStackTrace();
	}  /**/
}



/*  */

void fileCopy2() {
	Path FROM = Paths.get("C:\\Temp\\from.txt");
	Path TO = Paths.get("C:\\Temp\\to.txt");
	//overwrite existing file, if exists
	CopyOption[] options = new CopyOption[] {
		StandardCopyOption.REPLACE_EXISTING,
		StandardCopyOption.COPY_ATTRIBUTES
	};
	try {
		Files.copy(FROM, TO, options);
	} catch (IOException e) {
		System.err.println("An IOException was caught :"+e.getMessage());
	}

}
/*........................................................................ list files in sub directory...................................................... */
public void listf(String directoryName, ArrayList<File> files) {
	File directory = new File(directoryName);

	// get all the files from a directory
	File[] fList = directory.listFiles();
	for (File file : fList) {
		if (file.isFile()) {
			files.add(file);
		} else if (file.isDirectory()) {
			listf(file.getAbsolutePath(), files);
		}
	}
}
/* .......................................................................listFiesDirectory.............................................................................. */
/* list files in sub directory  second solution */
public static List<File>listFiesDirectory (String directoryName) {
	File directory = new File(directoryName);

	List<File> resultList = new ArrayList<File>();

	// get all the files from a directory
	File[] fList = directory.listFiles();
	resultList.addAll(Arrays.asList(fList));
	for (File file : fList) {
		if (file.isFile()) {
			System.out.println(file.getAbsolutePath());
		} else if (file.isDirectory()) {
			resultList.addAll(listFiesDirectory(file.getAbsolutePath()));
		}
	}
	//System.out.println(fList);
	return resultList;
}
/*...................................................... Create new directory in  input directory   from netbeans processing ..............................................  */
public static String createOneDirectory(String input_file_directory, String directory_name) {
	/* return new directory path */
	boolean debug_directory_creation = false;
	
	// String new_dir_name = input_file_directory + File.separator + directory_name;
	String new_dir_name = input_file_directory +  directory_name;
	try {
		File filenew = new File(new_dir_name);
		if (!filenew.exists()) {
			if (filenew.mkdir()) {
				if (debug_directory_creation) {
					println("(Library) NEW DIRECTORY Directory created = " + new_dir_name);
				}
			} else {
				if (debug_directory_creation) {
					println("(Library) NEW DIRECTORY directory NOT CREATED = " + new_dir_name);
				}
			}
		}
	} catch (Exception ex) {
		println("(Library) NEW DIRECTORY directory NOT CREATED = " + new_dir_name);
	}
	return new_dir_name;
} 
/*//// Get time stamp  for use in creating seperate folders for each run of the program to avoid overwriting imagesprevious */
public static String getCurrentTimeStamp() {
	// SimpleDateFormat sdfDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//dd/MM/yyyy
	SimpleDateFormat sdfDate = new SimpleDateFormat("yyyy-MM-dd-HH_mm_ss");//dd/MM/yyyy
	Date now = new Date();
	String strDate = sdfDate.format(now);
	return strDate;
} 

/* Adapted  to return a random string from Java program Processing_libraries netbeans */
public static double returnRandomDouble(double rangeMin, double rangeMax) {
	//http://stackoverflow.com/questions/3680637/how-to-generate-a-random-double-in-a-given-range
	
	Random r = new Random(System.currentTimeMillis());
	/* add pause to make sure successive calls to this function (short time)  millisecond is different*/
	try {
		Thread.sleep(2); // pause 2 milliseconds
	} catch (InterruptedException e) {
		// Handle here
	}
	double randomValue = rangeMin + (rangeMax - rangeMin) * r.nextDouble();
	if (Double.valueOf(rangeMax - rangeMin).isInfinite()) {
		System.out.println("ERROR.....Min and Max are out of range");
		System.exit(1);
	}

	return randomValue;   /*  return numeric  */
}


public static int returnRandomInteger(double rangeMin, double rangeMax) {
	//http://stackoverflow.com/questions/3680637/how-to-generate-a-random-double-in-a-given-range
	
	Random r = new Random(System.currentTimeMillis());
	/* add pause to make sure successive calls to this function (short time)  millisecond is different*/
	try {
		Thread.sleep(2); // pause 2 milliseconds
	} catch (InterruptedException e) {
		// Handle here
	}
	double randomValue = rangeMin + (rangeMax - rangeMin) * r.nextDouble();
	if (Double.valueOf(rangeMax - rangeMin).isInfinite()) {
		System.out.println("ERROR.....Min and Max are out of range");
		System.exit(1);
	}
	

	return (int)randomValue;   /*  return integer  */
}

/* Adapted  to return a random string from Java program Processing_libraries netbeans */
public static String returnRandomDoubleString(double rangeMin, double rangeMax,boolean returnInteger) {
	//http://stackoverflow.com/questions/3680637/how-to-generate-a-random-double-in-a-given-range
	String aString;
	Random r = new Random(System.currentTimeMillis());
	/* add pause to make sure successive calls to this function (short time)  millisecond is different*/
	try {
		Thread.sleep(2); // pause 2 milliseconds
	} catch (InterruptedException e) {
		// Handle here
	}
	double randomValue = rangeMin + (rangeMax - rangeMin) * r.nextDouble();
	if (Double.valueOf(rangeMax - rangeMin).isInfinite()) {
		System.out.println("ERROR.....Min and Max are out of range");
		System.exit(1);
	}
	if(returnInteger)
	{
		/* return an Integer String  ie no decimal points */
		int randomInt = (int)randomValue;
		aString = Integer.toString(randomInt);
	}
	else {aString = Double.toString(randomValue);}
	
	
	return aString;   /*  return numeric string  */
}

/* ChangeFillAlpha  --- change the alpha of fill up or down */
public color changeFillAlpha(boolean up_alpha,int increment)
{
color fillColor;
	if (up_alpha){
		float tempval;
		tempval = screen_alpha;
		if(tempval>=0.0&&tempval<=255 ){tempval= tempval+increment;}  /*CONTROLS SCREEN  OVERLAY  ALPHA*/
		if(tempval<=255&&tempval>=0){screen_alpha =tempval;}
		else if(tempval>=255) {screen_alpha = 255;}
		else if(tempval<=0) {screen_alpha = 0;}
		/* Change color of fill */
		fillColor = changeRandomFill();
		fill(fill_red,fill_green,fill_blue,(int)screen_alpha); 
		//fill(100,20,0,(int)screen_alpha); // rgb alpha
		rectMode(CORNERS);
		rect(0,0,width,height);   /* Full screen fill */

		if(show_keysdata) {println( "fileUtilities.pde.. Change screen_alpha  = "+screen_alpha);
			println( " FileUtilities.pde...changeFillAlpha..... Change screen_alpha (UP)  = "+screen_alpha);}
		//println("UP = "+keyCode);
	}
	else{
		//float tempval;
		float tempval = screen_alpha;
		if(tempval>=0.0&&tempval<=255 ){tempval= tempval-increment;}  /*CONTROLS SCREEN  OVERLAY  ALPHA*/
		if(tempval<=255&&tempval>=0){screen_alpha =tempval;}
		else if(tempval>=255) {screen_alpha = 255;}
		else if(tempval<=0) {screen_alpha = 0;}	
		/* Change color of fill */
		fillColor = changeRandomFill();
		fill(fill_red,fill_green,fill_blue,(int)screen_alpha); 
		//fill(100,20,0,(int)trace_alpha); // rgb alpha
		rectMode(CORNERS);
		rect(0,0,width,height);   /* Full screen fill */
		
		if(show_keysdata) {println( "screen_alphaDOWN = "+screen_alpha);
			println( " FileUtilities.pde...changeFillAlpha.....  Change screen_alpha (DOWN)  = "+screen_alpha);}	
	}
return fillColor; 
	}   /* End changeFillAlpha */



void changeEnlargement(boolean direction,float increment,boolean show_enlargement)    /* direction true = enlarge */
{
	if(!direction){
		/* this enlarges the image  because it is resized by dividing dimentions by rd chosen between the ranges here */
		if(rd_min>1.0&&rd_min<rd_max ){
			rd_min = rd_min -increment;
			rd_max =  rd_max -increment;
			if(show_enlargement){println( "increasing magnification...........................................rd_min = "+rd_min + "  rd_max = "+rd_max);}
			
		}
		else if(rd_min>1.0&&rd_max<rd_min ){
			rd_max =  rd_max -increment;
			if(show_enlargement){println( "decreasing magnification...........................................rd_min = "+rd_min + "  rd_max = "+rd_max);}
			
		}
		else if(direction){
			if(rd_min>1.0&&rd_min<rd_max){	
				
				rd_min = rd_min +increment;
				rd_max =  rd_max +increment;
				println( "  upper case.........decreasing magnification...........................................rd_min = "+rd_min + "  rd_max = "+rd_max);
				
			}
		}
		else{println( "MINIMUM REACHED");}
	}}
/* ...............................................................Utility.returnNonRepeatingIntergerListInterval().......................................................................................... */
/* return a nonrepeating list of intergers ranging from 0 to  arrayValues 
	then select intervalInterger of them usually number files to merge*/
// this returns a List of non repeating integers from 	 
public static List<Integer> returnNonRepeatingInterger(int numberIntegers, int interValInteger) {
	List<Integer> listIntegers = new ArrayList<Integer>();
	List<Integer> outputlistIntegers = new ArrayList<Integer>();
	for (int j = 0; j < numberIntegers; j++) {
		listIntegers.add(j);
	}
	Random rand = new Random(System.nanoTime());
	Collections.shuffle(listIntegers, rand);
	/*  take only a subset of the generated  list and return it*/
	for (int i = 0; i < interValInteger; i++) {
		outputlistIntegers.add(listIntegers.get(i));
		// System.out.println("(Utility)(returnNonRepeatingInterger)  shuffled list = " + listIntegers.get(i) + " interValInteger =" + interValInteger + " numberIntegers =" + numberIntegers);
	}
	
	return outputlistIntegers;
}
/* 	Print ArrayList */

public static void printArrayList(ArrayList list, String location) {
	System.out.println(" BEGIN location= " + location);
	int i = 0;
	if (list.isEmpty()) {
		println("ArrayList Empty = " + location);
	}
	for (Object list1 : list) {
		println("ArrayList item[" + i + "] = " + list1);
		i++;
	}
	println("Total number of items in List = " + i);
	println("END location= " + location);
}
/*...........PrintIntegerList ........................*/
public static void printIntegerList(List<Integer> intList, String location) {
	System.out.println("location= " + location);
	Iterator<Integer> myListIterator = intList.iterator();
	while (myListIterator.hasNext()) {
		Integer filenumber = myListIterator.next();
		System.out.println(filenumber);
		
	}
	System.out.println("End list= " + location);
}
/*  Load Images in Directory into PImage ArrayList */

public  ArrayList<PImage> returnPImagesInDirectory(String dirPath,String extension,String comment, boolean debug){

	ArrayList<PImage> PImageList = new ArrayList<PImage>();
	ArrayList<String>  fileList = new ArrayList<String>();
	/* Get the number of image files in directory  GLOBAL VARIABLE */
	//numImageFilesDirectory = getNumberFilesInDirectory(input_file_path,"png"); 
	// println(" numImageFilesDirectory  ="+numImageFilesDirectory );
	/* Get list of file names in Image Directory */
	fileList  = getFilePathsInDirectory1(dirPath,extension);
	for ( int i = 0; i< fileList.size(); i++ )
	{
		/*  Load files into Image ListArray */
		//String input_file_name = input_file_path+ i + ".png";
		//String input_file_name = fileList .get(i);
		PImageList.add(loadImage( fileList .get(i)) );
             if(debug){println(comment + " PImageFilePath ["+ i +"] = " + fileList .get(i));}
		/* load file names into StringList  (ArrayList-Java */
		//imageFileNames.append( getFileName(input_file_name) );  /*  Apache commons  see utilities */
	}

	return PImageList;
}
/*........................................... Return a list of file names in directory....................................... */
public  StringList  returnFileNamesInDirectory(String dirPath,String extension,String comment, boolean debug){
ArrayList<String>  fileList = new ArrayList<String>();
StringList imageFileNames = new StringList(); 

fileList  = getFilePathsInDirectory1(dirPath,extension);
for ( int i = 0; i< fileList.size(); i++ )
	{
		/* load file names into StringList  (ArrayList-Java */
		imageFileNames.append( getFileName( fileList .get(i)) );  /*  Apache commons  see utilities */
	if(debug){println(comment +" ImageFileName ["+ i +"] = " + getFileName( fileList .get(i))  );}
		
	}
return imageFileNames;
}
  /* Return integer between min and max MUST DECLARE Random preceeding the use of this function*/
/* http://stackoverflow.com/questions/363681/generating-random-integers-in-a-specific-range */
public int nextIntInRange(int min, int max, Random rng) {
   if (min > max) {
      throw new IllegalArgumentException("Cannot draw random int from invalid range [" + min + ", " + max + "].");
   }
   int diff = max - min;
   if (diff >= 0 && diff != Integer.MAX_VALUE) {
      return (min + rng.nextInt(diff + 1));
   }
   int i;
   do {
      i = rng.nextInt();
   } while (i < min || i > max);
   return i;
}