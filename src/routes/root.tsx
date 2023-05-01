import { Link, Outlet } from "react-router-dom"

const Main = () => {
  return (
    <>
      <nav>
        <Link to="/">Home</Link>
        <Link to="/about">About</Link>
      </nav>
      <Outlet />
    </>
  )
}

export default Main
