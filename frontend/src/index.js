import React from "react";
import { createRoot } from "react-dom/client";
import { BrowserRouter } from "react-router-dom";
import App from "App";

import { SchafkopfUIControllerProvider } from "context";

const container = document.getElementById("app");
const root = createRoot(container);

root.render(
  <BrowserRouter>
    <SchafkopfUIControllerProvider>
      <App />
    </SchafkopfUIControllerProvider>
  </BrowserRouter>
);
