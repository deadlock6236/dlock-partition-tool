# dlock-partition-tool

## Windows installation drive creation script

This is a short batch script I made to automate the creation of a bootable Windows installation partition on a disk drive

This is also my first batch script and I'm definitely not familiar with the batch conventions so the code will most likely look like a big ugly turd with little uglier turds splashed over it

And this is also my first contribution to the software community so feel free to take this free crap and leave without a word, or let me know how you think I could improve it.

## What can I do with it?
Whatever you want actually, but I can tell you what I do with it.

See, I build and repair computers quite often, so I wanted a way to install Windows directly into a drive before even putting it into the computer I'm working on, so that I don have to waste time recreating a bootable flash drive each time I have to install a different Windows version. This way I can keep all the different Windows installation files on my computer and I only have to hook the drive to my computer and tell the script which version I want to use.

You will most likely find better solutions out there but this one does exactly what I need it to do, nothing more, nothing less, and so far it has proven to be quite useful for me so I decided to share it with the community, after all, it might help some fellow geek out there.

## How it works
It is a batch script that acts as a simplified interface to run some Diskpart commands. That's the intention at least...

## Yeah, okay... but what does it really do?
Quite a few things actually, depending on how you configure it using the Global variables inside the script.

Here are the tasks in order:

* (OPTIONAL) Clean the selected disk (WARNING, DATA LOSS RISK. Check the DISK_NUMBER variable)
* Create Windows installation partition.
* Copy windows installation files to newly created partition
* Make installation partition active
* (OPTIONAL) Create additional Data partition.
* Make installation partition bootable

## Where do I get the Windows installation files?
You can download an original windows ISO using the Windows Media Creation Tool. Once you have the .iso mount it, and exctract *__boot__*, *__sources__* and *__bootmgr__* to a new directory on your pc and that's pretty much it.
I usually use a naming convention for the folder with the installation files (from now on WIN DATA PACK), such as *__WIN_10_X64_EN__*, specially if I have more than one of them in the same folder. 

I plan to modify the script so that you only have to point to the .iso but right now I don't really want to because I'm a lazy mofo.

## Global variables description
There are comments in the code, go look there, I'm not copy-pasting those over here.

## How the heck do I run it?
If you're asking yourself that, do yourself a favor and google what a batch script is before you make a mess on your computer. Really, I recommend you to carefully read the code before executing this. I'm 100% no responsible for any damage to your personal files.

## Who are you?
A middle-road software developer that fixes computers on his spare time.
