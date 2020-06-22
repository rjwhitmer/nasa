
console.log("Home page")

const baseURL = 'http://localhost:3000/planets'
fetch(baseURL)
    .then(response => response.json())
    .then(showPlanets)

const mainTag = document.querySelector("main")


const main = document.querySelector("main")

function showPlanets(planets){
    
    planets.forEach(planet => {
        console.log(planet.name)
        
        const flipCard = document.createElement('div')
        const divInner = document.createElement('div')
        const divFront = document.createElement('div')
        const divBack = document.createElement('div')
        const pFront = document.createElement("p")
        const pBack = document.createElement("p")

        pFront.innerText = `How's the weather on ${planet.name}?`

        pBack.innerHTML = `<a href='newshow.html?id=${planet.id}'><img class='child' src='images/${planet.name}.jpg'></a>`

        flipCard.className = "flip-card"
        divInner.className = "flip-card-inner"
        divFront.className = "flip-card-front"
        divBack.className = "flip-card-back"
            
        
        divFront.append(pFront)
        divBack.append(pBack)
        divInner.append(divFront)
        divInner.append(divBack)
        flipCard.append(divInner)
        main.append(flipCard)
    })
}
