# TeX & LaTeX Syntax Highlighting for Xcode

This plugin provides full-featured syntax highlighting for TeX and LaTeX documents directly within the Xcode IDE, turning it into a powerful, minimalist environment for academic and technical writing.

It was originally created by Patrick Iglesias-Zemmour and has been updated and improved in collaboration with Google's Gemini to support modern Xcode versions and provide more intelligent highlighting.

![Syntax Highlighting Screenshot](https://user-images.githubusercontent.com/..../screenshot.png)
*(Note: You will need to take a new screenshot of the highlighter in action and upload it to GitHub to make this image link work.)*

## Why Use Xcode for TeX?

*   **Minimalist & Focused:** Enjoy a clean, distraction-free writing environment without the clutter of traditional TeX editors.
*   **Powerful Editor:** Leverage Xcode's robust and fast text-editing engine.
*   **Excellent Code Folding:** Easily navigate large documents by collapsing `\begin{...}...\end{...}` environments.
*   **Unified Workflow:** If you already use Xcode for other projects, you can now keep your TeX writing in the same familiar IDE.

---

### 🚨 **Important Note for Modern Xcode Users** 🚨

Modern versions of Xcode have enhanced security. When you launch Xcode for the first time after installing the plugin, you will see a dialog box asking if you want to load the plugin's bundle.

**You must click "Load Bundle".** If you click "Skip Bundle," the syntax highlighting will not work, and you may need to reset Xcode's plugin validation to be asked again.

---

## Features

*   **Intelligent Command Highlighting:** Recognizes and separately colors:
    *   The command itself (`\documentclass`)
    *   Optional arguments in square brackets (`[12pt,a4paper]`)
    *   Required arguments in curly braces (`{article}`)
*   **Full Math Environment Support:** Correctly highlights and handles:
    *   Inline math (`$...$`)
    *   Displayed math (`$$...$$` or `\[...\]`)
*   **Robust and Stable:** Fixes bugs from the original version, including issues with indented environments and greedy matching of math blocks.
*   **Customizable:** Works with Xcode's theme system. A custom theme, "Basic TeX," is provided as a great starting point.

## Installation

You can install the plugin automatically with the provided script (recommended) or manually.

#### 1. Automated Installation (Recommended)

This is the safest and easiest way to install the plugin.

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

#### 2. Manual Installation (Advanced Users)

> **Warning:** This method involves modifying the contents of the `Xcode.app` bundle. This can break Xcode's code signature and your changes may be overwritten by future Xcode updates. Proceed at your own risk.

Copy the following files to their respective destinations. You may need to create the destination folders if they don't exist.

*   `TeX.ideplugin` -> `~/Library/Developer/Xcode/Plug-ins/`
*   `Basic TeX.xccolortheme` -> `~/Library/Developer/Xcode/UserData/FontAndColorThemes/`

*The following files must be placed inside the Xcode application itself:*
*   `TeX.xclangspec` -> `/Applications/Xcode.app/Contents/SharedFrameworks/SourceModel.framework/Versions/A/Resources/LanguageSpecifications/`
*   `Xcode.SourceCodeLanguage.TeX.plist` -> `/Applications/Xcode.app/Contents/SharedFrameworks/SourceModel.framework/Versions/A/Resources/LanguageMetadata/`


## Getting Started

1.  **Restart Xcode:** After installing, you must completely quit and restart Xcode.
2.  **Load the Bundle:** When prompted, click **"Load Bundle"** (see important note above).
3.  **Select the Theme:** Go to **Xcode > Settings > Themes** and select **"Basic TeX"** from the list. Your `.tex` files will now be beautifully highlighted.

## How to Compile TeX in Xcode

To complete the setup, you can configure Xcode to compile your `.tex` files with a single keystroke.

1.  In your Xcode project, go to **Product > Scheme > Edit Scheme...**.
2.  Select the **"Build"** phase in the left panel.
3.  Expand the **"Pre-actions"** section and click the `+` to add a **"New Run Script Action"**.
4.  In the script editor, ensure "Provide build settings from" is set to your project. Paste the following command, replacing `YourFile.tex` with the name of your main document:
    ```sh
    # This uses the standard TeX Live path. Adjust if your installation is different.
      /Library/TeX/texbin/pdflatex -interaction=nonstopmode -output-directory="${SRCROOT}" "${SRCROOT}/YourFile.tex" && open -a "/Applications/XCode.app" $(SRCROOT)YourFile.pdf
    ```
Now, pressing **⌘B** (Build) will compile your document into a PDF in your project's root directory.

## Compatibility

*   **Tested and working up to Xcode 16.4 (July 2025).**
*   **Backward Compatibility:** The plugin preserves a list of old `DVTPlugInCompatibilityUUIDs` in its `Info.plist` to maintain support for users on older versions of Xcode (11, 12, 13, etc.), though the "Load Bundle" prompt is the primary mechanism for modern versions.

Open source files at: https://github.com/p-i-z/TeX-Colorization-for-Xcode
