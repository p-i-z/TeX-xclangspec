**TeX-xclangspec**

**Xcode syntax highlighting for TeX under Xcode**

Supported Versions Xcode 11/12 

Xcode attempts to load the TeX.ideplugin if its Info.plist contains a UUID that matches the DVTPlugInCompatibilityUUID value in the Xcode's Info.plist.

This UUID changes with each version of Xcode, so plugin authors need to keep adding UUIDs for each new Xcode that's released. 
To get this UUID, open Terminal.app and paste the line: defaults read /Applications/Xcode.app/Contents/Info DVTPlugInCompatibilityUUID

The present plugin should support recent Xcode versions up to 12.

To make the plugin working, you have to put yourself the right files at the right places.

Of course, there is no warranty that it will work with the next version of Xcode.

“**TeX.ideplugin**” **->** ~/Library/Developer/Xcode/Plug-ins/

“**TeX.xclangspec**” **->** /Applications/Xcode.app/Contents/SharedFrameworks/SourceModel.framework/Versions/A/Resources/LanguageSpecifications/

“**Xcode.SourceCodeLanguage.TeX.plist**” **->** /Applications/Xcode.app/Contents/SharedFrameworks/SourceModel.framework/Versions/A/Resources/LanguageMetadata/

and

“**Basic TeX.xccolortheme**” -> ~/Library/Developer/Xcode/UserData/FontAndColorThemes/

And this is what the script **TeX-Xcode-setup.sh** does, creating the appropriate folders if they do not exist already.

**Note:** Unzip TeX-xclangspec GitHub.zip, the folder **TeX-xclangspec GitHub** contains all these files. Run the script from inside that folder.
