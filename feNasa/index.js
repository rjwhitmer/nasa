
console.log("Home page")

const baseURL = 'http://localhost:3000/planets'
fetch(baseURL)
    .then(response => response.json())
    .then(showPlanets)

const mainTag = document.querySelector("main")



function showPlanets(planets){
    
    planets.forEach(planet => {
        console.log(planet.name)
 
        
        const div = document.createElement('div')
        const $div = document.createElement('div.table')
        
        const $uls = document.createElement("ul")
        const $lis = document.createElement("li")
        // const $myPs = document.createElement("p")

        // // $myPs.textContent = "Planet Name" 
        div.className = planet.name
        $lis.innerHTML = ` <p class='parent'>
                <a href='newshow.html?id=${planet.id}' aria-haspopup="true>
                <button class="button pulse">${planet.name}</button>
                </a>
                <img class='child' src='${planet.name}.jpg'>
                </p>  
        
        `
         
        $uls.append($lis)
       
        $uls.append($lis)
        $div.append($uls)
        div.append($div)

        mainTag.append(div)
    })
}
