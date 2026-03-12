{ ... }: {
  programs.git = {
    enable = true;
    userName = "Christian Sherland";
    userEmail = "christiansherland@gmail.com";
    ignores = [
      # Compiled source
      "*.com" "*.class" "*.dll" "*.exe" "*.o" "*.so" "*.pyc"
      # Packages
      "*.7z" "*.dmg" "*.gz" "*.iso" "*.jar" "*.rar" "*.tar" "*.zip" "*.war" "*.ear"
      # Logs and databases
      "*.log" "*.sqlite"
      # OS generated files
      ".DS_Store?" "ehthumbs.db" "Icon?" "Thumbs.db" "*.DS_Store"
      # Xcode
      "*.pbxuser" "*.mode1v3" "*.mode2v3" "*.perspectivev3" "*.xcuserstate"
      "project.xcworkspace/" "xcuserdata/"
      # VS Code
      ".vscode" ".classpath" ".factorypath" ".project" ".settings"
      # IntelliJ
      "*.idea"
      # Node
      "node_modules/"
    ];
    extraConfig = {
      apply.whitespace = "fix";
      commit.template = "~/.gitmessage.txt";
      core = {
        autocrlf = "input";
        commentChar = ";";
        trustctime = false;
        untrackedCache = true;
      };
      diff.submodule = "log";
      fetch.prune = true;
      help.autocorrect = 1;
      init.defaultBranch = "main";
      mergetool.keepBackup = false;
      pull.rebase = true;
      push.autoSetupRemote = true;
      rebase.autostash = true;
    };
  };
}
