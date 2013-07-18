// Can be run from commandline if exported as an APPLET from
// the Processing IDE
//
// Example if multiple jar files are required
// java -cp "core.jar;net.jar;SharedCanvasServer.jar" SharedCanvasServer
//
// Example if only one jar is produced
// java -jar simple_shell.jar

try {
  BufferedReader in = new BufferedReader(new InputStreamReader(System.in));
  String str = "";
  while (str != null) {
    System.out.print("prompt> ");
    str = in.readLine();
    println(str);
  }
} 
catch (IOException e) {
}
