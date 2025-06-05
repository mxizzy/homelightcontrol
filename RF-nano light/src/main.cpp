#include <SPI.h>
#include "printf.h"
#include "RF24.h"
#include <Arduino.h>

#define CE_PIN 7
#define CSN_PIN 8

// This structure is where received data will be buffered into. I am using uint8_t because the bytes that are sent will be 8 bits long, and they need to be received in the same size to not be corrupted
struct{
    uint8_t instructionType;
    uint8_t red;
    uint8_t green;
    uint8_t blue;
    uint8_t alpha;
}rfcommand;

// instantiate an object for the nRF24L01 transceiver
RF24 radio(CE_PIN, CSN_PIN);

// radio address
const uint8_t address[6] = "00001";

void setup(){
  //setup of radio communication
  radio.begin();
  radio.openReadingPipe(1, address);
  radio.setPALevel(RF24_PA_LOW);
  //radio start listening
  radio.startListening();
  //open serial communication
  Serial.begin(115200);
  pinMode(6, OUTPUT);
}

void loop (){
  //read radio address
  radio.read(&rfcommand, sizeof(rfcommand));
  delay(1000);
  // Only execute commands if an instruction type has been set, if not, this is the indication of an invalid signal or no signal.
  switch (rfcommand.instructionType)
  {
  case 1:
      // Print values to serial out, this is just for debugging purposes
    Serial.print("red=");
    Serial.println(rfcommand.red);
    Serial.print("green=");
    Serial.println(rfcommand.green);
    Serial.print("blue=");
    Serial.println(rfcommand.blue);
    break;
  default:
    break;
  }
}