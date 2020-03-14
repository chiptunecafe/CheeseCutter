if __name__ == "__main__":
    import os, shutil
    
    if os.path.exists("CheeseCutter"):
        os.rmdir("CheeseCutter")

    os.mkdir("CheeseCutter")

    shutil.copy("README.md", "CheeseCutter")
    shutil.copy("LICENSE.md", "CheeseCutter")
    shutil.copy("AUTHORS", "CheeseCutter")
    shutil.copytree("tunes", "CheeseCutter/tunes")

    if os.name == "nt":
        shutil.copy("build/ccutter.exe", "CheeseCutter")
        shutil.copy("build/ct2util.exe", "CheeseCutter")
        shutil.copy("build/SDL.dll", "CheeseCutter")
    else:
        shutil.copy("build/ccutter", "CheeseCutter")
        shutil.copy("build/ct2util", "CheeseCutter")
