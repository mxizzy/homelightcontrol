#include <SPI.h>
#include "printf.h"
#include "RF24.h"
#include <Arduino.h>

#define CE_PIN 7
#define CSN_PIN 8

// this structure will contain all data that is sent through radio
struct{
    uint8_t instructionType;
    uint8_t red;
    uint8_t green;
    uint8_t blue;
    uint8_t alpha;
}rfcommand;

bool send = false;
bool off = false;
bool radioNumber = 1;

// instantiate an object for the nRF24L01 transceiver
RF24 radio(CE_PIN, CSN_PIN);
const uint8_t address[6] = "00001"; 

void setup(){
    pinMode(A7, INPUT); //defines pins
    pinMode(A6, INPUT);
    pinMode(A5, INPUT);
    pinMode(6, INPUT);
    pinMode(2, INPUT);
    pinMode(9, OUTPUT);
    pinMode(10, OUTPUT);
    pinMode(11, OUTPUT);

    Serial.begin(115200);
    // This code sets up the radio to transmit
    radioNumber = 1;
    radio.begin();
    radio.openWritingPipe(address);
    radio.setPALevel(RF24_PA_LOW);
    radio.stopListening();
}

void loop(){
    rfcommand.red = 0.25 * analogRead(A7);
    rfcommand.green = 0.25 * analogRead(A6);
    rfcommand.blue = 0.25 * analogRead(A5);
    // Show user what their currently configured color is
    analogWrite(11, rfcommand.red);
    analogWrite(10, rfcommand.green);
    analogWrite(9, rfcommand.blue);
    // This code will run only when the button to send the data is pressed, before that the user can configure the setting.
    send = digitalRead(6);
    off = digitalRead(2);
    if(send){
        rfcommand.instructionType = 1;
        radio.write(&rfcommand, sizeof(rfcommand));
        Serial.print("red=");
        Serial.println(rfcommand.red);
        Serial.print("green=");
        Serial.println(rfcommand.green);
        Serial.print("blue=");
        Serial.println(rfcommand.blue);
    };
    if(off){
        rfcommand.instructionType = 2;
        radio.write(&rfcommand, sizeof(rfcommand));
    };
    
}