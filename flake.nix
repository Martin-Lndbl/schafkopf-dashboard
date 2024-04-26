{
  description = "Your next node.js project";

  # Use the unstable nixpkgs to use the latest set of node packages
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
  };
  outputs =
    { self
    , nixpkgs
    , flake-utils
    }:

    flake-utils.lib.eachDefaultSystem
      (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };
      in
      {
        devShells.default = pkgs.mkShell {

          buildInputs = with pkgs; [
            yarn
            nodejs

            # postman

            nodePackages.typescript
            nodePackages.typescript-language-server

            jdk
          ];
          shellHook = ''
            export REACT_APP_BACKEND_API_URL=http://localhost:7071/v1
            export REACT_APP_REDIRECT_URI=https://localhost:3000/
            export export REACT_APP_TENANT_ID=12adafa8-7abf-4c26-b6e6-80f6c439643d
            export REACT_APP_PORTAL_CLIENT_ID=7bec181a-3821-4d95-a5d2-71931162ae0e
            # export REACT_APP_SCOPES=<Scope(s)>
            # export REACT_APP_ADMIN_ROLE=<Admin role>
            # export REACT_APP_VIEWER_ROLE=<Viewer role>
          '';
        };
      });
}

