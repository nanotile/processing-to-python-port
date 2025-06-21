/* readWriteTextFile.pde */
/* However, if you will be writing to the same file many times, the above
has to open and close the file on the disk many times,
which is a slow operation. In this case, a buffered writer is better: */

import java.io.PrintWriter;
import java.io.FileNotFoundException;

public void writeStringToFile1(String inputText, String outputFilePath)
{
try{
PrintWriter outputStream = new PrintWriter(outputFilePath);
outputStream.println(inputText); /* Stores in ram */
outputStream.close();   /* Writes stream to file and closes  flushes stream*/

}
catch (FileNotFoundException e){
e.printStackTrace();
}
}/* End writeStringToFile1() */

/* Notes:

    The second parameter to the FileWriter constructor will tell it to append to the file (as opposed to writing a new file).
    Using a BufferedWriter is recommended for an expensive writer (such as FileWriter).
    Using a PrintWriter gives you access to println syntax that you're probably used to from System.out.
    But the BufferedWriter and PrintWriter wrappers are not strictly necessary.
 */

public void writeStringToFile(String inputText, String outputFilePath){
PrintWriter outStream = null;
try{
outStream = new PrintWriter(new BufferedWriter(new FileWriter(outputFilePath, true))); 
    outStream.println(inputText);
	//outStream.newLine();
	outStream.close();
	
}catch (IOException ioe) {
     System.err.println("IOException: " + ioe.getMessage());	 
}finally {
if(outStream != null) {outStream.close();                    } // always close the file
 }  
}  /* End writeStringToFile() */



public void writeStringToFile2(String inputText, String outputFilePath){
 
      BufferedWriter bw = null;
 
      try {
         // APPEND MODE SET HERE
         bw = new BufferedWriter(new FileWriter(outputFilePath, true));
     bw.write(inputText);
     bw.newLine();
     bw.flush();
      } catch (IOException ioe) {
     ioe.printStackTrace();
      } finally {                       // always close the file
     if (bw != null) try {
        bw.close();
     } catch (IOException ioe2) {
        // just ignore it
     }
      } // end try/catch/finally
 
   } // end test()
 
