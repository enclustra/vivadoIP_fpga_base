########################################################################################################################
#  Copyright (c) 2019 by Enclustra GmbH, Switzerland
#  All rights reserved.
#  Authors: Oliver Bruendler
########################################################################################################################
import re

########################################################################################################################
# Helper Functions
########################################################################################################################
#Replace some tagged content of a text file
def ReplaceInTaggedLine(file : str, tag : str, expRegex : str, new : str):
    #Read File
    with open(file, "r") as f:
        contentLines = f.readlines()

    #Do replacement
    for idx, l in enumerate(contentLines):
        #Find line with tag
        if "$${}$$".format(tag) in l:
            contentLines[idx] = re.sub(expRegex, new, l)
            break
    else:
        raise Exception("tag '$${}$$' not found in file '{}".format(tag, file))

    #Write File
    with open(file, "w+") as f:
        f.writelines(contentLines)

########################################################################################################################
# Main Function
########################################################################################################################

def FpgaBaseUpdateVersion(gitRepo : str, verbose : bool = False):
    """
    Call this function to update the build information in the fpga_base IP.

    :param gitRepo: Path to the repo to get the GitHash from that is stored in ther Version field
    :param verbose: Print information
    """

    import os
    import datetime as dt
    try:
        import git
    except:
        raise Exception("FpgaBaseUpdateVersion(): Install gitpython to run this script [pip install gitpython]")

    try:
        repo = git.Repo(gitRepo)
    except git.exc.InvalidGitRepositoryError:
         raise Exception("Path {} is not a GIT repository".format(gitRepo))


    GitUnclean = False
    #Handle dirty repo
    if repo.is_dirty(untracked_files=True):
        print("FpgaBaseUpdateVersion(): Repository is Dirty! Builds from dirty repositories are not recommended, so please commit first.\n")
        GitUnclean = True
        result = input("Continue (c) or Abort (a)?: ")
        if result != "c":
            print("\nBuild Aborted!")
            exit()
        print()

    #Get GitHAsh
    commitHash = repo.head.object.hexsha
    commitHash8 = commitHash[0:8]
    if GitUnclean:  # set hash to 0xFFFFFFFF if build from an unclean GIT repo (Hash would not be valid)
        commitHash8 = "FFFFFFFF"
    if verbose: print("FpgaBaseUpdateVersion():Current GIT Hash: ", commitHash)
    if verbose: print("FpgaBaseUpdateVersion():Hash in Register: ", commitHash8)

    #Update HDL
    FILEPATH = os.path.dirname(os.path.abspath(__file__))
    VERSION_FILE = FILEPATH + "/../hdl/fpga_base_scripted_info_pkg.vhd"
    ReplaceInTaggedLine(VERSION_FILE, "githash", r'"[0-9a-fA-F]*"', '"{}"'.format(commitHash8))
    buildDate = dt.datetime.now()
    if verbose: print("FpgaBaseUpdateVersion():Build Date:       ", "{:04}.{:02}.{:02} {:02}:{:02}".format(buildDate.year, buildDate.month, buildDate.day, buildDate.hour, buildDate.minute))
    ReplaceInTaggedLine(VERSION_FILE, "year", r'"[0-9]*"', '"{}"'.format(buildDate.year))
    ReplaceInTaggedLine(VERSION_FILE, "month", r'"[0-9]*"', '"{}"'.format(buildDate.month))
    ReplaceInTaggedLine(VERSION_FILE, "day", r'"[0-9]*"', '"{}"'.format(buildDate.day))
    ReplaceInTaggedLine(VERSION_FILE, "hour", r'"[0-9]*"', '"{}"'.format(buildDate.hour))
    ReplaceInTaggedLine(VERSION_FILE, "minute", r'"[0-9]*"', '"{}"'.format(buildDate.minute))


    # Ignore scripted changes in GIT
    repo.git.execute(["git", "update-index", "--assume-unchanged", os.path.abspath(VERSION_FILE)])

if __name__ == "__main__":
    FpgaBaseUpdateVersion("..", verbose=True)