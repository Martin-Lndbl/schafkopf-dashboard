import { createContext, useContext } from "react";

const PlayerRegister = createContext();

function PlayerRegisterProvider({ children }) {
  const initialState = {
    session: [],
    players: [],
  };
  return <PlayerRegister.Provider value={initialState}>{children}</PlayerRegister.Provider>;
}

function usePlayerRegister() {
  const context = useContext(PlayerRegister);

  if (!context) {
    throw new Error(
      "usePlayerRegister should be used inside the PlayerRegisterProvider"
    );
  }

  return context;
}

export { PlayerRegisterProvider, usePlayerRegister };
