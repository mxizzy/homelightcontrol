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
bool radioNumber = 1;

// instantiate an object for the nRF24L01 transceiver
RF24 radio(CE_PIN, CSN_PIN);
const uint8_t address[6] = "00001"; 

void setup(){
    pinMode(A7, INPUT); //defines pins
    pinMode(A2, INPUT);
    pinMode(A5, INPUT);
    pinMode(6, INPUT);
    pinMode(10, INPUT);

    Serial.begin(115200);

    radioNumber = 1;
    radio.begin();
    radio.openWritingPipe(address);
    radio.setPALevel(RF24_PA_LOW);
    radio.stopListening();

    rfcommand.instructionType = 1;
}

void loop(){
    rfcommand.red = 0.25 * analogRead(A7);
    rfcommand.green = 0.25 * analogRead(A2);
    rfcommand.blue = 0.25 * analogRead(A5);

    // This code will run only when the button to send the data is pressed, before that the user can configure the setting.
    send = digitalRead(6);
    if(send){
        radio.write(&rfcommand, sizeof(rfcommand));
        Serial.print("red=");
        Serial.println(rfcommand.red);
        Serial.print("green=");
        Serial.println(rfcommand.green);
        Serial.print("blue=");
        Serial.println(rfcommand.blue);
    };
    delay(1000);
}