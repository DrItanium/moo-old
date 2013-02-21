/*
Copyright (c) 2013, Joshua Scoggins 
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of Joshua Scoggins nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL Joshua Scoggins BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/
#include "clips.h"
#include "OSDetection.h"
#if defined(__APPLE__)
#include "TargetConditionals.h"
#endif
//These are function definitions to find out what OS we're on

extern void* OSGetOperatingSystem(void* theEnv);
extern void* OSIsLinux(void* theEnv);
extern void* OSIsWindows64(void* theEnv); 
extern void* OSIsWindows32(void* theEnv);
extern void* OSIsOSX(void* theEnv);
extern void* OSIsAndroid(void* theEnv);
extern void* OSIsIOS(void* theEnv);
extern void* OSIsFreeBSD(void* theEnv);
extern void* OSIsOpenBSD(void* theEnv);
extern void* OSIsNetBSD(void* theEnv);
extern void* OSIsMicrosoftConsole(void* theEnv);
extern void* OSIsSonyConsole(void* theEnv);
extern void* OSIsNintendoConsole(void* theEnv);

extern void OSDetectionFunctionDefinitions(void* theEnv) {
   EnvDefineFunction2(theEnv, 
         (char*)"get-operating-system", 
         's',
         PTIEF OSGetOperatingSystem, 
         (char*)"OSGetOperatingSystem",
         (char*)"00a");
   EnvDefineFunction2(theEnv, 
         (char*)"operating-system-is-android", 
         'b',
         PTIEF OSIsAndroid, 
         (char*)"OSIsAndroid",
         (char*)"00a");
   EnvDefineFunction2(theEnv, 
         (char*)"operating-system-is-windows32", 
         'b',
         PTIEF OSIsWindows32, 
         (char*)"OSIsWindows32",
         (char*)"00a");
   EnvDefineFunction2(theEnv, 
         (char*)"operating-system-is-windows64", 
         'b',
         PTIEF OSIsWindows64, 
         (char*)"OSIsWindows64",
         (char*)"00a");
   EnvDefineFunction2(theEnv, 
         (char*)"operating-system-is-osx", 
         'b',
         PTIEF OSIsOSX, 
         (char*)"OSIsOSX", 
         (char*)"00a");
   EnvDefineFunction2(theEnv, 
         (char*)"operating-system-is-linux", 
         'b',
         PTIEF OSIsLinux, 
         (char*)"OSIsLinux", 
         (char*)"00a");
   EnvDefineFunction2(theEnv, 
         (char*)"operating-system-is-freebsd", 
         'b',
         PTIEF OSIsFreeBSD, 
         (char*)"OSIsFreeBSD",
         (char*)"00a");
   EnvDefineFunction2(theEnv, 
         (char*)"operating-system-is-openbsd", 
         'b',
         PTIEF OSIsOpenBSD, 
         (char*)"OSIsOpenBSD",
         (char*)"00a");
   EnvDefineFunction2(theEnv, 
         (char*)"operating-system-is-netbsd", 
         'b',
         PTIEF OSIsNetBSD, 
         (char*)"OSIsNetBSD", 
         (char*)"00a");
   EnvDefineFunction2(theEnv, 
         (char*)"operating-system-is-ios", 
         'b',
         PTIEF OSIsIOS, 
         (char*)"OSIsIOS", 
         (char*)"00a");
   EnvDefineFunction2(theEnv, 
         (char*)"operating-system-is-microsoft-console", 
         'b', 
         PTIEF OSIsMicrosoftConsole, 
         (char*)"OSIsMicrosoftConsole", 
         (char*) "00a");
   EnvDefineFunction2(theEnv, 
         (char*)"operating-system-is-sony-console", 
         'b',
         PTIEF OSIsSonyConsole, 
         (char*)"OSIsSonyConsole", 
         (char*)"00a");
   EnvDefineFunction2(theEnv, 
         (char*)"operating-system-is-nintendo-console", 
         'b', 
         PTIEF OSIsNintendoConsole, 
         (char*)"OSIsNintendoConsole", 
         (char*)"00a");
}

void* OSGetOperatingSystem(void* theEnv) {
#if defined(__linux__)
   return EnvAddSymbol(theEnv, "Linux");
#elif defined(__FreeBSD__)
   return EnvAddSymbol(theEnv, "FreeBSD");
#elif defined(__OpenBSD__)
   return EnvAddSymbol(theEnv, "OpenBSD");
#elif defined(__NetBSD__)
   return EnvAddSymbol(theEnv, "NetBSD");
#elif defined(__ANDROID__)
   return EnvAddSymbol(theEnv, "Android");
#elif defined(_WIN64)
   return EnvAddSymbol(theEnv, "Windows64");
#elif defined(_WIN32)
   return EnvAddSymbol(theEnv, "Windows32");
#elif defined(__APPLE__)
   #if TARGET_OS_MAC
      return EnvAddSymbol(theEnv, "OSX");
   #elif TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR
      return EnvAddSymbol(theEnv, "IOS");
   #else
      return EnvAddSymbol(theEnv, "AppleUnknown");
   #endif
#elif defined(PS3) || defined(PSP) || defined(__PPU__)
   return EnvAddSymbol(theEnv, "SonyConsole");
#elif defined(_XBOX) 
   return EnvAddSymbol(theEnv, "MicrosoftConsole");
#elif defined(__wii__) || defined(_WII)
   return EnvAddSymbol(theEnv, "NintendoConsole");
//Add more operating systems here
#else
   return EnvAddSymbol(theEnv, "Unknown");
#endif
}

//These are function definitions to find out what OS we're on
void* OSIsLinux(void* theEnv) {
#if defined(__linux__)
   return EnvTrueSymbol(theEnv);
#else
   return EnvFalseSymbol(theEnv);
#endif
}
void* OSIsWindows64(void* theEnv) {
#if defined(_WIN64)
   return EnvTrueSymbol(theEnv);
#else 
   return EnvFalseSymbol(theEnv);
#endif
}
void* OSIsWindows32(void* theEnv) {
#if defined(_WIN32)
   return EnvTrueSymbol(theEnv);
#else
   return EnvFalseSymbol(theEnv);
#endif
}
void* OSIsOSX(void* theEnv) {
#if defined(__APPLE__) && defined(TARGET_OS_MAC)
   return EnvTrueSymbol(theEnv);
#else
   return EnvFalseSymbol(theEnv);
#endif
}
void* OSIsAndroid(void* theEnv) {
#if defined(__ANDROID__) || defined(__android__)
   return EnvTrueSymbol(theEnv);
#else
   return EnvFalseSymbol(theEnv);
#endif
}
void* OSIsIOS(void* theEnv) {
#if defined(__APPLE__) && defined(TARGET_OS_IPHONE)
   return EnvTrueSymbol(theEnv);
#else
   return EnvFalseSymbol(theEnv);
#endif
}
void* OSIsFreeBSD(void* theEnv) {
#if defined(__FreeBSD__)
   return EnvTrueSymbol(theEnv);
#else
   return EnvFalseSymbol(theEnv);
#endif
}
void* OSIsOpenBSD(void* theEnv) {
#if defined(__OpenBSD__)
   return EnvTrueSymbol(theEnv);
#else
   return EnvFalseSymbol(theEnv);
#endif
}
void* OSIsNetBSD(void* theEnv) {
#if defined(__NetBSD__) 
   return EnvTrueSymbol(theEnv);
#else
   return EnvFalseSymbol(theEnv);
#endif
}

/* 
 * These are for consoles...by default these will return FALSE
 * I use these generic names because there are many devices (future and 
 * current) that are a part of this class of operating systems. We use the
 * platform detection functions to figure out what platform we are on
 */
void* OSIsMicrosoftConsole(void* theEnv) {
   //Microsoft's console is easy
#if defined(_XBOX)
   return EnvTrueSymbol(theEnv);
#else
   return EnvFalseSymbol(theEnv);
#endif
}
void* OSIsSonyConsole(void* theEnv) {
   //Playstation 2 isn't supported
#if defined(__PPU__) || defined(PSP) || defined(__psp__) || defined(__PSP__) || defined(_PSP)
   return EnvTrueSymbol(theEnv);
#else
   return EnvFalseSymbol(theEnv);
#endif
}
void* OSIsNintendoConsole(void* theEnv) {
   //GameCube isn't supported...not enough RAM!
#if defined(__wii__) || defined(_WII)
   return EnvTrueSymbol(theEnv);
#else
   return EnvFalseSymbol(theEnv);
#endif
}
