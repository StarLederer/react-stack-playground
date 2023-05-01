import { Link, Outlet } from "react-router-dom"
import { Button, AppBar, Box, Container } from "@mui/material"
import { FC } from "react"

const Lnk: FC<{
  to: string,
  children: string
}> = (props) => <Button variant="outlined" sx={{ color: "Background" }} component={Link} {...props}>{props.children}</Button>

const Main = () => {
  return (
    <>
      <AppBar position="static">
        <Container maxWidth="xl">
          <Box display="flex" gap={1} py={2} >
            <Lnk to="/">Home</Lnk>
            <Lnk to="/about">About</Lnk>
          </Box>
        </Container>
      </AppBar>

      <Outlet />
    </>
  )
}

export default Main
