/*utilitiesRandom.pde -- from getFilesMergeRandom.pde  in Squiggle*/
 public static int returnRandomInteger(int aStart, int aEnd){
    if (aStart > aEnd) {
      throw new IllegalArgumentException("Start cannot exceed End.");
    }
  Random aRandom = new Random();
    //get the range, casting to long to avoid overflow problems
    long range = (long)aEnd - (long)aStart + 1;
    // compute a fraction of the range, 0 <= frac < range
    long fraction = (long)(range * aRandom.nextDouble());
    int randomNumber =  (int)(fraction + aStart);    
    
  return randomNumber;
  }