if __name__ == "__main__":
    import os, shutil, sys
    
    if os.path.exists("CheeseCutter"):
        shutil.rmtree("CheeseCutter")

    os.mkdir("CheeseCutter")

    shutil.copy("README.md", "CheeseCutter")
    shutil.copy("LICENSE.md", "CheeseCutter")
    shutil.copy("AUTHORS", "CheeseCutter")
    shutil.copytree("tunes", "CheeseCutter/tunes")

    if os.name == "nt":
        shutil.copy("build/ccutter.exe", "CheeseCutter")
        shutil.copy("build/ct2util.exe", "CheeseCutter")
        shutil.copy("build/SDL.dll", "CheeseCutter")
    elif sys.platform == "darwin":
        os.makedirs("CheeseCutter/CheeseCutter.app/Contents/MacOS")
        os.makedirs("CheeseCutter/CheeseCutter.app/Contents/Frameworks")

        shutil.copy("arch/MacOS/Contents/Info.plist", "CheeseCutter/CheeseCutter.app/Contents")
        shutil.copytree("arch/MacOS/Contents/Resources", "CheeseCutter/CheeseCutter.app/Contents/Resources")
        shutil.copy("build/ccutter", "CheeseCutter/CheeseCutter.app/Contents/MacOS");
        shutil.copy("build/ct2util", "CheeseCutter/CheeseCutter.app/Contents/MacOS");
        shutil.copytree("arch/MacOS/SDL.framework", "CheeseCutter/CheeseCutter.app/Contents/Frameworks/SDL.framework");
    else:
        shutil.copy("build/ccutter", "CheeseCutter")
        shutil.copy("build/ct2util", "CheeseCutter")

    shutil.make_archive(sys.argv[1], "zip", "CheeseCutter")
