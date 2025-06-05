#include <SPI.h>
#include "printf.h"
#include "RF24.h"
#include <Arduino.h>

#define CE_PIN 7
#define CSN_PIN 8

int red = analogRead(A7);
int green = analogRead(A2);
int blue = analogRead(A5);
byte colordata[3] = {red, green, blue};

bool send = digitalRead(6);
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
}

void loop(){
    red = 0.25 * analogRead(A7);
    green = 0.25 * analogRead(A2);
    blue = 0.25 * analogRead(A5);
    colordata[0] = red;
    colordata[1] = green;
    colordata[2] = blue;

    send = digitalRead(6);

    Serial.println(colordata[1]);
    if(send){
        radio.write(&colordata[3], sizeof(colordata));
        Serial.println(colordata[2]);
    };
    delay(1000);
}