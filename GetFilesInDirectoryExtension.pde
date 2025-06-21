//  getFilesInDirectory

ArrayList <File> getFilesInDirectory1(String input_file_directory,String file_extension)
{
    ArrayList <File> file_kb = new ArrayList();
    File[] fileList = new File(input_file_directory).listFiles();
for (File file : fileList) {
        if (file.isFile() & (file.getName()).endsWith("."+file_extension)) {
            //println("....................."+file);
            //files_kb.add(file.getName());
            file_kb.add(file);

            /*      for (int ii=0;ii < files_kb.size();ii++)
                 {

                   println( " files = " + file_kb.get(ii).getName()             );
                   println( " path = " + file_kb.get(ii).getPath()             );
                    }
             */
        }
    }

    return file_kb;
}// end function

/* getFilePathsInDirectory */

ArrayList <String> getFilePathsInDirectory1(String input_file_directory,String file_extension)
{
    ArrayList <String> file_path_list = new ArrayList();
    File[] fileList = new File(input_file_directory).listFiles();
    String path;
for (File file : fileList) {
        if (file.isFile() & (file.getName()).endsWith("."+file_extension)) {
            //println("....................."+file);
            //files_kb.add(file.getName());
            path = file.getPath() ;
            file_path_list .add(path);

            /*      for (int ii=0;ii < files_kb.size();ii++)
                 {

                   println( " files = " + file_kb.get(ii).getName()             );
                   println( " path = " + file_kb.get(ii).getPath()             );
                    }
             */
        }
    }

    return file_path_list ;
}// end function