#include <MD_DS1307.h>
#include <Wire.h>

#define PRINTS(s) Serial.print(F(s));
#define PRINT(s, v) { Serial.print(F(s)); Serial.print(v); }

char htoa(uint8_t i)
{
  if (i < 10)
  {
    return(i + '0');
  }
  else if (i < 16)
  {
    return(i - 10 + 'a');
  }
  return('?');
}

const char *p2dig(uint8_t v, uint8_t mode)
// print 2 digits leading zero
{
  static char c[3] = { "00" };

  switch(mode)
  {
    case HEX:
    {
      c[0] = htoa((v >> 4) & 0xf);
      c[1] = htoa(v & 0xf);
    }
    break;
  
    case DEC:
    {
      c[0] = ((v / 10) % 10) + '0';
      c[1] = (v % 10) + '0';
    }
    break;
  }

  return(c);
}

void setup() {
  // put your setup code here, to run once:
Serial.begin(9600);

}

void loop() {
  RTC.readTime();
PRINT("", RTC.yyyy);
  PRINT("-", p2dig(RTC.mm, DEC));
  PRINT("-", p2dig(RTC.dd, DEC));
  PRINT(" ", p2dig(RTC.h, DEC));
  PRINT(":", p2dig(RTC.m, DEC));
  PRINT(":", p2dig(RTC.s, DEC));

  // put your main code here, to run repeatedly:

}
