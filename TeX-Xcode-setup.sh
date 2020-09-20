#!/usr/bin/env bash

# Path were this script is located
#
SCRIPT_PATH="$(dirname "$BASH_SOURCE")"

# Various directories for the plugin
#
plugins_dir=~/Library/Developer/Xcode/Plug-ins/
spec_dir=/Applications/Xcode.app/Contents/SharedFrameworks/SourceModel.framework/Versions/A/Resources/LanguageSpecifications
metdat_dir=/Applications/Xcode.app/Contents/SharedFrameworks/SourceModel.framework/Versions/A/Resources/LanguageMetadata
FontAndColorThemes_dir=~/Library/Developer/Xcode/UserData/FontAndColorThemes/

# Create Plug-ins directory if it doesn't exist
if [ ! -d "$plugins_dir" ]; then
    mkdir $plugins_dir
fi

# Create Specifications directory if it doesn't exist
if [ ! -d "$spec_dir" ]; then
    mkdir $spec_dir
fi
    
# Create LangageMetadat directory if it doesn't exist
if [ ! -d "$metdat_dir" ]; then
    mkdir $metdat_dir
fi

# Create FontAndColorThemes directory if it doesn't exist
if [ ! -d "$FontAndColorThemes_dir" ]; then
    mkdir $FontAndColorThemes_dir
fi


cp -r $SCRIPT_PATH/TeX.ideplugin $plugins_dir
cp $SCRIPT_PATH/TeX.xclangspec $spec_dir
cp $SCRIPT_PATH/Xcode.SourceCodeLanguage.TeX.plist $metdat_dir

cp $SCRIPT_PATH/"Basic TeX.xccolortheme" $FontAndColorThemes_dir