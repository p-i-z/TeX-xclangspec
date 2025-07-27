# TeX & LaTeX Syntax Highlighting for Xcode

This plugin provides full-featured syntax highlighting for TeX and LaTeX documents directly within the Xcode IDE, turning it into a powerful, minimalist environment for academic and technical writing.

It was originally created by Patrick Iglesias-Zemmour and has been updated and improved in collaboration with Google's Gemini to support modern Xcode versions and provide more intelligent highlighting.

## Features

*   **Intelligent Command Highlighting:** Recognizes and separately colors:
    *   The command itself (`\documentclass`)
    *   Optional arguments in square brackets (`[12pt,a4paper]`)
    *   Required arguments in curly braces (`{article}`)
*   **Full Math Environment Support:** Correctly highlights and handles:
    *   Inline math (`$...$`)
    *   Displayed math (`$$...$$`)
    *   Standard LaTeX displayed math (`\[...\]`)
*   **Code Folding:** All `\begin{...}...\end{...}` environments are fully foldable, making it easy to navigate large documents.
*   **Robust and Stable:** Fixes bugs from the original version, including issues with indented environments and greedy matching of math blocks.
*   **Customizable:** Works with Xcode's theme system. A custom theme, "Basic TeX," is provided as a great starting point.

## Compatibility

This plugin is designed to be backward compatible, but the installation process varies depending on your version of Xcode.

#### For Modern Xcode (approx. version 15 and newer)

*   **Tested and working up to Xcode 16.4 (July 2025).**
*   On these versions, the old UUID check is no longer the main issue. When you first launch Xcode after installation, you should be prompted with a dialog box. **You must click "Load Bundle"** to enable the plugin.

#### For Older Xcode (approx. versions 12, 13, 14)

*   This plugin contains a long list of compatibility UUIDs and should work for many of these versions out of the box.
*   **If the plugin does not load**, it is because your specific version of Xcode has a UUID that is not in the list. You will need to add it manually.
*   To find your Xcode's UUID, run the following command in the Terminal app:
    ```sh
    defaults read /Applications/Xcode.app/Contents/Info DVTPlugInCompatibilityUUID
    ```
*   Copy the resulting UUID string.
*   Right-click on `TeX.ideplugin`, choose "Show Package Contents," and open the `Info.plist` file.
*   Add the copied UUID as a new string inside the `DVTPlugInCompatibilityUUIDs` array.
*   Save the file and restart Xcode.

## Installation

You can install the plugin automatically with the provided script or manually.

#### Automated Installation (Recommended)

1.  Unzip the project files.
2.  Open the Terminal application.
3.  Navigate into the unzipped project folder using the `cd` command.
    ```sh
    cd path/to/your/TeX-xclangspec-GitHub-folder
    ```
4.  Make the script executable and run it:
    ```sh
    chmod +x TeX-Xcode-setup.sh
    ./TeX-Xcode-setup.sh
    ```
The script will copy all necessary files to their correct locations, creating directories if they don't exist.

#### Manual Installation

Copy the following files to their respective destinations:

1.  `TeX.ideplugin` -> `~/Library/Developer/Xcode/Plug-ins/`
2.  `TeX.xclangspec` -> `/Applications/Xcode.app/Contents/SharedFrameworks/SourceModel.framework/Versions/A/Resources/LanguageSpecifications/`
3.  `Xcode.SourceCodeLanguage.TeX.plist` -> `/Applications/Xcode.app/Contents/SharedFrameworks/SourceModel.framework/Versions/A/Resources/LanguageMetadata/`
4.  `Basic TeX.xccolortheme` -> `~/Library/Developer/Xcode/UserData/FontAndColorThemes/`

## Getting Started

1.  **Restart Xcode:** After installing the files, you must completely quit and restart Xcode.
2.  **Load the Bundle / Add UUID:** Follow the instructions in the "Compatibility" section for your version of Xcode.
3.  **Select the Theme:** Go to **Xcode > Settings > Themes** and select **"Basic TeX"** from the list. Your `.tex` files will now be beautifully highlighted.

## Using Xcode as a TeX Environment

To complete the setup, you can configure Xcode to compile your `.tex` files.

1.  In your Xcode project, go to **Product > Scheme > Edit Scheme**.
2.  Select the **"Build"** phase in the left panel.
3.  Expand the **"Pre-actions"** section and click the `+` to add a **"New Run Script Action"**.
4.  In the script editor, paste the following command, replacing `YourFile.tex` with the name of your main document:
    ```sh
    /Library/TeX/texbin/pdflatex $(SRCROOT)YourFile.tex && open -a "/Applications/XCode.app" $(SRCROOT)YourFile.pdf
    ```
Now, pressing **⌘B** (Build) will compile your document.
