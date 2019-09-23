/*
 * main.cpp
 *
 *  Created on: Nov 24, 2011
 *      Author: kderbyma
 */
#include <cassert>
#include <cstring>
#include <iostream>
#include "SimpleString.h"
SimpleString::SimpleString()
: lengthM(0), storageM(new char[1]){
storageM[0] = '\0';
std::cout << "\nDefault Constructor is Called.";
}
SimpleString::SimpleString(const char *s):lengthM(strlen(s)){
storageM = new char[lengthM + 1];
strcpy(storageM, s);
std::cout << "\nConstructor is Called.";
}
/*SimpleString::~SimpleString(){
delete [] storageM;
std::cout << "\nDestructor is Called.";
}*/
int SimpleString::length() const
{
return lengthM;
}
char SimpleString::get_char(int pos) const
{
assert(pos >= 0 && pos < length());
return storageM[pos];
}
const char * SimpleString::c_str() const
{
return storageM;
}
void SimpleString::set_char(int pos, char c)
{
assert(pos >= 0 && pos < length());
assert(c != '\0');
storageM[pos] = c;
}
int main(void){
SimpleString s1 ("Blue");
SimpleString s2 ("Red");
SimpleString *s3;
std::cout << "\nPoint one...\n";
// Point one
{
s3 = new SimpleString("Red");
SimpleString *s4 = new SimpleString [2];
delete [] s4;
std::cout << "\nPoint two...\n";
// Point two
}
delete s3;
std::cout << "\nPoint three...\n";
// Point three
#if 1
SimpleString s4;
s4 = s1;
s2 = s1;
#endif
return 0;
}
