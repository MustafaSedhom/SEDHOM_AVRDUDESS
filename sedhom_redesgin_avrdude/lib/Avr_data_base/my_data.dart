// additonal commant list
List<String> Additional_command = ["-E", "-F", "-G", "-K"];
// total command
List<String> total_commands = [
  "avrdude",
  "-m atm328p",
  "-c asp",
  "-p USB",
  ...Additional_command,
];
// output terminal
List<String> Output_commands = [
  "SEDHOM_AVRDUDE.exe run",
  "avrdude -m atm328p",
  "uploading Done >>>",
  "SEDHOM_AVRDUDE.exe run",
  "avrdude -m atm328p",
  "uploading Done >>>",
  "SEDHOM_AVRDUDE.exe run",
  "avrdude -m atm328p",
  "uploading Done >>>",
  "SEDHOM_AVRDUDE.exe run",
  "avrdude -m atm328p",
  "uploading Done >>>",
  "SEDHOM_AVRDUDE.exe run",
  "avrdude -m atm328p",
  "uploading Done >>>",
];
