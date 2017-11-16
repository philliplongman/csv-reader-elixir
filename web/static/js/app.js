import Elm from "./main"


const readFileData = () => {
  let input = document.getElementById("file")
  let file = input.files[0]
  let reader = new FileReader()

  // Callback to send data to Elm once asnyc read process is complete
  reader.onload = (event) => {
    app.ports.fileRead.send({
      name: file.name,
      contents: event.target.result
    })
  }

  reader.readAsText(file)
}


const app = Elm.Main.fullscreen()
app.ports.fileSelected.subscribe(readFileData)
