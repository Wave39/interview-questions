# Root evaluation readme

Here are some notes about the code that I put together for the Root coding problem statement.
I chose to use Objective-C and the Mac OS X command line application template in Xcode for this coding exercise,
as that is where I have most of my experience on the iOS platform.

## Classes

I coded most of the objects in this application as classes, as I find objects derived from NSObject in Objective-C
to be the easiest to work with, and well worth the penalty in processing and memory overhead you pay as opposed
to trying to use simpler data structures.

## First run

In the main.m file, at line 15 I have put an NSLog statement that outputs the build directory to the console.
You can use this when you first run the application to see the path to the executable, which you would probably want
to copy to the clipboard, switch over to Terminal, change to that directory, and then run the executable as described below.

Also, if you run the application from Xcode, I have modified the Root-Evaluation scheme to automatically fill
in an argument passed on launch of ~/input.txt, which is just a file called input.txt in your Home directory. 
The code in the application will expand the tilde character into a full path as is common in operating systems that use the tilde character to represent the currently logged in user's home directory.

## Usage

To run this application, you would change directory to the path where the executable is located, and run this command:

```
./Root-Evaluation /Path/To/Input/File.txt
```
