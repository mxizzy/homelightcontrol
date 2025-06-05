#include <SPI.h>
#include "printf.h"
#include "RF24.h"
#include <Arduino.h>

#define CE_PIN 7
#define CSN_PIN 8


int colordata;
int* radioSignal;
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
  radio.read(&colordata, sizeof(colordata));
  //serial print colorsignal
*radioSignal = colordata;
  Serial.println(*radioSignal);
  delay(1000);
  analogWrite(6, colordata);
}