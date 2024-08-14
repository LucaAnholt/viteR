import { Button } from "@/components/ui/button"
import { ThemeProvider } from "@/components/theme-provider"
import { ModeToggle } from "@/components/mode-toggle"

const App = () => {
  return (
    <>
      <ThemeProvider defaultTheme="dark" storageKey="vite-ui-theme">
        <div className="App">
          <Button>Click me</Button>
          <ModeToggle></ModeToggle>
        </div>
      </ThemeProvider>
    </>
  )
}

export default App
