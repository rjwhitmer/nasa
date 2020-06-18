console.log('whaddup')
let searchParams = new URLSearchParams(window.location.search)
let id = searchParams.get("id")

fetch(`http://localhost:3000/planets/${id}`)
    .then(response => response.json())
    .then(dailyWeather)



const mainTag = document.querySelector("main")
const bodyTag = document.querySelector("body")
const description = document.getElementsByClassName("planet-description")

function dailyWeather(planet){
    console.log(planet)
    let h1 = document.createElement('h1')

    h1.innerText = planet.name
    document.body.prepend(h1)
    
    

    let pictureDiv = document.createElement('div')    
    pictureDiv.innerHTML = `<img src=/images/${planet.name}.jpg>`    
    document.body.append(pictureDiv)
    planet['planet_days'].forEach(day => {
        
        const div = document.createElement('div.planet-day')
        let p1 = document.createElement('p')
        let p2 = document.createElement('p')
        let p3 = document.createElement('p')
        let p4 = document.createElement('p')
        let h3 = document.createElement('h3')
        
        p1.innerText = `Today's High: ${day.max_temp}`
        p2.innerText = `Today's Low: ${day.min_temp}`
        p3.innerText = `Wind Direction: ${day.avg_wind_direction}`
        p4.innerText = `Average Temperature: ${day.avg_temp}`
        h3.innerHTML = `
        <a><button class = "button planetDate">Sol ${day.planet_date}</button></a>
        

        `
        // bodyTag.style.background.append(url('${planet.name}.jpg'))

        div.append( h3, p1, p2, p3, p4 )
        
        mainTag.append(div)
    })
    let descriptionHeader = document.createElement("h2")
    descriptionHeader.innerText = `${planet.description}`
    document.body.append(descriptionHeader)

    
}

