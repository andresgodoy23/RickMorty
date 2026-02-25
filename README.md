#Qué hace la app?

Esta app está hecha en SwiftUI y se conecta a la API pública de Rick & Morty.
Muestra una lista de personajes y cuando seleccionas uno, te lleva a una pantalla de detalle donde se ve su imagen, especie y estado.

La app usa navegación de dos niveles Lista y Detalle

## API utilizada

Endpoint:
https://rickandmortyapi.com/api/character

Se hace una petición GET para obtener los personajes.

## Arquitectura utilizada (MVVM)

- Model: Character y CharacterResponse
- ViewModel: CharacterViewModel 
- Views: CharacterListView y CharacterDetailView

## Manejo de errores

- Si no hay internet, muestra: "No connection. Please try again."
- Si la API falla, muestra el código de error HTTP
- La app no se cierra ni crashea cuando ocurre un error

## Estados de carga

Mientras se están cargando los datos o las imágenes, se muestra un ProgressView
