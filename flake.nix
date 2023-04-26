{
  description = "A simple database to store a stream of events and retrieve them by index";
  inputs.hix.url = "github:tek/hix?ref=0.5.1";
  outputs = {hix, ...}: hix.lib.flake {
    cabal = {
         dependencies = [
          "binary"
          "bytestring"
          "directory"
          "filepath"
          "safe-exceptions"
          "stm"
          "unix"
          "unix-bytestring"
        ];
    };


    packages = {
      eventdb = {
        src = ./.;
        library = {
          enable = true;
        }; 
      };

      app.executables = {
        src = ./.;
        bank-acct-demo = {
          enable = false;
          source-dirs = "app-bank-acct-demo";
          dependencies = [ 
            "random"
            "async"
            "eventdb"
          ];
        };
      };
    };
    main = "bank-acct-demo";  
  };
}
