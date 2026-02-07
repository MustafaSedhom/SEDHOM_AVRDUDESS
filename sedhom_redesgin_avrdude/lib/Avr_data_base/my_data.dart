// ignore_for_file: camel_case_types

class MCU {
  final String partId; // AVRDUDE part ID
  final String name; // MCU Name
  final int flashKB; // Flash size in KB
  final int eepromKB; // EEPROM size in KB
  final int pins; // Number of pins
  final Map<String, String> defaultFuses; // Default fuse hex values

  MCU({
    required this.partId,
    required this.name,
    required this.flashKB,
    required this.eepromKB,
    required this.pins,
    required this.defaultFuses,
  });
}

class AVRData {
  static List<MCU> mcus = [
    MCU(
      partId: "m8",
      name: "ATmega8",
      flashKB: 8,
      eepromKB: 1,
      pins: 28,
      defaultFuses: {"low": "0xE1", "high": "0xD9", "extended": "0xFF"},
    ),
    MCU(
      partId: "m48",
      name: "ATmega48",
      flashKB: 4,
      eepromKB: 1,
      pins: 28,
      defaultFuses: {"low": "0xE1", "high": "0xD9", "extended": "0xFF"},
    ),
    MCU(
      partId: "m328p",
      name: "ATmega328P",
      flashKB: 32,
      eepromKB: 1,
      pins: 28,
      defaultFuses: {"low": "0xFF", "high": "0xDE", "extended": "0x05"},
    ),
    MCU(
      partId: "m16",
      name: "ATmega16",
      flashKB: 16,
      eepromKB: 1,
      pins: 40,
      defaultFuses: {"low": "0xFF", "high": "0xD9", "extended": "0xFF"},
    ),
    MCU(
      partId: "m32",
      name: "ATmega32",
      flashKB: 32,
      eepromKB: 2,
      pins: 40,
      defaultFuses: {"low": "0xFF", "high": "0xD9", "extended": "0xFF"},
    ),
    MCU(
      partId: "m2560",
      name: "ATmega2560",
      flashKB: 256,
      eepromKB: 4,
      pins: 100,
      defaultFuses: {"low": "0xFF", "high": "0xD8", "extended": "0xFF"},
    ),
    MCU(
      partId: "tiny85",
      name: "ATtiny85",
      flashKB: 100,
      eepromKB: 66,
      pins: 100,
      defaultFuses: {"low": "0xFF", "high": "0xD8", "extended": "0xFF"},
    ),
    MCU(
      partId: "tiny86",
      name: "ATtiny86",
      flashKB: 100,
      eepromKB: 66,
      pins: 100,
      defaultFuses: {"low": "0xFF", "high": "0xD8", "extended": "0xFF"},
    ),
    MCU(
      partId: "tiny87",
      name: "ATtiny87",
      flashKB: 100,
      eepromKB: 66,
      pins: 100,
      defaultFuses: {"low": "0xFF", "high": "0xD8", "extended": "0xFF"},
    ),
    MCU(
      partId: "tiny88",
      name: "ATtiny88",
      flashKB: 100,
      eepromKB: 66,
      pins: 100,
      defaultFuses: {"low": "0xFF", "high": "0xD8", "extended": "0xFF"},
    ),
    MCU(
      partId: "tiny89",
      name: "ATtiny89",
      flashKB: 100,
      eepromKB: 66,
      pins: 100,
      defaultFuses: {"low": "0xFF", "high": "0xD8", "extended": "0xFF"},
    ),
    MCU(
      partId: "tiny90",
      name: "ATtiny90",
      flashKB: 100,
      eepromKB: 66,
      pins: 100,
      defaultFuses: {"low": "0xFF", "high": "0xD8", "extended": "0xFF"},
    ),
    MCU(
      partId: "tiny91",
      name: "ATtiny91",
      flashKB: 100,
      eepromKB: 66,
      pins: 100,
      defaultFuses: {"low": "0xFF", "high": "0xD8", "extended": "0xFF"},
    ),
    MCU(
      partId: "tiny92",
      name: "ATtiny92",
      flashKB: 100,
      eepromKB: 66,
      pins: 100,
      defaultFuses: {"low": "0xFF", "high": "0xD8", "extended": "0xFF"},
    ),
    MCU(
      partId: "tiny93",
      name: "ATtiny93",
      flashKB: 100,
      eepromKB: 66,
      pins: 100,
      defaultFuses: {"low": "0xFF", "high": "0xD8", "extended": "0xFF"},
    ),
    MCU(
      partId: "tiny94",
      name: "ATtiny94",
      flashKB: 100,
      eepromKB: 66,
      pins: 100,
      defaultFuses: {"low": "0xFF", "high": "0xD8", "extended": "0xFF"},
    ),
  ];
}

class progrmers {
  static List<String> programers_name = [
    "USB asp to TTL converter",
    "Arduino as ISP",
    "AVR ISP",
    "Microship ISP",
  ];
}

class FormateOptions {
  static List<String> format_options = [
    "Auto (Writing only)",
    "intel hex",
    "motorola S-record",
    "Raw binary",
    "Decimal (Reading only)",
    "Hexadecimal (Reading only)",
    "Binary (Reading only)",
  ];
}

class PortType {
  static List<String> port_types = ["usb", "parallel", "lpt", "com"];
}

class BuadRates {
  static List<String> baud_rates = [
    "115200",
    "9600",
    "19200",
    "38400",
    "57600",
  ];
}

class speedOptions {
  static List<String> speed_options = [
    "(Defualt)375 kHz",
    "1.5 MHz",
    "3 MHz",
    "6 MHz",
    "12 MHz",
  ];
}

class Read_write_verify_options {
  static List<String> options = ["Read", "Write", "Verify"];
}

class VersibaltyOptions {
  static List<String> versibality_options = ["1", "2", "3", "4"];
}
