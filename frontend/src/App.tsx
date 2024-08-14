import { ThemeProvider } from "@/components/theme-provider"
import { ModeToggle } from "@/components/mode-toggle"
import { Navbar } from "@/components/ui/navbar"

const App = () => {
  return (
    <>
      <ThemeProvider defaultTheme="dark" storageKey="vite-ui-theme">
        <div className="App container mx-auto">
          <Navbar></Navbar>
          <ModeToggle></ModeToggle>
        </div>
      </ThemeProvider>
    </>
  )
}

export default App
