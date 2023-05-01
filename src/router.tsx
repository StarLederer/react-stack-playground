import { createBrowserRouter } from "react-router-dom"

import Root from "~/routes/root"
import RootAbout from "~/routes/root/about"

const router = createBrowserRouter([
  {
    path: "/",
    element: <Root />,
    children: [
      {
        path: "/about",
        element: <RootAbout />,
      },
    ]
  },
])

export default router
