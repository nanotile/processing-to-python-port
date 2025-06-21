/* PrintUrilities */

/* ........................................................................ printPVectorArrayList...................................................................................... */
void printPVectorArrayList(ArrayList<PVector> inputArrayList,String comment){

PVector pv =new PVector();	 
println(  "inputArrayList = " + comment);
for(int j =0;j<inputArrayList.size();j++)
			{
			pv = inputArrayList.get(j);
			println (pv.x+"  "+pv.y+"  "+pv.z);
}
println( comment +"  size = " + inputArrayList.size());
}

/* .........................................................................showFileArrayList.................................................................................. */
public static void showFileArrayList(File[] inputFileArray)
{
println ("(showFileArrayList)  inputFileArray.length =  "+  inputFileArray.length);
 for (int i=0;i<inputFileArray.length;i++)
      {
      String path = inputFileArray[i].getAbsolutePath();
      println ("(showFileArrayList)  file path ["+i+"] =  "+  path);    }
}


	/*................................................................................. printArrayInterger................................................................. */
	void printArrayInterger(int InputArray[],String array_name){
 
 println("PrintArrayInteger begin" + array_name);
  for (int kk =0 ; kk < InputArray.length; kk++) {
      println("array["+kk + "] = "+ InputArray[kk]); // each point on one line
    
  }
// println("PrintArrayInteger end"); 
}

/*...................................................................... printArrayFloat................................................................ */
void printArrayFloat(float InputArray[]){
 println("PrintArrayFloat begin");
  for (int kk =0 ; kk < InputArray.length; kk++) {
      println("array["+kk + "] = "+ InputArray[kk]); // each point on one line
  
  }
  println("PrintArrayFloat end"); 
}

/*..................................................................... print ArrayList String................................................................. */

 void printArrayListString(ArrayList<String> alist,String header)
 {
 println("ArrayList: "+ header);
 for(int i =0;i<alist.size();i++)
 println("list number[ "+ i + "]  = "+alist.get(i));
  println("End ArrayList: "+ header);
 }
 /* ................................................................printStringArray()............................................................................ */
void printStringArray (String[] input_stringArray)
{
for(int i=0;i<input_stringArray.length;i++)
println("String Array = "+input_stringArray[i]);

}
