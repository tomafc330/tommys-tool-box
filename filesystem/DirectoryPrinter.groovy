import groovy.io.GroovyPrintStream;


class DirectoryPrinter {
    
    /**
     * Usage: first arg is the directory (and sub dirs) to go through
     *        second arg is the output file to the list.
     * @param args
     */
    public static void main(String[] args) {
        def directory = "/home/tchan/tmp/costco_nosvn"
        def outFile = "/home/tchan/tmp/out.out"
        
        def stream = new GroovyPrintStream(new File(outFile))
        printFile(new File(directory), stream)
    }
    
    def static printFile(File file, GroovyPrintStream stream) {
        file.eachFile() { eachFile ->
            if (eachFile.isFile()){
                def str = "${eachFile.getPath()} ${eachFile.size()}"
                stream.println(str)
            } else {
                printFile(eachFile, stream)
            }
        }
    }
}

