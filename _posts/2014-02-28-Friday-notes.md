---
layout: posts
categories: ApTranscriptome CCThermBE
title: February 28 notes
tags: 
  - SRA
  - arduino
---


## 2014-02-24

[Script to download all files from SRA archive in fastq format](http://davetang.org/wiki/tiki-index.php?page=SRA)


[Working code](http://www.instructables.com/id/Arduino-Laser-System-Tripwire-Tutorial/) to trigger LED/buzzer when laser beam is broken.

~~~
const int PHOTOCELL_PIN = A0;
const int BUZZER_PIN = 3;
// voltage readings are in 0-1023 range
const int THRESHOLD = 500;

void setup() {
  pinMode(PHOTOCELL_PIN, INPUT);
  Serial.begin(9600);
}

long alarmEndTime = 0;

void loop() {
  int level = analogRead(PHOTOCELL_PIN);
  Serial.println(level);
  long time = millis();
  if (time < alarmEndTime) {
    long timeLeft = alarmEndTime - time;
    if (timeLeft % 1000 > 300) {
      tone(BUZZER_PIN, 4000);
    } else {
      noTone(BUZZER_PIN);
    }
  } else {
    noTone(BUZZER_PIN);
    if (level < THRESHOLD) {
      alarmEndTime = time + 3000;
    }
  }
}
~~~


Pseudo-code to add camera

~~~
const int PHOTOCELL_PIN = A0;
const int CAMERA_PIN = 3;
// voltage readings are in 0-1023 range
const int THRESHOLD = 500;

void setup() {
  pinMode(PHOTOCELL_PIN, INPUT);
  Serial.begin(9600);
}

long alarmEndTime = 0;

void loop() {
  int level = analogRead(PHOTOCELL_PIN);
  Serial.println(level);
  long time = millis();
  if (time < alarmEndTime) {
    long timeLeft = alarmEndTime - time;
    if (timeLeft % 1000 > 300) {
//      TAKE PICTURE;
//      SAVE PICTURE TO microSD shield;
    } else {
      noTone(CAMERA_PIN);
    }
  } else {
    noTone(CAMERA_PIN);
    if (level < THRESHOLD) {
      alarmEndTime = time + 3000;
    }
  }
}
~~~


### Helms Cahan lab meeting

Discussed ApTranscriptome manuscript. Good ideas for improved analyses and figures!


### Other

Finished review for Molecular Ecology



## 2014-02-28

Workstation alarm still going...backup in progress

### CCThermBe

Heat shocked 'blue' ant group

Meet with Grace to work on beam braker

### ApTranscriptome

Working on analyses discussed yesterday


### Reading

Fu, X., Sun, Y., Wang, J., Xing, Q., Zou, J., Li, R., Wang, Z., Wang, S., Hu, X., Zhang, L. & Bao, Z. (2014). Sequencing-based gene network analysis provides a core set of gene resource for understanding thermal adaptation in Zhikong scallop Chlamys farreri. Molecular Ecology Resources, 14, 184–198.

  - interesting and clear use of network analysis
  - identifies Hsp90 as a 'hub' which we also find in Aphaenogaster!
  - seems like they could have used regression approach with time-series dat

