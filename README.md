# ZMemory
Dynamic memory allocation for Doom source ports

If you have ever wanted to be able to allocate memory dynamically in Doom for whatever reason, then this is the solution.
The current implementation persists the allocations across map changes, but adding hub-scope allocation is in the pipeline.

Suggestions, requests and the like are welcome.

## Motivation
I, Zelaven, am a sucker for things like these. That aside, this is actually useful for projects that want to support extensibility.
As an example, imagine an ACS-implemented dialogue system where multiple side-running, unrelated extension submods should be able to add diagolue options. This is hard to do if the entire dialogue system and its data is precompiled in the ACS of the core mod. It would require the mod to add its own handling of space in one or more of the infinitely expansible spaces. Otherwise the only thing a submod can do is copy-paste the ACS source of the core mod and make its changes to that and use file replacement, which, if multiple mods do this, only one of them will have its effects realized, namely the last loaded.
It also provides easier fixing of content-related issues, such as eliminating objects in data structures or the like, by providing simple interfaces within the mod for doing so using the underlying structures residing in the memory space.

## Versioning information
The versioning scheme is the following:
Major.Minor.Patch

The Major releases might break backward compatibility. If backwards compatibility is broken then this will generally be incremented.
The Minor releases will generally only add new functionality, provide optimizations, new functionality or improvements in other such forms.
The Patch releases are for bug fixes and the like.

## Usage information
All you need to add to your project is the content in the acs_interface folder and adding it to your list of include files.
The interface is a minimalist, stripped down version of the source that provides only the information necessary to compile your own project with the interface.
After building your mod, simply load it alongside the build of ZMemory matching the header or a compatible build.

## Building
Currently only a linux build script is available. A windows build script would be an appreciated contribution.
On linux, the environment variable ACC_ZCOMMON_PATH needs to be defined for the script to work. Alternatively you can the compilation part on your own with your own script and run the build script anyway. Having the environment variable be missing will only result in the build script not compiling the ACS source for you.
